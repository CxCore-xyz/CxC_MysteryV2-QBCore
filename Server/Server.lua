local QBCore = exports['qb-core']:GetCoreObject()

function Random_I_Fuc()
    return Config.Basic[math.random(#Config.Basic)]
end

function Random_GI_Fuc()
    return Config.Premium[math.random(#Config.Premium)]
end

RegisterNetEvent("G_M_P_A_F")
AddEventHandler("G_M_P_A_F", function(src)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BscPack = Config.BasicAmount
    TriggerClientEvent('QBCore:Notify', source, 'You opened an basic pack!', "primary")  
    Citizen.Wait(2500)
    Player.Functions.AddItem(Random_I_Fuc(), BscPack)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Just opened an mystery pack! Player-ID: ^5"..src) end
    TriggerClientEvent('QBCore:Notify', src, 'Reward was added to your backpack!', "success")
end)

RegisterNetEvent("G_G_M_P_A_F")
AddEventHandler("G_G_M_P_A_F", function(src)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PrmPack = Config.PremiumAmount
    TriggerClientEvent('QBCore:Notify', source, 'You opened premium pack!', "primary") 
    Citizen.Wait(2500)
    Player.Functions.AddItem(Random_GI_Fuc(), PrmPack)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Just opened an premium mystery pack! Player-ID: ^5"..src) end
    TriggerClientEvent('QBCore:Notify', src, 'Reward was added to your backpack!', "success")
end)

QBCore.Functions.CreateUseableItem(Config.BasicItem, function(source, item)
	local src = source
        local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(Config.BasicItem, Config.BasicRemoveAmount) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BasicItem], "remove")
        TriggerClientEvent('CxC_Mystery:v2b:client', src)
        if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Removed basic pack! Player-ID: ^5"..src) end
    end
end)

QBCore.Functions.CreateUseableItem(Config.PremiumItem, function(source, item)
	local src = source
        local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(Config.PremiumItem, Config.PremiumRemoveAmount) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PremiumItem], "remove")
        TriggerClientEvent('CxC_Mystery:v2:client', src)
        if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Removed premium pack! Player-ID: ^5"..src) end
    end
end)