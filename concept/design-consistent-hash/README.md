# Typical Question: How Does Consistent Hashing Work?     :Concept:


---

Design: How Does Consistent Hashing Work?  

---

Similar Posts:  
-   [Concepts For System Design](https://architect.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://architect.dennyzhang.com/tag/systemdesign)

---

Q: What consistent hashing for?  
Setting up the initial shards for a new service is relatively straightforward: you set up the appropriate shards and the roots to perform the sharding, and you are off to the races. However, what happens when you need to change the number of shards in your sharded service? Such "re-sharding" is often a complicated process.  

**Consistent hashing** allows distribution of data across a cluster to minimize reorganization **when nodes are added or removed**.  

![img](//raw.githubusercontent.com/DennyZhang/images/master/design/consistent_hashing.png)  

Two Principles For Paritioning Data:  
1.  **Determinism**. The output should always be the same for a unique input.
2.  **Uniformity**. The distribution of outputs across the output space should be equal.

---

Q: What are the old ways before consistent hashing?  
-   Use mod function to partition data.

When we add a new node to the cluster, we need to shuffle the whole data set. Very very time consuming. When we want to remove one node to scale in, we need to change everything again.  

-   Use hash tables as metadata routing.

The data can't be easily balanced across nodes.  

---

Q: Examples of consistent hashing usage.  
-   Distributed caches
-   Load balancing with consistent hashing algorithm.
-   Couchbase automated data partitioning
-   OpenStack swift
-   Amazon Dynamo
-   Apache Cassandra
-   Etc

---

Q: Please explain the workflow when a node is down.  

    If a bucket becomes unavailable (for example because the computer it resides on is not reachable), then the points it maps to will be removed. Requests for resources that would have mapped to each of those points now map to the next highest points. Since each bucket is associated with many pseudo-randomly distributed points, the resources that were held by that bucket will now map to many different buckets. The items that mapped to the lost bucket must be redistributed among the remaining ones, but values mapping to other buckets will still do so and do not need to be moved.

---

Q: Please explain the workflow, when the failed node has come.  

---

Q: Consistent hashing itself doesn't provide HA. How you can provide HA?  

---

Related Reading:  
-   [wikipedia](https://en.wikipedia.org/wiki/Consistent_hashing)
-   [Consistent hashing by Cassandra](https://docs.datastax.com/en/cassandra/2.1/cassandra/architecture/architectureDataDistributeHashing_c.html)