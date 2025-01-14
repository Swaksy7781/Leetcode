SELECT e.name
FROM Employee e
WHERE e.id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);