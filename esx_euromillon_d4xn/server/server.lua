ESX								= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Compra de boletos
RegisterServerEvent('esx_euromillon_d4xn:darBoletos_d4xn')
AddEventHandler('esx_euromillon_d4xn:darBoletos_d4xn', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local coords = xPlayer.getCoords(true)
    if #(coords-vector3(219.80, -859.85, 29.20)) <= 3 then
        if xPlayer.getMoney() >= 12 then

            xPlayer.addInventoryItem('boleto_euromillon', 1)
            xPlayer.removeMoney(12)

        elseif xPlayer.getMoney() < 12 then

            TriggerClientEvent('esx:showNotification', _source, '~r~No ~w~tienes dinero!')
        end
    end
end)
