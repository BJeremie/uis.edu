

--LAB1A

--- users table

CREATE TABLE users(

user_id INTEGER PRIMARY KEY,
first_name text,
last_name text,
eamil varchar(255) NOT NULL,
password  varchar(255) NOT NULL,
created_at TIMESTAMP,
updated_at TIMESTAMP

);

--- status 
CREATE TABLE status(

	status_id SERIAL PRIMARY KEY,
	description text NOT NULL,
	created_at TIMESTAMP, 
	updated_at TIMESTAMP
);

--- inventory table 

CREATE TABLE inventory(

	inventory_id SERIAL PRIMARY KEY, 
	status_id  INTEGER REFERENCES status(status_id),
	description text NOT NULL,
	created_at TIMESTAMP,
	updated_at TIMESTAMP
); 

--- transaction table 

CREATE TABLE transactions(

	transactions_id SERIAL PRIMARY KEY,
	user_id INTEGER REFERENCES users, 
	inventory_id SERIAL REFERENCES inventory,
	checkout_time TIMESTAMP NOT NULL,
	schedule_checkin_time TIMESTAMP, 
	actual_checkin_time TIMESTAMP,
	created_at TIMESTAMP,
	updated_at TIMESTAMP
);

-- Insert 5 users into the users table 

INSERT INTO users (user_id, first_name, last_name, eamil, password, created_at, updated_at) 

VALUES (2,'Jerry','Josh','jerryjosh@aol.com','pa$$w0rd','2019-09-15 16:30','2019-07-15 18:30'),
(4,'Jonas','Tomas','jonastoma@aol.com','pa$$w0rd','2019-09-15 14:30','2019-07-15 10:30'),
(5,'Jean','Boss','jeanboss@aol.com','pa$$w0rd','2019-09-15 13:30','2019-07-15 21:30'),
(1,'John','Diaz','johndiaz@aol.com','pard','2019-06-15 17:30','2019-06-15 17:30'),
(3,'Jessica','Cruz','jessicacruz@aol.com','pa$$w0rd','2019-09-15 15:30','2019-07-15 19:30');


--- Question 6 insert 5 record into the status table 

INSERT INTO status(description, created_at, updated_at)
VALUES ('Available','2019-02-15 17:30',current_timestamp),
('Checked Out','2019-09-15 17:30',current_timestamp),
('Overdue','2019-09-15 17:30',current_timestamp),
('Unavailable','2019-09-17 17:30',current_timestamp),
('Under Repair','2019-09-19 17:30',current_timestamp);


---- Question 7 

INSERT INTO inventory(description, created_at, updated_at)
VALUES ('Laptop1','2019-02-15 17:30', current_timestamp),
('Laptop2','2019-09-15 17:30',current_timestamp),
('Webcam1','2019-09-15 17:30',current_timestamp),
('TV1','2019-09-17 17:30',current_timestamp),
('Microphone1','2019-09-19 17:30',current_timestamp);



---- Question 8 INSERT INTO 3 record to Transaction 

INSERT INTO transactions(user_id,inventory_id,checkout_time,schedule_checkin_time, actual_checkin_time,created_at, updated_at)

VALUES (2,3,'2019-02-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:33','2019-02-15 12:34'),
(5,4,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(4,5,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4');


--- 9 Alter users table 
ALTER TABLE users
  ADD COLUMN "signed_agreement" BOOLEAN NOT NULL DEFAULT FALSE;


--- 10 Query  


SELECT * FROM transactions ORDER BY  schedule_checkin_time DESC; 



--- 11 Write a query that returns a list of all equipement due 

SELECT * FROM inventory WHERE created_at='2019-02-15 12:33'; 


--- 12 


SELECT * FROM transactions WHERE user_id=2;



---  Question 2 

--- a --- 

SELECT * FROM inventory
    WHERE description IS NOT NULL; 
    

--- b ---

SELECT `users`.`first_name`,`transactions`.`checkout_time`,inventory.description,status.description FROM `transactions`  INNER JOIN users ON users.user_id = transactions.user_id INNER JOIN inventory ON inventory.inventory_id = transactions.inventory_id INNER JOIN inventory_id ON inventory.status_id = status.status_id WHERE transactions.checkout_time ='2018-09-3'




--- C ---

INSERT INTO inventory(description, created_at, updated_at)
VALUES ('Server HP','2018-02-15 17:30', current_timestamp); 


--- D --- 

SELECT *
    FROM inventory WHERE description = 'Server HP'



--LAB1B



INSERT INTO transactions(user_id,inventory_id,checkout_time,schedule_checkin_time, actual_checkin_time,created_at, updated_at)

VALUES (6,7,'2019-02-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:33','2019-02-15 12:34'),
(7,8,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(8,9,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4'),
(9,10,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(10,11,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4'),
(11,12,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(12,13,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4'),
(13,14,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(14,15,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4'),
(15,16,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(16,17,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4'),
(17,18,'2019-05-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),

---- a transaction where the scheduled_checkin_time is 2018-08-01 14:39:53 and the actual_checkin_time is 2018-08-02 14:39:53. Additionally, 

(18,19,'2018-08-01 14:39:53',current_timestamp,'2019-06-9','2019-02-15 12:3','2018-08-02 14:39:53'),
(19,20,'2018-08-01 14:39:53',current_timestamp,'2019-06-9','2019-02-15 12:3','2018-08-02 14:39:53'),
(20,21,'2018-08-01 14:39:53',current_timestamp,'2019-06-9','2019-02-15 12:3','2018-08-02 14:39:53'),

--- Five of the transactions need to have a checkout_time after September 3 2018.

(21,22,'2018-09-01 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(22,23,'2018-09-02 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4'),
(23,24,'2018-08-01 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3'),
(24,25,'2018-08-05 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:4'),
(25,26,'2018-08-15 12:30',current_timestamp,'2019-06-9','2019-02-15 12:3','2019-02-15 12:3');














