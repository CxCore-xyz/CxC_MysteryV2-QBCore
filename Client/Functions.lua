function loadAnimDict(dict) while (not HasAnimDictLoaded(dict)) do RequestAnimDict(dict) Wait(5) end end
function OpenPack() loadAnimDict("clothingshirt") TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0) end
RegisterNetEvent('CxC:Anim:Func') AddEventHandler('CxC:Anim:Func', function() OpenPack() end)