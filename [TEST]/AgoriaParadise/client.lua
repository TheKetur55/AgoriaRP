local connecte = false
AddEventHandler("playerSpawned", function()
	if (connecte == false) then
		TriggerServerEvent("AgoriaParadise:playerConnected")
		connecte = true
	end
end)