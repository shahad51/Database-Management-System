CREATE SCHEMA courseDB;
CREATE TABLE courseDB.Instructor
    ( instructorID	INT(2) NOT NULL,
	fName		VARCHAR(20),
	lName		VARCHAR(20),
	SSN		INT(9) UNIQUE,
	deptCode	VARCHAR(5),
	position	VARCHAR(10) CHECK (position IN ('assistant', 'associate', 'full')),
	bonus		DECIMAL (7, 2),
	CONSTRAINT Instructor_PK PRIMARY KEY (instructorID)
     );
CREATE TABLE courseDB.TeachingAssistant
      ( teachingAssistantID	INT NOT NULL,
        SSN	       		INT UNIQUE,
        studentID		INT NOT NULL UNIQUE,
        salary 			DECIMAL (7, 2),
	    CONSTRAINT TeachingAssistant_PK PRIMARY KEY (teachingAssistantID)
       );

CREATE TABLE courseDB.course
    ( courseNo		VARCHAR(10) NOT NULL,
	title			VARCHAR(30) NOT NULL,
	sectionNo		INT(3) NOT NULL,
	units			INT(2),
	deptCode		VARCHAR(5), 
	instructorID		INT(2),
	teachingAssistantID	INT(2),		
	prerequisite		VARCHAR(10),
    CONSTRAINT Course_PK PRIMARY KEY (courseNo, sectionNo),
	CONSTRAINT Course_FK1 FOREIGN KEY (instructorID) REFERENCES courseDB.Instructor(instructorID) ON DELETE CASCADE, 
	CONSTRAINT Course_FK2 FOREIGN KEY (teachingAssistantID) REFERENCES courseDB.TeachingAssistant(teachingAssistantID) ON DELETE SET NULL
    );

-- Insert Statements
-- Insert into TeachingAssistant
INSERT   INTO  	courseDB.TeachingAssistant
VALUES		(37, 478902824, 379, 2500);

INSERT   INTO  	courseDB.TeachingAssistant
VALUES		(92, 352761903, 574, 5000);

-- Insert into instructor
INSERT INTO courseDB.instructor
VALUES (76, 'Andy', 'Chou', 467374211, 'math', 'assistant', 300),
	   (52,'Chris', 'Bowen',602497126, 'math', 'associate', 0),
       (44, 'Jennifer', 'Furman', 290337845, 'acct', 'assistant', 800),
       (89, 'Daniel', 'Pradmore', 589035216, 'acct', 'assistant', 300);
       
 -- Insert into course
INSERT INTO courseDB.course
VALUES ('ACCT101','Accounting I', 1,4,'acct',44, 92, 'None'),
	   ('ACCT101','Accounting I', 2,4,'acct',44, 92, 'None'),
       ('ACCT102','Accounting II', 1,3,'acct',89, 37, 'ACCT101'),
       ('MATH105','Algebra', 1,3,'math',76, null,'None');
      