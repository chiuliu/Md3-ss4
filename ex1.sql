use md3_ss02;
create table class(
  classId int auto_increment primary key,
  className varchar(100),
  startDate varchar(255),
  status bit
);

create table student (
  studentId int auto_increment primary key,
  studentName varchar(100),
  address varchar(255),
  phone varchar(11),
  class_id int,
  status bit,
   constraint fk_class foreign key (class_id) references class(classId)
);

create table subjects (
   subjectId int auto_increment primary key,
   subjectName varchar(100),
   credit int,
   status bit
);

create table mark (
   markId int auto_increment primary key,
   student_id int,
   subject_id int,
   mark double,
   examTime datetime,
   constraint fk_student foreign key (student_id) references student(studentId),
   constraint fk_sbjects foreign key (subject_id) references subjects(subjectId)
);

select * from class;
insert into class(className, startDate, status )value ('B15DCVT402','2015-10-03',1),
                                                      ('B15DCVT020','2015-12-20',1),
                                                      ('B15DCVT001','2015-09-11',1);
select classId,className,startDate, 
case status when 1 then 'true' when 0 then 'false' end as status from class;

select * from student;

insert into student(studentName, address, phone, class_id,status) 
value ('le quang tiep','bac ninh','0333125999',1,1),
	 ('pham van tri','thai binh','0987333287',1,1),
     ('nguyen van minh','thanh hoa','09876599222',2,1),
     ('nguyen van thuy','ha noi','0987659766',2,1),
     ('nguyen thu quynh ','ha nam','09878957223',3,1),
     ('nguyen thi huyen','bac ninh','0987658292',3,1);
     
select studentId,studentName,address,phone,class_id,
 case status when 1 then 'true' when 0 then 'false' end as status from student; 
 
delete from student where studentId = 5;
 
 select * from subjects;
 
 insert into subjects(subjectName,credit,status)value('toan',3,1),
                                                     ('van',3,1),
                                                     ('anh',2,1);
 
select subjectId,subjectName,credit,
 case status when 1 then 'true' when 0 then 'false' end as status from subjects; 
 
 select * from mark;
 insert into mark(student_id,subject_id,mark,examTime)
 value(1,1,7,'2020-06-11 06:00:00'),
      (1,1,7,'2021-02-09 06:00:00'),
      (2,2,8,'2021-05-15 07:00:00'),
      (2,3,9,'2022-03-07 08:00:00'),
      (3,3,10,'2023-02-11 10:00:00');
-- Hiển thị số lượng sinh viên theo từng địa chỉ nơi ở.
select address, count(*) as student_count from student group by address;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.subjectId, s.subjectName, s.credit, m.mark, m.examTime
from subjects s
join mark m on s.subjectId = m.subject_id
where m.mark = (select max(mark) from mark)
order by s.subjectId;
-- Tính điểm trung bình các môn học của từng học sinh.
select s.studentId, s.studentName, avg(m.mark) as avg_mark from student s
join mark m on s.studentId = m.student_id 
group by s.studentId,s.studentName
order by s.studentId;

-- Hiển thị những bạn học viên có điểm trung bình các môn học nhỏ hơn bằng 7.
select s.studentId, s.studentName, avg(m.mark)  as avg_mark  from student s
join mark m on s.studentId = m.student_id 
group by s.studentId,s.studentName
having avg(m.mark)<=7;

-- Hiển thị thông tin học viên có điểm trung bình các môn lớn nhất.
select s.studentId, s.studentName, avg(m.mark) as avg_mark from student s
join mark m on s.studentId = m.student_id 
group by s.studentId,s.studentName
order by s.studentId desc
limit 1;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần,
select s.studentId, s.studentName, avg(m.mark) as avg_mark from student s
join mark m on s.studentId = m.student_id 
group by s.studentId,s.studentName
order by s.studentId desc;