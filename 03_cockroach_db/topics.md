### Phase 1: Local Setup & Connecting

1. Single-Node Cluster Initiation:** How to start a local database (`cockroach start-single-node --insecure`).
2. Interactive SQL Shell Navigation:** How to log in and write queries directly inside the terminal (`cockroach sql`).

### Phase 2: Foundational SQL & CRUD (The Basics)

3. Creating and Managing Databases:** How to create, show, and switch between databases (`CREATE DATABASE`, `USE`).
4. Creating Tables (DDL):** Learning how to define a table structure, column names, and basic data types (Text, Integers, Dates).
5. Inserting Data (C in CRUD):** How to add rows to your tables (`INSERT INTO`).
6. Reading & Filtering Data (R in CRUD):** How to retrieve data, filter it (`WHERE`), sort it (`ORDER BY`), and limit the results (`LIMIT`).
7. Updating Data (U in CRUD):** How to safely modify existing rows (`UPDATE`).
8. Deleting Data (D in CRUD):** How to remove data from tables (`DELETE FROM`).

### Phase 3: Relationships, Constraints & Indexes

9. Primary Keys:** Why every table needs a unique identifier (and why this is extra important in CockroachDB).
10. Basic Constraints:** Enforcing data rules (`NOT NULL`, `UNIQUE`, `DEFAULT`).
11. Foreign Keys & Relationships:** How to link two tables together (e.g., linking an `orders` table to a `users` table).
12. Joins:** Writing queries that combine data from multiple tables simultaneously (`INNER JOIN`, `LEFT JOIN`).
13. Secondary Indexes:** How to speed up slow search queries on non-primary key columns.

### Phase 4: Cluster Operations & Security

14. Admin UI Monitoring:** Using the built-in DB Console (web dashboard at port `8080`) to watch your queries run in real-time.
15. Multi-Node Local Clusters:** Transitioning from a single node to running a 3-node cluster on your local machine (`cockroach start` and `cockroach init`).
16. Secure Cluster Configuration:** Moving away from `--insecure` and generating SSL/TLS certificates (`cockroach cert`).

### Phase 5: Core Storage Architecture (Under the Hood)

17. The Key-Value (KV) Storage Engine:** How CockroachDB translates your relational tables and rows into raw Key-Value pairs.
18. Monolithic Keyspace & Range Splitting:** How the database automatically splits your data into $64\text{ MB}$ chunks ("Ranges") when tables get too big.
19. Raft Consensus Protocol:** How writes are safely agreed upon and committed across multiple nodes.
20. Leaseholders vs. Replicas:** How read/write traffic is routed to the specific node holding the "lease" for a data range.
21. Replication Factor:** Configuring how many copies of your data exist across the cluster.

### Phase 6: Distributed Query Execution

22. Gateway Nodes:** How any node in the cluster can accept a query and coordinate its execution.
23. DistSQL Engine:** How a single SQL query is split up, executed in parallel across multiple nodes, and stitched back together.
24. Distributed Transactions:** How CockroachDB guarantees ACID compliance (no corrupted data) across different machines.
25. Vectorized Execution:** How the database processes batches of data in memory to make analytical queries ultra-fast.

### Phase 7: Multi-Region & Production Topology

26. Node Locality Settings:** Telling the database where servers physically live in the world (`--locality`).
27. Survival Goals:** Setting up the cluster to survive the sudden death of a server zone (`SURVIVE ZONE`) or a cloud region (`SURVIVE REGION`).
28. Table Localities:** Designing tables for global performance (Regional Tables vs. Global Tables).
29. Primary Key Design for Scale:** Learning how to design primary keys (using UUIDs instead of auto-incrementing integers) to prevent performance bottlenecks ("hotspots") across nodes.