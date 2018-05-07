# Design: A URL Shorterner Service     :Feature:


---

Design A URL Shorterner Service  

---

Similar Posts:  
-   [Encode and Decode TinyURL](https://architect.dennyzhang.com/encode-and-decode-tinyurl)
-   [A URL Redirecting Feature](https://architect.dennyzhang.com/design-url-redirect)
-   Tag: [#systemdesign](https://architect.dennyzhang.com/tag/systemdesign), [#designservice](https://architect.dennyzhang.com/tag/designservice)

---

TinyURL service provides short aliases for redirection of long URLs. Thus people can type or share easily.  

e.g, from <https://architect.dennyzhang.com/design-tiny-url> to [<https://goo.gl/ojcPMV>](https://goo.gl/ojcPMV).  

There are many similar services like [Google URL Shortener](https://goo.gl/), [Bitly](https://bitly.com/) etc.  

Step-By-Step Requirements:  

    - Q: Define REST API(s) for this service.
    - Q: How you can convert old URL into new URL?
    - Q: What db schema you will use?
    - Q: How you evaluate the read and write performance?
    - Q: Architectural changes to support 100M URLs?
    - Q: How would you generate unique IDs at scale?
    - Q: Will hash collisions happen? If yes, how to solve it?
    - Q: How you can support the feature of tracking click stats?
    - Q: How to support data retention?

---

Q: Define REST API(s) for this service.  

Hints:  

    - List major functionalities
    - Make sure the API(s) you have designed are restful
    - How to support API breaking changes

Related Reading: [Common Mistakes In REST API Design](https://architect.dennyzhang.com/design-rest-api)  

-   **Create a new TinyURL**

Request:  

    POST /v1/tinyurls
    {
     "old_url": string
    }

Response:  

    HTTP/1.1 201 OK
    {
      "tiny_url": string
    }

    HTTP/1.1 4XX/5XX ERROR
    {
      "message": string
    }

-   **Get old URL**

Request:  

    GET /v1/tinyurls/${tiny_url}

Response:  

    HTTP/1.1 201 OK
    {
      "old_url": string
    }

    HTTP/1.1 4XX/5XX ERROR
    {
      "message": string
    }

---

Q: How you can convert old URL into new URL?  
One idea: convert in between a decimal number and a base 62 number.  

    A URL character can be one of the following
    1 A lower case alphabet ['a' to 'z'], total 26 characters
    2 An upper case alphabet ['A' to 'Z'], total 26 characters
    3 A digit ['0' to '9'], total 10 characters

With the length of 6, it can support ~56.8 million URLs. (pow(62, 6) = 56,800,235,584)  

new\_url = f(old\_url). f can be md5 or base64  

    denny@dennyzhang.com:/opt# echo "https://architect.dennyzhang.com/design-tiny-url" | md5
    dcf31c911b752c668f466e40b337e5f2
    YWJjCg==
    
    denny@dennyzhang.com:/opt# echo "https://architect.dennyzhang.com/design-tiny-url" | base64
    echo "abc" | md5
    aHR0cHM6Ly9icmFpbi5kZW5ueXpoYW5nLmNvbS9kZXNpZ24tdGlueS11cmwK

---

Q: What db schema you will use?  

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="right" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="right">id</th>
<th scope="col" class="left">new\_url</th>
<th scope="col" class="left">old\_url</th>
</tr>
</thead>

<tbody>
<tr>
<td class="right">1</td>
<td class="left"><https://architect.dennyzhang.com/>&#x2026;</td>
<td class="left"><https://mytinyurl.com/ojcPMV>&#x2026;</td>
</tr>


<tr>
<td class="right">2</td>
<td class="left"><https://www.dennyzhang.com/>&#x2026;</td>
<td class="left"><https://mytinyurl.com/>&#x2026;</td>
</tr>


<tr>
<td class="right">3</td>
<td class="left"><https://dennyzhang.com/>&#x2026;</td>
<td class="left"><https://mytinyurl.com/>&#x2026;</td>
</tr>
</tbody>
</table>

Hints: id is an incremental field. What's the trade-off if we have or don't have the id field?  

-   Create index for the field of new\_url.
-   Use DB lookup to get old URL from new URL.

---

Q: How you evaluate the read and write performance?  

TODO  

Here we use RDBMS.  

-   Full index of new\_url will use lots of data. And slow down the adding new mappings.
-   Find old url from new url will be a quick database lookup

---

Q: Architectural changes to support 100M URLs?  

If you need to support 100M URLs, will RDBMS be able to support it? If yes, how you can do that?  

Need capacity planning to evaluable whether RDBMS could be an option.  
TODO  

Use NoSQL  
-   The data retrieve is simply get value by key. So NoSQL will solve the problem very well. Especially when data volume is big.

---

Q: How would you generate unique IDs at scale?  

What if thousands of URL shortening requests coming every second.  

TODO  

---

Q: Will hash collisions happen? If yes, how to solve it?  
TODO  

---

Q: How you can support the feature of tracking click stats?  
TODO  

---

Q: How to support data retention?  

TODO  

For cost effective, we want to enforce data retention. For any mappings older than 1 year, we can remove them.  

Add create time to DB schema  

When user regenerate a same old url, should we update the record's timestamp?  

How we can delete the old data quickly? Range select requirement.  

HTTP 302 vs HTTP 301  

---

Related Reading:  
-   [geeksforgeeks.org](https://www.geeksforgeeks.org/how-to-design-a-tiny-url-or-url-shortener/)
-   [Create a TinyURL System](http://blog.gainlo.co/index.php/2016/03/08/system-design-interview-question-create-tinyurl-system/)
-   [System Design : Design a service like TinyUrl](https://www.youtube.com/watch?v=fMZMm_0ZhK4)