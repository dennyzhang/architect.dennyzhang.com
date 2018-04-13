# Explain CAP Theorem     :Concept:


---

CAP Theorem  

---

Similar Posts:  
-   [Concepts For System Design](https://code.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://code.dennyzhang.com/tag/systemdesign)

---

Q: What is CAP Theorem? See definition in [wikipedia](https://en.wikipedia.org/wiki/CAP_theorem).  

1.  Consistency: Every read receives the most recent write or an error
2.  Availability: Every request receives a (non-error) response - without guarantee that it contains the most recent write
3.  Partition tolerance: The system continues to operate despite an arbitrary number of messages being dropped (or delayed) by the network between nodes

---

Q: Does it mean I can only get two of CAP?  

CAP is frequently misunderstood as if one has to choose to abandon one of the three guarantees at all times.  

In fact, the choice is really between consistency and availability only when a network partition or failure happens; at all other times, no trade-off has to be made.  

-   Traditional RDMBS usually choose consistency over availability.
-   NoSQL DB choose availability over consistency.

---

Q: What is BASE?  

Basically Available, Soft State, Eventual Consistency  

---

Q: Different types of consistency models?  

strong consistency, sequential consistency, eventual consistency, etc.  

---

Q: What does CAP Theorem tell us?  

It is impossible for a web service to provide the three following guarantees : Consistency, Availability and Partition-tolerance.