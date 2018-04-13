# Design: Uber Backend     :BLOG:Medium:


---

Design uber backend - define use cases, scope on your own, come up with various components, give high and low level design&#x2026;.  

---

Similar Posts:  
-   Tag: [#systemdesign](https://brain.dennyzhang.com/tag/systemdesign), [#designservice](https://brain.dennyzhang.com/tag/designservice)

---

Question1: List the first questions you want to discuss or clarify?  

What business values we need to deliver?  

Key Roles: drivers, riders, platform  

Key Features:  

    - Matches: Find good matches in between drivers and riders
    - Mapping: trip management

---

Question2: Key data and data store involved.  

    Trips DB
    Credit DB

---

Question3: High level design: Propose your architecture diagram.  

![img](//raw.githubusercontent.com/DennyZhang/images/master/design/design-uber.png)  

---

Question4: List major challenges you think.  

-   [Revenue] No enough drivers/riders. For a certain area, or period.
-   [Risk] Safety protection for drivers/riders.
-   [Performance] Autoscaling challenges to balance cost and performance.

---

Useful link:  
-   [YouTube: System Design: Uber Lyft ride sharing services](https://www.youtube.com/watch?v=J3DY3Te3A_A)
-   [Designing Uber backend](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5717271485874176/preview)