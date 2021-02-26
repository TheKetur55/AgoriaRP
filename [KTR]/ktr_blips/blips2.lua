
local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Casernes de pompiers
	--[[{title="Caserne de Pompiers", colour=76, id=60, x=215.786, y=-1642.49, z=29.7138},
	{title="Caserne de Pompiers", colour=1, id=60, x=1202.38, y=-1460.13, z=34.7642},
	{title="Caserne de Pompiers", colour=1, id=60, x=-1087.93, y=-2374.1, z=13.9451},
	{title="Caserne de Pompiers", colour=1, id=60, x=-379.942, y=6118.73, z=31.8456},
	{title="Caserne de Pompiers", colour=1, id=60, x=-635.992, y=-121.635, z=39.0138},
	{title="Caserne de Pompiers", colour=1, id=60, x=1697.26, y=3585.46, z=35.5443},]]--
    -- Poste de Police
	-- {title="Safe Zone", colour=1, id=161, x=425.130, y=-979.558, z=30.711},
    -- {title="Safe Zone", colour=1, id=161, x=302.9041, y=-1439.7789, z=29.7998},
    -- Magasins d'armes
    --[[{title="Magasin d'armes", colour=25, id=110, x=1701.292, y=3750.450, z=34.365},
    {title="Magasin d'armes", colour=25, id=110, x=237.428, y=-43.655, z=69.698},
    {title="Magasin d'armes", colour=25, id=110, x=843.604, y=-1017.784, z=27.546},
    {title="Magasin d'armes", colour=25, id=110, x=-321.524, y=6072.479, z=31.299},
    {title="Magasin d'armes", colour=25, id=110, x=-664.218, y=-950.097, z=21.509},
    {title="Magasin d'armes", colour=25, id=110, x=-1320.983, y=-389.260, z=36.483},
    {title="Magasin d'armes", colour=25, id=110, x=-1109.053, y=2686.300, z=18.775},
    {title="Magasin d'armes", colour=25, id=110, x=2568.379, y=309.629, z=108.461},
    {title="Magasin d'armes", colour=25, id=110, x=-3157.450, y=1079.633, z=20.692},]]--
    -- Pompe à essence voiture
    --{title="Pompe à essence", colour=6, id=361, x=49.4187,   y=2778.793,  z=58.043},
    --{title="Pompe à essence", colour=6, id=361, x=263.894,   y=2606.463,  z=44.983},
    --{title="Pompe à essence", colour=6, id=361, x=1039.958,  y=2671.134,  z=39.550},
    --{title="Pompe à essence", colour=6, id=361, x=1207.260,  y=2660.175,  z=37.899},
    --{title="Pompe à essence", colour=6, id=361, x=2539.685,  y=2594.192,  z=37.944},
    --{title="Pompe à essence", colour=6, id=361, x=2679.858,  y=3263.946,  z=55.240},
    --{title="Pompe à essence", colour=6, id=361, x=2005.055,  y=3773.887,  z=32.403},
    --{title="Pompe à essence", colour=6, id=361, x=1687.156,  y=4929.392,  z=42.078},
    --{title="Pompe à essence", colour=6, id=361, x=1701.314,  y=6416.028,  z=32.763},
    --{title="Pompe à essence", colour=6, id=361, x=179.857,   y=6602.839,  z=31.868},
    --{title="Pompe à essence", colour=6, id=361, x=-94.4619,  y=6419.594,  z=31.489},
    --{title="Pompe à essence", colour=6, id=361, x=-2554.996, y=2334.40,  z=33.078},
    --{title="Pompe à essence", colour=6, id=361, x=-1800.375, y=803.661,  z=138.651},
    --{title="Pompe à essence", colour=6, id=361, x=-1437.622, y=-276.747,  z=46.207},
    --{title="Pompe à essence", colour=6, id=361, x=-2096.243, y=-320.286,  z=13.168},
    --{title="Pompe à essence", colour=6, id=361, x=-724.619, y=-935.1631,  z=19.213},
    --{title="Pompe à essence", colour=6, id=361, x=-526.019, y=-1211.003,  z=18.184},
    --{title="Pompe à essence", colour=6, id=361, x=-70.2148, y=-1761.792,  z=29.534},
    --{title="Pompe à essence", colour=6, id=361, x=265.648,  y=-1261.309,  z=29.292},
    --{title="Pompe à essence", colour=6, id=361, x=819.653,  y=-1028.846,  z=26.403},
    --{title="Pompe à essence", colour=6, id=361, x=1208.951, y=-1402.567, z=35.224},
   --{title="Pompe à essence", colour=6, id=361, x=1181.381, y=-330.847,  z=69.316},
   --{title="Pompe à essence", colour=6, id=361, x=620.843,  y= 269.100,  z=103.089},
    --{title="Pompe à essence", colour=6, id=361, x=2581.321, y=362.039, z=108.468},
    -- Pompe à essence | Bateau
    --{title="Pompe à essence | Bateau", colour=6, id=427, x=-802.513, y=-1504.675,z=1.305},
    --{title="Pompe à essence | Bateau", colour=6, id=427, x=7.313, y=-2777.435, z=3.451},
    --{title="Pompe à essence | Bateau", colour=6, id=427, x=1326.863, y=4218.219, z=33.55},
    -- Pompe à essence | Avion
    --{title="Pompe à essence | Avion", colour=6, id=251, x=2133.268, y=4783.649, z=40.97},
    --{title="Pompe à essence | Avion", colour=6, id=251, x=1731.302, y=3310.969, z=41.224},
    --{title="Pompe à essence | Avion", colour=6, id=251, x=-1229.625, y=-2877.264, z=13.945},
    -- Pompe à essence | Hélicoptère
   -- {title="Pompe à essence | Hélicoptère", colour=6, id=43, x=1770.241, y=3239.716, z=42.127},
    --{title="Pompe à essence | Hélicoptère", colour=6, id=43, x=-1112.407, y=-2883.893, z=13.946},
     {title="~s~Auto École", colour=12, id=498, x=239.36, y=-1380.94, z=51.08},
    {title="~h~ ~u~Federal prison", colour=40, id=58, x = 1809.64, y=2603.15, z=45.59},

{title="~b~Agoria Immobilier", colour=12, id=350, x=-1908.82, y=-574.22, z=19.00},

    {title="Douane", colour=12, id=526, x=2682.81, y=4865.20, z=31.13},
    {title="Douane", colour=12, id=526, x=-2663.94, y=2671.44, z=16.69},
    {title="Douane", colour=12, id=526, x=136.13, y=3417.03, z=41.50},
    {title="Douane", colour=12, id=526, x=2431.00, y=4612.00, z=41.50},
	--{title="QG militaire", colour=52, id=565, x=-2234.29, y=3271.37, z=32.81},

--{title="~g~Vénétie Industry", colour=71, id=375, x=-2188.73, y=-421.72, z=12.50},
    

    {title="~b~Commissariat", colour=29, id=60, x=-1093.19, y=-809.50, z=20.27},


    {title="~r~AgoTuning", colour=67, id=304, x=-359.62, y=-127.66, z=38.21},
    {title="Auto Repair", colour=44, id=544, x=-1140.60, y=-1993.72, z=13.20},



{title="Vigneron", colour=19, id=85, x=-1873.63, y=2059.28, z=148.85},
{title="Tequilala", colour=70, id=93, x=-564.95, y=272.77, z=83.01},
{title="Circuit", colour=81, id=546, x=-1032.85, y=-2912.32, z=13.96},


--{title="~h~Gouvernement", colour=4, id=570, x=-303.72, y=-1014.88, z=30.38},

	{title="~b~Concessionnaire ~s~Poid Lourd", colour=74, id=67, x=-176.17, y=-1152.52, z=24.20},

	{title="~b~Concessionnaire ~s~moto", colour=74, id=522, x=265.78, y=-1155.51, z=29.28},
	{title="~b~Concessionnaire ~s~voiture", colour=74, id=595, x=-39.71, y=-1113.54, z=26.43},
	{title="~b~Concessionnaire ~s~bateaux", colour=74, id=427, x=-862.08, y=-1323.91, z=1.60},
	{title="~r~Armurier ~s~Central", colour=29, id=110, x=22.09, y=-1107.28, z=28.80},
	{title="~o~Place d\'Agoria", colour=47, id=590, x=-1159.14, y=-1730.45, z=4.00},
	--{title="~r~Evenement~r~", colour=2, id=605, x=-1168.3, y=-2413.11, z=13.94},
	
	
	{title="Champ de pomme", colour=2, id=280, x=-1829.64, y=2014.00, z=130.86},
	{title="Champ d'orange", colour=17, id=280, x=321.785, y=6531.189, z=28.13},
  --  {title="Champ d'Arachide", colour=10, id=280, x=1543.58, y=1728.96, z=109.50},
	{title="Champ de lavande", colour=27, id=280, x=1510.36, y=1797.60, z=109.00},
	
    -- Avocat
    --[[{title="Avocat", colour=4, id=498, x=-7.9498, y=1073.4370, z=327.6915},]]--
    -- Journaliste
    --[[{title="LI News", colour=56, id=184, x=-1056.5019, y=-241.7538, z=44.0210},]]--
    -- Mécano
   -- {title="Garage Mecano", colour=24, id=402, x=-373.8031, y=-119.4571, z=38.6972},
    -- Magasin
    --[[{title="Magasins", colour=11, id=52, x=373.875, y=325.896, z=102.566},
    {title="Magasins", colour=11, id=52, x=2557.458, y=382.282, z=107.622},
    {title="Magasins", colour=11, id=52, x=-3038.939, y=585.954, z=6.908},
    {title="Magasins", colour=11, id=52, x=-3241.927, y=1001.462, z=11.830},
    {title="Magasins", colour=11, id=52, x=547.431, y=2671.710, z=41.156},
    {title="Magasins", colour=11, id=52, x=1961.464, y=3740.672, z=31.343},
    {title="Magasins", colour=11, id=52, x=2678.916, y=3280.671, z=54.241},
    {title="Magasins", colour=11, id=52, x=1729.216, y=6414.131, z=34.037},
    {title="Magasins", colour=11, id=52, x=1135.808, y=-982.281, z=45.415},
    {title="Magasins", colour=11, id=52, x=-1222.915, y=-906.983, z=11.326},
    {title="Magasins", colour=11, id=52, x=-1487.553, y=-379.107, z=39.163},
    {title="Magasins", colour=11, id=52, x=-2968.243, y=390.910, z=14.043},
    {title="Magasins", colour=11, id=52, x=1166.024, y=2708.930, z=37.157},
    {title="Magasins", colour=11, id=52, x=1392.562, y=3604.684, z=33.980},
    {title="Magasins", colour=11, id=52, x=-48.519, y=-1757.514, z=28.421},
    {title="Magasins", colour=11, id=52, x=1163.373, y=-323.801, z=68.205},
    {title="Magasins", colour=11, id=52, x=-707.501, y=-914.260, z=18.215},
    {title="Magasins", colour=11, id=52, x=-1820.523, y=792.518, z=137.118},
    {title="Magasins", colour=11, id=52, x=1698.388, y=4924.404, z=41.063},]]--
    -- Bar
--{title="Unicorn", colour=8, id=121, x=127.830, y=-1284.796, z=28.280},
  -- -- {title="Tequila la", colour=25, id=93, x=-559.906, y=287.093, z=81.176},
   -- {title="Yellow Jack", colour=73, id=93, x=1986.18, y=3054.31, z=46.32},
    -- Pôle-Emploi
   -- {title="Agence d'intérim | ~r~Emplois", colour=59, id=407, x=-262.24, y=-969.54, z=30.22},
   -- {title="Pôle-Emploi | ~r~Emplois", colour=59, id=351, x=-1055.6131, y=-242.8479, z=43.0210},
    --Fourrière
  --  {title="Fourrière", colour=5, id=147, x=369.9592, y=-1607.7911, z=29.2900},
  --  {title="Fourrière", colour=5, id=147, x=-451.5817, y=6006.0131, z=31.8409},
    -- Garages
 --   {title="Garages", colour=68, id=357, x=215.124, y=-791.377, z=29.646},
  --  {title="Garages", colour=68, id=357, x=105.359, y=6613.586, z=31.3973},
    -- Prison
   -- {title="Prison Général", colour=62, id=189, x=1712.5054, y=2603.7177, z=45.5648},
    -- Banque
    --[[{title="Banque", colour=2, id=108, x=150.266, y=-1040.203, z=29.374},
    {title="Banque", colour=2, id=108, x=-1212.980, y=-330.841, z=37.787},
    {title="Banque", colour=2, id=108, x=-2962.582, y=482.627, z=15.703},
    {title="Banque", colour=2, id=108, x=-112.202, y=6469.295, z=31.626},
    {title="Banque", colour=2, id=108, x=314.187, y=-278.621, z=54.170},
    {title="Banque", colour=2, id=108, x=-351.534, y=-49.529, z=49.042},
    {title="Banque", colour=2, id=108, x=241.727, y=220.706, z=106.286},
    {title="Banque", colour=2, id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295},]]
    -- Carwash
   -- {title="Carwash", colour=0, id=100, x=26.5906, y=-1392.0261, z=27.3634},
    --{title="Carwash", colour=0, id=100, x=167.1034, y=-1719.4704, z=27.2916},
   -- {title="Carwash", colour=0, id=100, x=-74.5693, y=6427.8715, z=29.4400},
    --{title="Carwash", colour=0, id=100, x=-699.6325, y=-932.7043, z=17.0139},
    -- Brinks
  --  {title="BobCat", colour=63, id=106, x=-41.6631, y=-664.1893, z=32.4804},
    -- Déchetterie
  --  {title="Déchetterie", colour=81, id=318, x=-424.5213, y=-1710.4532, z=19.2625},
    -- Auto école
  --  {title="Auto-École", colour=69, id=56, x=239.471, y=-1380.960, z=32.741},
  --  -- Revente Véhicule
  --  {title="Casse Automobile", colour=24, id=380, x=-178.5799, y=-1376.9764, z=29.9095},
   -- {title="Casse Aéronautique", colour=24, id=380, x=-1275.0545, y=-3386.8339, z=12.9401},
    -- Benny's Original
   -- {title="Benny's Original", colour=27, id=72, x=-205.626,y=-1314.99, z=30.247},
    -- Concessionnaire
   -- {title="Concessionnaire | Automobile", colour=75, id=326, x=-56.5742, y=-1090.9211, z=26.4223},
  --  {title="Concessionnaire | Aéronautique", colour=75, id=90, x=-940.06, y=-2963.15, z=18.85},
    -- Fermier
  --  {title="Fermier", colour=56, id=86, x=2564.4794921875, y=4680.2729492188, z=33.076812744141},
    --LTD Gasoline
  --   {title="LTD Shop", colour=49, id=52, x = -47.3110542297363, y = -1758.62475585938, z = 29.4209995269775},
  --   {title="LTD Shop", colour=49, id=52, x = 1164.8337, y = -323.6544, z = 69.2050},
  --   {title="LTD Shop", colour=49, id=52, x = -706.0908, y = -914.6056, z = 19.2155, a = 70.91468},
  --   {title="LTD Shop", colour=49, id=52, x = -1819.5460, y = 793.5396, z = 138.0865, a = 131.30442},
  --   {title="LTD Shop", colour=49, id=52, x = 1697.2774, y = 4923.4960, z = 42.0636, a = 313.6508789},
     --Twenty Four Seven
  --   {title="24/7 SuperMarket", colour=2, id=52, x = 24.392505645752, y = -1345.41369628906, z = 29.4970207214355},
  --   {title="24/7 SuperMarket", colour=2, id=52,x = 372.9973, y = 328.0470, z = 103.5663, a = 247.77499},
  --   {title="24/7 SuperMarket", colour=2, id=52,x = 2555.5698, y = 380.8841, z = 108.6229, a = 2.7695364},
  --   {title="24/7 SuperMarket", colour=2, id=52,x = -3040.5358, y = 584.0538, z = 7.9089, a = 15.20044},
  --   {title="24/7 SuperMarket", colour=2, id=52,x = -3243.9121, y = 1000.0833, z = 12.8307, a = 358.99728},
   --  {title="24/7 SuperMarket", colour=2, id=52,x = 549.2512, y = 2669.7011, z = 42.1564, a = 99.7776641}, 
   --  {title="24/7 SuperMarket", colour=2, id=52,x = 1959.2835, y = 3741.4711, z = 32.3437, a = 305.00201},
  ---   {title="24/7 SuperMarket", colour=2, id=52,x = 2676.5444, y = 3280.2155, z = 55.2411, a = 331.64767},
  --   {title="24/7 SuperMarket", colour=2, id=52,x = 1728.6229, y = 6416.6918, z = 35.0372, a = 232.35256},
     --Robs Liquor
   --  {title="Robs Liquor", colour=5, id=52,x = 1134.3242, y = -983.0690, z = 46.4158 ,a =275.8009},
  --   {title="Robs Liquor", colour=5, id=52,x = -1221.5172, y = -908.0098, z = 12.3263, a = 25.7894},
  --   {title="Robs Liquor", colour=5, id=52,x = -1486.8096, y = -377.4985, z = 40.1634, a = 126.951},
  --   {title="Robs Liquor", colour=5, id=52,x = -2966.2502, y = 391.5374, z = 15.0433, a = 75.62678},
  --   {title="Robs Liquor", colour=5, id=52,x = 1165.1733, y = 2710.7856, z = 38.1577, a = 184.67919},
 --    {title="Robs Liquor", colour=5, id=52,x = 1391.7576, y = 3606.0419, z = 34.9809, a = 196.12565},
     -- Agent imo
 --    {title="Agence Immobilier", colour=54, id=269,x = -116.77, y = -603.07, z = 35.28},
     -- UPK
  --   {title="UPK Transport", colour=47, id=492,x = 901.16, y = -1241.60, z = 25.48},

  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.4)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
