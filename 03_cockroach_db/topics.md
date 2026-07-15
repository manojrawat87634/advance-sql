### Phase 1: Local Setup & Connecting
1. **Single-Node Cluster Initiation:** How to start a local database (`cockroach start-single-node --insecure`).
2. **Interactive SQL Shell Navigation:** How to log in and write queries directly inside the terminal using native CLI binaries (`cockroach sql`).

### Phase 2: Structural Optimizations & Storage Layout

3. **Primary Keys for Distributed Architectures:** Understanding the unique physical routing implications of the primary key and why it dictates the data's physical location on disk.
4. **Secondary Index Layout:** How secondary indexes are physically decoupled and stored as independent keyspace structures across the cluster.

### Phase 3: Cluster Operations & Security

5. **Admin UI Monitoring:** Using the built-in DB Console (web dashboard at port `8080`) to watch distributed execution flows, replication status, and hardware metrics in real-time.
6. **Multi-Node Local Clusters:** Transitioning from a single node to running a 3-node cluster on your local machine using cluster peer matching (`cockroach start` and `cockroach init`).
7. **Secure Cluster Configuration:** Implementing cluster security by generating internal node-to-node and client-to-node SSL/TLS certificates (`cockroach cert`).

### Phase 4: Core Storage Architecture (Under the Hood)

8. **The Key-Value (KV) Storage Engine:** How CockroachDB maps and flattens relational schemas, rows, and system catalogs into raw, globally ordered Key-Value pairs managed by the Pebble storage engine.
9. **Monolithic Keyspace & Range Splitting:** How the unified keyspace is automatically partitioned into contiguous chunks ("Ranges") that dynamically split (typically at 512 MiB in modern versions) and rebalance themselves.
10. **Raft Consensus Protocol:** How range mutation streams use the Raft log consensus to guarantee strict consistency across a majority quorum of network peers.
11. **Leaseholders vs. Replicas:** The structural separation of duties where a single designated node (the Leaseholder) bypasses Raft consensus overhead to handle direct read/write client traffic for its given range.
12. **Replication Factor:** Configuring zone configurations to scale the physical copy count of data ranges across independent failure domains.

### Phase 5: Distributed Query Execution

13. **Gateway Nodes:** The multi-master entry point mechanics where *any* arbitrary node accepts a query, parses it, and transforms into the execution coordinator.
14. **DistSQL Engine:** How the execution planner generates a directed acyclic graph (DAG) to push analytical operations down to remote leaseholder nodes, executing filtering and aggregation directly where the data lives.
15. **Distributed Transactions:** How the database achieves absolute Serializable isolation across disparate network machines using Hybrid Logical Clocks (HLC) and Multi-Version Concurrency Control (MVCC) write intents.
16. **Vectorized Execution:** How the execution engine switches data streaming from traditional row-by-row iteration to processing columnar batches in memory to maximize CPU cache performance.

### Phase 6: Multi-Region & Production Topology

17. **Node Locality Settings:** Defining cloud provider datacenter topology directly to the node processes using tier-based tags (`--locality`).
18. **Survival Goals:** Using declarative SQL commands to structure the layout of the Raft replicas to survive the complete loss of a data center datacenter zone (`SURVIVE ZONE`) or an entire cloud region (`SURVIVE REGION`).
19. **Table Localities:** Configuring tables for global runtime patterns by tuning physical range residency rules (`REGIONAL TABLES`, `REGIONAL TABLES BY ROW`, and `GLOBAL TABLES`).
20. **Primary Key Design for Scale:** Overcoming monotonic index bottlenecks by utilizing UUIDs or bit-shuffled sequences (`shard_row_id_block_size`) to prevent write hotspots on individual node ranges.