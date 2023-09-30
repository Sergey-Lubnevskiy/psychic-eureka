CREATE TABLE numbers (num INT PRIMARY KEY);
CREATE TABLE primes (num INT PRIMARY KEY);

-- ���������� ������� ������� �� 3 �� 1000000
DECLARE @i INT = 3;
WHILE @i <= 1000000
BEGIN
    INSERT INTO numbers VALUES (@i);
    SET @i = @i + 1;
END;

-- ������������� ������� �������� �����
INSERT INTO primes VALUES (2);

-- ����� ������� �����
DECLARE @prime INT = 2;
WHILE @prime * @prime <= 1000000
BEGIN
    -- �������� �����, ������� ������� �� ������� ������� �����
    DELETE FROM numbers WHERE num % @prime = 0;

    -- ��������� ���������� �������� �����
    SET @prime = (SELECT MIN(num) FROM numbers WHERE num > @prime);

    -- ���������� ���������� �������� ����� � ������� primes
    INSERT INTO primes VALUES (@prime);
END

-- ���������� ���������� ����� � ������� primes, ��� ��� ��� �������� ��������
INSERT INTO primes SELECT num FROM numbers WHERE num > @prime;

-- ����� ������� �����
SELECT num FROM primes ORDER BY num;
