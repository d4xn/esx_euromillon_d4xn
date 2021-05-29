# esx_euromillon_d4xn

*A simple lottery FiveM script.*

**Requeriments: esx_basicneeds & mythic_notify**

**IMPORT EUROMILLON.SQL INTO YOUR DB**

**Add this to esx_basicneeds/server/main.lua:**

**If you speak other language change the notifications, and if you want change the percentages too**

**PERCENTAGES: 25% win 0$ - 25% win 6$ - 30% win 12$ - 15% win 50$ - 5% win 150$ - 1/1,000 win 10,000$ - 1/1,000,000 win 1,000,000$**

```lua
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
        xPlayer.addMoney(10000) -- 1/1,000 possibilities

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
```

# Thanks For Reading!
