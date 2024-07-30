create table groups
(
    id        serial primary key,
    name      varchar(50) not null,
    course    varchar(50) not null,
    specialty varchar(100)
);

create table students
(
    id                serial primary key,
    first_name        varchar(50)         not null,
    last_name         varchar(50)         not null,
    student_id_number varchar(20) unique  not null,
    email             varchar(100) unique not null,
    group_id          int references groups (id)
);

create table teachers
(
    id         serial primary key,
    first_name varchar(50)         not null,
    last_name  varchar(50)         not null,
    email      varchar(100) unique not null,
    course_id  int references courses (id)

);

create table courses
(
    id          serial primary key,
    name        varchar(100) not null,
    description text,
    teacher_id  int references teachers (id)
);


create table grades
(
    id         serial primary key,
    student_id int references students (id),
    course_id  int references courses (id),
    grade      decimal(3, 2),
    date       date not null
);
insert into groups (name, course, specialty)
values (1, 'Technology', 'Java Developer'),
       (2, 'Analytic', 'Python Developer'),
       (3, 'Management', 'Product Manager');

insert into students (first_name, last_name, student_id_number, email, group_id)
values ('Иван', 'Иванов', 'A101', 'ivan@mail.com', 1),
       ('Сергей', 'Петров', 'A102', 'serg@mail.com', 2),
       ('Дарья', 'Сидорова', 'A103', ' dasha@mail.com', 3),
       ('Ольга', 'Путина', 'A104', 'olga@mail.com', 2);


insert into courses (name, description, teacher_id)
values ('Technology', 'Изучение современных инструментов, методов и инноваций', 1),
       ('Analytic', 'Анализ данных для принятия решений.', 2),
       ('Management', 'Управление ресурсамиб создание и развитие продуктов ', 1);

insert into teachers (first_name, last_name, email, course_id)
values ('Александр', 'Смирнов', 'smirnov@mail.com', 1),
       ('Екатерина', 'Петрова', 'petrova@mail.com', 1),
       ('Дмитрий', 'Иванов', 'ivanov@mail.com', 2),
       ('Мария', 'Кузнецова', 'kuznet@mail.com', 2);

insert into grades (student_id, course_id, grade, date)
values  (1, 1, 4.5, '2024-05-30'),
        (2, 2, 5.0, '2024-05-30'),
        (3, 3, 4.2, '2024-05-30'),
        (4, 1, 4.9, '2024-05-30');