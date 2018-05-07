# Explain: Gossip Protocol     :Concept:


---

How Gossip protocol works?  

---

Similar Posts:  
-   [Concepts For System Design](https://architect.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://architect.dennyzhang.com/tag/systemdesign)

---

Q: What problems gossip protocol try to solve?  
-   Reliable communication is not assumed.
-   The frequency of the interactions is low compared to typical message latencies so that the protocol costs are negligible.

TODO  

---

Q: What the basic idea of gossip protocol is?  

    The concept of gossip communication can be illustrated by the analogy of office workers spreading rumors. Let's say each hour the office workers congregate around the water cooler. Each employee pairs off with another, chosen at random, and shares the latest gossip. 
    
    At the start of the day, Alice starts a new rumor: she comments to Bob that she believes that Charlie dyes his mustache. At the next meeting, Bob tells Dave, while Alice repeats the idea to Eve. After each water cooler rendezvous, the number of individuals who have heard the rumor roughly doubles (though this doesn't account for gossiping twice to the same person; perhaps Alice tries to tell the story to Frank, only to find that Frank already heard it from Dave). Computer systems typically implement this type of protocol with a form of random "peer selection": with a given frequency, each machine picks another machine at random and shares any hot rumors.
    
    The power of gossip lies in the robust spread of information. Even if Dave had trouble understanding Bob, he will probably run into someone else soon and can learn the news that way.

Read more: [wikipedia](https://en.wikipedia.org/wiki/Gossip_protocol).  

---

Q: What key parts of gossip protocol are?  
-   peer selection: Each node pairs off with another, chosen at random

TODO  

---

Q: Since we choose peers randomly, how we know the rummor has been propagated to all nodes?  

No, you don't  

TODO  

---

Q: Give me some real examples which gossip protocol can be useful  

-   Config information changes

    For example, in a network with 25,000 machines, we can find the best match after about 30 rounds of gossip: 15 to spread the search string and 15 more to discover the best match. A gossip exchange could occur as often as once every tenth of a second without imposing undue load, hence this form of network search could search a big data center in about 3 seconds.

-   Node leave or join the cluster

Consul uses a gossip protocol to manage membership and broadcast messages to the cluster. See more: [Consul Gossip](https://www.consul.io/docs/internals/gossip.html)  

---

More Resources  
-   [YouTube: The Gossip Protocol](https://www.youtube.com/watch?v=oZtfw8rMJ7g)
-   [YouTube: Randomized Gossip Methods](https://www.youtube.com/watch?v=Gxf5glthqrk&pbjreload=10)

TODO