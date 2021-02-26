USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_event','event',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_event','event',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('event','event')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('event',0,'recrue','Recrue',12,'{}','{}'),
  ('event',1,'novice','Novice',24,'{}','{}'),
  ('event',2,'experimente','Experimente',36,'{}','{}'),
  ('event',3,'uber','Uber',48,'{}','{}'),
  ('event',4,'boss','Patron',0,'{}','{}')
;
