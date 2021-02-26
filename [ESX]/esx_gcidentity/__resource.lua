-- resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/css/style.css',
	'html/css/identity/style.css',
	'html/css/job/style.css',
	'html/css/driverlicence/style.css',
	'html/css/weaponlicence/style.css',
	'html/script.js',
	'html/img/cards/identity/m.png',
	'html/img/cards/identity/f.png',
	'html/img/cards/job/ambulance.png',
	'html/img/cards/job/farmer.png',
	'html/img/cards/job/mecano.png',
	'html/img/cards/job/party.png',
	'html/img/cards/job/police.png',
	'html/img/cards/job/iaa.png',
	'html/img/cards/job/realestateagent.png',
	'html/img/cards/job/reporter.png',
	'html/img/cards/job/taxi.png',
	'html/img/cards/weaponlicence/armes.png',
	'html/img/cards/driverlicence/auto.png',
	'html/img/cards/driverlicence/moto.png',
	'html/img/cards/driverlicence/truck.png',
	'html/img/cursor.png'
}

client_script {
	"client.lua"
}


server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server.lua'
}

