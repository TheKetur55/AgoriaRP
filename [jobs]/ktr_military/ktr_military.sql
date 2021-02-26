USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_military', 'Militaire', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_military', 'Militaire', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_military', 'Militaire', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('military','Militaire')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('military',0,'sdt','Soldat',20,'{}','{}'),
	('military',1,'pcl','1re classe',40,'{}','{}'),
	('military',2,'cpl','Caporal',60,'{}','{}'),
	('military',3,'cch','Caporal-chef',85,'{}','{}'),
	('military',4,'ccv','Caporal-chef de 1re classe',100,'{}','{}'),
	('military',5,'sgt','Sergent',20,'{}','{}'),
	('military',6,'sch','Sergent-chef',40,'{}','{}'),
	('military',7,'adj','Adjudant',60,'{}','{}'),
	('military',8,'adc','Adjudant-chef',85,'{}','{}'),
	('military',9,'mjr','Major',100,'{}','{}'),
	('military',10,'slt','Sous-lieutenant',20,'{}','{}'),
	('military',11,'ltn','Lieutenant',40,'{}','{}'),
	('military',12,'cne','Capitaine',60,'{}','{}'),
	('military',13,'cba','Commandant',85,'{}','{}'),
	('military',14,'lcl','Lieutenant-colonel',100,'{}','{}'),
	('military',15,'col','colonel',100,'{}','{}')
;
