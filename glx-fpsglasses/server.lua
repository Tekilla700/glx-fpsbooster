

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("fps_glasses", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent('glx-glasses:client:useGlasses', source)  
    end
end)
