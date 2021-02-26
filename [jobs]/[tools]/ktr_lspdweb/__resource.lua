resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

ui_page 'html/app.html'

files {
  'html/app.html',
  'html/app.css',
  'html/app.js',
  'html/debounce.min.js',
}

client_scripts {
  'config.lua',
  'client.lua',
}
server_script {
  '@mysql-async/lib/MySQL.lua',
  'server.lua'
}
