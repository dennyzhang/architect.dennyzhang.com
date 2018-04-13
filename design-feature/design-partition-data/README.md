# Design: How To Partition Data At Scale     :Feature:


---

Let's design a sharding scheme for key-value storage.  

---

Similar Posts:  
-   [Concepts For System Design](https://code.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://code.dennyzhang.com/tag/systemdesign)

---

![img](//raw.githubusercontent.com/DennyZhang/challenges-leetcode-interesting/master/images/design/partition_data.png)  

Question1: Clarity the requirements from your experience/viewpoints.  

You can discuss with the interviewer to sort out all vague parts. Or make reasonable assumptions by your own.  

Thinkings:  
-   How much data it should support?

    A key question for the whole discussion.

-   What the read/write OPS would be?

    Better understand the characteristic of service
    Thus we can have better estimation for RAM/CPU/Disk usage

-   Do we need to keep very old data?

    Data retention. If yes, we usually can have some assumption for the maximum size of the whole data.

-   How large the hot data would be?

    Resource planning for RAM

---

Question2: What typical ways of partitioning data?  

Thinkings:  
-   Consistent hash
-   In RDMBS, B-tree/segment tree

---

Question3: Propose your architecture diagram.  

---

Question4: Suppose one node is down, how the partition would keep working?  

---

Credits To: [interviewbit.com](https://www.interviewbit.com/problems/sharding-a-database/)