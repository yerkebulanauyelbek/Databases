create table students(
    full_name text primary key,
    age smallint not null,
    birth_date varchar(14) not null,
    gender char(1) not null,
    avg_grd numeric(3,2) not null check(avg_grd>=0.00 and avg_grd<=4.00),
    info_abt_urself text,
    dorm boolean not null,
    add_info text
);
create table instructors(
    full_name text primary key ,
    speak_lang text,
    work_exp text,
    possib_remote_lessons boolean not null
);
create table participants(
    lesson_title text not null,
    teach_instruct text not null references instructors(full_name),
    stud_students text not null references students(full_name),
    room_num smallint not null unique
);