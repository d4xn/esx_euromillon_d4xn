ESX								= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

-- Venta Boleto NPC
Citizen.CreateThread(function()
    SpawnNPC('a_f_m_eastsa_01', vector4(219.80, -859.85, 29.20, 340.30)) --'a_f_m_eastsa_01' - 'a_c_shepherd'
    SpawnNPC('a_c_shepherd', vector4(220.50, -860.15, 29.20, 340.30))
    while true do
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
        local _sleep = 1000
        if #(_charPos - vector3(219.80, -859.85, 29.20)) < 3 then
            _sleep = 0
            DrawText3D(219.80, -859.85, 31.25, 'Pulsa ~r~[E]~w~ para comprar un boleto por ~g~12$~s~')
            if IsControlJustPressed(0, 38) then 
                TriggerServerEvent('esx_euromillon_d4xn:darBoletos')
            end
        end
        Citizen.Wait(_sleep)
    end
end)

-- DrawText3D
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- SpawnNPC

SpawnNPC = function(modelo, x, y, z, h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    crearNPC = CreatePed(5, hash, x, y, z, h, false, true)
    FreezeEntityPosition(crearNPC, true)
    SetEntityInvincible(crearNPC, true)
    SetBlockingOfNonTemporaryEvents(crearNPC, true)
    TaskStartScenarioInPlace(crearNPC, "", 0, false) -- "WORLD_HUMAN_SMOKING"
end