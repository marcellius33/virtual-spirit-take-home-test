1. I have the following Users Table:

```
| ID    | Name      | Mark
-----------------------------
| 1     | John      | A
| 2     | Marissa   | B
| 3     | Bob       | C
| 4     | Britany   | C
```

Please create a query to get some users who have a specific mark.

Solution:

```sql
SELECT * FROM users where MARK = ?;
```

2. I have users & books table as follows:

Users Table

```
| ID    | Name
------------------
| 1     | John
| 2     | Bob
| 3     | Britany
```

Books Table

```
| ID    | Name                                      | Date      | user_id
----------------------------------------------------------------------------
| 1     | Bachelor of Information Systems           |01-01-2019 | 1
| 2     | Bachelor of Design                        |02-02-2019 | 2
| 3     | Bachelor of Commerce                      |03-03-2019 | 3
| 4     | Associate Degree in Health Science        |04-04-2019 | 3
| 5     | Master of Architectural Technology        |05-05-2019 | 2
| 6     | Bachelor of Psychology                    |06-06-2019 | 2
| 7     | Associate Degree in Information Systems   |07-07-2019 | 1
```

Please create a query to get the latest book (based on date column) for each user. Below is the result example:

```
| User      | Book                                      | Date
---------------------------------------------------------------
| John      | Associate Degree in Information Systems   |07-07-2019
| Bob       | Bachelor of Psychology                    |06-06-2019
| Britany   | Associate Degree in Health Science        |04-04-2019
```

Solution:

```sql
WITH sorted_books AS (
    SELECT
        b.id,
        b.name AS book,
        b.date,
        b.user_id,
        ROW_NUMBER() OVER (PARTITION BY b.user_id ORDER BY b.date DESC) AS row_num
    FROM
        books b
)

SELECT
    u.name AS user
    sb.book,
    sb.date
FROM
    sorted_books sb
JOIN
    users u on u.id = sb.user_id
WHERE
    sb.row_num = 1
ORDER BY
    u.id;
```
