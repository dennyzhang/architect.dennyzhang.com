# Design: DB Replication     :Concept:


---

One of the most important elements of distributed database architecture is replication.  

It determines whether or not the data is consistent / available.  

---

Similar Posts:  
-   [Key Facts In Cloud Systems](https://brain.dennyzhang.com/design-key-facts)
-   [Concepts For System Design](https://brain.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://brain.dennyzhang.com/tag/systemdesign)

---

Q: What are typical replication mechanisms for RDBMS?  

Database replication can be done in at least three different ways:  
-   **Transactional** replication: Users receive full initial copies of the database and then receive periodic updates as data changes.

    *Database mirroring* or mysql binlog replication are typical transactional replications.

-   **Merging** replication: Data from two or more databases is combined into a single database.

    Merge replication is primarily designed for mobile applications or distributed server applications that have possible data conflicts. 
    
    Common scenarios include: exchanging data with mobile users; consumer point of sale (POS) applications; and integration of data from multiple sites.

-   **Snapshot** replication: simply takes a "snapshot" of the data on one server and moves that data to another server (or another database on the same server).

    Snapshot replication is used to provide the initial data set for transactional and merge replication; it can also be used when complete refreshes of data are appropriate.

SQL Server 2000 supports three distinct types of replication: snapshot, transactional, and merge, each of which has its own purpose.  

---

Q: What are typical deployment models of replication mechanisms?  
1.  Master/Slave
2.  Multiple-Master
3.  Masterless

---

Q: What are typical methods for mysql master HA? What the main logic looks like?  

TODO:  

---

Q: Explain the process of Master/Slave Replication Model.  

1.  Writes are executed on master node(s), then replicate to slave nodes.
2.  If we allow dirty reads, reads can happen in slave nodes. Otherwise read can only happen in master nodes as well.

Many large scale websites use mysql. They always have lots of reads with few writes.  

Thus people usually use master/slave model of mysql.  

---

Q: What are the problems of Master/Slave Replication?  

Master nodes are SPOF(single point of failure).  

TODO: how to provide HA for DB master?  

---

Q: Explain the process of Multiple-Master Replication Model.  

TODO  

---

Q: Explain the process of Masterless Replication Model.  

In a masterless design, every node is a primary node.  
1.  Writes are executed in multiple nodes, which can also be called copies.
2.  If we allow dirty reads, reads can happen in one of the nodes. Otherwise we need to read all replicas.

Couchbase and elasticsearch are using masterless replication model.  

Usually they are **Quorum Based Voting**.  

TODO: For consistent read, can we only trust the master replica?  

---

Q: What are the problems of Masterless Replication?  

TODO  

---

Q: Explain the process of db fail-over.  

TODO  

---

Misc:  
Cross-site region replication  

Auto failover  
sync/async replication, binlog  
multi-leader, quorum consistency  

---

More Reading:  
1.  [database replication](http://searchsqlserver.techtarget.com/definition/database-replication)
2.  [Introduction to Database Replication](http://www.informit.com/articles/article.aspx?p=169612&seqNum=2)
3.  [Distributed Databases and Replication Design](https://blog.couchbase.com/distributed-databases-and-replication-design/)
4.  [Replication (computing) by wikipedia](https://en.wikipedia.org/wiki/Replication_(computing))
5.  [SQL Server Replication](https://docs.microsoft.com/en-us/sql/relational-databases/replication/sql-server-replication)