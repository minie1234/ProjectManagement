DROP TABLE User_Info;
CREATE TABLE User_Info
(
    `no`        INT            NOT NULL    AUTO_INCREMENT, 
    `email`     VARCHAR(45)    NULL, 
    `name`      VARCHAR(45)    NULL, 
    `password`  VARCHAR(45)    NULL, 
    `position`  VARCHAR(45)    NULL, 
    PRIMARY KEY (no)
);

DROP TABLE Project_Info;
CREATE TABLE Project_Info
(
    `no`         INT            NOT NULL    AUTO_INCREMENT, 
    `title`      VARCHAR(45)    NULL, 
    `content`    VARCHAR(45)    NULL, 
    `startDate`  VARCHAR(45)    NULL, 
    `endDate`    VARCHAR(45)    NULL, 
    PRIMARY KEY (no)
);

DROP TABLE Project_User_Info;
CREATE TABLE Project_User_Info
(
    `UserNo`     INT    NULL, 
    `ProjectNo`  INT    NULL
);

ALTER TABLE Project_User_Info ADD CONSTRAINT FK_Project_User_Info_ProjectNo_Project_Info_no FOREIGN KEY (ProjectNo)
 REFERENCES Project_Info (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Project_User_Info ADD CONSTRAINT FK_Project_User_Info_UserNo_User_Info_no FOREIGN KEY (UserNo)
 REFERENCES User_Info (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;







DROP TABLE Todo_Info;
CREATE TABLE Todo_Info
(
    `no`         INT            NOT NULL    AUTO_INCREMENT, 
    `team`       VARCHAR(45)    NULL, 
    `task`       VARCHAR(45)    NULL, 
    `UserNo`     INT            NULL, 
    `ProjectNo`  INT            NULL, 
    `startDate`  DATE           NULL, 
    `endDate`    DATE           NULL, 
    `state`      VARCHAR(45)    NULL, 
    `fileNo`     INT            NULL, 
    PRIMARY KEY (no)
);

ALTER TABLE Todo_Info ADD CONSTRAINT FK_Todo_Info_UserNo_User_Info_no FOREIGN KEY (UserNo)
 REFERENCES User_Info (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Todo_Info ADD CONSTRAINT FK_Todo_Info_ProjectNo_Project_Info_no FOREIGN KEY (ProjectNo)
 REFERENCES Project_Info (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;


DROP TABLE File_Info;
CREATE TABLE File_Info
(
    `fileNo`         INT            NOT NULL    AUTO_INCREMENT, 
    `fileName`   VARCHAR(50)    NOT NULL, 
    `fileWriter`   INT    NOT NULL, 
    `fileDate`  DATE           NOT NULL, 
    `report` VARCHAR(50),
    PRIMARY KEY (fileNo)
);

ALTER TABLE Todo_Info ADD CONSTRAINT FK_Todo_Info_fileNo_File_Info_no FOREIGN KEY (fileNo)
 REFERENCES File_Info (fileNo)  ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE File_Info ADD CONSTRAINT FK_File_Info_UserNo_User_Info_no FOREIGN KEY (fileWriter)
 REFERENCES User_Info (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;


insert into user_info
values(1, 'email1', 'name1', 'pass1', 'position1');
insert into user_info
values(2, 'email2', 'name2', 'pass2', 'position2');

insert into file_info
values(1, 'filename1', 1, now(), 'report1');
insert into file_info
values(2, 'filename2', 2, now(), 'report1');

insert into project_info
values(1, 'project1', 'content', '2017-09-13', '2017-09-15');
insert into project_info
values(2, 'project2', 'content', '2017-09-14', '2017-09-15');
insert into project_info
values(3, 'project3', 'content', '2017-09-15', '2017-09-16');
insert into project_info
values(4, 'project4', 'content', '2017-09-15', '2017-09-16');

insert into todo_info
values(1, 'team1', 'task1', 1, 1, '2017-09-14', '2017-09-17', 'state1', 1);
insert into todo_info
values(2, 'team1', 'task2', 1, 1, '2017-09-15', '2017-09-18', 'state1', 1);
insert into todo_info
values(3, 'team2', 'task3', 1, 1, '2017-09-16', '2017-09-17', 'state1', 1);
insert into todo_info
values(4, 'team2', 'task3', 1, 3, '2017-09-11', '2017-09-13', 'state1', 1);
insert into todo_info
values(5, 'team2', 'task3', 1, 2, '2017-09-12', '2017-09-14', 'state1', 1);


        
select * from file_info;
select * from todo_info;
select distinct team from todo_info;
select * from project_info;
select distinct title from project_info;
select * from project_info left join todo_info on(project_info.no = todo_info.ProjectNo);
select distinct project_info.title, team from project_info left join todo_info on(project_info.no = todo_info.ProjectNo) order by title;

select 	todo_info.no, todo_info.team, todo_info.task, 
				(select name from user_info where no = todo_info.userno) as todowriter, 
				(select title from project_info where no = todo_info.projectno) as projecttitle, 
				todo_info.startdate, todo_info.enddate, todo_info.state, 
				(select fileName from File_Info where fileNo = todo_info.fileno) as fileName,
				(select fileDate from File_Info where fileNo = todo_info.fileno) as fileDate,
				(select name from user_info where no = (select fileWriter from File_Info where fileNo = todo_info.fileno)) as filewriter 
		from 	todo_info;
        
select 	todo_info.no, todo_info.team, todo_info.task, 
				(select name from user_info where no = todo_info.userno) as todowriter, 
				(select title from project_info where no = todo_info.projectno) as projecttitle, 
				todo_info.startdate, todo_info.enddate, todo_info.state, 
				(select fileName from File_Info where fileNo = todo_info.fileno) as fileName,
				(select fileDate from File_Info where fileNo = todo_info.fileno) as fileDate,
				(select name from user_info where no = (select fileWriter from File_Info where fileNo = todo_info.fileno)) as filewriter 
		from 	todo_info
        where projectno = (select no from project_info where title = 'project1');

select 	todo_info.no, todo_info.team, todo_info.task, 
				(select name from user_info where no = todo_info.userno) as todowriter, 
				(select title from project_info where no = todo_info.projectno) as projecttitle, 
				todo_info.startdate, todo_info.enddate, todo_info.state, 
				(select fileName from File_Info where fileNo = todo_info.fileno) as fileName,
				(select fileDate from File_Info where fileNo = todo_info.fileno) as fileDate,
				(select name from user_info where no = (select fileWriter from File_Info where fileNo = todo_info.fileno)) as filewriter 
		from 	todo_info
        where 	projectNo = (select no from project_info where title = 'project1') and team = 'team2';