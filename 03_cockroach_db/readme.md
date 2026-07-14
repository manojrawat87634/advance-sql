## Phase 1: Core Distributed Architecture (The Foundation)

Before writing any SQL, you must understand how data is physically broken down and moved across a network.

* **The Key-Value (KV) Abstraction Layer:** How CockroachDB translates a standard relational table into giant, ordered key-value byte strings under the hood.
* **Monolithic Range Splitting:** Understand how tables are automatically chopped into **64 MiB chunks** (called "Ranges").
* **The Raft Consensus Protocol:** How a single range chooses a "Raft Leader" to handle writes, and how replicas vote to commit data across a quorum (majority) of nodes.
* **Automated Rebalancing & Healing:** How the database detects a dead node and automatically clones missing data ranges onto surviving machines without down-time.

---

## Phase 2: Distributed Data Modeling & Schema Design

Standard SQL index strategies fail in distributed environments. You must learn how data placement affects performance.

* **Shard Key / Primary Key Selection:** How to choose primary keys that prevent "hotspotting" (e.g., avoiding auto-incrementing sequential IDs which force all writes onto a single node).
* **Multi-Column Locality Keys:** How to bundle structural keys (like your `institution_id`) into primary keys to ensure related rows land on the exact same physical server.
* **Secondary Indexes in Distributed Systems:** Understanding how global secondary indexes require hidden network lookups and how to use `STORING` clauses to cover queries.
* **Global/Reference Tables:** Configuring small tables (like `courses`) to automatically replicate 100% of their rows to every single server for instant, network-free local JOINs.

---

## Phase 3: Distributed Transactions & Consistency (The Interview Gold)

This is the advanced engineering theory that interviewers check for to see if you genuinely understand distributed data.

* **ACID at Scale:** How CockroachDB achieves atomicity and consistency across different physical hard drives separated by networks.
* **Serializable Isolation (SSI):** Why CockroachDB defaults to the strictest ANSI isolation level and how it completely prevents data phenomena like write-skew.
* **Transaction Contention & Client-Side Retries:** What happens when two users try to edit the same row across different nodes at the same fraction of a second. You must learn how to handle **Transaction Retry Errors** in your backend code.
* **Hybrid Logical Clocks (HLC):** How a distributed system keeps absolute physical time without relying on perfectly synchronized atomic hardware clocks.

---

## Phase 4: Query Execution & Optimization

How to write efficient code when your database runs across multiple machines.

* **The Distributed Execution Engine (DistSQL):** How the system splits a single query into mini-tasks, pushes them to the nodes holding the data, and streams the results back.
* **EXPLAIN and EXPLAIN ANALYZE:** Learning how to read execution maps to identify heavy network bottlenecks.
* **Avoiding Scatter-Gather Tax:** Optimizing your backend API endpoints so they always pass the sharding key, avoiding expensive queries that scan every node in the cluster.

---

## Phase 5: Multi-Region & High Availability Operations

The final phase covers how to build systems engineered to survive complete data center failures.

* **Locality Constraints & Geo-Partitioning:** Writing SQL commands that pin data to specific physical servers based on geography (e.g., pinning European rows to EU servers for legal compliance or latency).
* **Surviving Multi-AZ and Multi-Region Outages:** Testing chaos engineering scenarios (killing instances) while observing how quorum keeps the app completely online.

---

### Resume Project Blueprint

Once you finish Phase 3, adapt your current school project:

1. Spin up a **3-Node CockroachDB Cluster** inside Docker locally.
2. Port your Node/Python/Java application from PostgreSQL to CockroachDB (they share the same Postgres driver wire protocol).
3. Intentionally introduce database write contention to trigger a retry loop, and implement a **Client-Side Transaction Retry Wrapper** in your backend.

Documenting this setup on your GitHub and resume demonstrates true distributed engineering capability.
