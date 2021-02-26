Config              = {}
Config.MarkerType   = -1
Config.DrawDistance = 2.0
Config.ZoneSize     = {x = 3.0, y = 3.0, z = 1.5}
Config.MarkerColor  = {r = 100, g = 204, b = 100}

Config.RequiredCopsCoke  = 1
Config.RequiredCopsMeth  = 1
Config.RequiredCopsWeed  = 1
Config.RequiredCopsOpium = 1

Config.RequiredCopsCoco = 1
Config.RequiredCopsVirus = 1
Config.RequiredCopsDatura = 1

Config.TimeToFarm    = 4 * 1000
Config.TimeToProcess = 7 * 1000
Config.TimeToSell    = 4  * 1000

Config.Locale = 'fr'

Config.Zones = {


	-- Virus
	CocoField =			{x = 1558.42,	y = -2118.88,	z = 76.37,	name = _U('coke_field'),		sprite = 501,	color = 40}, -- 
	CocoField2 =		{x = 72.40,	y = -790.75,	z = 17.84,	name = _U('coke_field'),		sprite = 501,	color = 40}, -- 
	CocoProcessing =	{x = 49.70,	y = -778.95,	z = 17.78,	name = _U('coke_processing'),	sprite = 478,	color = 40}, --
	CocoDealer =		{x = -2229.92,	y = 3481.48,	z = 29.16,	name = _U('coke_dealer'),		sprite = 500,	color = 75}, --

	--Datura
	CokeField =			{x = -119.04,	y = 1430.75,	z = 293.27,	name = _U('coke_field'),		sprite = 501,	color = 40}, -- 
	CokeProcessing =	{x =  -152.67,	y = 6140.52,	z = 31.33,	name = _U('coke_processing'),	sprite = 478,	color = 40}, --
	CokeDealer =		{x = -1701.86,	y = -1128.95 ,	z =12.15,	name = _U('coke_dealer'),		sprite = 500,	color = 75} --
	


}
