# Explain: Vector Clocks/Version Vectors     :BLOG:Basic:


---

Explain: What vector clocks/version vectors are  

---

Similar Posts:  
-   [Concepts For System Design](https://brain.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://brain.dennyzhang.com/tag/systemdesign)

---

Vector clocks is an algorithm for generating a partial ordering of events in a distributed system and **detecting causality violations**. [See in wikipedia](https://en.wikipedia.org/wiki/Vector_clock)  

![img](//raw.githubusercontent.com/DennyZhang/images/master/design/vector-clock.png)  

-   Vector clocks/version vectors are about detecting conflicting/updates &#x2026;
-   &#x2026; but says nothing about how to resolve those conflicts.

Many NoSQL DB choose vector clock to control the ordering of multi-version records.  

---

Q: Why we can't use machines' timestamp to version changes in distributed system?  

A: Using the physical timestamp of a record is no good because you can't guarantee that time will move forward in a uniform manner across all nodes in the cluster.  

It means a 'later' record might have an earlier timestamp than some record produced before it.  

---

Q: What is Lamport Clock?  

A: Lamport Clock can be considered as a logical timestamp. A Lamport Clock is a single integer value that is passed around the cluster with every message sent between nodes.  

Each node keeps a record of what it thinks the latest (i.e. highest) Lamport Clock value is, and if it hears a larger value from some other node, it updates its own value.  

![img](//raw.githubusercontent.com/DennyZhang/images/master/design/lamport-sample.jpg)  

---

Q: What are the difference in between of Lamport Clock and Vector Clock?  

last-write-win issue.  

TODO:  

---

Q: Problems with vector clocks?  

[Why Cassandra doesn't need vector clocks](https://www.datastax.com/dev/blog/why-cassandra-doesnt-need-vector-clocks)  

Cassandra breaks a row up into columns that can be updated independently.  

---

Related Readings:  
-   [Why do distributed databases choose the Vector Clock&#x2026;](https://goo.gl/Nx77nZ)