## From <span class="fragment highlight-red">Chaos</span> to <span class="fragment highlight-red">Order</span>: Creating an Effective <span class="fragment highlight-red">Data Model</span> for Your Database

---

### 1. Introduction
#### 1.1. What is the so-called data model?

> A data model is a conceptual representation of data that describes how data is <span class="fragment highlight-red">organized</span>, <span class="fragment highlight-red">stored</span>, and <span class="fragment highlight-red">accessed</span> in a database management system (DBMS). It defines the structure of a database by identifying the <span class="fragment highlight-red">data types</span>, <span class="fragment highlight-red">relationships</span>, <span class="fragment highlight-red">constraints</span>, and <span class="fragment highlight-red">rules</span> that apply to the data. 


---

### 1.2. Examples

<div class="small-size">

**Products Table**

| product_id | name       | description                        | price |
| ---------- | ---------- | ---------------------------------- | ----- |
| 1          | Sofa       | Comfortable living room couch      | 999.99 |
| 2          | Bed        | King size bed with memory foam      | 1499.99 |
| 3          | Desk       | Modern home office desk             | 399.99 |
| 4          | Bookshelf  | Tall wooden bookshelf for any room  | 249.99 |
| 5          | Chair      | Ergonomic office chair for comfort  | 149.99 |

**Orders Table**

| order_id | customer_id | order_date         | total_cost |
| -------- | ----------- | ------------------ | ---------- |
| 1        | 101         | 2023-05-11 12:30:00 | 2149.98    |
| 2        | 102         | 2023-05-10 10:15:00 | 1449.97    |
| 3        | 103         | 2023-05-09 15:45:00 | 849.98     |
</div>
---
### 1.2. Examples

<div class="small-size">

**Order_Items Table**

| order_id | product_id | quantity | price  |
| -------- | ---------- | -------- | ------ |
| 1        | 1          | 1        | 999.99 |
| 1        | 2          | 1        | 1499.99|
| 2        | 4          | 2        | 499.98 |
| 3        | 5          | 3        | 449.97 |

**Customers Table**

| customer_id | first_name | last_name | email                    | address                       |
| ----------- | ---------- | --------- | ------------------------ | ----------------------------- |
| 101         | John       | Smith     | johnsmith@example.com    | 123 Main St, Anytown USA      |
| 102         | Sarah      | Johnson   | sjohnson@example.com     | 456 Oak Ave, Anycity USA      |
| 103         | Michael    | Williams  | michaelwilliams@example.com | 789 Maple Rd, Anystate USA |
</div>


---

### 1.3. Examples

<div class="small-size">

**Movies Table**

| ID | Title            | Year    | Genre   | Rating |
|----|------------------|---------|---------|--------|
| 1  | The Shawshank Redemption | 1994 | Drama | 9.3    |
| 2  | The Godfather           | 1972 | Crime  | 9.2    |
| 3  | The Dark Knight         | 2008 | Action | 9.0    |


**Users Table**
| ID | Name      | Email          | Date_of_Birth  |
|----|-----------|----------------|----------------|
| 1  | John Doe  | john@mail.com | 1990-02-12     |
| 2  | Jane Doe  | jane@mail.com | 1992-05-25     |
| 3  | Bob Smith | bob@mail.com  | 1985-09-08     |

**Rentals Table**

| ID | User_ID | Movie_ID |  Price  | Date_Rented         |
|----|---------|--------|---------|---------------------|
| 1  | 1       | 2       | $3.99   | 2023-05-10 14:30:00 |
| 2  | 2       | 1       | $2.99   | 2023-05-10 18:45:00 |
| 3  | 1       | 3       | $4.99   | 2023-05-11 09:15:00 |
</div>
---
### 1.3. Examples

<div class="small-size">

**Rentals Table**

| Rental ID | User Name | User Email       | User Date of Birth | Movie Title            | Movie Year | Movie Genre | Movie Rating | Rental Price | Date Rented          |
|-----------|-----------|-----------------|--------------------|------------------------|------------|-------------|--------------|--------------|---------------------|
| 1         | John Doe  | john@mail.com   | 1990-02-12         | The Godfather          | 1972       | Crime       | 9.2          | $3.99        | 2023-05-10 14:30:00 |
| 2         | Jane Doe  | jane@mail.com   | 1992-05-25         | The Shawshank Redemption | 1994       | Drama       | 9.3          | $2.99        | 2023-05-10 18:45:00 |
| 3         | John Doe  | john@mail.com   | 1990-02-12         | The Dark Knight         | 2008       | Action      | 9.0          | $4.99        | 2023-05-11 09:15:00 |
</div>
---

## 2. Normalize vs. Denormalize
### 2.1 Normalize
> Normalization is the process of organizing data in a database to minimize <span class="fragment highlight-red">redundancy</span> and improve <span class="fragment highlight-red">data integrity</span>. This involves splitting up data into smaller, more manageable tables and establishing <span class="fragment highlight-red">relationships</span> between them.

---

## 2. Normalize vs. Denormalize
### 2.2 Denormalize
> Denormalization, on the other hand, is the process of intentionally adding redundant data to a database table for <span class="fragment highlight-red">performance optimization</span>. This involves combining related data into a single table, which can result in faster queries but may also increase data redundancy and decrease data consistency.

---

## 2 Normalize vs. Denormalize
### 2.3 Compare
<div class="small-size">


|              | Normalized Data                                          | Denormalized Data                                       |
|--------------|---------------------------------------------------------|--------------------------------------------------------|
| <span class="fragment highlight-green">Data Duplication</span> | Minimal data duplication, each piece of data is stored only once | Data is duplicated in multiple places for faster queries |
| <span class="fragment highlight-green">Data Integrity</span> | Strong data integrity as data is not duplicated           | Data integrity may be compromised due to data duplication |
| <span class="fragment highlight-green">Flexibility</span>    | Can handle changes in data requirements more easily      | Changes in data requirements may require significant rework |
| <span class="fragment highlight-green">Query Performance</span> | Query performance may be slower due to complex joins     | Query performance may be faster due to fewer joins and redundant data |
| <span class="fragment highlight-green">Storage Space</span> | Requires more storage space due to normalization | Requires less storage space due to data duplication |

</div>

---

## 2 Normalize vs. Denormalize
### 2.4 Exercise

Normalize following table(30 Min):

<div class="small-size">

| Order ID | Date       | Product ID | Product Name           | Category         | Sub-Category        | Customer ID | Customer Name    | Region      | Quantity | Price  |
|----------|------------|------------|------------------------|-----------------|---------------------|--------------|------------------|-------------|------------|--------|
| 1001     | 2023-05-01 | P001       | iPhone 12 Pro Max | Electronics | Smartphones         | C001         | John Smith          | North       | 1        | 1099.0 |
| 1002     | 2023-05-02 | P002       | MacBook Air M1      | Electronics | Laptops & Notebooks | C002         | Jane Doe            | South       | 2        | 1299.0 |
| 1003     | 2023-05-03 | P003       | Samsung QLED TV    | Electronics | TVs & Home Theater  | C003         | Bob Johnson        | East        | 1        | 1499.0 |
| 1004     | 2023-05-04 | P004       | Nike Air Max 270  | Fashion     | Men's Shoes         | C001         | John Smith           | North        | 1        | 150.0  |
| 1005     | 2023-05-05 | P005       | Bose QuietComfort 35 | Electronics | Headphones          | C005         | David Kim          | North       | 2        | 349.0  |
| 1006     | 2023-05-06 | P006       | Canon EOS R6          | Electronics | Cameras & Camcorders | C006         | Emily Chen         | South       | 1        | 2499.0 |
| 1007     | 2023-05-07 | P007       | Amazon Echo Dot      | Electronics | Smart Home Devices  | C007         | Michael Brown | East        | 3        | 49.99 |
| 1008     | 2023-05-08 | P008       | Adidas Ultraboost   | Fashion     | Women's Shoes       | C008         | Samantha Lee | West        | 1        | 180.0  |
| 1009     | 2023-05-09 | P009       | LG OLED TV             | Electronics | TVs & Home Theater  | C009         | Jack Wang         | North       | 1        | 1899.0 |
| 1010     | 2023-05-10 | P010       | Apple Watch Series 7 | Electronics | Smartwatches        | C010         | Olivia Johnson  | South       | 1        | 399.0  |

</div>

---

## 2 Normalize vs. Denormalize
### 2.5 Exercise
Denormalize following tables(30 Min):

<div class="small-size float">

**Orders Table:**

| Order ID | Date       | Customer ID |
|----------|------------|--------------|
| 1001     | 2023-05-01 | C001         |
| 1002     | 2023-05-02 | C002         |
| 1003     | 2023-05-03 | C003         |
| 1004     | 2023-05-04 | C004         |
| 1005     | 2023-05-05 | C005         |
| 1006     | 2023-05-06 | C006         |
| 1007     | 2023-05-07 | C007         |
| 1008     | 2023-05-08 | C008         |
| 1009     | 2023-05-09 | C009         |
| 1010     | 2023-05-10 | C010         |

</div>
<div class="small-size float">

**Customers Table:**

| Customer ID | Customer Name |
|--------------|------------------|
| C001         | John Smith          |
| C002         | Jane Doe            |
| C003         | Bob Johnson        |
| C004         | Sarah Lee           |
| C005         | David Kim          |
| C006         | Emily Chen         |
| C007         | Michael Brown |
| C008         | Samantha Lee |
| C009         | Jack Wang         |
| C010         | Olivia Johnson  |
</div>
<div class="small-size float">

**Products Table:**

| Product ID | Product Name           | Category         | Sub-Category        | Price  |
|------------|------------------------|-----------------|---------------------|--------|
| P001       | iPhone 12 Pro Max | Electronics | Smartphones         | 1099.0 |
| P002       | MacBook Air M1      | Electronics | Laptops & Notebooks | 1299.0 |
| P003       | Samsung QLED TV    | Electronics | TVs & Home Theater  | 1499.0 |
| P004       | Nike Air Max 270  | Fashion     | Men's Shoes         | 150.0  |
| P005       | Bose QuietComfort 35 | Electronics | Headphones          | 349.0  |
| P006       | Canon EOS R6          | Electronics | Cameras & Camcorders | 2499.0 |
| P007       | Amazon Echo Dot      | Electronics | Smart Home Devices  | 49.99 |
| P008       | Adidas Ultraboost   | Fashion     | Women's Shoes       | 180.0  |
| P009       | LG OLED TV             | Electronics | TVs & Home Theater  | 1899.0 |
| P010       | Apple Watch Series 7 | Electronics | Smartwatches        | 399.0  |
</div>
<div class="small-size float" >

**Order Details Table:**

| Order ID | Product ID | Quantity |
|----------|------------|-----------|
| 1001     | P001       | 1        |
| 1002     | P002       | 2        |
| 1003     | P003       | 1        |
| 1004     | P004       | 1        |
| 1005     | P005       | 2        |
| 1006     | P006       | 1        |
| 1007     | P007       | 3        |
| 1008     | P008       | 1        |
| 1009     | P009       | 1        |
| 1010     | P010       | 1        |

</div>

---
## 2 Normalize vs. Denormalize
### 2.6 Exercise

<div class="small-size" >

**Customers table**

| Customer ID | Customer Name |
|--------------|------------------|
| C001         | John Smith          |
| C002         | Jane Doe            |
| C003         | Bob Johnson        |

**Orders table**

| Order ID | Date       | Customer ID | Item               | Quantity | Price |
|----------|------------|--------------|------------------|-----------|---------|
| 1001     | 2023-05-01 | C001         | Latte             | 1        | 3.50   |
| 1002     | 2023-05-01 | C001         | Muffin         | 2        | 2.00   |
| 1003     | 2023-05-02 | C002         | Espresso       | 1        | 2.50   |
| 1004     | 2023-05-02 | C002         | Croissant      | 1        | 1.75   |
| 1005     | 2023-05-03 | C003         | Americano   | 2        | 4.00   |

</div>
---

## 2 Normalize vs. Denormalize
### 2.7 Solution

<div class="small-size" >

| Order ID | Date       | Customer ID | Customer Name | Item               | Quantity | Price |
|----------|------------|--------------|------------------|------------------|-----------|---------|
| 1001     | 2023-05-01 | C001         | John Smith          | Latte             | 1        | 3.50   |
| 1002     | 2023-05-01 | C001         | John Smith          | Muffin         | 2        | 2.00   |
| 1003     | 2023-05-02 | C002         | Jane Doe            | Espresso       | 1        | 2.50   |
| 1004     | 2023-05-02 | C002         | Jane Doe            | Croissant      | 1        | 1.75   |
| 1005     | 2023-05-03 | C003         | Bob Johnson        | Americano   | 2        | 4.00   |
</div>

---
## 3. Relation types
### 3.1 <span class="fragment highlight-green">One-to-One (1:1) Relationship</span>
   In a one-to-one relationship, each record in Table A can only have one matching record in Table B, and each record in Table B can only have one matching record in Table A

<div class="small-size" >

**Table 1: Customer Information**

| Customer ID | First Name | Last Name | Email              |
|-------------|------------|-----------|---------------------|
| 001         | John       | Smith     | john.smith@example.com |
| 002         | Jane       | Doe       | jane.doe@example.com   |
| 003         | Bob        | Johnson   | bob.johnson@example.com |

**Table 2: Customer Address**

| Customer ID | Street Address | City       | State | Zip Code |
|-------------|----------------|-------------|--------|-----------|
| 001         | 123 Main St   | Anytown | CA    | 12345    |
| 002         | 456 Elm St     | Othertown | NY   | 67890    |
| 003         | 789 Maple St | Anothertown | FL | 24680     |
</div>

---

## 3. Relation types
### 3.2 <span class="fragment highlight-green">One-to-Many (1:N) Relationship</span>

<div class="small-size" >

In a one-to-many relationship, each record in Table A can have many matching records in Table B, but each record in Table B can only have one matching record in Table A.


**Books**
| Book ID | Title           | Author        | Publication Date |
|---------|----------------|---------------|------------------|
| 1       | To Kill a Mockingbird | Harper Lee | 1960             |
| 2       | 1984            | George Orwell | 1949             |
| 3       | The Great Gatsby | F. Scott Fitzgerald | 1925      |

**Borrowers**
| Borrower ID | Name      | Book ID |
|-------------|-----------|---------|
| 1           | John Smith | 1       |
| 2           | Jane Doe  | 2       |
| 3           | Bob Johnson  | 1       |
| 4           | Sarah Lee | 3       |
</div>
---

## 3. Relation types
### 3.3 <span class="fragment highlight-green">Many-to-One (1:N)</span>

<div class="small-size" >

In a many-to-one relationship, each record in Table A can only have one matching record in Table B, but each record in Table B can have many matching records in Table A.

**Department table:**

| Department ID | Department Name |
|---------------|-----------------|
| 1             | Sales           |
| 2             | Marketing       |
| 3             | IT              |

**Employee table:**

| Employee ID | Employee Name | Department ID |
|-------------|---------------|-----------------|
| 1           | John Smith    | 1               |
| 2           | Jane Doe      | 2               |
| 3           | Bob Johnson  | 3               |
| 4           | Sarah Lee      | 1               |
| 5           | David Kim     | 2               |

</div>
---

## 3. Relation types
### 3.4 <span class="fragment highlight-green">Many-to-One (1:N)</span>

<div class="small-size float" >

**Students**

| Student ID | Student Name |
|------------|--------------|
| 1          | John         |
| 2          | Jane         |
| 3          | Bob          |
| 4          | Alice        |
</div>


<div class="small-size float" >

**Courses**

| Course ID | Course Name |
|-----------|-------------|
| 1         | Math        |
| 2         | Science     |
| 3         | History     |
| 4         | English     |
</div>


<div class="small-size float" >

**Enrollment**

| Student ID | Course ID |
|------------|-----------|
| 1          | 1         |
| 1          | 2         |
| 2          | 2         |
| 3          | 1         |
| 3          | 3         |
| 4          | 4         |

</div>
---



### 3.5 Exercise

<div class="fragment fade-in medium-size highlight-green">customer - orders</div>
<div class="fragment fade-in medium-size">A customer can place many orders. (One-to-Many)</div>

<div class="fragment fade-in medium-size green">Person and Passport</div>
<div class="fragment fade-in medium-size">A person can only have one passport, and each passport belongs to only one person. (One-to-One)</div>

<div class="fragment fade-in medium-size green">student and courses</div>
<div class="fragment fade-in medium-size">A student can enroll in many courses. (One-to-Many)</div>


<div class="fragment fade-in medium-size green">blog and comments</div>
<div class="fragment fade-in medium-size">A blog post can have many comments. (One-to-Many)</div>


<div class="fragment fade-in medium-size green">department and employees</div>
<div class="fragment fade-in medium-size">A department can have many employees. (One-to-Many)</div>


<div class="fragment fade-in medium-size green">department and employees</div>
<div class="fragment fade-in medium-size">A department can have many employees. (One-to-Many)</div>

<div class="fragment fade-in medium-size green">product and reviews</div>
<div class="fragment fade-in medium-size">A product can have many reviews. (One-to-Many)</div>

<div class="fragment fade-in medium-size green">Company and CEO</div>
<div class="fragment fade-in medium-size">Each company can have only one CEO, and each CEO can only be the CEO of one company at a time(One-to-Many)</div>

<div class="fragment fade-in medium-size green">Book and Author</div>
<div class="fragment fade-in medium-size">Each book can have many Author, and each author can have many the books(Many-to-Many)</div>

<div class="fragment fade-in medium-size green">Movie and Actor</div>
<div class="fragment fade-in medium-size">A movie database where multiple actors can star in multiple movies and each movie can feature multiple actors.(Many-to-Many)</div>
---

## 4. Data Model Concepts
<div class="medium-size" >

1. <span class="fragment highlight-red">Entities</span>: Entities are objects or concepts that are relevant to the business or system being modeled. For example, in a university system, entities may include students, courses, and instructors.

2. <span class="fragment highlight-red">Attributes</span>: Attributes are characteristics or properties of an entity. For example, a student entity may have attributes such as name, address, and student ID.

3. <span class="fragment highlight-red">Relationships</span>: Relationships describe the associations between entities. They can be one-to-one, one-to-many, or many-to-many.

4. <span class="fragment highlight-red">Keys</span>: Keys are used to uniquely identify each instance of an entity. Primary keys are used to uniquely identify each row in a table, while foreign keys are used to link tables together.

5. <span class="fragment highlight-red">Normalization and Denormalization</span>: Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity.
6. <span class="fragment highlight-red">Foreign Keys</span>: A foreign key is a column or set of columns in a table that refers to the primary key of another table
7. <span class="fragment highlight-red">Constraints</span>: Constraints are rules that the database management system (DBMS) enforces to maintain the accuracy, consistency, and integrity of the data in the database. rules such as primary key, unique, not null, check, and foreign key constraints.
8. <span class="fragment highlight-red">Data Types</span>: Data types specify the type of data that can be stored in a column in a table. The most common data types include numeric, character, date/time, and boolean data types.
</div>

---

### Project Ideas
1. Hotel
2. Online Restaurant
3. School
4. Library
5. Company

---

### learning SELECT query 

   - Retrieve all users from the User table:
<div class="fragment fade-in">
   <pre>
   <code>
      SELECT * FROM User;
   </code>
   </pre>
</div>

---

### learning SELECT query 

   - Retrieve the names and email addresses of all users:

<div class="fragment fade-in">
   <pre>
   <code>
      SELECT name, email FROM User;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the hotel names and addresses of all hotels:

<div class="fragment fade-in">
   <pre>
   <code>
      SELECT name, address FROM Hotel;
   </code>
   </pre>
   </div>
---

### learning SELECT query 

   - Retrieve the room types and their descriptions:

<div class="fragment fade-in">
   <pre>
   <code>
      SELECT name, description FROM RoomType;
   </code>
   </pre>
   </div>

---

### learning SELECT query 


   - Retrieve the room numbers and prices per night for all rooms:

<div class="fragment fade-in">
   <pre>
   <code>
      SELECT room_number, price_per_night FROM Room;
   </code>
   </pre>
   </div>
---

### learning SELECT query 

   - Retrieve the names and email addresses of users whose phone number starts with '555':

<div class="fragment fade-in">
   <pre>
   <code>
   SELECT name, email FROM User WHERE phone_number LIKE '555%';
   </code>
   </pre>
   </div>

---

### learning SELECT query 



   - Retrieve the hotel names and addresses of hotels located in a specific city:

<div class="fragment fade-in">
   <pre>
   <code>
SELECT name, address FROM Hotel WHERE city = 'New York';
   </code>
   </pre>
   </div>
---

### learning SELECT query 

   - Retrieve the room types and their descriptions for rooms that are currently available:

<div class="fragment fade-in">
   <pre>
   <code>
SELECT rt.name, rt.description
FROM RoomType rt
JOIN Room r ON rt.room_type_id = r.room_type_id
WHERE r.availability = true;
   </code>
   </pre>
   </div>

---
### learning SELECT query 

   - Retrieve the reservation IDs, check-in dates, and check-out dates for a specific user:

<div class="fragment fade-in">
   <pre>
   <code>
SELECT reservation_id, check_in_date, check_out_date
FROM Reservation
WHERE user_id = 123;
   </code>
   </pre>
   </div>
---

### learning SELECT query 

   - Retrieve the total price and check-out date for a specific reservation:

<div class="fragment fade-in">
   <pre>
   <code>
SELECT total_price, check_out_date
FROM Reservation
WHERE reservation_id = 456;
   </code>
   </pre>
   </div>
---

### learning SELECT query 

   - Retrieve the count of users for each city:
   <div class="fragment fade-in">
   <pre>
   <code>
    SELECT city, COUNT(*) AS user_count
FROM User
GROUP BY city;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the average price per night for each room type:
   <div class="fragment fade-in">
   <pre>
   <code>
   SELECT room_type_id, AVG(price_per_night) AS average_price
FROM Room
GROUP BY room_type_id;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the total price and count of reservations for each user:
   
   <div class="fragment fade-in">
   <pre>
   <code>
    SELECT user_id, SUM(total_price) AS total_price, COUNT(*) AS reservation_count
FROM Reservation
GROUP BY user_id;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the maximum and minimum prices per night for each hotel:
   
   <div class="fragment fade-in">
   <pre>
   <code>
    SELECT hotel_id, MAX(price_per_night) AS max_price, MIN(price_per_night) AS min_price
FROM Room
GROUP BY hotel_id;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the average check-in and check-out dates for each user:

   <div class="fragment fade-in">
   <pre>
   <code>
    SELECT user_id, AVG(check_in_date) AS average_check_in_date, AVG(check_out_date) AS average_check_out_date
FROM Reservation
GROUP BY user_id;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the total price and average duration of reservations for each room type:
   
   <div class="fragment fade-in">
   <pre>
   <code>
    SELECT room_type_id, SUM(total_price) AS total_price, AVG(DATEDIFF(check_out_date, check_in_date)) AS average_duration
FROM Reservation
GROUP BY room_type_id;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the count of available and unavailable rooms for each hotel:

   <div class="fragment fade-in">
   <pre>
   <code>
    SELECT hotel_id, SUM(CASE WHEN availability = 1 THEN 1 ELSE 0 END) AS available_rooms, SUM(CASE WHEN availability = 0 THEN 1 ELSE 0 END) AS unavailable_rooms
FROM Room
GROUP BY hotel_id;
   </code>
   </pre>
   </div>

---
### learning SELECT query 

   - Retrieve the total number of reservations made for each room number:

   <div class="fragment fade-in">
   <pre>
   <code>
    SELECT room_number, COUNT(*) AS reservation_count
FROM Reservation
GROUP BY room_number;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve all users with their corresponding hotel names:

  <div class="fragment fade-in">
   <pre>
   <code>
SELECT u.*, h.name AS hotel_name
FROM User u
JOIN Reservation r ON u.user_id = r.user_id
JOIN Room rm ON r.room_id = rm.room_id
JOIN Hotel h ON rm.hotel_id = h.hotel_id;
   </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve all reservations with the corresponding user names and room numbers:

  <div class="fragment fade-in">
   <pre>
   <code>
SELECT r.*, u.name AS user_name, rm.room_number
FROM Reservation r
JOIN User u ON r.user_id = u.user_id
JOIN Room rm ON r.room_id = rm.room_id;
   </code>
   </pre>
   </div>
---

### learning SELECT query 

   - Retrieve all rooms with their corresponding hotel names and room types:

 <div class="fragment fade-in">
   <pre>
   <code>
    SELECT rm.*, h.name AS hotel_name, rt.name AS room_type
FROM Room rm
JOIN Hotel h ON rm.hotel_id = h.hotel_id
JOIN RoomType rt ON rm.room_type_id = rt.room_type_id;
  </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve all reservations with the corresponding user names, room numbers, and hotel addresses:

  <div class="fragment fade-in">
   <pre>
   <code>
SELECT r.*, u.name AS user_name, rm.room_number, h.address
FROM Reservation r
JOIN User u ON r.user_id = u.user_id
JOIN Room rm ON r.room_id = rm.room_id
JOIN Hotel h ON rm.hotel_id = h.hotel_id;
  </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve all users who have made a reservation for a room with a specific room type:
  
  <div class="fragment fade-in">
   <pre>
   <code>
    SELECT u.*
FROM User u
JOIN Reservation r ON u.user_id = r.user_id
JOIN Room rm ON r.room_id = rm.room_id
JOIN RoomType rt ON rm.room_type_id = rt.room_type_id
WHERE rt.name = 'Deluxe Room';
  </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve the total number of reservations made by each user:

  <div class="fragment fade-in">
   <pre>
   <code>
    SELECT u.user_id, u.name, COUNT(r.reservation_id) AS total_reservations
FROM User u
LEFT JOIN Reservation r ON u.user_id = r.user_id
GROUP BY u.user_id, u.name;
  </code>
   </pre>
   </div>

---

### learning SELECT query 

   - Retrieve all hotels with the number of available rooms for each hotel:
  
  <div class="fragment fade-in">
   <pre>
   <code>
SELECT h.*, COUNT(rm.room_id) AS available_rooms
FROM Hotel h
LEFT JOIN Room rm ON h.hotel_id = rm.hotel_id AND rm.availability = true
GROUP BY h.hotel_id, h.name, h.address, h.city, h.country, h.description;
  </code>
   </pre>
   </div>
---

### learning SELECT query 

   - Retrieve all room types along with the number of rooms available for each type:

 <div class="fragment fade-in">
   <pre>
   <code>
    SELECT rt.*, COUNT(rm.room_id) AS available_rooms
FROM RoomType rt
LEFT JOIN Room rm ON rt.room_type_id = rm.room_type_id AND rm.availability = true
GROUP BY rt.room_type_id, rt.name, rt.description;

  </code>
   </pre>
   </div>
