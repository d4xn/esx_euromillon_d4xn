# esx_euromillon_d4xn

*A simple lottery FiveM script.*

**IMPORT EUROMILLON.SQL INTO YOU DB**

**Add this to esx_basicneeds/server/main.lua:**

```lua
ESX.RegisterUsableItem('boleto_euromillon', function(source)
    math.randomseed(os.time())
    local winner = math.random(0, 100000)
    local number = math.random(0, 100000)
    local luck = math.random(0, 100)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('boleto_euromillon', 1)

    if winner == number then
        TriggerClientEvent('esx:showNotification', source, '~g~1,000,000$ ~w~Te ha tocado el gordo!')
        xPlayer.addMoney(1000000) --- 1/1000000 possibilities

    elseif luck == 100 then
		TriggerClientEvent('esx:showNotification', source, number-winner)
		TriggerClientEvent('esx:showNotification', source, winner-number)
        TriggerClientEvent('esx:showNotification', source, '~g~10,000$ ~w~Te ha tocado el segundo premio!')
        xPlayer.addMoney(10000)

    else
        if luck >= 25 then
            if luck >= 50 then
                if luck >= 75 then
                    if luck >= 90 then
                        TriggerClientEvent('esx:showNotification', source, '~g~250$ ~w~Te ha tocado el tercer premio!')
                        xPlayer.addMoney(250)
                    else
                        TriggerClientEvent('esx:showNotification', source, '~g~50$ ~w~Te ha tocado el cuarto premio!')
                        xPlayer.addMoney(50)
                    end
                else
                    TriggerClientEvent('esx:showNotification', source, '~g~12$ ~w~Te has quedado igual, porque no vuelves a probar suerte...')
                    xPlayer.addMoney(12)
                end
            else
                TriggerClientEvent('esx:showNotification', source, '~r~6$ ~w~Has recuperado la mitad!')
                xPlayer.addMoney(6)
            end
        else
            TriggerClientEvent('esx:showNotification', source, '~r~No ~w~te ha tocado nada! :(')
        end
    end
end)
```

# Thanks For Reading!
