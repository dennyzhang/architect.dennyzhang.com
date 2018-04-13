# Design: A Distributed Counter     :Concept:


---

Design: A Distributed Counter  

---

Similar Posts:  
-   [Concepts For System Design](https://brain.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://brain.dennyzhang.com/tag/systemdesign), [#designservice](https://brain.dennyzhang.com/tag/designservice), [#datastructure](https://brain.dennyzhang.com/tag/datastructure)

---

Q: Why we need distributed counters?  

Counter represents a single integer value waving up so fast you can tolerate incorrect values.  

Common examples:  

    - Number of likes on Facebook
    - Number of retweets on Twitter
    - Number of shares traded on an exchange
    - Clicks, views, etc

---

Q: What about using RDMBS to support counters?  

    Prior to counters, solutions for counting looked like this:
    - one column per increment, with a batch background job
    - external synchronization (Zookeeper, through Cages)
    - use another database (Redis, PostgreSQL, . . . )

Yes, with one update SQL statement, it's done.  

But this design will have severe performance issues, if the data volume is big. You physically can't issue new updates if the last one hasn't finished.  

Besides the design can't scale easily.  

---

Q: What about using queue to support counters via async updates?  

TODO  

---

Q: What about using vector clocks to accept distributed writes, then merge them?  

[Explain: Vector Clocks/Version Vectors](https://brain.dennyzhang.com/vector-clocks)  

TODO  

---

Q: How to implement counters via Redis  

A: Use Redis INCR command. The counter pattern is the most obvious thing you can do with Redis atomic increment operations.  

[Redis INCR key](https://redis.io/commands/incr)  

---

Related Readings:  
-   [Concepts For System Design](https://brain.dennyzhang.com/design-concept)
-   [Distributed Counters in Cassandra](http://www.datastax.com/wp-content/uploads/2011/07/cassandra_sf_counters.pdf)
-   [JGroups CounterService](https://github.com/belaban/JGroups/blob/master/doc/design/CounterService.txt)
-   [Highly Available Counters Using Cassandra](http://rockthecode.io/blog/highly-available-counters-using-cassandra/)