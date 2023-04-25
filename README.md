# Questions and Answers

## Select operation

### 1757
##### Recyclable and Low Fat Products

Write an SQL query to find the ids of products that are both low fat and recyclable.
Return the result table in any order.
The query result format is in the following example.

Example 1:

Input: 

Products table:
| product_id  | low_fats | recyclable |
|-------------|----------|------------|
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |

Output: 
| product_id  |
|-------------|
| 1           |
| 3           |

Explanation: Only products 1 and 3 are both low fat and recyclable.

```sql
select product_id 
from Products 
where low_fats='Y' and recyclable='Y';
```
<br>



### 584
##### Find Customer Referee

Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input: 

Customer table:<br>
| id | name | referee_id |
| ---- | ------ | ------------ |
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |

Output: 
| name |
|------|
| Will |
| Jane |
| Bill |
| Zack |


```sql
select name 
from Customer 
where referee_id is null or referee_id !=2;
```
<br>



### 595
##### Big Countries

A country is big if:
it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).

Write an SQL query to report the name, population, and area of the big countries.
Return the result table in any order.
The query result format is in the following example.

Example 1:

Input: 

World table:
| name        | continent | area    | population | gdp          |
|-------------|-----------|---------|------------|--------------|
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |

Output: 
| name        | population | area    |
|-------------|------------|---------|
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
```sql
select name, population, area 
from World 
where area>=3000000 or population>=25000000;
```
<br>


### 1148
##### Article Views

Write an SQL query to find all the authors that viewed at least one of their own articles.
Return the result table sorted by id in ascending order.
The query result format is in the following example.


Example 1:

Input: 

Views table:
| article_id | author_id | viewer_id | view_date  |
|------------|-----------|-----------|------------|
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |

Output: 
| id   |
|------|
| 4    |
| 7    |
```sql
select distinct viewer_id as id 
from Views 
where author_id=viewer_id 
order by viewer_id;
```
<br>



### 1683
##### Invalid Tweets
Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input: 

Tweets table:
| tweet_id | content                          |
|----------|----------------------------------|
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |

Output: 
| tweet_id |
|----------|
| 2        |

Explanation: 
Tweet 1 has length = 14. It is a valid tweet.
Tweet 2 has length = 32. It is an invalid tweet.
```sql
select tweet_id 
from Tweets 
where char_length(content)>15;
```
<br>




## Basic Joins

### 1378
##### Replace Employee ID With The Unique Identifier

Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just show null.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input: 

Employees table:
| id | name     |
|----|----------|
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |

EmployeeUNI table:
| id | unique_id |
|----|-----------|
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |

Output: 
| unique_id | name     |
|-----------|----------|
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |

Explanation: 
Alice and Bob do not have a unique ID, We will show null instead.
The unique ID of Meir is 2.
The unique ID of Winston is 3.
The unique ID of Jonathan is 1.

```sql
select employees.name,employeeuni.unique_id 
from employees 
left join employeeuni on employees.id=employeeuni.id;
```
<br>


### 1068
##### Product Sales Analysis I

Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.
Return the resulting table in any order.
The query result format is in the following example.


Example 1:

Input:

Sales table:
| sale_id | product_id | year | quantity | price |
|---------|------------|------|----------|-------| 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |

Product table:

| product_id | product_name |
|------------|--------------|
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |

Output:
| product_name | year  | price |
|--------------|-------|-------|
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |

Explanation: 
From sale_id = 1, we can conclude that Nokia was sold for 5000 in the year 2008.
From sale_id = 2, we can conclude that Nokia was sold for 5000 in the year 2009.
From sale_id = 7, we can conclude that Apple was sold for 9000 in the year 2011.

```sql
select product.product_name, sales.year, sales.price 
from sales, product 
where sales.product_id=product.product_id;
```
<br>


### 1581
##### Customer Who Visited but Did Not Make Any Transactions

Write a SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.
The query result format is in the following example.


Example 1:

Input: 

Visits
| visit_id | customer_id |
|----------|-------------|
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |

Transactions
| transaction_id | visit_id | amount |
|----------------|----------|--------|
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |

Output: 
| customer_id | count_no_trans |
|-------------|----------------|
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |

Explanation: 
Customer with id = 23 visited the mall once and made one transaction during the visit with id = 12.
Customer with id = 9 visited the mall once and made one transaction during the visit with id = 13.
Customer with id = 30 visited the mall once and did not make any transactions.
Customer with id = 54 visited the mall three times. During 2 visits they did not make any transactions, and during one visit they made 3 transactions.
Customer with id = 96 visited the mall once and did not make any transactions.
As we can see, users with IDs 30 and 96 visited the mall one time without making any transactions. Also, user 54 visited the mall twice and did not make any transactions.

```sql
select visits.customer_id, count(visits.visit_id) as count_no_trans
from visits
left join transactions on visits.visit_id=transactions.visit_id
where transactions.transaction_id is null
group by visits.customer_id;
```
<br>



### 197
##### Rising Temperature

Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input: 

Weather table:
| id | recordDate | temperature |
|----|------------|-------------|
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |

Output: 

| id |
|----|
| 2  |
| 4  |

Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).

```sql
select A.id 
from weather A, weather B
where datediff(A.recordDate,B.recordDate) = 1
and A.temperature > B.temperature;
```
<br>



### 1661
##### Average Time Of Process Per Machine

There is a factory website that has several machines each running the same number of processes. Write an SQL query to find the average time each machine takes to complete a process.
The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input:

Activity table:
| machine_id | process_id | activity_type | timestamp |
|------------|------------|---------------|-----------|
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |

Output: 
| machine_id | processing_time |
|------------|-----------------|
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |

Explanation: 
There are 3 machines running 2 processes each.
Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456

```sql
select machine_id, 
round(sum(case when activity_type = 'start' then -1*timestamp else timestamp end)/count(distinct process_id),3) as processing_time
from activity
group by machine_id;
```
<br>



### 577
##### Employee Bonus

Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input: 

Employee table:
| empId | name   | supervisor | salary |
|-------|--------|------------|--------|
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |

Bonus table:
| empId | bonus |
|-------|-------|
| 2     | 500   |
| 4     | 2000  |

Output: 
| name | bonus |
|------|-------|
| Brad | null  |
| John | null  |
| Dan  | 500   |


```sql
select employee.name, bonus.bonus
from employee
left join bonus on employee.empId=bonus.empId
where ifnull(bonus,0)<1000;
```
<br>


### 1280
##### Students and Examinations

Write an SQL query to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.
The query result format is in the following example.


Example 1:

Input:

Students table:
| student_id | student_name |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |

Subjects table:
| subject_name |
|--------------|
| Math         |
| Physics      |
| Programming  |

Examinations table:
| student_id | subject_name |
|------------|--------------|
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |

Output: 
| student_id | student_name | subject_name | attended_exams |
|------------|--------------|--------------|----------------|
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |

Explanation: 
The result table should contain all students and all subjects.
Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
Alex did not attend any exams.
John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.

```sql
select s.student_id, s.student_name,sub.subject_name, 
count(e.student_id) as attended_exams
from students s
cross join subjects sub
left join examinations e
using (student_id, subject_name)
group by s.student_id, sub.subject_name
order by student_id, subject_name;
```
<br>



### 570
##### Managers With At Least 5 Direct Reports

Write an SQL query to report the managers with at least five direct reports.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input:

Employee table:
| id  | name  | department | managerId |
|-----|-------|------------|-----------|
| 101 | John  | A          | None      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |

Output: 
| name |
|------|
| John |

```sql
select distinct g.name as name
from employee e join employee g
on g.id=e.managerid
group by g.id
having count(*)>=5;
```
<br>



### 1934
##### Confirmation Rate

The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write an SQL query to find the confirmation rate of each user.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input:

Signups table:
| user_id | time_stamp          |
|---------|---------------------|
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |

Confirmations table:
| user_id | time_stamp          | action    |
|---------|---------------------|-----------|
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |

Output: 
| user_id | confirmation_rate |
|---------|-------------------|
| 6       | 0.00              |
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |

Explanation:
User 6 did not request any confirmation messages. The confirmation rate is 0.
User 3 made 2 requests and both timed out. The confirmation rate is 0.
User 7 made 3 requests and all were confirmed. The confirmation rate is 1.
User 2 made 2 requests where one was confirmed and the other timed out. The confirmation rate is 1 / 2 = 0.5.

```sql
select user_id,round(avg(if(action = 'confirmed', 1, 0)), 2) as confirmation_rate
FROM Signups left join Confirmations using(user_id)
group by 1
order by 1;
```
<br>



## Basic Aggregate Functions

### 620
##### Not Boring Movies

Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.
The query result format is in the following example.


Example 1:

Input:

Cinema table:
| id | movie      | description | rating |
|----|------------|-------------|--------|
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |

Output: 
| id | movie      | description | rating |
|----|------------|-------------|--------|
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |

Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.

```sql
select * from cinema
where id%2!=0 and description!="boring"
order by rating desc;
```
<br>



### 1251
##### Average Selling Price

Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.
Return the result table in any order.
The query result format is in the following example.


Example 1:

Input:

Prices table:
| product_id | start_date | end_date   | price  |
|------------|------------|------------|--------|
| 1          | 2019-02-17 | 2019-02-28 | 5      |
| 1          | 2019-03-01 | 2019-03-22 | 20     |
| 2          | 2019-02-01 | 2019-02-20 | 15     |
| 2          | 2019-02-21 | 2019-03-31 | 30     |

UnitsSold table:
| product_id | purchase_date | units |
|------------|---------------|-------|
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |

Output: 
| product_id | average_price |
|------------|---------------|
| 1          | 6.96          |
| 2          | 16.96         |

Explanation: 
Average selling price = Total Price of Product / Number of products sold.
Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96

```sql
select prices.product_id, ROUND(SUM(price * units) / SUM(units), 2) as average_price
from Prices join UnitsSold 
on prices.product_id = unitssold.product_id
and purchase_date between start_date and end_date
group by product_id;
```
<br>


