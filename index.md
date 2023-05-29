## Exploring <span class="fragment highlight-red">ClickHouse</span>: 
### A High-Performance <span class="fragment highlight-red">Columnar</span> Database for Real-Time Analytics 

---

### 1. Introduction
#### 1.1. Brief history of ClickHouse

> ClickHouse was initially developed by <span class="fragment highlight-red">Yandex</span>, a leading Russian search engine company, to address its internal analytical needs in 2016. Due to its outstanding performance and features, the project was open-sourced under the Apache 2.0 license, leading to widespread adoption across various industries worldwide.


---

### 1.2. Key features and benefits

- <span class="fragment highlight-current-red">**Columnar storage:**</span> Designed for analytical workloads, enabling efficient data compression and faster querying.
  
- <span class="fragment highlight-current-red">**High performance:**</span> Capable of processing large volumes of data with low latency using parallel and distributed processing techniques.
  
- <span class="fragment highlight-current-red">**Scalability:**</span> Supports both horizontal and vertical scaling for seamless growth and adaptability.

- <span class="fragment highlight-current-red">**Flexible querying:**</span> Offers a powerful SQL-like query language with advanced analytical capabilities.

- <span class="fragment highlight-current-red">**Integration:**</span> Easily integrates with various data sources like Kafka, Hadoop, and other databases.


---


## 2. <span class="fragment highlight-green">RDBMS</span> vs. <span class="fragment highlight-green">Columnar</span> Database: 
### MySQL vs. ClickHouse 

---


## 2.1. Data model

<span class="fragment highlight-green">**MySQL (RDBMS):**</span> MySQL stores data in a <span class="fragment highlight-red">row-based</span> format, with records stored as rows in a table. This design is well-suited for transactional workloads where records are frequently inserted, updated, or deleted, and queries often involve specific rows and a limited number of columns.

<span class="fragment highlight-green">**ClickHouse (Columnar Database):**</span> ClickHouse stores data in a <span class="fragment highlight-red">columnar</span> format, organizing data by columns rather than rows. This design is optimized for analytical workloads, where queries typically involve aggregations and calculations across a large number of rows and a limited number of columns.

---
## 2.1. Data model

<div class="r-stack">
  <div class="fragment fade-in-then-out">
      <p>Row Based vs. Column Based </p>
      <img src="/img/column-oriented-database1.jpg" width="450" height="300">
  </div>

   <div class="fragment fade-in-then-out">
      <p>Row Based</p>
      <img src="/img/row-oriented-3e6fd5aa48e3075202d242b4799da8fa.gif" width="450" height="300">
  </div>

   <div class="fragment fade-in-then-out">
      <p>Column Based</p>
      <img  src="/img/column-oriented-d082e49b7743d4ded32c7952bfdb028f.gif" width="450" height="300">
  </div>
</div>

---

### 2.2. Use cases

<span class="fragment highlight-green">**MySQL (RDBMS):**</span> MySQL is ideal for transactional workloads, such as online transaction processing (OLTP) systems, where the focus is on storing, updating, and retrieving individual records quickly. Examples include <span class="fragment highlight-current-red">e-commerce platforms</span>, <span class="fragment highlight-current-red">inventory management systems</span>, and <span class="fragment highlight-current-red">customer relationship management (CRM) applications</span>.

<span class="fragment highlight-green">**ClickHouse (Columnar Database):**</span> ClickHouse excels at <span class="fragment highlight-current-red">analytical</span> workloads, such as online analytical processing (OLAP) systems, where the focus is on processing and analyzing large volumes of data across many rows. Examples include <span class="fragment highlight-current-red">real-time analytics</span>, <span class="fragment highlight-current-red">time-series data</span> analysis, and <span class="fragment highlight-current-red">large-scale event logging</span>.

---

### 2.3. Real-time data ingestion use cases

Real-time data ingestion is a crucial aspect of various applications, such as:

  - <span class="fragment highlight-green">Log and event data analysis</span>: ClickHouse can process and analyze high-velocity log and event data from web servers, applications, or IoT devices.
  - <span class="fragment highlight-green">Stream processing</span>: ClickHouse's Kafka integration enables real-time stream processing and analytics for applications like fraud detection and recommendation engines.
  - <span class="fragment highlight-green">Time-series data</span>: ClickHouse's performance and scalability make it an excellent choice for handling large volumes of time-series data, such as sensor readings or financial market data.

---

## 3. What Makes ClickHouse so Fast?
### 3.1. <span class="fragment highlight-green">Columnar storage model</span>`

ClickHouse employs a columnar storage model, which stores data by columns rather than rows. This design offers several advantages for analytical workloads, including efficient data compression and faster query execution, as only relevant columns need to be read during a query.

---

## 3. What Makes ClickHouse so Fast?
### 3.2. <span class="fragment highlight-green">Data compression</span>

ClickHouse utilizes various compression algorithms, such as LZ4 and ZSTD, to reduce storage space and improve query performance. The columnar storage model naturally lends itself to better compression ratios, as data within columns is often more homogeneous.

---

## 3. What Makes ClickHouse so Fast?
### <span class="fragment highlight-green">3.3. Distributed and replicated architecture</span>

ClickHouse's distributed architecture enables horizontal scaling and high availability. Data is automatically partitioned and distributed across multiple nodes or shards, while replication ensures data redundancy and fault tolerance. The system employs a quorum-based approach for consistency and supports various replication strategies.

---

## 3. What Makes ClickHouse so Fast?
### <span class="fragment highlight-green">3.4. Indexing and partitioning</span>

ClickHouse offers multiple indexing options, including sparse primary key index, skipping data index (secondary index), and materialized views, to optimize query performance. Additionally, partitioning divides data into manageable chunks based on specific criteria (e.g., date ranges), further enhancing query speed and data management efficiency.

---

## 3. What Makes ClickHouse so Fast?
### <span class="fragment highlight-green">3.4. Indexing and partitioning</span>
#### <span class="fragment highlight-blue">3.4.1 Sparse Index</span>

> Traditional relational databases have one entry per table row in their primary index, but ClickHouse uses a different approach optimized for handling massive data volumes. The MergeTree Engine Family in ClickHouse stores data in table parts, with each part having its own primary index. As parts merge, their primary indexes also merge. To maintain disk and memory efficiency, ClickHouse uses a sparse index technique where one index entry (a "mark") represents a group of rows (a "granule") rather than indexing every individual row.

---

## 3. What Makes ClickHouse so Fast?
### <span class="fragment highlight-green">3.4. Indexing and partitioning</span>
#### <span class="fragment highlight-blue">3.4.2 Data Skipping Index</span>

ClickHouse <span class="fragment highlight-red">Data Skipping Indexes</span> improve query performance by <span class="fragment highlight-red">skipping irrelevant data</span> based on aggregated information stored for groups of rows called granules. This feature reduces the amount of data to be processed, <span class="fragment highlight-blue">saving time</span> and <span class="fragment highlight-blue">resources</span>, and is most effective when the indexed data has some order or structure.
> For example, if you have a dataset with temperature readings for different cities and dates, and you want to find all entries where the temperature is above 90°F, a <span class="fragment highlight-red">data skipping index</span> could store the <span class="fragment highlight-red">minimum</span> and <span class="fragment highlight-red">maximum</span> temperature for each granule. When executing the query, ClickHouse would only read the granules where the maximum temperature is above 90°F, skipping the rest and saving time and resources.

---

## 4. Why is ClickHouse unique?
### 4.1. SQL-like query language

ClickHouse uses a SQL-like query language that offers a familiar and intuitive interface for data manipulation and analysis. It supports standard SQL features like SELECT, INSERT, UPDATE, and DELETE, as well as a wide range of functions and operators tailored for analytical tasks.

---

## 4. Why is ClickHouse unique?

- <span class="fragment highlight-green">Data Compression</span>: Some column-oriented DBMSs do not use data compression. However, data compression plays a key role in achieving excellent performance.
- <span class="fragment highlight-green">Parallel Processing on Multiple Cores</span>: Large queries are parallelized naturally, taking all the necessary resources available on the current server.
- <span class="fragment highlight-green">Efficient Data Retrieval and Cost-Effective Storage</span>: ClickHouse is designed to work on regular hard drives, which means the cost per GB of data storage is low, but SSD and additional RAM are also fully used if available.
- <span class="fragment highlight-green">Distributed Processing on Multiple Servers</span>
- <span class="fragment highlight-green">SQL Support</span>

---

## 4. Why is ClickHouse unique?
- <span class="fragment highlight-green">Vector Computation Engine</span>: The Vector Computation Engine in ClickHouse refers to its efficient data processing mechanism that uses a columnar approach and leverages modern hardware capabilities, like SIMD, for faster calculations and improved query performance.
- <span class="fragment highlight-green">Real-Time Data Inserts</span>: ClickHouse supports tables with a primary key. To quickly perform queries on the range of the primary key, the data is sorted incrementally using the merge tree. Due to this, data can continually be added to the table. No locks are taken when new data is ingested.
- <span class="fragment highlight-green">Suitable for Online Queries</span>: ClickHouse's "low latency" feature allows for real-time, online query processing, as opposed to other OLAP systems that may take tens of seconds or minutes to build reports, sometimes necessitating offline preparation.
- <span class="fragment highlight-green">Support for Approximated Calculations</span>: ClickHouse allows trading accuracy for performance through approximated aggregate functions, querying a sample of data, and aggregating a limited number of random keys. These methods help achieve faster results with less resource usage, while maintaining reasonable accuracy.

---

## What is the meaning of "SIMD CPU instructions":
<div class="r-stack">
<span class="fragment fade-in-then-out"> Single Instruction, Multiple Data (SIMD) is a computing concept where a single instruction operates on multiple pieces of data at the same time. This approach is used to speed up tasks that involve repetitive operations on large sets of data, such as in graphics processing or scientific simulations.</span>

<span class="fragment fade-in-then-out">Think of SIMD like a factory assembly line. Imagine you have a machine that can paint toy cars. Instead of painting one car at a time, the machine is designed to paint multiple cars simultaneously with a single instruction.</span>
</div>

---

## What is the meaning of "SIMD CPU instructions":

For example, let's say you want to add the values of two arrays (A and B) and store the results in a third array (C). Without SIMD, you'd perform the addition one element at a time:

```
A: [1, 2, 3, 4]
B: [5, 6, 7, 8]
C: []

1 + 5 = 6  => C: [6]
2 + 6 = 8  => C: [6, 8]
3 + 7 = 10 => C: [6, 8, 10]
4 + 8 = 12 => C: [6, 8, 10, 12]
```

With SIMD, you can perform the addition for multiple elements at once:

```
A: [1, 2, 3, 4]
B: [5, 6, 7, 8]
C: []

[1, 2, 3, 4] + [5, 6, 7, 8] = [6, 8, 10, 12] => C: [6, 8, 10, 12]
```

As you can see, SIMD allows you to process data more quickly and efficiently by performing operations on multiple data elements simultaneously.


---

## 5. Scalability and Performance
### 5.1. Horizontal and vertical scaling

ClickHouse is designed to scale seamlessly, supporting both horizontal and vertical scaling:

    Horizontal scaling: ClickHouse's distributed architecture allows you to add new nodes or shards to the cluster, increasing processing capacity and storage without affecting existing data and queries.
    Vertical scaling: ClickHouse can efficiently utilize additional hardware resources like CPU cores, memory, and storage on individual nodes, improving performance as your hardware capabilities grow.

### 5.2. Data replication and consistency

ClickHouse uses asynchronous data replication to ensure data redundancy and fault tolerance. The system employs a quorum-based approach for consistency, allowing you to define how many replicas must confirm a write operation before it is considered successful. You can also configure various replication strategies, such as choosing between synchronous and asynchronous replication based on your specific requirements.
### 5.3. Load balancing and fault tolerance

ClickHouse provides built-in load balancing and fault tolerance capabilities:

    Load balancing: ClickHouse distributes query processing across available replicas, balancing the load and ensuring optimal resource utilization. Load balancing can be configured using various strategies, such as round-robin, random, or least loaded.
    Fault tolerance: ClickHouse automatically detects and handles replica failures, rerouting queries to available replicas to maintain system availability and performance.

### 5.4. Performance benchmarks and comparisons

ClickHouse consistently demonstrates superior performance in benchmarks and real-world scenarios compared to other analytical databases. Its combination of columnar storage, data compression, parallel and distributed processing, and advanced query optimizations allows it to deliver low-latency queries on massive datasets, making it an ideal choice for real-time analytics workloads.

## 6. Security and Access Control (3 minutes)
### 6.1. Authentication and authorization

ClickHouse supports user authentication and authorization to restrict access to the database:

    Authentication: Users can connect to ClickHouse using a username and password or SSL/TLS client certificates for secure authentication.
    Authorization: ClickHouse employs a role-based access control system, allowing you to define user roles with specific permissions, such as read or write access to specific tables or columns.

### 6.2. Data encryption at rest and in transit

ClickHouse offers data encryption options for added security:

    Encryption at rest: ClickHouse supports data encryption at rest using the TDE (Transparent Data Encryption) feature, which encrypts data on disk using industry-standard AES encryption algorithms.
    Encryption in transit: ClickHouse can secure data in transit using SSL/TLS encryption for both client-server and server-server communication.

### 6.3. Role-based access control

ClickHouse's role-based access control system allows you to define and manage user roles with granular permissions, helping you enforce the principle of least privilege. Roles can be assigned to users, providing them with specific access rights, such as querying or modifying certain tables, executing specific functions, or even restricting access based on IP addresses.
6.4. Security best practices

To ensure a secure ClickHouse deployment, follow these best practices:

    Limit access to ClickHouse by using firewalls or network security groups.
    Regularly update ClickHouse to the latest stable version to benefit from security patches and improvements.
    Use strong, unique passwords for each user account and follow the principle of least privilege.
    Enable SSL/TLS encryption for data in transit and configure TDE for data at rest.
    Regularly monitor and audit user activity and access logs for signs of unauthorized access or malicious activity.

## 7. Use Cases and Success Stories (4 minutes)
### 7.1. Real-time analytics and reporting

ClickHouse excels at real-time analytics and reporting, enabling organizations to process and analyze large volumes of data with low-latency queries. This capability allows for real-time decision-making, rapid insights, and a more agile business environment.
### 7.2. Time-series data and event logging

ClickHouse is an excellent choice for handling time-series data and event logging, thanks to its high-performance, scalability, and compression features. Applications include IoT sensor data, server logs, or financial market data, where processing large volumes of time-series data is crucial.
### 7.3. Ad tech, IoT, and other industries

ClickHouse is widely used across various industries, such as ad tech, IoT, e-commerce, finance, and more, providing a versatile solution for different data processing and analytical needs. Its real-time capabilities, scalability, and performance make it an attractive option for businesses looking to gain insights from their data.
### 7.4. Notable companies using ClickHouse

Several well-known companies have successfully adopted ClickHouse as part of their data infrastructure:

    Yandex: The creator of ClickHouse uses it extensively for internal analytical workloads, serving as the foundation for various products and services.
    Cloudflare: Cloudflare leverages ClickHouse for real-time log analysis and reporting, providing insights into billions of events daily.
    Uber: Uber uses ClickHouse for time-series data analysis, enabling real-time monitoring and anomaly detection across its vast data infrastructure.

These success stories highlight ClickHouse's versatility and its ability to provide value across different industries and use cases.


## 8. Conclusion and Q&A (3 minutes)
### 8.1. Summary of key points

In conclusion, ClickHouse is a powerful columnar database designed for high-performance real-time analytics. Its features, such as columnar storage, distributed architecture, and flexible querying, make it an ideal choice for various industries and use cases.
### 8.2. Additional resources and learning materials

For further exploration, you can refer to the official ClickHouse documentation, join the ClickHouse community forums, or attend webinars and conferences.
### 8.3. Open floor for questions and discussion
We'll now open the floor for any questions and discussion. Please feel free to ask anything related to ClickHouse, and I'll be happy to help.