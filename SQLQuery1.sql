CREATE TABLE numbers (num INT PRIMARY KEY);
CREATE TABLE primes (num INT PRIMARY KEY);

-- Заполнение таблицы числами от 3 до 1000000
DECLARE @i INT = 3;
WHILE @i <= 1000000
BEGIN
    INSERT INTO numbers VALUES (@i);
    SET @i = @i + 1;
END;

-- Инициализация первого простого числа
INSERT INTO primes VALUES (2);

-- Поиск простых чисел
DECLARE @prime INT = 2;
WHILE @prime * @prime <= 1000000
BEGIN
    -- Удаление чисел, которые делятся на текущее простое число
    DELETE FROM numbers WHERE num % @prime = 0;

    -- Получение следующего простого числа
    SET @prime = (SELECT MIN(num) FROM numbers WHERE num > @prime);

    -- Добавление найденного простого числа в таблицу primes
    INSERT INTO primes VALUES (@prime);
END

-- Добавление оставшихся чисел в таблицу primes, так как они являются простыми
INSERT INTO primes SELECT num FROM numbers WHERE num > @prime;

-- Вывод простых чисел
SELECT num FROM primes ORDER BY num;
