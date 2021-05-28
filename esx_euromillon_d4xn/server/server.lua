ESX								= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Compra de boletos
RegisterServerEvent('esx_euromillon_d4xn:darBoletos')
AddEventHandler('esx_euromillon_d4xn:darBoletos', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() >= 12 then

        xPlayer.addInventoryItem('boleto_euromillon', 1)
        xPlayer.removeMoney(12)
    end
    if xPlayer.getMoney() < 12 then

        TriggerClientEvent('esx:showNotification', _source, '~r~No ~w~tienes dinero!')
    end
    
end)
