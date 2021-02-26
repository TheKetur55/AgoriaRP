resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Intro system when you spawn'

ui_page 'ui/index.html'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server/data.lua',
    'server/https.lua'
}

files {
    'ui/index.html',
    'ui/style.css',
    'ui/manage.js',
    'ui/assets/logo.png',
    'ui/assets/music.mp3'
}