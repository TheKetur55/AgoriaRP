Config                            = {}

Config.DrawDistance               = 10.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableJobLogs              = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'
Config.eventStations = {

	LSPD = {

--[[
		Vehicles = {
			{
				Spawner = vector3(-2156.61, -420.53, 130.50),
				InsideShop = vector3(-2161.78, -413.84, 12.90),
				SpawnPoints = {
					{ coords = vector3(-2161.78, -413.84, 12.90), heading = 27.89, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1544.24, 85.46, 61.30),
				InsideShop = vector3(-1539.63, 77.32, 61.20),
				SpawnPoints = {
					{ coords = vector3(-1539.63, 77.32, 61.20), heading = 243.95, radius = 10.0 }
				}
			}
		},

]]
		

		BossActions = {
			vector3(-1133.29, -1732.15, 4.47)
		}

	}

}



Config.AuthorizedVehicles = {
Shared = {
		{ model = 'avarus', label = 'Avarus', price = 1 },
		{ model = 'akuma', label = 'Akuma', price = 1 },
		{ model = 'bati', label = 'bati', price = 1 },
		{ model = 'chimera', label = 'chimera', price = 1 },
		{ model = 'double', label = 'double', price = 1 },
		{ model = 'diablous2', label = 'diablous2', price = 1 },
		{ model = 'fcr', label = 'fcr', price = 1 },
		{ model = 'fcr2', label = 'fcr2', price = 1 },
		{ model = 'gargoyle', label = 'gargoyle', price = 1 },
		{ model = 'hakuchou2', label = 'hakuchou2', price = 1 },
		{ model = 'nightblade', label = 'nightblade', price = 1 },
		{ model = 'pcj', label = 'pcj', price = 1 },
		{ model = 'sanctus', label = 'sanctus', price = 1 },
		{ model = 'shotaro', label = 'shotaro', price = 1 },
		{ model = 'vortex', label = 'vortex', price = 1 },
		{ model = 'zombiea', label = 'zombiea', price = 1 },
		
		{ model = 'dominator3', label = 'dominator3', price = 1 },
		{ model = 'dominator', label = 'dominator', price = 1 },
		{ model = 'hotknife', label = 'hotknife', price = 1 },
		{ model = 'nightshade', label = 'nightshade', price = 1 },
		{ model = 'slamvan3', label = 'slamvan3', price = 1 },
		{ model = 'tampa', label = 'tampa', price = 1 },
		{ model = 'virgo3', label = 'virgo3', price = 1 },
		
		{ model = 'bifta', label = 'bifta', price = 1 },
		{ model = 'blazer3', label = 'blazer3', price = 1 },
		{ model = 'brawler', label = 'brawler', price = 1 },
		{ model = 'dubsta3', label = 'dubsta3', price = 1 },
		{ model = 'dune', label = 'dune', price = 1 },
		{ model = 'marshall', label = 'marshall', price = 1 },
		{ model = 'monster', label = 'monster', price = 1 },
		{ model = 'rcbandito', label = 'rcbandito', price = 1 },
		{ model = 'trophytruck', label = 'trophytruck', price = 1 },
		
		{ model = 'baller3', label = 'baller3', price = 1 },
		{ model = 'dubsta2', label = 'dubsta2', price = 1 },
		{ model = 'granger', label = 'granger', price = 1 },
		{ model = 'patriot2', label = 'patriot2', price = 1 },
		{ model = 'patriot', label = 'patriot', price = 1 },
		{ model = 'toros', label = 'toros', price = 1 },
		{ model = 'xls2', label = 'xls2', price = 1 },
		
		{ model = 'stretch', label = 'stretch', price = 1 },
		{ model = 'stafford', label = 'stafford', price = 1 },
		
		{ model = 'banshee', label = 'banshee', price = 1 },
		{ model = 'bestiagts', label = 'bestiagts', price = 1 },
		{ model = 'buffalo2', label = 'buffalo tuning', price = 1 },
		{ model = 'carbonizzare', label = 'carbonizzare', price = 1 },
		{ model = 'comet2', label = 'comet2', price = 1 },
		{ model = 'comet3', label = 'comet tuning', price = 1 },
		{ model = 'comet4', label = 'comet tout terrain', price = 1 },
		{ model = 'coquette', label = 'coquette', price = 1 },
		{ model = 'deveste', label = 'deveste', price = 1 },
		{ model = 'elegy', label = 'elegy tuning', price = 1 },
		{ model = 'elegy2', label = 'elegy2', price = 1 },
		{ model = 'furoregt', label = 'furoregt', price = 1 },
		{ model = 'feltzer2', label = 'feltzer2', price = 1 },
		{ model = 'hotring', label = 'hotring course', price = 1 },
		{ model = 'infernus2', label = 'infernus2', price = 1 },
		{ model = 'italigto', label = 'italigto', price = 1 },
		{ model = 'jester', label = 'jester', price = 1 },
		{ model = 'khamelion', label = 'khamelion', price = 1 },
		{ model = 'kuruma', label = 'kuruma', price = 1 },
		{ model = 'massacro', label = 'massacro', price = 1 },
		{ model = 'neon', label = 'neon', price = 1 },
		{ model = 'omnis', label = 'omnis voiture de rally', price = 1 },
		{ model = 'pariah', label = 'pariah', price = 1 },
		{ model = 'raptor', label = 'raptor', price = 1 },
		{ model = 'ruston', label = 'ruston', price = 1 },
		{ model = 'schafter3', label = 'schafter', price = 1 },
		{ model = 'schlagen', label = 'schlagen', price = 1 },
		{ model = 'sentinel3', label = 'sentinel3', price = 1 },
		{ model = 'seven70', label = 'seven70', price = 1 },
		{ model = 'specter2', label = 'specter2', price = 1 },
		{ model = 'streiter', label = 'streiter', price = 1 },
		{ model = 'sultan', label = 'sultan', price = 1 },
		{ model = 'tampa2', label = 'tampa2', price = 1 },
		{ model = 'tropos', label = 'tropos', price = 1 },
		{ model = 'verlierer2', label = 'verlierer2', price = 1 },
		
		{ model = 'btype', label = 'btype', price = 1 },
		{ model = 'btype2', label = 'btype2', price = 1 },
		{ model = 'casco', label = 'casco', price = 1 },
		{ model = 'cheetah2', label = 'cheetah2', price = 1 },
		{ model = 'coquette2', label = 'coquette2', price = 1 },
		{ model = 'gt500', label = 'gt500', price = 1 },
		{ model = 'jb700', label = 'jb700', price = 1 },
		{ model = 'stingergt', label = 'stingergt', price = 1 },
		{ model = 'torero', label = 'torero', price = 1 },
		{ model = 'turismo2', label = 'turismo2', price = 1 },
		{ model = 'viseris', label = 'viseris', price = 1 },
		{ model = 'ztype', label = 'ztype', price = 1 },
		
		{ model = 'autarch', label = 'autarch', price = 1 },
		{ model = 'banshee2', label = 'banshee2', price = 1 },
		{ model = 'cheetah', label = 'cheetah', price = 1 },
		{ model = 'cyclone', label = 'cyclone', price = 1 },
		{ model = 'bullet', label = 'bullet', price = 1 },
		{ model = 'adder', label = 'adder', price = 1 },
		{ model = 'entityxf', label = 'entityxf', price = 1 },
		{ model = 'gp1', label = 'gp1', price = 1 },
		{ model = 'italigtb', label = 'italigtb', price = 1 },
		{ model = 'italigtb2', label = 'italigtb2', price = 1 },
		{ model = 'le7b', label = 'le7b', price = 1 },
		{ model = 'nero', label = 'nero', price = 1 },
		{ model = 'nero2', label = 'nero2', price = 1 },
		{ model = 'prototipo', label = 'prototipo', price = 1 },
		{ model = 'reaper', label = 'reaper', price = 1 },
		{ model = 'sc1', label = 'sc1', price = 1 },
		{ model = 'scramjet', label = 'scramjet', price = 1 },
		{ model = 'sheava', label = 'sheava', price = 1 },
		{ model = 'sultanrs', label = 'sultanrs', price = 1 },
		{ model = 't20', label = 't20', price = 1 },
		{ model = 'tempesta', label = 'tempesta', price = 1 },
		{ model = 'turismor', label = 'turismor', price = 1 },
		{ model = 'tyrus', label = 'tyrus', price = 1 },
		{ model = 'vagner', label = 'vagner', price = 1 },
		{ model = 'visione', label = 'visione', price = 1 },
		{ model = 'xa21', label = 'xa21', price = 1 },
		{ model = 'zentorno', label = 'zentorno', price = 1 },
		
		{ model = 'youga', label = 'youga', price = 1 },
		{ model = 'bobcatxl', label = 'bobcatxl', price = 1 },
		
		{ model = '718caymans', label = '718caymans', price = 1 },
		{ model = 'audirs6tk', label = 'Audi rs6', price = 1 },
		{ model = 'benzsl63', label = 'Mercedes sl amg', price = 1 },
		{ model = 'e63amg', label = 'Classe e amg 63', price = 1 },
		{ model = 'eleanor', label = 'Mustang shelby GT500', price = 1 },
		{ model = 'evo9mr', label = 'Mistubushi evo 9', price = 1 },
		{ model = 'f82', label = 'Bmw m4', price = 1 },
		{ model = 'golfgti', label = 'Golf 5 gti', price = 1 },
		{ model = 'gtr', label = 'Nissan gtr 35', price = 1 },
		{ model = 'm3e46', label = 'Bmw m3 e 46', price = 1 },
		{ model = 'meganers', label = 'Renault megane 3 rs', price = 1 },
		{ model = 'mgt', label = 'Mustang GT', price = 1 },
		{ model = 'p1', label = 'Mclaren P1', price = 1 },
		{ model = 'polo2018', label = 'Polo 2018', price = 1 },
		{ model = 'r8ppi', label = 'Audi R8', price = 1 },
		{ model = 'r8prior', label = 'Audi R8 Sport', price = 1 },
		{ model = 'rmodamgc63', label = 'Mercedes C63 Amg', price = 1 },
		{ model = 'rmodm4gts', label = 'Bmw m3 Gts', price = 1 },
		{ model = 'rs318', label = 'Audi Rs3', price = 1 },
		{ model = 'rs5', label = 'Audi Rs5', price = 1 },
		{ model = 'rt70', label = 'Dodge charger rt70', price = 1 },
		{ model = 'skyline', label = 'Nissan skyline R34', price = 1 },
		{ model = 'viper', label = 'Dodge viper', price = 1 },
		{ model = 'zl12017', label = 'Camaro zl1', price = 1 },
		{ model = 'kart3', label = 'Karting', price = 1 },
		{ model = 'rx7veilside', label = 'Mazda rx7 Drift', price = 1 },
		{ model = 'spr', label = 'toyota supra drag', price = 1 },
		{ model = '690r', label = 'Ktm 690 R', price = 1 },
		{ model = 'z1000', label = 'Kawasaki z1000', price = 1 },
		{ model = 'r6', label = 'Yamaha R6', price = 1 }
	
	},

	recrue = {
		
	},
	
	chef = {
	
	},
	boss = {

	}


	
}

Config.AuthorizedHelicopters = {


	recrue = {
		{ model = 'frogger', label = 'Frogger', livery = 0, price = 1 }
	},

	chef = {
		{ model = 'frogger', label = 'Frogger', livery = 0, price = 1 }
	},

	boss = {
		{ model = 'frogger', label = 'Frogger', livery = 0, price = 1 },
		{ model = 'buzzard', label = 'Buzzard', livery = 0, price = 1 },
		{ model = 'volatus', label = 'volatus', livery = 0, price = 1 },
		{ model = 'swift', label = 'swift', livery = 0, price = 1 },
		{ model = 'seasparrow', label = 'seasparrow', livery = 0, price = 1 },





	}
}



