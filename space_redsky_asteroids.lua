-- Approximate realm limits
local YMIN = otherworlds.settings.redsky_asteroids.YMIN or 16000
local YMAX = otherworlds.settings.redsky_asteroids.YMAX or 21000

-- Register on_generated function for this layer
minetest.register_on_generated(otherworlds.asteroids.create_on_generated(YMIN, YMAX, {

    c_air = minetest.get_content_id("vacuum:vacuum"),
    c_obsidian = minetest.get_content_id("default:obsidian"),
    c_stone = minetest.get_content_id("asteroid:redstone"),
    c_cobble = minetest.get_content_id("asteroid:redcobble"),
    c_gravel = minetest.get_content_id("asteroid:redgravel"),
    c_dust = minetest.get_content_id("asteroid:reddust"),
    c_ironore = minetest.get_content_id("asteroid:ironore"),
    c_copperore = minetest.get_content_id("asteroid:copperore"),
    c_coalore = minetest.get_content_id("asteroid:coalore"),
    c_diamondore = minetest.get_content_id("asteroid:diamondore"),
    c_meseore = minetest.get_content_id("asteroid:meseore"),
    c_waterice = minetest.get_content_id("default:ice"),
    c_atmos = minetest.get_content_id("asteroid:atmos"),
    c_snowblock = minetest.get_content_id("default:snowblock"),
    c_titanium = minetest.get_content_id("ctg_world:stone_red_with_titanium"),
    c_aluminum = minetest.get_content_id("ctg_world:red_stone_with_aluminum"),
    c_nickel = minetest.get_content_id("ctg_world:red_stone_with_nickel"),
    c_gold = minetest.get_content_id("asteroid:red_mineral_gold"),
    c_silver = minetest.get_content_id("asteroid:red_mineral_silver"),
    c_tin = minetest.get_content_id("asteroid:red_mineral_tin"),
    c_uranium = minetest.get_content_id("asteroid:red_mineral_uranium"),
    c_chromium = minetest.get_content_id("asteroid:red_mineral_chromium"),
    c_zinc = minetest.get_content_id("asteroid:red_mineral_zinc"),
    c_lead = minetest.get_content_id("asteroid:red_mineral_lead"),
    c_sulfur = minetest.get_content_id("asteroid:red_mineral_sulfur"),
}))

-- Deco code for grass and crystal

-- how often surface decoration appears on top of asteroid cobble
local TOPDECO = 500

local grass = {"mars:grass_1", "mars:grass_2", "mars:grass_3", "mars:grass_4", "mars:grass_5"}

local flower = {"mars:moss", "mars:redweed", "mars:redgrass"}

local crystal = {"crystals:ghost_crystal_1", "crystals:ghost_crystal_2", "crystals:red_crystal_1",
                 "crystals:red_crystal_2", "crystals:rose_quartz_1", "crystals:rose_quartz_2"}

local random = math.random

local function is_atmos_node(pos)
    local node = minetest.get_node(pos)
    if minetest.get_item_group(node.name, "vacuum") == 1 or minetest.get_item_group(node.name, "atmosphere") > 0 then
        return true
    end
    if node.name == "air" then
        return true
    end
    if node.name == "technic:dummy_light_source" then
        return true
    end
    return false
end

local function get_solid_node(pos)
    local node = nil
    local npos = {
        x = pos.x,
        y = pos.y,
        z = pos.z
    }
    local c = 0
    while node == nil and c < 128 do
        if (not is_atmos_node(pos)) then
            return npos
        end
        npos = {
            x = npos.x,
            y = npos.y - 1,
            z = npos.z
        }
        c = c + 1
    end
    return node
end

local function is_solid(pos)
    if (not is_atmos_node(pos)) then
        return true
    end
    return false
end

-- Add surface decoration
minetest.register_on_generated(function(minp, maxp)

    if minp.y < YMIN or maxp.y > YMAX then
        return
    end

    local bpos, ran
    local coal = minetest.find_nodes_in_area(minp, maxp, {"asteroid:redgravel"})

    for n = 1, #coal do

        local coal_pos = get_solid_node(coal[n])

        if (coal_pos ~= nil and coal_pos) then

            bpos = {
                x = coal_pos.x,
                y = coal_pos.y + 1,
                z = coal_pos.z
            }
            local cpos = {
                x = bpos.x,
                y = bpos.y + 1,
                z = bpos.z
            }
            ran = random(TOPDECO)

            if minetest.get_node(coal_pos).name == "asteroid:redgravel" and minetest.get_node(bpos).name ~=
                "asteroid:reddust" and minetest.get_node(bpos).name ~= "asteroid:redstone" and
                minetest.get_node(bpos).name ~= "asteroid:redcobble" and minetest.get_node(bpos).name ~=
                "asteroid:redgravel" then

                if ran < 100 then -- grass

                    minetest.swap_node(bpos, {
                        name = grass[random(#grass)]
                    })

                elseif ran >= 180 and ran <= 200 then -- other plants

                    minetest.swap_node(bpos, {
                        name = flower[random(#flower)]
                    })

                elseif ran == TOPDECO then -- crystals

                    minetest.swap_node(bpos, {
                        name = crystal[random(#crystal)]
                    })
                end
            end
        end
    end
end)
