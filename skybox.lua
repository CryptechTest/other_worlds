

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
                --set_gravity(player, 1.05)
            end
            --------

            -- Underground
        elseif pos.y > -11000 and pos.y < otherworlds.skybox.underground and current ~= "underground" then
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
                --set_gravity(player, 1.0)
                otherworlds.gravity.set(player, "underground")
            end

            -- Earth
        elseif pos.y > otherworlds.skybox.underground and pos.y < otherworlds.skybox.atmos_low and current ~= "earth" then
            --[[
            player:set_sky({
                type = "regular",
                clouds = true,
                sunrise_visible = true
            })


            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = false,
                scale = 1.0,
                sunrise_visible = true
            })
            --]]
            player_list[name] = "earth"

            if otherworlds.settings.gravity.enable then
                --set_gravity(player, 1.0)
                otherworlds.gravity.set(player, "earth")
            end

            -- Atmos Low
        elseif pos.y > otherworlds.skybox.atmos_low and pos.y < otherworlds.skybox.atmos_up and current ~= "atmos_low" then
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
                visible = false
            })
            player:set_sun({
                visible = false,
                scale = 1.1,
                sunrise_visible = false
            })

            player_list[name] = "atmos_low"

            if otherworlds.settings.gravity.enable then
                --set_gravity(player, 0.8)
                otherworlds.gravity.set(player, "atmos_low")
            end

            -- Atmos High
        elseif pos.y > otherworlds.skybox.atmos_up and pos.y < otherworlds.skybox.space_low and current ~= "atmos_high" then
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
                --set_gravity(player, 0.5)
                otherworlds.gravity.set(player, "atmos_high")
            end

            -- Lower Space
        elseif pos.y > otherworlds.skybox.space_low and pos.y < otherworlds.skybox.space_mid and current ~= "space_low" then
            player:set_sky({
                type = "skybox",
                textures = space_skybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#0e0627"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 0.8,
                sunrise_visible = false
            })

            player_list[name] = "space_low"

            if otherworlds.settings.gravity.enable then
                --set_gravity(player, 0.1)
                otherworlds.gravity.set(player, "space_low")
            end

            -- Mid Space
        elseif pos.y > otherworlds.skybox.space_mid and pos.y < otherworlds.skybox.space_high and current ~= "space_mid" then
            player:set_sky({
                type = "skybox",
                textures = space_mid_skybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#29222c",
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
                scale = 0.4,
                sunrise_visible = false
            })

            player_list[name] = "space_mid"

            if otherworlds.settings.gravity.enable then
                --set_gravity(player, 0.09)
                otherworlds.gravity.set(player, "space_mid")
            end

            -- Redsky
        elseif pos.y > otherworlds.skybox.redsky_low and pos.y < otherworlds.skybox.redsky_high and current ~= "redsky" then
            player:set_sky({
                type = "skybox",
                textures = redskybox,
                clouds = false,
                sunrise_visible = false,
                base_color = "#440817",
                fog_tint_type = "sun_tint"
            })

            player:set_moon({
                visible = false
            })
            player:set_stars({
                visible = false
            })
            player:set_sun({
                visible = true,
                scale = 0.2,
                sunrise_visible = false
            })

            player_list[name] = "redsky"

            if otherworlds.settings.gravity.enable then
                --set_gravity(player, 0.08)
                otherworlds.gravity.set(player, "redsky")
            end

            -- DeepSpace
        elseif pos.y > otherworlds.skybox.space_deep_low and pos.y < otherworlds.skybox.space_deep_high and current ~= "deepspace" then
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
                --set_gravity(player, 0.02)
                otherworlds.gravity.set(player, "deepspace")
            end

            -- Everything else (blackness)
        elseif pos.y < otherworlds.skybox.blackness and current ~= "blackness" then
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
                --set_gravity(player, 0.03)
                otherworlds.gravity.set(player, "blackness")
            end
        end
    end
end)

minetest.register_on_leaveplayer(function(player)
    player_list[player:get_player_name()] = nil
end)
