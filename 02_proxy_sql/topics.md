## 1. ProxySQL Architecture & Ports

Before writing SQL, you must understand that ProxySQL acts as a "middleman" split into two entirely different operational entry points:

* **The Application Port (`6033`):** Where your backend code connects. It acts like a normal MySQL server, but transparently routes queries.
* **The Admin Port (`6032`):** A dedicated, embedded SQLite command line interface specifically for configuration.
* **Connection Pooling:** How ProxySQL accepts thousands of frontend connections and multiplexes them down to just a few backend database connections.

## 2. The Multi-Layer Configuration Model

Unlike MySQL, when you run an `INSERT` or `UPDATE` in ProxySQL, **the changes do not take effect immediately**. You must learn the three configuration states:

* **In-Memory Config (`main` tables):** The workspace where your SQL edits happen, but is not yet active.
* **Runtime Layer (`runtime_` tables):** The active configuration running in the proxy's working memory.
* **Disk Layer (`disk` SQLite database):** The persistent storage layer that survives system reboots.
* **State Commands:** Understanding the `LOAD ... TO RUNTIME` and `SAVE ... TO DISK` commands to move configurations between these layers.

## 3. Hostgroup Topology (Logical Grouping)

Instead of connecting directly to single servers, you must learn to think in "Hostgroups" (pools of databases assigned a specific numeric ID):

* **Writers vs. Readers:** Why we group servers (e.g., Hostgroup 10 for Write-capable Master servers, Hostgroup 20 for Read-only Replicas).
* **The `mysql_servers` Table Schema:** Understanding structural columns like `hostgroup_id`, `hostname`, `port`, `status` (ONLINE, SHUNNED, OFFLINE), and `weight` (for load balancing).

## 4. User Mapping & Credentials Syncing

Before any client can send a query, ProxySQL needs to know who is connecting:

* **Frontend vs. Backend Credentials:** Why you must replicate database usernames and passwords into ProxySQL's `mysql_users` table.
* **Default Hostgroup Routing:** How assigning a `default_hostgroup` to a user automatically routes their traffic even if you write zero routing rules.

## 5. The Query Routing Engine (`mysql_query_rules`)

This is the core decision-making engine. You need to learn how ProxySQL parses incoming SQL strings using regular expressions (regex):

* **Regular Expressions in SQL:** Learning patterns like `^SELECT` (match anything starting with SELECT) vs. `SELECT.*FOR UPDATE` (capturing locks).
* **Rule Chaining & Priorities:** How rules are evaluated sequentially using `rule_id`, and how the `apply` flag acts as a "break" statement to stop processing rules once a match is found.

## 6. The Monitor Module & High Availability

In production, database servers lag or crash. You must learn how ProxySQL automatically protects your data:

* **The `monitor` Schema:** How ProxySQL runs its own internal background checks (pings, connections, and replication lag checks).
* **Replication Lag Shunning:** How configuring `max_replication_lag` dynamically shuns lagging read replicas so clients never read stale data.
* **The `read_only` State Monitor:** How ProxySQL continuously queries the MySQL global `read_only` variable to automatically identify which server is the Master and which are the Replicas.

## 7. Advanced Routing (Sharding & Transactions)

Once you master basic routing, you learn how to handle complex schemas:

* **Transaction Pinning:** Why active SQL transactions (starting with `BEGIN`) must lock to the Master hostgroup to prevent read-after-write errors.
* **Schema-Based Routing:** Dividing traffic based on target database names (e.g., routing `shard_A` queries to Hostgroup 30 and `shard_B` queries to Hostgroup 40).
* **Query Rewriting & SQL Hints:** Injecting routing comments directly inside query payloads (e.g., `/* max_hostgroup=10 */`) to force behavior directly from application code.