INSERT INTO email(id, email) VALUES ('1','someone@email.com');
INSERT INTO email(id, email) VALUES ('2','someoneelse@email.com');

INSERT INTO instruments(teachable_instruments) VALUES ('piano','drums');

INSERT INTO lessons(lesson_id, number_of_lessons) VALUES ('1','10');

INSERT INTO level (level) VALUES ('Advanced');

INSERT INTO person(person_id, personal_number,first_name,last_name,address) VALUES ('1','199302105432','Stina','Larsson','Bovägen 2');

INSERT INTO person_email(person_id,email_id) VALUES ('1','1');

INSERT INTO rent_instrument(rent_id, lease, fee, brand, number_of_instruments) VALUES ('2','200','1200','Yamaha','60');

INSERT INTO student(student_id, person_id, instrument) VALUES ('1','1', 'Saxophone');

INSERT INTO student_lessons(student_id, lesson_id,person_id) VALUES ('1','1','1');

INSERT INTO student_level (student_id,person_id) VALUES ('1','1');

INSERT INTO student_rent(student_id,rent_id,person_id, rented_instument) VALUES ('3','1','5','Violin');

INSERT INTO instructor(person_id, instructor_id) VALUES ('9','1');

INSERT INTO instrument(student_id,person_id,type_of_instrument) VALUES ('7','4','Flute');

INSERT INTO instruments_instructor(person_id) VALUES ('1');

INSERT INTO lesson(lesson_id, student_id,person_id,price,type_of_lesson,instructor_id) VALUES ('1','4','6','250','Group','1');

INSERT INTO parent(student_id, person_id) VALUES ('1','5');

INSERT INTO sibling(student_id, person_id,name) VALUES ('1','6','Sara');

INSERT INTO booking(booking_id, person_id,lesson_id) VALUES ('1','6','3');

INSERT INTO ensemble(student_id, lesson_id,person_id,genre,max_students, min_students) VALUES ('1','1','1','Rock','5','32');

INSERT INTO group_lesson(student_id, lesson_id,person_id,max_places, min_places) VALUES ('2','2','2','5','32');

INSERT INTO individual_lesson(student_id, lesson_id,person_id,genre,max_student, instrument) VALUES ('3','3','3','Oboe');