-- fumoplushies/init.lua
-- Silly fumo plushies to decorate your world with
--[[
    Copyright (C) 2023  Ale
    Copyright (C) 2024  1F616EMO

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local S = minetest.get_translator("fumoplushies")
local fumos = {
    cirno = {
        name = S("Cirno"),
        title = S("Fairy of the Ice"),
        craftitem = "default:snow",
    },
    reimu = {
        name = S("Hakurei Reimu"),
        title = S("Shrine Maiden of Paradise"),
        craftitem = "default:gold_ingot",
    },
    marisa = {
        name = S("Kirisame Marisa"),
        title = S("Ordinary Magician"),
        craftitem = "default:steel_ingot"
    },
    alice = {
        name = S("Alice Margatroid"),
        title = S("Seven-Colored Puppeteer"),
        craftitem = "wool:white"
    },
    cirnowhatsapp = {
        name = S("Cirno (WhatsApp variant)"),
        title = S("Fairy of the Green App"),
        craftitem = "wool:green"
    },
    mikuhatsune = {
        name = S("Hatsune Miku"),
        title = S("Number One Princess in the World"),
        craftitem = "wool:blue"
    }
}

for k, v in pairs(fumos) do
    local desc = S("Fumo Plush: @1", v.name or k)
    if v.title then
        desc = desc .. "\n" .. v.title
    end

    minetest.register_node("fumoplushies:" .. k .. "plushie", {
        description = desc,
        drawtype = "mesh",
        mesh = "fumo" .. k .. ".obj",
        tiles = { "fumo" .. k .. ".png" },
        paramtype2 = "facedir",
        paramtype = "light",
        sunlight_propagates = true,
        selection_box = {
            type = "fixed",
            fixed = { -0.3, -0.46, -0.4, 0.3, 0.3, 0.3 }
        },
        collision_box = {
            type = "fixed",
            fixed = { -0.3, -0.46, -0.4, 0.3, 0.3, 0.3 }
        },
        is_ground_content = false,
        groups = {
            snappy = 2,
            choppy = 2,
            oddly_breakable_by_hand = 3,
            flammable = 3,
            wool = 1
        },
        use_texture_alpha = "blend",
    })

    if v.craftitem then
        minetest.register_craft({
            type = "shapeless",
            output = "fumoplushies:" .. k .. "plushie",
            recipe = { "fumoplushies:plushie", v.craftitem }
        })
    end
end

minetest.register_craftitem("fumoplushies:plushie", {
    description = S("Fumo Plush Base"),
    inventory_image = "fumobaseitem.png"
})

minetest.register_craft({
    output = "fumoplushies:plushie",
    recipe = {
        { "",           "farming:string ", "" },
        { "wool:white", "wool:white",      "wool:white" },
        { "",           "wool:white",      "" }
    }
})
