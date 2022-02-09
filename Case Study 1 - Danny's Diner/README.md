# Case Study \#1 - Danny's Diner [https://8weeksqlchallenge.com/case-study-1/]

## Case Study Questions

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

### Example Query:
`
SELECT
  	product_id,
    product_name,
    price
FROM dannys_diner.menu
ORDER BY price DESC
LIMIT 5;
`

## Answers
1. What is the total amount each customer spent at the restaurant?
  
  * Customer A spent $76
  * Customer B spent $74
  * Customer C spent $36

  ![result_01](/img/result_01)

2. How many days has each customer visited the restaurant?
  
  * Customer A visited 4 times
  * Customer B visited 6 times
  * Customer C visited 2 times

  ![result_02](/img/result_02)

3. What was the first item from the menu purchased by each customer?

  * Customer A’s first order are curry and sushi
  * Customer B’s first order is curry
  * Customer C’s first order is ramen

  ![result_03](/img/result_03)

4. What is the most purchased item on the menu and how many times was it purchased by all customers?

  * Most purchased item on the menu is ramen

  ![result_04](/img/result_04)

5. Which item was the most popular for each customer?

  * Customer A and C’s favourite item is ramen
  * Customer B enjoys all items in the menu

  ![result_05](/img/result_05)

6. Which item was purchased first by the customer after they became a member?

  * After Customer A became a member, his/her first order is curry, whereas it’s sushi for Customer B

  ![result_06](/img/result_06)

7. Which item was purchased just before the customer became a member?

  * Customer A’s order before he/she became member is sushi and curry
  * Customer B’s order is sushi. That must have been a real good sushi!
  
  ![result_07](/img/result_07)

8. What is the total items and amount spent for each member before they became a member?

  * Customer A spent $ 25 on 2 items
  * Customer B spent $40 on 3 items

  ![result_08](/img/result_08)

9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

  * Total points for Customer A, B and C are 860, 940 and 360

  ![result_09](/img/result_09)

10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

  * Customer A has 1370 points
  * Customer B has 820 points

  ![result_10](/img/result_10)

###       Bonus Questions
1. Join All The Things

  ![bonous_1](/img/bonous_1)

2. Rank All The Things

  ![bonous_2](/img/bonous_2)
