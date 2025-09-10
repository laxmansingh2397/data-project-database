# **Normalization**

## **Introduction to Database Normalization**

Normalization is an important process in database design that helps improve the database's efficiency, consistency, and accuracy. It makes it easier to manage and maintain the data and ensures that the database is adaptable to changing business needs.

* Database normalization is the process of organizing the attributes of the database to reduce or eliminate data redundancy (having the same data but at different places).

* Data redundancy unnecessarily increases the size of the database as the same data is repeated in many places. Inconsistency problems also arise during insert, delete, and update operations. 

* In the relational model, there exist standard methods to quantify how efficient a databases is. These methods are called normal forms and there are algorithms to covert a given database into normal forms.

* Normalization generally involves splitting a table into multiple ones which must be linked each time a query is made requiring data from the split tables.

## **Why do we need Normalization?**

The primary objective for normalizing the relations is to eliminate the below anomalies. Failure to reduce anomalies results in data redundancy, which may threaten data integrity and cause additional issues as the database increases. Normalization consists of a set of procedures that assist you in developing an effective database structure.

* **Insertion Anomalies:** Insertion anomalies occur when it is not possible to insert data into a database because the required fields are missing or because the data is incomplete. For example, if a database requires that every record has a primary key, but no value is provided for a particular record, it cannot be inserted into the database.

* **Deletion anomalies:** Deletion anomalies occur when deleting a record from a database and can result in the unintentional loss of data. For example, if a database contains information about customers and orders, deleting a customer record may also delete all the orders associated with that customer.

* **Updation anomalies:** Updation anomalies occur when modifying data in a database and can result in inconsistencies or errors. For example, if a database contains information about employees and their salaries, updating an employee’s salary in one record but not in all related records could lead to incorrect calculations and reporting.

## **Features of Database Normalization**

* **Elimination of Data Redundancy:** One of the main features of normalization is to eliminate the data redundancy that can occur in a database. Data redundancy refers to the repetition of data in different parts of the database. Normalization helps in reducing or eliminating this redundancy, which can improve the efficiency and consistency of the database.

* **Ensuring Data Consistency:** Normalization helps in ensuring that the data in the database is consistent and accurate. By eliminating redundancy, normalization helps in preventing inconsistencies and contradictions that can arise due to different versions of the same data.

* **Simplification of Data Management:** Normalization simplifies the process of managing data in a database. By breaking down a complex data structure into simpler tables, normalization makes it easier to manage the data, update it, and retrieve it.

* **Improved Database Design:** Normalization helps in improving the overall design of the database. By organizing the data in a structured and systematic way, normalization makes it easier to design and maintain the database. It also makes the database more flexible and adaptable to changing business needs.

* **Avoiding Update Anomalies:** Normalization helps in avoiding update anomalies, which can occur when updating a single record in a table affects multiple records in other tables. Normalization ensures that each table contains only one type of data and that the relationships between the tables are clearly defined, which helps in avoiding such anomalies.

* **Standardization:** Normalization helps in standardizing the data in the database. By organizing the data into tables and defining relationships between them, normalization helps in ensuring that the data is stored in a consistent and uniform manner.


## **Normal Forms DBMS**

**1.** **First Normal Form(1NF):** First Normal Form (1NF) ensures that the structure of a database table is organized in a way that makes it easier to manage and query.

### Rules For First Normal Form (1NF):

1. Using row order to convey information is not permitted.

2. Mixing data types within the same column is not permitted.

3. Having a table without a primary key is not permitted.

4. Repeating groups are not permitted.

#### Problem Example:-

| StudentID | Name | Courses       |
| --------- | ---- | ------------- |
| 1         | John | Math, Physics |
| 2         | Jane | Chemistry     |

**Issue:** The Courses column stores multiple values.

#### Solution-After 1NF:-

| StudentID | Name | Course    |
| --------- | ---- | --------- |
| 1         | John | Math      |
| 1         | John | Physics   |
| 2         | Jane | Chemistry |


**2.** **Second Normal Form (2NF):** Second Normal Form (2NF) is based on the concept of fully functional dependency. It is a way to organize a database table so that it reduces redundancy and ensures data consistency. Fully Functional Dependency means a non-key attribute depends on the entire primary key, not just part of it.

### Rules For Second Normal Form (2NF):

1. Meet 1NF Requirements: The table must first satisfy First Normal Form (1NF), meaning:

    * All columns contain single, indivisible values.
    * No repeating groups of columns.

2. Each non-key attribute in the table must be dependent on the entire primary key. 

#### Problem Example:-

| OrderID | ProductID | ProductName | Quantity |
| ------- | --------- | ----------- | -------- |
| 101     | 1         | Pen         | 10       |
| 101     | 2         | Notebook    | 5        |

**Issue:** ProductName depends only on ProductID, not on the full composite key.

#### Solution-After 2NF:-

Orders Table:
| OrderID | ProductID | Quantity |
| ------- | --------- | -------- |
| 101     | 1         | 10       |
| 101     | 2         | 5        |

Products Table:
| ProductID | ProductName |
| --------- | ----------- |
| 1         | Pen         |
| 2         | Notebook    |

**3.** **Third Normal Form (3NF):** The Third Normal Form (3NF) builds on the First (1NF) and Second (2NF) Normal Forms. Achieving 3NF ensures that the database structure is free of transitive dependencies, reducing the chances of data anomalies. Even though tables in 2NF have reduced redundancy compared to 1NF, they may still encounter issues like update anomalies.

### Rules For Third Normal Form (3NF):

1. It is in Second Normal Form (2NF): This means the table has no partial dependencies (i.e., no non-prime attribute is dependent on a part of a candidate key).

2. There is no transitive dependency for non-prime attributes: In simpler terms, each non-key attribute in the table must depend on the key, the whole key, and nothing but the key.

#### Problem Example:-

| EmployeeID | Name | DepartmentID | DepartmentName |
| ---------- | ---- | ------------ | -------------- |
| 1          | Alex | D01          | Sales          |
| 2          | Bob  | D02          | HR             |

**Issue:** DepartmentName depends on DepartmentID, not directly on EmployeeID.

#### Solution-After 3NF:-

Employees Table:
| EmployeeID | Name | DepartmentID |
| ---------- | ---- | ------------ |
| 1          | Alex | D01          |
| 2          | Bob  | D02          |

Departments Table:
| DepartmentID | DepartmentName |
| ------------ | -------------- |
| D01          | Sales          |
| D02          | HR             |

**4.** **Boyce-Codd Normal Form (BNCF):** Boyce-Codd Normal Form (BCNF) is an advanced version of 3NF used to reduce redundancy in databases. It ensures that for every functional dependency, the left side must be a superkey. This helps create cleaner and more consistent database designs, especially when there are multiple candidate keys.

### Rules For Boyce-Codd Normal Form (BCNF):

1. The table should be in the 3rd Normal Form.

2. Each attribute in the table must depend on the key, the whole key, and nothing but the key.

#### Example Problem:-
A course might have multiple instructors, and instructors can teach multiple courses.

Befor normalization:-
| CourseID | Instructor | Room |
| -------- | ---------- | ---- |
| C01      | Dr. A      | R1   |
| C01      | Dr. B      | R1   |
| C02      | Dr. A      | R2   |
| C02      | Dr. C      | R2   |
| C03      | Dr. B      | R3   |

**Issues:**

    * Room information is duplicated across multiple rows.

    * Updating the room requires multiple updates.

    * Data anomalies may occur.

#### Solution-After BCNF:-

Courses table
| CourseID | Room |
| -------- | ---- |
| C01      | R1   |
| C02      | R2   |
| C03      | R3   |

CourseInstructors table
| CourseID | Instructor |
| -------- | ---------- |
| C01      | Dr. A      |
| C01      | Dr. B      |
| C02      | Dr. A      |
| C02      | Dr. C      |
| C03      | Dr. B      |

**5.** **Fourth Normal Form (4NF):** As databases grow in complexity, proper normalization becomes important to reduce data redundancy and maintain data integrity. Fourth Normal Form (4NF) is a higher level of normalization in relational database design, which deals with multivalued dependencies (MVDs).

**Multivalued Dependency:** A multivalued dependency occurs in a relation when one attribute determines multiple independent values of another attribute, independent of other attributes. A multivalued dependency always requires at least three attributes because it consists of at least two attributes that are dependent on a third.

### Rule For Fourth Normal Form (4NF):

1. It should be in the Boyce-Codd Normal Form (BCNF).

2. The table should not have any Multi-valued Dependency.

#### Example Problem:-

| Course     | Instructor | TextBook\_Author |
| ---------- | ---------- | ---------------- |
| Management | X          | Churchill        |
| Management | Y          | Peters           |
| Management | Z          | Peters           |
| Finance    | A          | Weston           |
| Finance    | A          | Gilbert          |

#### Solution-After 4NF:-

Course Table
| Course     | Instructor |
| ---------- | ---------- |
| Management | X          |
| Management | Y          |
| Management | Z          |
| Finance    | A          |

TextBook Author Table
| Course     | TextBook\_Author |
| ---------- | ----------       |
| Management | Churchill        |
| Management | Peters           |
| Finance    | Weston           |
| Finance    | Gilbert          |

**Key Idea:** 4NF eliminates redundancy caused by multivalued dependencies by separating independent one-to-many relationships into different tables.

**6.** **Fifth Normal Form (5NF):** 5NF is one of the highest levels of normalization, also known as Project-Join Normal Form (PJNF).

### Rule For Fifth Normal Form (5NF) :

1. It is already in 4NF.

    * It should be in BCNF.

    * No multi-valued dependency should exist.

2. It cannot be broken down into smaller tables without losing data.


#### Example Problem:-

| Subject | Class    | Teacher |
| ------- | -------- | ------- |
| math    | class 10 | kartik  |
| math    | class 9  | yash    |
| math    | class 10 | yash    |
| science | class 10 | yash    |

#### Solution-After 5NF:-

Subjects & Class
| Subject | Class    |
| ------- | -------- |
| math    | class 9  |
| math    | class 10 |
| science | class 10 |

Class & Teacher
| Class    | Teacher |
| -------- | ------- |
| class 10 | kartik  |
| class 9  | yash    |
| class 10 | yash    |


## **Advantages of Normalization**

* Normalization eliminates data redundancy and ensures that each piece of data is stored in only one place, reducing the risk of data inconsistency and making it easier to maintain data accuracy.

* By breaking down data into smaller, more specific tables, normalization helps ensure that each table stores only relevant data, which improves the overall data integrity of the database.

* Normalization simplifies the process of updating data, as it only needs to be changed in one place rather than in multiple places throughout the database.

* Normalization enables users to query the database using a variety of different criteria, as the data is organized into smaller, more specific tables that can be joined together as needed.

* Normalization can help ensure that data is consistent across different applications that use the same database, making it easier to integrate different applications and ensuring that all users have access to accurate and consistent data.


## **Disadvantages of Normalization**

* Normalization can result in increased performance overhead due to the need for additional join operations and the potential for slower query execution times.

* Normalization can result in the loss of data context, as data may be split across multiple tables and require additional joins to retrieve.

* Proper implementation of normalization requires expert knowledge of database design and the normalization process. 

* Normalization can increase the complexity of a database design, especially if the data model is not well understood or if the normalization process is not carried out correctly.

