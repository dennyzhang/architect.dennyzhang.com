# Concurrency & Communication     :Concept:


---

Multi-threaded applications may need to coordinate threads that share data or other resources. Different processes may need to coordinate with each other as well.  

The sequence matters, in order to guarantee the results' **correctness**. And meanwhile we definitely want to improve the **performance**.  

So what are the common approaches for this? And what are the pros and cons?  

---

Similar Posts:  
-   [Concepts For System Design](https://architect.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://architect.dennyzhang.com/tag/systemdesign)

---

Lots of concepts to learn and understand! Yes, I know. Too many.  

    Atomic Operations, Thread-safe
    
    Lock, Metasphore
    
    Queue-Per-Process, Queue Service
    
    Lock-free, Async Programming

---

What are the problems? And How you gonna solve them?  

---

Q: Synchronous vs. Asynchronous  

With async architectures, we can scale out for better performance.  

But with sync architectures, **the performance may not improve, even if we are willing to add more infrastures**.  

e.g, performance bottlenecks are at applications, instead of Databases. And the application has lots of locks and even starvations.