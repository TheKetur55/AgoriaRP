resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	'config.lua',
	'client.lua'
}


ui_page 'ui/index.html'
files {
  'ui/index.html',
  'ui/style.css',
  'ui/img/cube.gif',
  'ui/sound/music.ogg',
  'ui/img/back.jpg',
  'ui/script.js'	
}



server_script { 'server.lua' }
dependency 'es_extended'