CREATE TABLE email (
 email_id INT NOT NULL,
 email VARCHAR(200) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email_id);


CREATE TABLE instruments (
 teachable_insturments VARCHAR(100) NOT NULL
);


CREATE TABLE lessons (
 lesson_id INT NOT NULL,
 number_of_lessons VARCHAR(300)
);

ALTER TABLE lessons ADD CONSTRAINT PK_lessons PRIMARY KEY (lesson_id);


CREATE TABLE level (
 level  VARCHAR(50) NOT NULL
);


CREATE TABLE person (
 person_id INT NOT NULL,
 personal_number     VARCHAR(12) DEFAULT 'UNIQUE' NOT NULL,
 first_name  VARCHAR(100) NOT NULL,
 last_name VARCHAR(200),
 adress  VARCHAR(200) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE person_email (
 person_id INT NOT NULL,
 emal_id INT NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,emal_id);


CREATE TABLE rent_instrument (
 rent_id INT NOT NULL,
 lease  VARCHAR(200),
 fee  VARCHAR(200),
 brand VARCHAR(100),
 number_of_instruments INT
);

ALTER TABLE rent_instrument ADD CONSTRAINT PK_rent_instrument PRIMARY KEY (rent_id);


CREATE TABLE student (
 student_id INT NOT NULL,
 person_id INT NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id,person_id);


CREATE TABLE student_lessons (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student_lessons ADD CONSTRAINT PK_student_lessons PRIMARY KEY (student_id,lesson_id,person_id);


CREATE TABLE student_level (
 student_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student_level ADD CONSTRAINT PK_student_level PRIMARY KEY (student_id,person_id);


CREATE TABLE student_rent (
 student_id INT NOT NULL,
 rent_id INT NOT NULL,
 person_id INT NOT NULL,
 rented_instrument VARCHAR(100)
);

ALTER TABLE student_rent ADD CONSTRAINT PK_student_rent PRIMARY KEY (student_id,rent_id,person_id);


CREATE TABLE instructor (
 person_id INT NOT NULL,
 instructor_id  VARCHAR(50) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (person_id);


CREATE TABLE instrument (
 student_id INT NOT NULL,
 person_id INT NOT NULL,
 type_of_instrument VARCHAR(100) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (student_id,person_id);


CREATE TABLE instruments_instructor (
 person_id INT NOT NULL
);

ALTER TABLE instruments_instructor ADD CONSTRAINT PK_instruments_instructor PRIMARY KEY (person_id);


CREATE TABLE lesson (
 lesson_id INT NOT NULL,
 student_id INT NOT NULL,
 person_id INT NOT NULL,
 price VARCHAR(100) NOT NULL,
 type_of_lesson VARCHAR(100) NOT NULL,
 instructor_id    VARCHAR(100)
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id,student_id,person_id);


CREATE TABLE parent (
 student_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE parent ADD CONSTRAINT PK_parent PRIMARY KEY (student_id,person_id);


CREATE TABLE sibling (
 student_id INT NOT NULL,
 person_id INT NOT NULL,
 name VARCHAR(100)
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,person_id);


CREATE TABLE booking (
 id_1 INT NOT NULL,
 person_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (id_1,person_id,lesson_id);


CREATE TABLE ensemble (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL,
 person_id INT NOT NULL,
 genre  VARCHAR(50) NOT NULL,
 max_students  INT NOT NULL,
 min_students INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (student_id,lesson_id,person_id);


CREATE TABLE group_lesson (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL,
 person_id INT NOT NULL,
 min_places INT NOT NULL,
 max_places INT NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (student_id,lesson_id,person_id);


CREATE TABLE individual_lesson (
 student_id INT NOT NULL,
 ilesson_d INT NOT NULL,
 person_id INT NOT NULL,
 max_student  INT NOT NULL,
 instrument  VARCHAR(100) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (student_id,ilesson_d,person_id);


ALTER TABLE person_email ADD CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES email (email_id);
ALTER TABLE person_email ADD CONSTRAINT FK_person_email_1 FOREIGN KEY (emal_id) REFERENCES person (person_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE student_lessons ADD CONSTRAINT FK_student_lessons_0 FOREIGN KEY (student_id,person_id) REFERENCES student (student_id,person_id);
ALTER TABLE student_lessons ADD CONSTRAINT FK_student_lessons_1 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id);


ALTER TABLE student_level ADD CONSTRAINT FK_student_level_0 FOREIGN KEY (student_id,person_id) REFERENCES student (student_id,person_id);


ALTER TABLE student_rent ADD CONSTRAINT FK_student_rent_0 FOREIGN KEY (student_id,person_id) REFERENCES student (student_id,person_id);
ALTER TABLE student_rent ADD CONSTRAINT FK_student_rent_1 FOREIGN KEY (rent_id) REFERENCES rent_instrument (rent_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (student_id,person_id) REFERENCES student (student_id,person_id);


ALTER TABLE instruments_instructor ADD CONSTRAINT FK_instruments_instructor_0 FOREIGN KEY (person_id) REFERENCES instructor (person_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (student_id,person_id) REFERENCES student (student_id,person_id);


ALTER TABLE parent ADD CONSTRAINT FK_parent_0 FOREIGN KEY (student_id,person_id) REFERENCES student (student_id,person_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id,person_id) REFERENCES student (student_id,person_id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (id_1,person_id) REFERENCES student (student_id,person_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_1 FOREIGN KEY (id_1,lesson_id,person_id) REFERENCES lesson (student_id,lesson_id,person_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (student_id,lesson_id,person_id) REFERENCES lesson (student_id,lesson_id,person_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (student_id,lesson_id,person_id) REFERENCES lesson (student_id,lesson_id,person_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (student_id,ilesson_d,person_id) REFERENCES lesson (student_id,lesson_id,person_id);


