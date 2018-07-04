--[[This script is made by Yadiiiig, do not re-upload this without any permissions.]]
local blips = {  
{x = 288.03256225586, y = -1262.8233642578, z = 28.5, BlipName = "Molotov", ColorOfBlip = 1, IconOfBlip = 436 },
}

  Citizen.CreateThread(function()
  
for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.IconOfBlip)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.ColorOfBlip)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.BlipName)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local table = { 
{x = 288.03256225586, y = -1262.8233642578, z = 28.5},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(table) do
            DrawMarker(1, table[k].x, table[k].y, table[k].z, 0, 0, 0, 0, 0, 0, 1.75, 1.75, 0.5, 0, 0, 5, 200, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(table) do
            local dist = Vdist(GetEntityCoords(GetPlayerPed(-1), false).x, GetEntityCoords(GetPlayerPed(-1), false).y, GetEntityCoords(GetPlayerPed(-1), false).z, table[k].x, table[k].y, table[k].z)
            if dist <= 2 then
                AddTextEntry("Molly", "Press ~b~~h~E~h~~w~ To make a molotov!")
                DisplayHelpTextThisFrame("Molly",false )
                if IsControlJustPressed(0,51) and IsPedOnFoot(GetPlayerPed(-1)) and GetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_PETROLCAN", 1) then
                    RequestAnimDict("weapon@w_sp_jerrycan")
                    TaskPlayAnim(GetPlayerPed(-1),"weapon@w_sp_jerrycan", "fire", 1.0,-1.0, 5000, 1, 1, true, true, true)
                    Citizen.Wait(3000)
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MOLOTOV"), 1, false)
                end
            end
        end
    end
end)