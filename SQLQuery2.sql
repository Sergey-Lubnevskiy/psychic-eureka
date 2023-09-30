WITH nums AS (
    SELECT 0 AS num
    UNION ALL
    SELECT num + 1 FROM nums WHERE num < 9
),
tickets AS (
    SELECT a.num AS num1, b.num AS num2, c.num AS num3, d.num AS num4, e.num AS num5, f.num AS num6
    FROM nums a, nums b, nums c, nums d, nums e, nums f
)
SELECT CONCAT(num1, num2, num3, num4, num5, num6) AS ticket_number
FROM tickets
WHERE (num1 + num2 + num3) = (num4 + num5 + num6)
ORDER BY ticket_number;
