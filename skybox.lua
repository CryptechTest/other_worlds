-- Heights for skyboxes
local underground = -75

local atmos_low = 1000
local atmos_up = 2000         -- start height
local space_low = 4000        -- start height
local space_mid = 10000       -- start height
local space_high = 16000 - 1  -- end height
local redsky_low = 16000      -- start height
local redsky_high = 22000 - 1 -- end height
local space_deep_low = 22000  -- start height
local space_deep_high = 31000

-- Holds name of skybox showing for each player
local player_list = {}

-- Atmos skybox..
local atmos_skybox = { "sky_pos_z.png^[colorize:#007188BB", "sky_neg_z.png^[transformR180^[colorize:#007188BB",
    "sky_neg_y.png^[transformR270^[colorize:#007188BB",
    "sky_pos_y.png^[transformR270^[colorize:#007188BB",
    "sky_pos_x.png^[transformR270^[colorize:#007188BB",
    "sky_neg_x.png^[transformR90^[colorize:#007188BB" }

-- Outerspace skybox
local space_skybox = { "sky_pos_z.png^[colorize:#00005030", "sky_neg_z.png^[transformR180^[colorize:#00005030",
    "sky_neg_y.png^[transformR270^[colorize:#00005030",
    "sky_pos_y.png^[transformR270^[colorize:#00005030",
    "sky_pos_x.png^[transformR270^[colorize:#00005030",
    "sky_neg_x.png^[transformR90^[colorize:#00005030" }

-- Midspace skybox
local space_mid_skybox = { "sky_pos_z.png^[colorize:#61008830", "sky_neg_z.png^[transformR180^[colorize:#61008830",
    "sky_neg_y.png^[transformR270^[colorize:#61008830",
    "sky_pos_y.png^[transformR270^[colorize:#61008830",
    "sky_pos_x.png^[transformR270^[colorize:#61008830",
    "sky_neg_x.png^[transformR90^[colorize:#61008830" }

-- Redsky skybox
local redskybox = { "sky_pos_z.png^[colorize:#88000050", "sky_neg_z.png^[transformR180^[colorize:#88000050",
    "sky_neg_y.png^[transformR270^[colorize:#88000050",
    "sky_pos_y.png^[transformR270^[colorize:#88000050",
    "sky_pos_x.png^[transformR270^[colorize:#88000050", "sky_neg_x.png^[transformR90^[colorize:#88000050" }

-- Deep space skybox
local space_deep_skybox = { "sky_pos_z.png^[colorize:#000000A0", "sky_neg_z.png^[transformR180^[colorize:#000000A0",
    "sky_neg_y.png^[transformR270^[colorize:#000000A0",
    "sky_pos_y.png^[transformR270^[colorize:#000000A0",
    "sky_pos_x.png^[transformR270^[colorize:#000000A0",
    "sky_neg_x.png^[transformR90^[colorize:#000000A0" }

-- Darkest space skybox
local darkskybox = { "sky_pos_z.png^[colorize:#00005070", "sky_neg_z.png^[transformR180^[colorize:#00004070",
    "sky_neg_y.png^[transformR270^[colorize:#00004070",
    "sky_pos_y.png^[transformR270^[colorize:#00004070",
    "sky_pos_x.png^[transformR270^[colorize:#00004070",
    "sky_neg_x.png^[transformR90^[colorize:#00004070" }

-- check for active pova mod
local pova = minetest.get_modpath("pova")

-- gravity helper function
local set_gravity = function(player, grav)
    if pova then
        pova.add_override(player:get_player_name(), "default", {
            gravity = grav
        })
    else
        player:set_physics_override({
            gravity = grav
        })
    end
end

-------- this just adds nether background for xanadu server
local nether_mod = minetest.get_modpath("nether") and minetest.get_modpath("xanadu")
--------

local timer = 0

minetest.register_globalstep(function(dtime)
    timer = timer + dtime

    if timer < 2 then
        return
    end

    timer = 0

    for _, player in pairs(minetest.get_connected_players()) do
        local name = player:get_player_name()
        local pos = player:get_pos()
        local current = player_list[name] or ""

        -------- this just adds nether background for xanadu server
        if nether_mod and pos.y < -28000 and current ~= "nether" then
            player:set_sky({
                type = "plain",
                base_color = "#1d1118", -- "#300530", --"#070916", --"#1D0504",
                clouds = false,
                sky_color = {
                    day_horizon = "#9bc1f0",
                    dawn_horizon = "#bac1f0",
                    fog_tint_type = "default",
                    dawn_sky = "#b4bafa",
                    day_sky = "#8cbafa",
                    night_sky = "#006aff",
                    indoors = "#646464",
                    night_horizon = "#4090ff"
                }
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = false,
                sunrise_visible = false
            })

            player_list[name] = "nether"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 1.05)
            end
            --------

            -- Underground
        elseif pos.y > -11000 and pos.y < underground and current ~= "underground" then
            --		if pos.y < underground and current ~= "underground" then

            player:set_sky({
                type = "plain",
                clouds = false,
                sunrise_visible = false,
                base_color = "#101010"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = false,
                sunrise_visible = false
            })

            player_list[name] = "underground"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 1.0)
            end

            -- Earth
        elseif pos.y > underground and pos.y < atmos_low and current ~= "earth" then
            player:set_sky({
                type = "regular",
                clouds = true,
                sunrise_visible = true
            })

            player:set_moon({
                visible = true
            })
            player:set_stars({
                visible = true
            })
            player:set_sun({
                visible = true,
                scale = 1.0,
                sunrise_visible = true
            })

            player_list[name] = "earth"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 1.0)
            end

            -- Atmos Low
        elseif pos.y > atmos_low and pos.y < atmos_up and current ~= "atmos_low" then
            player:set_sky({
                type = "skybox",
                textures = atmos_skybox,
                clouds = true,
                sunrise_visible = true
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = true
            })
            player:set_sun({
                visible = true,
                scale = 1.1,
                sunrise_visible = false
            })

            player_list[name] = "atmos_low"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 0.8)
            end

            -- Atmos High
        elseif pos.y > atmos_up and pos.y < space_low and current ~= "atmos_high" then
            player:set_sky({
                type = "skybox",
                textures = atmos_skybox,
                clouds = false,
                sunrise_visible = true
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 1.2,
                sunrise_visible = false
            })

            player_list[name] = "atmos_high"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 0.5)
            end

            -- Lower Space
        elseif pos.y > space_low and pos.y < space_mid and current ~= "space_low" then
            player:set_sky({
                type = "skybox",
                textures = space_skybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#000050"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 1.3,
                sunrise_visible = false
            })

            player_list[name] = "space_low"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 0.1)
            end

            -- Mid Space
        elseif pos.y > space_mid and pos.y < space_high and current ~= "space_mid" then
            player:set_sky({
                type = "skybox",
                textures = space_mid_skybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#610088",
                fog_tint_type = "moon_tint"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 1.1,
                sunrise_visible = false
            })

            player_list[name] = "space_mid"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 0.09)
            end

            -- Redsky
        elseif pos.y > redsky_low and pos.y < redsky_high and current ~= "redsky" then
            player:set_sky({
                type = "skybox",
                textures = redskybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#880000",
                fog_tint_type = "moon_tint"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 0.6,
                sunrise_visible = false
            })

            player_list[name] = "redsky"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 0.08)
            end

            -- DeepSpace
        elseif pos.y > space_deep_low and pos.y < space_deep_high and current ~= "deepspace" then
            player:set_sky({
                type = "skybox",
                textures = space_deep_skybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#000040",
                fog_tint_type = "moon_tint"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 0.1,
                sunrise_visible = false
            })

            player_list[name] = "deepspace"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 0.02)
            end

            -- Everything else (blackness)
        elseif pos.y < -10999 and current ~= "blackness" then
            player:set_sky({
                type = "skybox",
                textures = darkskybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#101010",
                fog_tint_type = "moon_tint"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 0.1,
                sunrise_visible = false
            })

            player_list[name] = "blackness"

            if otherworlds.settings.gravity.enable then
                set_gravity(player, 0.03)
            end
        end
    end
end)

minetest.register_on_leaveplayer(function(player)
    player_list[player:get_player_name()] = nil
end)
