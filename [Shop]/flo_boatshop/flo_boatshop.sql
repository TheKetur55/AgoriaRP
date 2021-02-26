

CREATE TABLE `vehicle_categories3` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vehicle_categories3` (name, label) VALUES
	('boats','Bateaux')
;

CREATE TABLE `vehicles3` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vehicles3` (name, model, price, category) VALUES
    ('Dinghy','dinghy',30000,'boats'),
    ('Jetmax','jetmax',25000,'boats'),
    ('Marquis','marquis',40000,'boats'),
    ('Seashark','seashark',10000,'boats'),
    ('Seashark GT','seashark3',11000,'boats'),
    ('Speeder','speeder',25000,'boats'),
    ('Squalo','squalo',30000,'boats'),
    ('Submersible','submersible',300000,'boats'),
    ('Suntrap','suntrap',30000,'boats'),
    ('Toro','toro',45000,'boats'),
    ('Tropic','tropic2',25000,'boats')
;
