Config							= {}
Config.Locale					= 'fr'
Config.green					= 56108
Config.grey						= 8421504
Config.red						= 16711680
Config.orange					= 16744192
Config.blue						= 2061822
Config.purple					= 6965387
Config.pink						= 11750815
Config.yellow					= 16449301
Config.white					= 16777215
Config.black					= 0
Config.bluetweet				= 4436965

Config.webhook					= "https://discordapp.com/api/webhooks/585370085644959745/ip8C8x_De5l6exRvcM-gC67OVTk1ZaGwXg8IXmiHf5qDO2cbMU8653AeRga4xi1tNubL"

Config.webhookkill					= "https://discordapp.com/api/webhooks/605135060043169896/wdXB3i92KJp4S83X9aTDf4EhjYt94YlN4zQqTxQTD4QfQzRjYHtyvy-7SUaVAYXKNm8Y"
--Config.webhookkill2					= "https://discordapp.com/api/webhooks/605135060043169896/wdXB3i92KJp4S83X9aTDf4EhjYt94YlN4zQqTxQTD4QfQzRjYHtyvy-7SUaVAYXKNm8Y"

Config.webhookblacklisted					= "https://discordapp.com/api/webhooks/585372288283574272/CEzXO-NtTMudTNDehDinsE1MK6iv82ub6lHFh4N9sB3w8tSXW9p8z4lwChaD_9wprtKh"

Config.webhooweapon				= "https://discordapp.com/api/webhooks/585372288283574272/CEzXO-NtTMudTNDehDinsE1MK6iv82ub6lHFh4N9sB3w8tSXW9p8z4lwChaD_9wprtKh"

Config.webhookCharCreation		= "https://discordapp.com/api/webhooks/585371832408866840/Eqryh4JxvKC92HgzY9542_30BJ5CCpmpiOuZJGiV_GGh2xTkLaQkDZX-DhhdYbRkbNDK"

Config.webhookchat		= "https://discordapp.com/api/webhooks/585385759683379220/Gpdw7cg0AJ0n9fMS7ulWbmramdBi2cSw7oytoX0r5_itoFlRbKvxsesjtEZmCs-LkMt2"

Config.webhookvolvehicule		= "https://discordapp.com/api/webhooks/585509986168340480/K2rRUkcy1qo4d862CImL9OShM3DKBKhL9TycMRjvQJtSICkokUJmMKvmW1FI3EV5xcNv"


Config.webhookWrongPassword		= "https://discordapp.com/api/webhooks/583646021553487912/6jXEKqHoU3oetUQOF_CkvvPokBSxuVT4RJSdy22mVh6rhwQrv64DBGZvVOPKKtCDuQ-s"

Config.LoggetItemStandart		= "https://discordapp.com/api/webhooks/583646021553487912/6jXEKqHoU3oetUQOF_CkvvPokBSxuVT4RJSdy22mVh6rhwQrv64DBGZvVOPKKtCDuQ-s"

Config.webhookmoney				= "https://discordapp.com/api/webhooks/583646021553487912/6jXEKqHoU3oetUQOF_CkvvPokBSxuVT4RJSdy22mVh6rhwQrv64DBGZvVOPKKtCDuQ-s"

Config.webhookconnection		= "https://discordapp.com/api/webhooks/583646021553487912/6jXEKqHoU3oetUQOF_CkvvPokBSxuVT4RJSdy22mVh6rhwQrv64DBGZvVOPKKtCDuQ-s"



Config.webhooksocieteretrait    = "https://discordapp.com/api/webhooks/583646021553487912/6jXEKqHoU3oetUQOF_CkvvPokBSxuVT4RJSdy22mVh6rhwQrv64DBGZvVOPKKtCDuQ-s"


settings = {
	LogKills = true, -- Log when a player kill an other player.
	LogEnterPoliceVehicle = true, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = true, -- Log when a player enter in a blacklisted vehicle.
	LogPedJacking = true, -- Log when a player is jacking a car
	LogChatServer = true, -- Log when a player is talking in the chat , /command works too.
	LogLoginServer = true, -- Log when a player is connecting/disconnecting to the server.
	LogItemTransfer = true, -- Log when a player is giving an item.
	LogWeaponTransfer = true, -- Log when a player is giving a weapon.
	LogMoneyTransfer = true, -- Log when a player is giving money
	LogMoneyBankTransfert = true, -- Log when a player is giving money from bankaccount
	LogBanhammer = true, -- Log when a player is banned.
	LogCharCreation = true, -- Log when a player is register
	LogSocietyWrongPassword = true, -- Alert when a wrong password is entered for the withdrawal of company money
	LoggetItemStandart = true -- Alert when a person retrieves an item from their home safe

}

Components = {
	Teleport = false,
	GodMode = false,
	Speedhack = false,
	WeaponBlacklist = false,
}



blacklistedModels = {
	"SAVAGE",
	"AKULA",
	"ANNIHILATOR",
	"CARGOBOB",
	"FROGGER",
	"FROGGER2",
	"HAVOK",
	"HUNTER",
	"MAVERICK",
	"SKYLIFT",
	"SWIFT",
	"SWIFT2",
	"VALKYRIE",
	"VALKYRIE2",
	"VOLATUS",
	"RHINO",
	"OPPRESSOR",
	"OPPRESSOR2",
	"VINDICATOR",
	"BLIMP",
	"BLIMP2",
	"BLIMP3",
	"LUXOR",
	"LUXOR2",
	"HYDRA",
	"JET",
	

}

BlacklistedWeapons = { -- weapons that will get people banned
	"WEAPON_GARBAGEBAG",
	"WEAPON_RAILGUN",
}