create schema if not exists company;
use company;
create table company_employees(
	fname varchar(15) not null,
    minit char,
    lname varchar(15) not null, 
    ssn char(9) not null, 
    address varchar(30),
    sex char,
    salary decimal(10,2),
    super_ssn char(9),
    dno int not null,
    primary key (ssn)
);

create table departmant(
	dname varchar(15) not null,
    dnumber int not null,
    mgr_ssn char(9),
    mgr_start_date date,
    primary key (dnumber), 
    unique(dname),
    foreign key (mgr_ssn) references company_employees(ssn)
);

create table dept_locations(
	dnumber int not null,
    dlocation varchar(15) not null,
    primary key (dnumber, dlocation),
    foreign key (dnumber) references departmant(dnumber)
);

create table projects(
	pname varchar(15) not null, 
    pnumber int not null,
    plocation varchar(15),
    dnum int not null,
    primary key (pnumber, plocation),
    unique (pname),
    foreign key (dnum) references departmant(dnumber)
);

create table works_on(
	essn char(9) not null,
    pno int not null, 
    hours decimal(3,1),
    primary key(essn, pno),
    foreign key (essn) references company_employees(ssn),
    foreign key (pno) references projects(pnumber)
);

create table dependent(
	essn char(9) not null,
    dependent_name varchar(15) not null,
    sex char,
    bdate date,
    relationship varchar(8),
    primary key(essn,  dependent_name),
    foreign key (essn) references company_employees(ssn)
);

