CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO teacher (id, first_name, last_name) VALUES
(1, 'Taylah', 'Booker'),
(2, 'Sarah-Louise', 'Blake');

CREATE TABLE course (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    teacher_id INT REFERENCES teacher(id)
);

INSERT INTO course (id, name, teacher_id) VALUES
(1, 'Database design', 1),
(2, 'English literature', 2),
(3, 'Python programming', 1);

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO student (id, first_name, last_name) VALUES
(1, 'Shreya', 'Bain'),
(2, 'Rianna', 'Foster'),
(3, 'Yosef', 'Naylor');

CREATE TABLE student_course (
    student_id INT REFERENCES student(id),
    course_id INT REFERENCES course(id),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO student_course (student_id, course_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1);

SELECT
    student.id AS student_id,
    student.first_name AS student_first_name,
    student.last_name AS student_last_name,
    course.id AS course_id,
    course.name AS course_name,
    teacher.id AS teacher_id,
    teacher.first_name AS teacher_first_name,
    teacher.last_name AS teacher_last_name
FROM student
INNER JOIN student_course ON student.id = student_course.student_id
INNER JOIN course ON student_course.course_id = course.id
INNER JOIN teacher ON course.teacher_id = teacher.id;
