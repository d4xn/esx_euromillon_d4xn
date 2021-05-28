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
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '1,000,000$ Te ha tocado el gordo!'})
        xPlayer.addMoney(1000000) -- 100,000 if is the same number

    elseif luck == 100 then
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '10,000$ Te ha tocado el segundo premio!'})
        xPlayer.addMoney(10000)

    else
        if luck >= 25 then
            if luck >= 50 then
                if luck >= 75 then
                    if luck >= 90 then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '250$ Te ha tocado el tercer premio!'})
                        xPlayer.addMoney(250)
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
```

# Thanks For Reading!
