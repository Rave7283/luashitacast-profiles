local Settings = T{
	window_size_x = 150,
	window_size_y = -1,
	window_opacity = 0.5,
	window_background = { 0.02, 0.02, 0.02, 0.5 },
	window_border = {0.00, 0.00, 0.00, 0.0},
	window_border_shadow = {0.00, 0.00, 0.00, 0.0},
	enabled_text_color = {0, 1, 0, 1},
	disabled_text_color = {1, 0, 0, 1},
	font_scaling = 1.0
};

local imgui = require('imgui');

local Toggles = {};
local Cycles = {};
local Displays = {};

local varhelper = {
	Toggles = {},
	Values = {},
	Displays = {}
};

--Creates
varhelper.CreateToggle = function(name, default)
	Toggles[name] = default;
end

varhelper.CreateCycle = function(name, values)
	local newCycle = {
		Index = 1,
		Array = values
	};
	Cycles[name] = newCycle;
end

--Gets
varhelper.GetCycle = function(name)
	local ctable = Cycles[name];
	if (type(ctable) == 'table') then
		return ctable.Array[ctable.Index];
	else
		return 'Unknown';
	end
end

varhelper.GetToggle = function(name)
	if (Toggles[name] ~= nil) then
		return Toggles[name];
	else
		return false;
	end
end

--Sets
varhelper.SetCycle = function(cycleName, cyclePosition)
	local ctable = Cycles[cycleName];
	if (type(ctable) ~= 'table') then
		return;
	end
	
	ctable.Index = cyclePosition;
end

varhelper.SetToggle = function(toggleName, togglePosition)
	if (type(Toggles[name]) ~= 'boolean') then
		return;
	else
		Toggles[toggleName] = togglePosition;
	end
end

varhelper.SetDisplay = function(displayName, displayValue)
	Displays[displayName] = displayValue;
end

--Advances
varhelper.AdvanceCycle = function(name)
	local ctable = Cycles[name];
	if (type(ctable) ~= 'table') then
		return;
	end
	
	ctable.Index = ctable.Index + 1;
	if (ctable.Index > #ctable.Array) then
		ctable.Index = 1;
	end
end

varhelper.AdvanceToggle = function(name)
	if (type(Toggles[name]) ~= 'boolean') then
		return;
	elseif Toggles[name] then
		Toggles[name] = false;
	else
		Toggles[name] = true;
	end
end

--Display Handling
varhelper.Destroy = function()
	ashita.events.unregister('d3d_present', 'varhelper_present_cb');
end

--Determines if the chat window is fully-expanded.
varhelper.IsChatExpanded = function()
    -- courtesy of Syllendel
	local pattern = "83EC??B9????????E8????????0FBF4C24??84C0"
	local patternAddress = ashita.memory.find("FFXiMain.dll", 0, pattern, 0x04, 0);
	local chatExpandedPointer = ashita.memory.read_uint32(patternAddress)+0xF1
	local chatExpandedValue = ashita.memory.read_uint8(chatExpandedPointer)

	return chatExpandedValue ~= 0
end

local menuBase = ashita.memory.find('FFXiMain.dll', 0, '8B480C85C974??8B510885D274??3B05', 16, 0);


--- Determines if the map is open in game.
varhelper.IsMapOpen = function()
    -- courtesy of Lin
	local subPointer = ashita.memory.read_uint32(menuBase);
    local subValue = ashita.memory.read_uint32(subPointer);
    if (subValue == 0) then
        return false;
    end
    local menuHeader = ashita.memory.read_uint32(subValue + 4);
    local menuName = ashita.memory.read_string(menuHeader + 0x46, 16);
    local menuName = string.gsub(menuName, '\x00', '');
	
    return menuName:match('menu%s+map.*') ~= nil
        or menuName:match('menu%s+scanlist.*') ~= nil
        or menuName:match('menu%s+cnqframe') ~= nil
end

varhelper.Initialize = function()
	ashita.events.register('d3d_present', 'varhelper_present_cb', function ()
		--Hide when map if open, chat is expanded, or no player is found
		if (varhelper.IsChatExpanded() or varhelper.IsMapOpen() or GetPlayerEntity() == nil) then
			return
		end
		
		--Skip rendering when tables are empty
		if (next(Toggles) == nil and next(Cycles) == nil and next(Displays) == nil) then
			return
		end
		
		local displayText = '';
		local displayTextColor = {1,1,1,1};
		
		imgui.SetNextWindowBgAlpha(Settings.window_opacity)
		imgui.SetNextWindowSize({ Settings.window_size_x, Settings.window_size_y }, ImGuiCond_Always);
		imgui.PushStyleColor(ImGuiCol_WindowBg, Settings.window_background)
		imgui.PushStyleColor(ImGuiCol_Border, Settings.window_border)
		imgui.PushStyleColor(ImGuiCol_BorderShadow, Settings.window_border_shadow)
		imgui.Begin("Varhelper", true, bit.bor(ImGuiWindowFlags_NoDecoration, ImGuiWindowFlags_AlwaysAutoResize, ImGuiWindowFlags_NoFocusOnAppearing, ImGuiWindowFlags_NoNav));
		imgui.SetWindowFontScale(Settings.font_scaling);
		
		-- Displays
		for key, value in pairs(Displays) do			
			imgui.Text(key .. ': ')
            imgui.SameLine();
			
			displayText = value;
			x, _ = imgui.CalcTextSize(displayText);
            imgui.SetCursorPosX(imgui.GetCursorPosX() + imgui.GetColumnWidth() - x - imgui.GetStyle().FramePadding.x);
			imgui.Text(displayText);
		end
		
		-- Toggles
		for key, value in pairs(Toggles) do
			imgui.Text(key .. ': ')
            imgui.SameLine();
			
			if (value == true) then
				displayText = 'Enabled';
				displayTextColor = Settings.enabled_text_color;
			else
				displayText = 'Disabled';
				displayTextColor = Settings.disabled_text_color;
			end
			
			x, _ = imgui.CalcTextSize(displayText);
            imgui.SetCursorPosX(imgui.GetCursorPosX() + imgui.GetColumnWidth() - x - imgui.GetStyle().FramePadding.x);
			imgui.TextColored(displayTextColor, displayText);
		end
		
		-- Cycles
		for key, value in pairs(Cycles) do
			imgui.Text(key .. ': ')
            imgui.SameLine();
			
			displayText = value.Array[value.Index];
			x, _ = imgui.CalcTextSize(displayText);
            imgui.SetCursorPosX(imgui.GetCursorPosX() + imgui.GetColumnWidth() - x - imgui.GetStyle().FramePadding.x);
			imgui.Text(displayText);		
		end
		
		imgui.PopStyleColor(3);
		imgui.End();
		end
	);
end

return varhelper;