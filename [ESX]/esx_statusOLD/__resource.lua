resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Status'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/classes/status.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/app.css',
	'html/scripts/app.js',
	'html/hunger.png',
    'html/thirst.png',
	'html/drug.png',
	'html/bodybuilding.png',
	'html/pee.png',
	'html/poo.png',
	'html/sick.png',
	'html/endu.png'
}