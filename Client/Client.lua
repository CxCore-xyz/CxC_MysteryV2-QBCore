local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('CxC_Mystery:v2b:client')
AddEventHandler('CxC_Mystery:v2b:client', function()
    local src = source
    local ped = GetPlayerPed(-1)
    TriggerEvent('CxC:Anim:Func')
    QBCore.Functions.Progressbar("open_pack", "Opening Basic Pack", Config.BasicOpenTime, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("G_M_P_A_F", src)
        end, function() -- Cancel
            QBCore.Functions.Notify('Opening was canceled!', 'error')
      end)
end)

RegisterNetEvent('CxC_Mystery:v2:client')
AddEventHandler('CxC_Mystery:v2:client', function()
    local src = source
    local ped = GetPlayerPed(-1)
    TriggerEvent('CxC:Anim:Func')
    QBCore.Functions.Progressbar("open_premium_pack", "Opening Premium Pack", Config.PremiumOpenTime, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("G_G_M_P_A_F", src)
        end, function() -- Cancel
            QBCore.Functions.Notify('Opening was canceled!', 'error')
      end)
end)