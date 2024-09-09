CREATE DATABASE etl_DB

USE etl_DB

CREATE TABLE empData (
    emp_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
);

INSERT INTO empData
VALUES 
(1, "Vignesh","Nadar", 25.50, "2001-12-23"),
(2, "Zainab","Shaikh", 25.51, "2002-01-06"),
(3, "Oggy", "Rathore", 5.00, "2004-04-16"),
(4, "Tom", "Jerry", 20.00, "2002-02-04"),
(5, "Kick", "Butowski", 45.99, "2001-01-01"),
(6, "Phineas", "Ferb", 35.69, "2003-08-26");

INSERT INTO empData (emp_id, first_name, last_name)
VALUES (7, "Jhonny", "Bravo");

UPDATE empData
SET hire_date = "2003-06-19"
WHERE hourly_pay IS NULL;

INSERT INTO empData (emp_id, first_name, last_name, hire_date)
VALUES (8, "Ben", "Tenyson", CURRENT_DATE());

UPDATE empData
SET hourly_pay = 18.00
WHERE emp_id = 8;

ALTER TABLE empData
ADD COLUMN phone varchar(15);

ALTER TABLE empData
ADD CONSTRAINT
UNIQUE (phone);

UPDATE empData 
SET phone = CASE
    WHEN emp_id = 1 THEN "987654"
    WHEN emp_id = 2 THEN NULL
    WHEN emp_id = 3 THEN "345637"
    WHEN emp_id = 4 THEN "945637"
    WHEN emp_id = 5 THEN "345678"
    WHEN emp_id = 6 THEN "568792"
    WHEN emp_id = 7 THEN NULL
    WHEN emp_id = 8 THEN "893590"
    else phone
END;

UPDATE empData
SET phone = "787654" -- previously set as 987654 to verify the constraint unique.
WHERE emp_id = 7;

ALTER TABLE empData
ADD CONSTRAINT chk_hourly_pay CHECK(hourly_pay >= 10.00)

ALTER TABLE empData
MODIFY emp_id INT NOT NULL;

UPDATE empData 
SET hourly_pay = 12.00
WHERE hourly_pay < 10.00;

ALTER TABLE empData ADD laptop VARCHAR(5);

UPDATE empData 
SET laptop = CASE
    WHEN emp_id = 1 THEN "No"
    WHEN emp_id = 2 THEN "Yes"
    WHEN emp_id = 3 THEN "Yes"
    WHEN emp_id = 4 THEN "Yes"
    WHEN emp_id = 5 THEN "No"
    WHEN emp_id = 6 THEN "Yes"
    WHEN emp_id = 7 THEN "No"
    WHEN emp_id = 8 THEN "No"
END;

ALTER TABLE empData
ALTER COLUMN laptop SET DEFAULT "No";

INSERT INTO empData (emp_id, first_name, last_name, hourly_pay, hire_date, phone)
VALUES (9, "John", "Wick", 40.00, "1999-10-12", "548734");


INSERT INTO empData (emp_id, first_name, last_name, hourly_pay, hire_date, phone)
VALUES (10, "New", "Guy", 38.00, "1999-10-12", "544734");