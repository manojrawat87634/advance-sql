Prerequisites

Ubuntu 24.04 installed on  all nodes.
Hostname or IPs of nodes, e.g.:

Node1 : 192.168.136.129
Node2 : 192.168.136.130
Node3 : 192.168.136.131

Paswordless SHH between nodes is optional but helpful

Step 1 : Install CockroachDB on all nodes
Do the same steps as single-node installation onall three nodes:

Step 2 : Start Cockroach DB Each Node : 
	Node1 :

	
	cockroach start \
		--insecure \
		--store=node1 \
		--listen-addr=192.168.136.129:26257 \
		--http-addr=192.168.136.129:8080 \
		--join=192.168.136.129:26257, 192.168.136.130:26257, 192.168.136.131:26257
	
	Node 2 : 

		cockroach start \
		--insecure \
		--store=node1 \
		--listen-addr=192.168.136.130:26257 \
		--http-addr=192.168.136.130:8080 \
		--join=192.168.136.129:26257, 192.168.136.130:26257, 192.168.136.131:26257
	
	Node 3 : 
		cockroach start \
		--insecure \
		--store=node1 \
		--listen-addr=192.168.136.131:26257 \
		--http-addr=192.168.136.131:8080 \
		--join=192.168.136.129:26257, 192.168.136.130:26257, 192.168.136.131:26257
	
Step 3 : 
	Initlize the cluster 
		Run this Node1 only:
	cockroach init --insecure --host=192.168.136.129:26257

	You should see : 
		cluster sucessfully initialized


Step 4: Verify Connection.
	connect to sql Shell on any node 
	cockroach sql --insecure --host=192.168.136.129:26257

Step 5 : verify cluster (check with any node)
	cockroach node status --insecure --host=192.168.136.129:26257
	should see all 3 node listed.

Step 6 : Access Web UI 

	Node 1: http://192.168.136.129:8080
	Node 2: http://192.168.136.130:8080
	Node 3: http://192.168.136.131:8080
