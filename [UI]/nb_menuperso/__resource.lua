resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description "Menu Perso"

version '2.0.0'

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- nb_menuperso
---------------------------------------------------------------------------------------------------------------------------------------------------------
client_script 'config.lua'
--client_script 'actionktr.lua'
client_script 'keycontrol.lua'
client_script 'client.lua'
client_script 'handsup.lua'
client_script 'pointing.lua'
client_script 'crouch.lua'
-- client_script 'limiteur.lua'

server_script 'server.lua'

server_script '@mysql-async/lib/MySQL.lua'