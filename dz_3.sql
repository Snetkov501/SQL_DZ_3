CREATE DATABASE IF NOT EXISTS dz_3 ;

USE dz_3;

CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    post VARCHAR(45) NOT NULL,
    seniority INT, 
    salary DECIMAL(8,2), -- 100 000 . 00
    age INT
);

INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 40),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
  ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


SELECT DISTINCT lastname
FROM staff
ORDER BY lastname
LIMIT 5; -- по воз-ю, от буквы "А" к букве "Я"


-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
select * from staff
order by salary;

select * from staff
order by salary desc;

-- 2. Выведите 5 максимальных заработных плат (saraly)
select salary
from staff limit 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
select sum(salary),post
from staff
group by post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
select COUNT(*) post
from staff
where post='Рабочий' and age>=24 and age<=49
group by post;

-- 5. Найдите количество специальностей
select count(distinct post)
from staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
select post , avg(age)
from staff
group by post
having avg(age) <= 30;
