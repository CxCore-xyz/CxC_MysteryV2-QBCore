RegisterNetEvent("meth:processing", function()
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)



			if not isProcessing then
				local hasBag = false
				local s1 = false
				local hasMeth = false
				local s2 = false

				QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasMeth = result
					s1 = true
				end, 'meth')

				while(not s1) do
					Wait(100)
				end
				Wait(100)
				QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasBag = result
					s2 = true
				end, 'empty_weed_bag')

				while(not s2) do
					Wait(100)
				end

				if (hasMeth and hasBag) then
					ProcessMeth()
				elseif (hasMeth) then
					QBCore.Functions.Notify('Jūs neturite x1 tuščiu maišelių.', 'error')
				elseif (hasBag) then
					QBCore.Functions.Notify('Jūs neturite x1 metamfetamino.', 'error')
				else
					QBCore.Functions.Notify('Jūs neturite x1 metamfetamino ir x1 tuščiu maišelių.', 'error')
				end
		Wait(500)
    end
end)

function ProcessMeth()
	isProcessing = true
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	--SetEntityHeading(PlayerPedId(), 108.06254)

	QBCore.Functions.Progressbar("search_register", "Perdirbamos Kanapės", 30000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableInventory = true,
	}, {}, {}, {}, function()
	 TriggerServerEvent('qb-meth:processmeth')

		local timeLeft = Config.Delays.WeedProcessing / 1000

		while timeLeft > 0 do
			Wait(1000)
			timeLeft = timeLeft - 1

			if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
				TriggerEvent('qb-weedpicking:cancelProcessing')
				break
			end
		end
		ClearPedTasks(PlayerPedId())
	end, function()
		ClearPedTasks(PlayerPedId())
	end) -- Cancel

	isProcessing = false
end

server

RegisterServerEvent('qb-meth:processmeth', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local meth = Player.Functions.GetItemByName("meth")
    local empty_weed_bag = Player.Functions.GetItemByName("empty_weed_bag")
    if meth ~= nil and empty_weed_bag ~= nil then
        if Player.Functions.RemoveItem('meth', 1) and Player.Functions.RemoveItem('empty_weed_bag', 2) then
            Player.Functions.AddItem('meth_bag', 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meth'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meth_bag'], "add")
            TriggerClientEvent('QBCore:Notify', src, 'Sėkmingai perdirbote metamfetamina..', "success")  
        else
            TriggerClientEvent('QBCore:Notify', src, 'Neturite tinkamų daiktu..', "error") 
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Neturite tinkamų daiktu..', "error") 
    end
end)
