# Explain Paxos Algorithm     :BLOG:Design:


---

Explain Paxos Algorithm  

---

Similar Posts:  
-   [Concepts For System Design](https://brain.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://brain.dennyzhang.com/tag/systemdesign)

---

Q: What problem(s) Paxos algorithm solves?  
TODO  

---

Q: What is Byzantine problem?  
TODO  

---

Q: Explain key concepts in distributed system.  

    - leader
    - quorum
    - lease
    - split-brain

---

Q: What are 2PC? What the workflow of 2PC looks like?  

2PC: two phase commit. 2PC is one **atomic commitment protocol(ACP)**.  
The protocol achieves its goal even in many cases of temporary system failure.  

Assumptions of 2PC:  

    - 1. There is stable storage at each node with a write-ahead log
    - 2. No node crashes forever
    - 3. The data in the write-ahead log is never lost or corrupted
    - 4. That any two nodes can communicate with each other

Basic algorithm:  
-   1. Voting Phase  
    If any cohort votes No, the coordinator sends a rollback message to all the cohorts.
-   2. Commit Phase  
    The coordinator completes the transaction when all acknowledgments have been received.

    Coordinator                              Cohort
                       QUERY TO COMMIT
                    --------------------->
                       VOTE YES/NO           prepare*/abort*
                    <--------------------
    commit*/abort*     COMMIT/ROLLBACK
                    --------------------->
                       ACKNOWLEDGMENT        commit*/abort*
                    <---------------------  
    end

See more in [wikipedia](https://en.wikipedia.org/wiki/Two-phase_commit_protocol)  

---

Q: What are the problems with 2PC?  

1.  It is a blocking protocol.
2.  If the coordinator fails permanently, some cohorts will never resolve their transactions

---

Q: What are 3PC protocol?  

Motivation of 3PC: 2PC cannot dependably recover from a failure of both the coordinator and a cohort member during the Commit phase.  

    If only the coordinator had failed, and no cohort members had received a commit message, it could safely be inferred that no commit had happened. If, however, both the coordinator and a cohort member failed, it is possible that the failed cohort member was the first to be notified, and had actually done the commit. Even if a new coordinator is selected, it cannot confidently proceed with the operation until it has received an agreement from all cohort members, and hence must block until all cohort members respond.

3PC(three phase commit): compared to 2PC, it add one extra step. prepare to commit.  

![img](//raw.githubusercontent.com/DennyZhang/images/master/design/paxos-3pc.png)  

See more in [wikipedia](https://en.wikipedia.org/wiki/Three-phase_commit_protocol)  

---

Q: How 3PC can be helpful for my system design?  
TODO  

---

Q: Explain some common improvements of paxos algorithm?  
TODO  

---

Q: Difference between Raft and Paxos algorithm?  

Raft is a consensus algorithm designed as an alternative to Paxos. It was meant to be more understandable than Paxos by means of separation of logic, but it is also formally proven safe and offers some additional features.  

TODO  

(See Raft in [wikipedia](https://en.wikipedia.org/wiki/Raft_(computer_science)))