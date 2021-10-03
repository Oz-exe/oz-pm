QBCore.Commands.Add("pr", "Revive/Heal Nearest Wounded Player", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        local playerHealth = GetEntityHealth(source)
        local corpsePed = GetPedInFront()
        local corpseHP = GetEntityHealth(player)

        if corpseHP < playerHealth then
            SetEntityHealth(player, 200)
            TriggerClientEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"[Oz-PM]", "Revived Player:" .. player}
              })
        else
            SetEntityHealth(source, 200)
            TriggerClientEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"[Oz-PM]", "Revived Player:" .. source}
              })
        end
    end
end)

QBCore.Commands.Add("list", "# of Active Players", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        TriggerClientEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[Oz-PM]", "Active Players:" .. #GetActivePlayers()}
          })
    end
end)

function GetPedInFront()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end