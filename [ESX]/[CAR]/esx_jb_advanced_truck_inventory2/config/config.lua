--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 0

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true 

-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 2,
	water = 1,
	blowtorch = 10,
	biere = 1,
	bandage = 1,
	burritos = 1,
	c4_bank = 50,
	champagne = 1,
	cigarett = 1,
	clip = 1,
	cocacola = 1,
	coco_huile = 2,
	coco_noix = 2,
	cognac = 1,
	coke = 1,
	coke_pooch = 2,
	colis = 1,
	contract = 1,
	corium = 1,
	datura = 1,
	desperados = 1,
	fichepaye1 = 1,
	fixkit = 10,
	flashlight = 5,
	fleur_mauve = 1,
	grand_cru = 1,
	grip = 1,
	hamburger = 2,
	hammerwirecutter = 5,
	handcuffs = 3,
	headbag = 2,
	huile_de_coco = 1,
	jackdaniel = 1,
	jager = 1,
	jammer = 40,
	jumelles = 1,
	jus_raisin = 1,
	kebab = 1,
	lavande = 1,
	lighter = 1,
	medikit = 1,
	meth = 1,
	meth_pooch = 1,
	milk = 1,
	monster = 1,
	oasis = 1,
	opium = 1,
	opium_pooch = 1,
	paquetcigarett = 1,
	phone = 10,
	pizza = 3,
	pomme = 1,
	poudre_sol = 1,
	powerade = 1,
	raisin = 1,
	rasperry = 12,
	redbull = 1,
	sandwich = 1,
	saucisson = 1,
	silencieux = 10,
	tacos = 1,
	unlockingtool = 1,
	viande = 5,
	vine = 1,
	vineblanc = 1,
	virus_tchernobyl = 1,
	weed = 1,
	weed_pooch = 1,
	yusuf = 3,





	
	--WEAPON_COMBATPISTOL = 1000, -- poid poir une munnition
	black_money = 0, -- poids pour un argent
}

Config.VehicleLimit = {
    [0] = 200, --Compact
    [1] = 250, --Sedan
    [2] = 500, --SUV
    [3] = 250, --Coupes
    [4] = 225, --Muscle
    [5] = 200, --Sports Classics
    [6] = 230, --Sports
    [7] = 150, --Super
    [8] = 25, --Motorcycles
    [9] = 250, --Off-road
    [10] = 650, --Industrial
    [11] = 250, --Utility
    [12] = 700, --Vans
    [13] = 5, --Cycles
    [14] = 1000, --Boats
    [15] = 5000, --Helicopters
    [16] = 10000, --Planes
    [17] = 260, --Service
    [18] = 250, --Emergency
    [19] = 500, --Military
    [20] = 1000, --Commercial
    [21] = 0, --Trains
}