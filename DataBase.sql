create table officer(

FName varchar2(20) constraint officer_fname_nn NOT NULL,
MName varchar2(20) constraint officer_mname_nn NOT NULL,
LName varchar(20) constraint officer_lname_nn NOT NULL,
Military_Id number(7) constraint officer_miltId_nn NOT NULL,
SSN number(9) constraint officer_ssn_nn NOT NULL,
Birth_Date date constraint officer_date_nn NOT NULL,
Gender char(1) constraint officer_gender_nn NOT NULL,
Salary number constraint minimum_salary CHECK((Salary >= 1650)),
Military_rank varchar2(25),
Administrative_rank varchar(25),
Years_in_service int,
Personal_status varchar2(25),
Nationalities varchar2(35),
Qualifications varchar2(35),
Blood_type varchar2(3),
Weight float, 
Height float,
constraint officer_MilitaryId_pk primary key(Military_Id)
/*DepartmentId number(5) constraint Officer_DepartmentId foreign key references Department(DepartmentId),*/  /*==> ==> they refer to a table that has not yet been created*/
/*Officer_TaskId number(9) constraint offiecer_taskId foreign key references Task(TaskId) */             /*==> ==>  they refer to a table that has not yet been created*/


);



create table Officer_Address(
Officer_MilId number(7),
City varchar(25), 
Street varchar(25),
constraint officerAdd_pk primary key(Officer_MilId,City),
constraint officer_address_fk foreign key(Officer_MilId) references officer(Military_Id)
);


create table Department(
DepartmentId number(5) NOT NULL,
Department_Name varchar2(30),
Manager_MilitId number(7),
Manager_StartDate date,
constraint Department_pk primary key(DepartmentId,Department_Name),
constraint Department_Mgr_fk foreign key(Manager_MilitId) references officer(Military_Id)
);


create table Officer_Dependent(
Officer_MilitId number(7),
FName varchar2(20) NOT NULL,
Birth_Date date NOT NULL, 
Gender char(1) NOT NULL, 
Relation_to_Officer varchar(20),
constraint dependent_pk primary key(Officer_MilitId,FName),
constraint dependent_fk foreign key(Officer_MilitId) references officer(Military_Id)
);


create table Task(
TaskId number(9) NOT NULL,
Task_Name varchar2(50), 
Task_Location varchar2(50),
Task_Head_MilId number(7),
Department_Id number(5),
constraint Task_Id_pk primary key(TaskId),
constraint Task_headId_fk foreign key(Task_Head_MilId) references officer(Military_Id),
constraint Task_DepartmentId_fk foreign key(Department_Id) references Department(DepartmentId)

);



create table Task_ControlledBy_Dep(

Off_Task_Id number(7), 
Dep_Id number(5),
constraint Task_ControlledBy_Dep_pk primary key(Off_Task_Id,Dep_Id),
constraint Off_Task_Id_fk foreign key(Off_Task_Id) references officer(Military_Id),
constraint Dep_Id foreign key(Dep_Id) references Department(DepartmentId)

);

create table officer_worksfor(

Officer_Military_Id number(7),
Officer_DepartmentId number(5),
constraint officer_worksfor_pk primary key(Officer_Military_Id,Officer_DepartmentId),
constraint Officer_MilId_fk foreign key(Officer_Military_Id) references officer(Military_Id),
constraint Officer_DepId_fk foreign key(Officer_DepartmentId) references Department(DepartmentId)

);

create table officer_worksOn(

Off_Id number(7),
Task_Id number(9),
constraint officer_worksOn_pk primary key(Off_Id,Task_Id),
constraint Off_Id_fk foreign key(Off_Id) references officer(Military_Id),
constraint Task_Id_fk foreign key(Task_Id) references Task(TaskId)
);

create table MILITARY_RANKS(
Rank varchar2(55)
);


create table E_DEPARTMENT(
MILITID number(7) primary key NOT NULL ,
PASSWORD varchar2(30) 
);
