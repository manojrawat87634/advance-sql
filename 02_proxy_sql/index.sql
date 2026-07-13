sudo apt-get install proxysql
sudo systemctl start proxysql

-- Login to ProxySQL
mysql -u admin -padmin -h 127.0.0.1 -P 6032

-- Adding a Master server (Hostgroup 10)
INSERT INTO mysql_servers(hostgroup_id, hostname, port) VALUES (10, '192.168.1.10', 3306);

-- Adding a Replica server (Hostgroup 20)
INSERT INTO mysql_servers(hostgroup_id, hostname, port) VALUES (20, '192.168.1.11', 3306);

LOAD MYSQL SERVERS TO RUNTIME;
SAVE MYSQL SERVERS TO DISK;


-- Route all SELECT queries to Hostgroup 20 (Replicas)
INSERT INTO mysql_query_rules (rule_id, active, match_digest, destination_hostgroup) 
VALUES (1, 1, '^SELECT.*', 20);

-- Route SELECT ... FOR UPDATE (which requires a write lock) to Hostgroup 10 (Master)
INSERT INTO mysql_query_rules (rule_id, active, match_digest, destination_hostgroup) 
VALUES (2, 1, '^SELECT.*FOR UPDATE', 10);

LOAD MYSQL QUERY RULES TO RUNTIME;
SAVE MYSQL QUERY RULES TO DISK;