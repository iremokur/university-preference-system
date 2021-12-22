---create database
CREATE DATABASE "UniversityPreferencSystem";

----create table university
CREATE TABLE UNIVERSITY
(
  "university_id" serial NOT NULL,
  "name" text,
  "address" text,
  "e_mail address" text,
  "city" text,
  "university type" text,
  "year of foundation" integer,
  CONSTRAINT "PK_universityid" PRIMARY KEY ("university_id"),
  CONSTRAINT "UN_universityname" UNIQUE ("name")
);
----Create table faculty
CREATE TABLE FACULTY
(
  "university id" integer NOT NULL,
  "faculty_id" serial NOT NULL,
  "name" text,
  "e_mail address" text,
  CONSTRAINT "PK_facultyid" PRIMARY KEY ("faculty_id"),
  CONSTRAINT "forkey_unid" FOREIGN KEY ("university id")
  REFERENCES UNIVERSITY ("university_id") MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE
);
----Create table Department
CREATE TABLE DEPARTMENT
( 
  "faculty_id" integer NOT NULL,
  "department_id" serial NOT NULL,
  "name" text,
  "e_mail address" text,
  "language" text,
  "education type" text,
  "quota" int,
  "quota for top rank" int,
  "period" int,
  "min_score in 2019" int,
  "min_order in 2019" int,
  CONSTRAINT "PK_departmentid" PRIMARY KEY ("department_id"),
  CONSTRAINT "forkey_fakid" FOREIGN KEY("faculty_id")
  REFERENCES FACULTY("faculty_id") match simple
  ON UPDATE CASCADE ON DELETE CASCADE
);

----create table student
CREATE TABLE STUDENT
(
  "student_id" serial NOT NULL,
  "name" text,
  "surname" text,
  "score" int,
  "rank in the exam" int,
  "position in the high school" text,
  "university preference1" int,
  "university preference2" int,
  "university preference3" int,
   CONSTRAINT "PK_studentid" PRIMARY KEY ("student_id")

);
----because of the many to many relationship
----create table Departmentstudent
CREATE TABLE DEPARTMENTSTUDENT
(
   "department_id1" integer NOT NULL, 
   "department_id2" integer NOT NULL, 
   "department_id3" integer NOT NULL, 
   "student_id" integer NOT NULL,
   CONSTRAINT "pktid1" FOREIGN KEY("department_id1")
   REFERENCES DEPARTMENT("department_id") match simple
   ON UPDATE CASCADE ON DELETE CASCADE,
   CONSTRAINT "pktid2" FOREIGN KEY("department_id2")
   REFERENCES DEPARTMENT("department_id") match simple
   ON UPDATE CASCADE ON DELETE CASCADE,
   CONSTRAINT "pktid3" FOREIGN KEY("department_id3")
   REFERENCES DEPARTMENT("department_id") match simple
   ON UPDATE CASCADE ON DELETE CASCADE,
   CONSTRAINT "pkstudentid" FOREIGN KEY("student_id")
   REFERENCES STUDENT("student_id") match simple
   ON UPDATE CASCADE ON DELETE CASCADE
);

--INSERT TO UNIVERSTY TABLE
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('Dokuz Eylül University','Buca','deu@gmail.com','İzmir','State','1990');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('Ege University','Bornova','ege@gmail.com','İzmir','State','1980');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('Yaşar University','Bölge','yşr@gmail.com','İzmir','Private','2003');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('İstanbul Technical University','Maslak','itu@gmail.com','İstanbul','State','1973');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('Bilkent University','100. Yıl','blknt@gmail.com','Ankara','Private','1984');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('Koç University','Sarıyer','koç@gmail.com','İstanbul','Private','1993');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('Akdeniz University','Konyaaltı','akdeniz@gmail.com','Antalya','State','1992');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('İzmir University','Karşıyaka','izmirüni@gmail.com','İzmir','Private','2001');
insert into UNIVERSITY("name","address" ,"e_mail address" ,"city" ,"university type" ,"year of foundation")
values('İzmir Technical University','Gaziemir','izmirtechüni@gmail.com','İzmir','State','1880');

----SELECT UNIVERSITY
select *from UNIVERSITY;

--INSERT TO FACULTY TABLE
insert into FACULTY("university id","name","e_mail address" )
values('1','Faculty of Engineering','deueng@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('2','Faculty of Engineering','egeeng@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('6','Faculty of Engineering','koçeng@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('5','Faculty of Engineering','bileng@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('6','Faculty of Law','lawkoç@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('9','Faculty of Law','lawizmirtü@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('3','Faculty of Law','lawyşr@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('2','Faculty of Medicine','mediege@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('1','Faculty of Medicine','medideu@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('7','Faculty of Architecture','archiak@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('8','Faculty of Architecture','archiizmir@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('4','Faculty of Architecture','architu@hotmail.com');
insert into FACULTY("universityid","name","e_mail address" )
values('5','Faculty of Architecture','archibil@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('1','Faculty of Management','mandeu@hotmail.com');
insert into FACULTY("university id","name","e_mail address" )
values('8','Faculty of Management','manizmir@hotmail.com');

----SELECT FACULTY
Select * from FACULTY;

--INSERT TO DEPARTMENT TABLE
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('1','Computer Eng','compeng@gmail.com','En','formal','90','4','4','320','30000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('2','Computer Eng','compeng@gmail.com','Tr','formal','120','3','4','290','60000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('3','Industrial Eng','indeng@gmail.com','En','formal','70','2','4','300','50000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('10','Architecture','arch@gmail.com','Tr','formal','50','6','4','220','100000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('9','Medicine','med@gmail.com','Tr','formal','150','8','6','400','2000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('20','Architecture','arch@gmail.com','Tr','formal','50','6','4','220','90000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('5','Law','law@gmail.com','Tr','evening','300','10','4','300','70000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('8','Dentistry','den@gmail.com','Tr','formal','200','8','5','390','4000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('12','Architecture','arch@gmail.com','Tr','evening','30','1','4','120','100000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('13','Architecture','arch@gmail.com','En','formal','60','3','4','278','70000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('6','Law','law@gmail.com','Tr','Formal','300','10','4','210','150000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('7','Law','law@gmail.com','En','evening','230','9','4','203','148000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('4','Civil Eng','civeng@gmail.com','Tr','evening','75','2','4','240','90000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('14','Economy','econ@gmail.com','En','formal','130','3','4','330','12000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('19','Economy','econ@gmail.com','Tr','formal','78','3','4','180','120000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('14','Finance','fin@gmail.com','En','formal','90','4','4','340','10000');
insert into DEPARTMENT( "faculty_id" , "name" , "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" , "min_score in 2019" , "min_order in 2019" )
values('1','Industrial Eng','indeng@gmail.com','Tr','evening','45','0','4','200','98000');

--SELECT DEPARTMENT
Select * from DEPARTMENT;


--INSERT TO STUDENT TABLE
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('İREM','OKUR','330','29000','43','1','3','2');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Gizel','Kara','280','45000','70','12','19','15');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Ege','Uzak','220','139000','133','11','12','19');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Lara','Bayrak','323','15000','32','1','2','3');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Tanem','Zaman','300','71000','89','7','10','1');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Emre','Tan','294','56000','67','8','1','13');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Naz','Okur','310','30000','47','2','1','3');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Yağmur','Önde','340','10000','13','2','14','15');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Furkan','Çap','225','135000','111','11','12','19');
insert into STUDENT(  "name" , "surname" ,"score" ,"rank in the exam" ,"position in the high school" ,"university preference1" ,"university preference2" ,"university preference3" )
values('Teo','Yıldırım','260','98000','98','9','13','1');

---SELECT STUDENT
Select *from STUDENT ;




--INSERT TO DEPARTMENSTUDENT TABLE
insert into DEPARTMENTSTUDENT
values('1','2','3','4');
insert into DEPARTMENTSTUDENT
values('1','3','2','1');
insert into DEPARTMENTSTUDENT
values('12','19','15','2');
insert into DEPARTMENTSTUDENT
values('11','12','19','3');
insert into DEPARTMENTSTUDENT
values('7','10','1','5');
insert into DEPARTMENTSTUDENT
values('8','1','13','6');
insert into DEPARTMENTSTUDENT
values('2','1','3','7');
insert into DEPARTMENTSTUDENT
values('2','14','15','8');
insert into DEPARTMENTSTUDENT
values('11','12','19','9');
insert into DEPARTMENTSTUDENT
values('9','13','1','10');

---SELECT DEPARTMENTSTUDENT
Select * from DEPARTMENTSTUDENT;


----QUERY 1
Select "name","city","year of foundation"from UNIVERSITY
Where "city" Like 'İ%'
And "year of foundation" >1990;
----QUERY 2 
Select *from UNIVERSITY
Where "university_id" IN (
			Select "university id"from FACULTY
			where  FACULTY."name" Like 'Faculty of Engineering' or  FACULTY."name" Like 'Faculty of Medicine'
			);
			
		
-----QUERY 3-----
Select "university type" ,count("university type")from UNIVERSITY as un
INNER JOIN FACULTY as f on un."university_id"=f."university id"
group by "university type";


-----QUERY 4
Select * from DEPARTMENT
Where "education type" Like 'evening' and ("faculty_id"=1 or"faculty_id"=2 or "faculty_id"=3 or "faculty_id"=4 );
----QUERY 5 
Select "name","period","min_score in 2019"from DEPARTMENT
Order by "period" DESC , "min_score in 2019" DESC
Limit 5;

----QUERY 6------

select "faculty_id" , "department_id" ,"name", "e_mail address" ,"language" ,"education type" ,"quota" ,"quota for top rank" ,"period" ,"min_score in 2019" ,"min_order in 2019" ,count(*)  from DEPARTMENT as d
inner join DEPARTMENTSTUDENT as dp on d."department_id"=dp."department_id1" or  d."department_id"=dp."department_id2" or d."department_id"=dp."department_id3" 
where d."period"=4
group by d."faculty_id" , d."department_id" ,d."name", d."e_mail address" ,d."language" ,d."education type" ,d."quota" ,d."quota for top rank" ,d."period" ,d."min_score in 2019" ,d."min_order in 2019" 
limit 1;

----QUERY 7 ----
Select STUDENT."name","surname","university preference1","score",DEPARTMENT."name" from STUDENT
INNER JOIN DEPARTMENT ON STUDENT."university preference1"=DEPARTMENT."department_id"
Where "university preference1"=1 or "university preference1"=2
Order by "score" DESC ;

----QUERY 8
UPDATE FACULTY
Set "university id"=1
where "faculty_id"=1 and "university id"=9;
---IF YOU WANT TO CHECK!
Select * from FACULTY INNER JOIN UNIVERSITY on FACULTY."university id"=UNIVERSITY."university_id";

----QUERY 9
--- IF YOU WANT TO CHECK!
SELECT *FROM DEPARTMENT;

UPDATE DEPARTMENT
Set "period"="period"+1
where "name" like'Law%';

----QUERY 10 
---You can delete from faculty or department whatever you want because of the
----"ON UPDATE CASCADE ON DELETE CASCADE"
DELETE FROM FACULTY
WHERE "university id"=8;
---IF YOU WANT TO CHECK!
Select * from FACULTY;
Select* from DEPARTMENT;










