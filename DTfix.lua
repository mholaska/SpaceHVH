local gui_set = gui.SetValue
local gui_get = gui.GetValue
-- or pLocal:GetPropEntity("m_hActiveWeapon"):GetName():lower() == "weapon_g3sg1"
local function DTfix()
    local pLocal = entities.GetLocalPlayer()
    local dtval = gui_get("rbot.accuracy.weapon.asniper.doublefire")
    if pLocal:GetPropEntity("m_hActiveWeapon"):GetName():lower() == ("weapon_scar20" or "weapon_g3sg1")then
        
        if dtval == 2 then
            gui_set("rbot.antiaim.condition.shiftonshot", 0)
        elseif dtval == 0 then
            gui_set("rbot.antiaim.condition.shiftonshot", 1)
        end
    else
        gui_set("rbot.antiaim.condition.shiftonshot", 1)
    end
end
callbacks.Register("Draw","DTfix",DTfix)
