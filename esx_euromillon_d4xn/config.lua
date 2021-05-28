local blips = {
  -- Example {title="", colour=, id=, x=, y=, z=},

  {title="Venta Euromillon", colour=7, id=280, x = 219.80, y = -859.85, z = 30.20}, -- x= 219.80, y= -859.85, z= 30.20

}

local showBlip = true
      
if showBlip == true then
  Citizen.CreateThread(function()

      for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 1.0)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
      end

  end)

end