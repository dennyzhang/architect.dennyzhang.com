# Design: How Does LoadBalancer Work?     :Concept:


---

Design: How Does LoadBalancer Work?  

---

Similar Posts:  
-   [Concepts For System Design](https://architect.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://architect.dennyzhang.com/tag/systemdesign)

---

Q: How LoadBalancer route requests  

Generally speaking, load balancers fall into three categories:  

-   DNS Round Robin (rarely used): clients get a randomly-ordered list of IP addresses.

    pros: easy to implement and free; 
    cons: hard to control and not responsive, since DNS cache needs time to expire

-   L3/L4 Load Balancer: traffic is routed by IP address and port. L3 is network layer (IP). L4 is session layer (TCP).
-   L7 Load Balancer: traffic is routed by what is inside the HTTP protocol. L7 is application layer (HTTP).

Credits to: [link](http://www.puncsky.com/blog/2016/02/14/crack-the-system-design-interview/)  

Typical algorithms:  

    - round robin, weighted round robin
    - least loaded, least loaded with slow start
    - utilization limit
    - latency, cascade, etc

Commonly used algorithms for HAProxy:  

-   **roundrobin**: Round Robin selects servers in turns. This is the default algorithm.
-   **leastconn**: Selects the server with the least number of connections&#x2013;it is recommended for longer sessions. Servers in the same backend are also rotated in a round-robin fashion.
-   **source**: This selects which server to use based on a hash of the source IP i.e. your user's IP address. This is one method to ensure that a user will connect to the same server.

See more: [link](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts#load-balancing-algorithms)  

---

Q: What are sticky sessions?  

Some applications require that a user continues to connect to the same backend server. This persistence is achieved through sticky sessions, using the appsession parameter in the backend that requires it.  

---

how the Readiness Probe is done for backend services?  
Often, session tracking is accomplished via a consistent hashing function.