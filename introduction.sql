--deleting the student table from amdor analytics database if it already exists
DROP TABLE IF EXISTS student;

CREATE TABLE student(
	id VARCHAR(5),
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	gender VARCHAR(7),
	location VARCHAR(15));

/*deleting the student table from
amdor analytics database if it already exists*/

select * from student;

SELECT first_name FROM student;


SELECT first_name AS name, gender, location FROM student;

--adding phone number column to the student table
ALTER TABLE student ADD COLUMN phone_number VARCHAR(14);

--changing the data type of the id column from varchar to integer(int)
ALTER TABLE student ALTER COLUMN id SET DATA TYPE INT USING id::INT;

ALTER TABLE student ALTER COLUMN id SET DATA TYPE VARCHAR(5);

--deleting the phone number column
ALTER TABLE student DROP COLUMN phone_number;

SELECT * FROM student;

--renaming the id column to student_id
ALTER TABLE student RENAME COLUMN id TO student_id;

--making the student_id column the primary key of the student table
ALTER TABLE student ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);

--creating a grades table
CREATE TABLE grade(
grade_id INT PRIMARY KEY,
course_name VARCHAR(10),
student_id VARCHAR(5),
grade VARCHAR(1));

SELECT * FROM grade;

--making student_id in the grade table a foreign key
ALTER TABLE grade ADD CONSTRAINT grade_student_id_fkey FOREIGN KEY (student_id) REFERENCES student (student_id);

--Increasing the character limit of the loaction column
ALTER TABLE student ALTER COLUMN location SET DATA TYPE VARCHAR(20);

--Inserting a single row into the student table
INSERT INTO student
VALUES('SA001','Sandra','Asagade','Female','Nigeria');


--Inserting multiple rows into the student table
BEGIN:
INSERT INTO student(student_id,first_name,last_name,gender,location)
VALUES('BA002','Bolaji','Abdulsalaam','Male','United Kingdom'),
	('VA003','Valerie','Dogun','Female','United Kingdom'),
	('BA004','Bassey','Kalu','Male','Nigeria'),
	('FY005','Femi','Yusuff','Male','United Kingdom'),
	('PE006','Peter','Akpamuose','Male','Nigria');

SELECT * FROM student;

--Replacing Peter's location (Nigria with Nigeria)
UPDATE student
SET location = 'Nigeria'
WHERE first_name = 'Peter';






