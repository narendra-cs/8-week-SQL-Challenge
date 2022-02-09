
-- 1. What is the total amount each customer spent at the restaurant?

SELECT s.customer_id, sum(m.price) AS total_amount
FROM sales s 
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id;


-- 2. How many days has each customer visited the restaurant?

SELECT customer_id, count(DISTINCT order_date) AS visit_count
FROM sales
GROUP BY customer_id;


-- 3. What was the first item from the menu purchased by each customer?

WITH ordered_sales AS (
    SELECT s.*,m.product_name, 
	    dense_rank() OVER(
            PARTITION BY s.customer_id 
            ORDER BY s.order_date) AS item_rank
FROM sales s 
JOIN menu m ON s.product_id = m.product_id
)

SELECT DISTINCT customer_id, product_name
FROM  ordered_sales
WHERE item_rank = 1;


-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

WITH item_purchase_count AS (
    SELECT product_id, count(*) AS count
    FROM sales
    GROUP BY product_id
    ORDER BY count DESC
    LIMIT 1)

SELECT product_name, count
FROM menu m 
JOIN item_purchase_count ipc ON m.product_id = ipc.product_id;


-- 5. Which item was the most popular for each customer?

WITH item_purchase_count AS (
    SELECT customer_id, product_id, count(*) AS purchase_count
    FROM sales
    GROUP BY customer_id, product_id),
    most_purchase_item AS (
        SELECT customer_id, product_name,
        dense_rank() OVER(
            PARTITION BY customer_id 
            ORDER BY purchase_count DESC) AS item_rank
        FROM item_purchase_count ipc 
        JOIN menu m 
        ON ipc.product_id = m.product_id)

SELECT customer_id, product_name
FROM  most_purchase_item
WHERE item_rank = 1;


-- 6. Which item was purchased first by the customer after they became a member?

WITH puchased_item_after_member AS (
    SELECT s.customer_id, s.product_id, m.join_date, s.order_date,
        rank() OVER(
                PARTITION BY customer_id 
                ORDER BY order_date) AS item_rank
    FROM sales s 
    JOIN members m ON s.customer_id = m.customer_id
    WHERE s.order_date >= m.join_date)

SELECT customer_id, product_name
FROM  puchased_item_after_member piaf
JOIN menu m ON piaf.product_id = m.product_id
WHERE item_rank = 1
ORDER BY customer_id;


-- 7. Which item was purchased just before the customer became a member?

WITH puchased_item_before_member AS (
    SELECT s.customer_id, s.product_id, m.join_date, s.order_date,
        rank() OVER(
            PARTITION BY customer_id 
            ORDER BY order_date DESC) AS item_rank
    FROM sales s 
    JOIN members m ON s.customer_id = m.customer_id
    WHERE s.order_date < m.join_date)

SELECT customer_id, product_name
FROM puchased_item_before_member pibf
JOIN menu m ON pibf.product_id = m.product_id
WHERE item_rank = 1
ORDER BY customer_id;


-- 8. What is the total items and amount spent for each member before they became a member?

WITH puchased_item_before_member AS (
    SELECT s.customer_id, s.product_id, m.join_date, s.order_date
    FROM sales s 
    JOIN members m ON s.customer_id = m.customer_id
    WHERE s.order_date < m.join_date)

SELECT customer_id, count(m.product_id) AS total_items, sum(price) AS total_amount
FROM puchased_item_before_member pibf 
JOIN menu m ON pibf.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id;


-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT s.customer_id,
    sum(CASE m.product_name
            WHEN 'sushi' THEN m.price * 20
            ELSE m.price * 10
        END) AS total_points 
FROM sales s 
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id;


-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

WITH members_detail AS (
    SELECT *,
        date_add(join_date, INTERVAL 6 DAY) AS valid_date,
        last_day(join_date) AS last_date
    FROM members)

SELECT s.customer_id,
    sum(CASE
        WHEN s.order_date >= md.join_date AND s.order_date <= md.valid_date THEN m.price * 20
        WHEN m.product_name = 'sushi' THEN m.price * 20
        ELSE m.price * 10
        END) AS total_points
FROM sales s 
JOIN menu m ON s.product_id = m.product_id
JOIN members_detail md ON s.customer_id = md.customer_id
WHERE s.order_date <= md.last_date
GROUP BY s.customer_id;


--       Bonus Questions
--     Join All The Things

SELECT s.customer_id, s.order_date, m.product_name, m.price,
        CASE
            WHEN mem.join_date IS NOT NULL AND s.order_date >= mem.join_date THEN 'Y'
            ELSE 'N'
        END AS member
FROM sales s 
LEFT JOIN menu m ON s.product_id = m.product_id 
LEFT JOIN members mem ON s.customer_id = mem.customer_id;


--    Rank All The Things

WITH summary AS (
    SELECT s.customer_id, s.order_date, m.product_name, m.price,
            CASE
                WHEN mem.join_date IS NOT NULL AND s.order_date >= mem.join_date THEN 'Y'
                ELSE 'N'
            END AS member
    FROM sales s 
    LEFT JOIN menu m ON s.product_id = m.product_id 
    LEFT JOIN members mem ON s.customer_id = mem.customer_id)

SELECT *,
    CASE
        WHEN member = 'N' THEN null
        ELSE rank() OVER( 
            PARTITION BY customer_id, member
            ORDER BY order_date)
        END AS ranking
FROM summary;