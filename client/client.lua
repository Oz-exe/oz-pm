RegisterCommand('pr', function() -- /pr

    -- local reviveFee = 500

    TriggerEvent('chat:addMessage', {
        color = {107, 85, 135},
        multiline = true,
        args = {'[Oz-PM]', 'Reviving player...'}
    })

    local corpsePlayer = if(GetNearestPlayerToEntity(PlayerPedId()) != PlayerPedId()) then
        GetNearestPlayerToEntity(PlayerPedId())

    Wait(1)

    if GetEntityHealth(PlayerPedId()) <= 50 then

        SetEntityHealth(PlayerPedId(), 200)
        TriggerEvent('chat:addMessage', {
            color = {107, 85, 135},
            multiline = true,
            args = {'[Oz-PM]', 'Revived: ' .. GetPlayerName(PlayerPedId())}
        })

    else -- trigger server function to revive nearest player...

        if(NETWORK_DOES_ENTITY_EXIST_WITH_NETWORK_ID(corpsePlayer)) then
            SetEntityHealth(corpsePlayer, 200)
            TriggerEvent('chat:addMessage', {
                color = {107, 85, 135},
                multiline = true,
                args = {'[Oz-PM]', 'Revived: ' .. GetPlayerName(corpsePlayer)}
            })
        end
    
    
end)


RegisterCommand('list', function() -- /list

    TriggerEvent('chat:addMessage', {
        color = {107, 85, 135},
        multiline = true,
        args = {'[Oz-PM]', 'Active: ' .. #GetActivePlayers()}
    })

end)