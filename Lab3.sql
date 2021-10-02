/* 1, a) */
select course_id from course where credits>3;
/* 1, b) */
select room_number from classroom where building = 'Watson' or building = 'Packard';
/* 1, c) */
select course_id from course where dept_name ='Comp. Sci.';
/* 1, d) */
select course_id from section where semester='Fall';
/* 1, e) */
select id from student where tot_cred>45 and tot_cred<90;
/* 1, f) */
select id from student where name like '%a' or name like '%e' or name like '%i' or name like '%o' or name like '%u' or name like '%y';
/* 1, g) */
select course_id from prereq where prereq_id = 'CS-101';

/* 2, a) */
select dept_name, count(dept_name) as d_name, avg(salary) as avgsalary from instructor group by dept_name having count(dept_name) >= 1 order by avgsalary;
/* 2, b)
-
 2, c)
-
 2, d)
-
 2, e) */
select name from instructor where dept_name='Biology' or dept_name='Philosophy' or dept_name='Music';
/* 2, f) */
select distinct id from teaches where year = 2018 and id not in (select distinct id from teaches where year=2017);

/* 3, a) */
select distinct student.name from student, takes where student.dept_name = 'Comp. Sci.' and takes.grade like 'A%' and student.id = takes.id order by name;
/* 3, b) */
select id from instructor where id in (select i_id from advisor where s_id in (select id from takes where grade not in ('B','B+','A-','A')));
/* 3, c) */
select dept_name from department where dept_name not in(select dept_name from student where id in(select id from takes where grade ='F' or grade='C'));
/* 3, d) */
select name from instructor where id in(select id from teaches where course_id not in(select course_id from takes where grade='A'));
/* 3, e) */
select distinct course_id from section where time_slot_id in(select time_slot_id from time_slot where end_hr<13);
