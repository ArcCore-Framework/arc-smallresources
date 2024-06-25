-- This file is for static blips only  aka blips that dont ever change.

local Blips = { -- https://docs.fivem.net/docs/game-references/blips/#blips
    {text = 'Vanilla Unicorn', color = 7, coords = vec2(116.81, -1292.99), id = 121},
    {text = 'Burger Shot', color = 17, coords = vec2(116.81, -1292.99), id = 106},
    { text = 'Digital Den', color = 0,  coords = vec2(116.81, -1292.99), id = 521 },
    
}

local function CreateBlip(title, color, coords, id)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, id)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.65)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(title)
    EndTextCommandSetBlipName(blip)
  end

Citizen.CreateThread(function ()
    for i, data in ipairs(Blips) do
        CreateBlip(data.text, data.color, data.coords, data.id)
    end
end)