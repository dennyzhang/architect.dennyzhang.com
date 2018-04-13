# Design: How Does DNS Work?     :Concept:


---

Design: How Does DNS Work?  

---

Similar Posts:  
-   [Concepts For System Design](https://code.dennyzhang.com/design-concept)
-   Tag: [#systemdesign](https://code.dennyzhang.com/tag/systemdesign)

---

Useful Websites to check DNS: [<http://dnscheck.pingdom.com/>](http://dnscheck.pingdom.com/)  

---

Q: What are CNAME and A records?  
-   A record: points a name to specific public ip(s).
-   CNAME(Canonical Name) record: points to another name, instead of ip.

CNAME and A records are the most frequent ones we will manage.  

People can use names instead of ip addresses to find our websites in an easier way.  
e.g:  

    code.dennyzhang.com.  CNAME   dennyzhang.com
    www.dennyzhang.com.    CNAME   dennyzhang.com
    dennyzhang.com.        A       54.156.174.148

See more in [wikipedia](https://en.wikipedia.org/wiki/CNAME_record)  

---

Q: What is NS record and SOA?  

**You must use your own primary nameservers to manage your DNS records**.  

SOA(**Start of Authority record**): Every domain must have a Start of Authority record at the cutover point where the domain is delegated from its parent domain. (See [more](https://support.dnsimple.com/articles/soa-record/))  

    Denny-mac:denny mac$ dig dennyzhang.com NS
    
    ; <<>> DiG 9.8.3-P1 <<>> dennyzhang.com NS
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 54520
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0
    
    ;; QUESTION SECTION:
    ;dennyzhang.com.                        IN      NS
    
    ;; ANSWER SECTION:
    dennyzhang.com.         3599    IN      NS      ns30.domaincontrol.com.
    dennyzhang.com.         3599    IN      NS      ns29.domaincontrol.com.
    
    ;; Query time: 128 msec
    ;; SERVER: 8.8.8.8#53(8.8.8.8)
    ;; WHEN: Fri Mar  2 14:41:45 2018
    ;; MSG SIZE  rcvd: 84

---

Q: Explain the workflow of domain transfer.  
How to switch authorized server? Nameserver.  

SOA and NS?  

---

Q: What is TXT record?  

e.g:  
![img](//raw.githubusercontent.com/DennyZhang/images/master/design/dns_sample.png)  

    dig dennyzhang.com NS
    dig dennyzhang.com MX
    dig dennyzhang.com SOA

---

Q: What is MX record?  

wikipedia: [List of DNS record types](https://en.wikipedia.org/wiki/List_of_DNS_record_types)  

---

Q: AWS Route53 Routing policy  

![img](//raw.githubusercontent.com/DennyZhang/images/master/design/aws_route53_routing_policy.png)  

---

Q: Diversity of different DNS services.  

Route 53 DNS vs GoDaddy?  

---

Q: How does DDoS attack work with Cloudflare DNS protection?  

TODO