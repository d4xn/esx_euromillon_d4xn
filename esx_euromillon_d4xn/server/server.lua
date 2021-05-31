ESX								= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Compra de boletos
RegisterNetEvent('esx_euromillon_d4xn:darBoletos_d4xn')
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

ESX.RegisterUsableItem('boleto_euromillon', function(source)
    math.randomseed(os.time())
    local winner = math.random(0, 100000)
    local number = math.random(0, 100000)
    local winner2 = math.random(0, 1000)
    local number2 = math.random(0, 1000)
    local luck = math.random(0, 100)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('boleto_euromillon', 1)

    if winner == number then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '1,000,000$ Te ha tocado el gordo!'})
        xPlayer.addMoney(1000000) -- 1/1,000,000 possibilities

    elseif winner2 == number2 then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '10,000$ Te ha tocado el segundo premio!'})
        xPlayer.addMoney(10000)

    else
        if luck >= 25 then
            if luck >= 50 then
                if luck >= 80 then
                    if luck >= 95 then
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '150$ Te ha tocado el tercer premio!'})
                        xPlayer.addMoney(150)
                    else
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '50$ Te ha tocado el cuarto premio!'})
                        xPlayer.addMoney(50)
                    end
                else
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '12$ Te has quedado igual, porque no vuelves a probar suerte...'})
                    xPlayer.addMoney(12)
                end
            else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '6$ Has recuperado la mitad!'})
                xPlayer.addMoney(6)
            end
        else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'No te ha tocado nada! :('})
        end
    end
end)
