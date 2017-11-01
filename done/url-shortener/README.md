# Question:
```
Design a URL shortening service, like bit.ly

From:

https://www.dennyzhang.com/tag/devops

To:
http://bit.ly/2h90xzb
```

- Difficulty: Medium
- Tags:
- Original Link: https://www.interviewbit.com/courses/system-design/topics/interview-questions/
- Highlights:

# Answers

```
One Simple Solution could be Hashing. Use a hash function to convert long string to short string. In hashing, that may be collisions (2 long urls map to same short url) and we need a unique short url for every long url so that we can access long url back.

A Better Solution is to use the integer id stored in database and convert the integer to character string that is at most 6 characters long. This problem can basically seen as a base conversion problem where we have a 10 digit input number and we want to convert it into a 6 character long string.
```

- http://www.geeksforgeeks.org/how-to-design-a-tiny-url-or-url-shortener/
