-- This file is for static blips only  aka blips that dont ever change.

local Blips = { -- https://docs.fivem.net/docs/game-references/blips/#blips
    -- Food Places
    {text = 'Burger Shot', color = 17, coords = vector2(-1191.61, -889.97), id = 106},

    -- Mech Shops
    {text = 'Bennys', color = 28, coords = vector2(-208.3, -1325.41), id = 72},
    {text = 'Ottos Autos', color = 28, coords = vector2(830.09, -813.33), id = 72},

    -- Civ Buiz
    {text = 'Burger Shot', color = 17, coords = vector2(-1191.61, -889.97), id = 106},
    {text = 'Digital Den', color = 0,  coords = vector2(390.78, -830.86), id = 521},

    -- Police
    {text = 'Paleto Sheriff Station', color = 0,  coords = vector2(-442.01, 6009.51), id = 487},
    {text = 'Mission Row', color = 0,  coords = vector2(441.29, -981.71), id = 487},

    -- Other
    {text = 'Bobcat Security', color = 63,  coords = vector2(911.25, -2120.37), id = 487},

    -- {text = 'South Side Pawn', color = 0, coords = vec2(134.68, -1781.31), id = 605},
    -- {text = 'Sandy Pawn', color = 0, coords = vec2(1702.01, 3783.05), id = 605},
    -- {text = 'Rockford Pawn', color = 0, coords = vec2(-481.66, 281.49), id = 605},
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
        print(data.coords)
        CreateBlip(data.text, data.color, data.coords, data.id)
    end
end)