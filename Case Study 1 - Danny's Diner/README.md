# [Case Study \#1 - Danny's Diner](https://8weeksqlchallenge.com/case-study-1/)

### Case Study Questions

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

#### Example Query:
```sql
SELECT
  	product_id,
    product_name,
    price
FROM menu
ORDER BY price DESC
LIMIT 5;
```

### Answers
1. What is the total amount each customer spent at the restaurant?
  
  * Customer A spent $76
  * Customer B spent $74
  * Customer C spent $36

  <p align="center">
    <img src="img/result_01.png" alt="result_01"/>
  </p>

2. How many days has each customer visited the restaurant?
  
  * Customer A visited 4 times
  * Customer B visited 6 times
  * Customer C visited 2 times

  <p align="center">
    <img src="img/result_02.png" alt="result_02"/>
  </p>

3. What was the first item from the menu purchased by each customer?

  * Customer A’s first order are curry and sushi
  * Customer B’s first order is curry
  * Customer C’s first order is ramen

  <p align="center">
    <img src="img/result_03.png" alt="result_03"/>
  </p>

4. What is the most purchased item on the menu and how many times was it purchased by all customers?

  * Most purchased item on the menu is ramen

  <p align="center">
    <img src="img/result_04.png" alt="result_04"/>
  </p>

5. Which item was the most popular for each customer?

  * Customer A and C’s favourite item is ramen
  * Customer B enjoys all items in the menu

  <p align="center">
    <img src="img/result_05.png" alt="result_05"/>
  </p>

6. Which item was purchased first by the customer after they became a member?

  * After Customer A became a member, his/her first order is curry, whereas it’s sushi for Customer B

  <p align="center">
    <img src="img/result_06.png" alt="result_06"/>
  </p>

7. Which item was purchased just before the customer became a member?

  * Customer A’s order before he/she became member is sushi and curry
  * Customer B’s order is sushi. That must have been a real good sushi!
  
  <p align="center">
    <img src="img/result_07.png" alt="result_07"/>
  </p>

8. What is the total items and amount spent for each member before they became a member?

  * Customer A spent $ 25 on 2 items
  * Customer B spent $40 on 3 items

  <p align="center">
    <img src="img/result_08.png" alt="result_08"/>
  </p>

9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

  * Total points for Customer A, B and C are 860, 940 and 360

  <p align="center">
    <img src="img/result_09.png" alt="result_09"/>
  </p>

10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

  * Customer A has 1370 points
  * Customer B has 820 points

  <p align="center">
    <img src="img/result_10.png" alt="result_10"/>
  </p>

###       Bonus Questions
1. Join All The Things

  <p align="center">
    <img src="img/bonous_1.png" alt="bonous_1"/>
  </p>

2. Rank All The Things

  <p align="center">
    <img src="img/bonous_2.png" alt="bonous_2"/>
  </p>
