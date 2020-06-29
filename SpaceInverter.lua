
local gui_set = gui.SetValue
local gui_get = gui.GetValue
local space_ref = gui.Reference("Ragebot", "Anti-Aim")
local spacegb = gui.Groupbox(space_ref, "Space AA",328,818,298,100)
local inverter_key = gui.Keybox(spacegb, "inverter_key", "Inverter Key", 0)
local base_dir = gui.Slider(spacegb, "base_dir","Base Direction",0,-180,180)
local base_rot = gui.Slider(spacegb, "base_rot","Rotation",0,-58,58)
local base_lby = gui.Slider(spacegb, "base_lby", "LBY",0, -58,58)
local inverter_val = 0;



local function Inverter()
	local rot = base_rot:GetValue()
	local lby = base_lby:GetValue()
	local base = base_dir:GetValue()
	
	
	local rot_inv = rot * -1
	local lby_inv = lby * -1
	local base_inv = base * -1
	if inverter_key:GetValue() ~= 0 then
		if input.IsButtonPressed(inverter_key:GetValue()) then
			if inverter_val == 1 then
				inverter_val = 0
			elseif inverter_val == 0 then
				inverter_val = 1
			end
		end
	end
	if inverter_val == 1 then
		gui_set("rbot.antiaim.base.rotation", rot_inv)
		gui_set("rbot.antiaim.base.lby", lby_inv)
		gui_set("rbot.antiaim.base", base_inv)
	elseif inverter_val == 0 then
		gui_set("rbot.antiaim.base.rotation", rot)
		gui_set("rbot.antiaim.base.lby", lby)
		gui_set("rbot.antiaim.base", base)
	end
end


callbacks.Register("Draw","Inverter",Inverter)