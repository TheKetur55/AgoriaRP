Config = {}
--Config.Blip			= {sprite= 290, color = 30}
--Config.MecanoBlip	= {sprite= 290, color = 20}
Config.Price		= 100

Config.Garages = {
	-- VIGNE
	Garage_Centre = {	
	--	Pos = {x=215.800, y=-810.057, z=30.727},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-1886.40, y= 2021.87, z= 139.68},
			Heading = 76.95,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-1887.74, y=2014.81, z=140.12},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},


	Garage_AutoRepair = {	
	--	Pos = {x=215.800, y=-810.057, z=30.727},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-1110.31, y= -2003.53, z= 12.20},
			Heading = 199.17,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-1115.96, y=-1998.59, z=12.20},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},




	Garage_Gouv = {	
	--	Pos = {x=215.800, y=-810.057, z=30.727},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-311.90, y= -1025.52, z= 29.40},
			Heading = 55.24,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-311.18, y= -1029.99, z= 29.40},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},


-- HOPITAL
Garage_Agoria = {	
	--	Pos = {x=-1176.97, y=-1775.45, z=3.13},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-504.59, y= -259.27, z= 34.54},
			Heading = 109.23,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-515.47, y=-263.75, z=34.40},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},



	-- Auto Ecole
	Garage_Centred = {	
	--	Pos = {x = 244.25,y = -1414.32,z = 29.58},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = 244.25,y = -1414.32,z = 29.58},
			Heading = 331.34,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 239.51,y = -1412.54,z = 29.58},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	


-- Benny'S
	Garage_Paleto = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-156.41, y= -1305.64, z= 30.34},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-158.00, y=-1299.36, z=30.20},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},
	

	--Comico
Garage_comico = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-1117.13, y= -779.17, z= 17.46},
			Heading = 235.82,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-1109.90, y=-771.55, z=18.06},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},

	Garage_albonnebouf = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=1361.70, y= 1137.28, z= 112.90},
			Heading = 235.82,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=1368.90, y=1152.68, z=112.85},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},


	Garage_nightclub = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-415.04, y= 289.85, z= 82.30},
			Heading = 260.06,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-421.59, y=296.31, z=82.30},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},

	Garage_venetie = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-2146.54, y= -386.95, z= 12.20},
			Heading = 168.42,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-2153.45, y= -385.96, z= 12.20},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},


	Garage_vagos = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=334.89, y= -2040.50, z= 20.25},
			Heading = 49.32,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=337.81, y= -2036.35, z= 20.25},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},


	Garage_bloodz = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-1549.53, y= -421.41, z= 41.05},
			Heading = 323.30,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-1551.18, y=-415.70, z=41.05},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},


	Garage_unicorn = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x= -562.25, y= 300.55, z= 82.10},
			Heading = 265.41,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x= -562.28, y= 303.67, z= 82.20},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},


	--tabac
	Garage_tabac = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=2008.17, y= 3061.11, z= 46.10},
			Heading = 327.87,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=2006.74, y= 3053.65, z= 46.10},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},

	--base militaire
Garage_Palegto = {	
	--	Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.5,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-2284.66, y= 3327.397, z= 31.826},
			Heading = 235.82,
			Marker = { w= 1.5, h= 1.5,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-2281.289, y=3333.495, z=32.824},
			Marker = { w= 1.5, h= 1.5,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},

}

