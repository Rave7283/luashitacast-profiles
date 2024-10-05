local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.02;
};

local sets = {
	Idle = {
		hands = "Hct. Mittens +1",
		Legs = "Byakko's Haidate",
		feet = "Hct. Leggings +1"
	},
	Resting = {},
	Engaged_Hybrid = {
		Head = "Panther Mask",
		Neck = "Temp. Torque",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Hauberk",
		Hands = "Dusk Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Byakko's Haidate",
		Feet = "Marine M Boots"
	},
	Engaged_Accuracy = {
		Head = "Optical Hat",
		Neck = "Temp. Torque",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Hauberk",
		Hands = "Dusk Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Life Belt",
		Legs = "Byakko's Haidate",
		Feet = "Marine M Boots"
	},
	Engaged_Power = {
		Head = "Panther Mask",
		Neck = "Temp. Torque",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Hauberk",
		Hands = "Dusk Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Triumph Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Byakko's Haidate",
		Feet = "Marine M Boots"
	},
	WS_Hybrid = {
		Head = "Maat's Cap",
		Neck = "Temp. Torque",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Hecatomb Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Triumph Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Accuracy = {
		Head = "Maat's Cap",
		Neck = "Peacock Amulet",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Hauberk",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Life Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Power = {
		Head = "Maat's Cap",
		Neck = "Temp. Torque",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Hecatomb Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Triumph Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Single = {
		Head = "Maat's Cap",
		Neck = "Temp. Torque",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Hecatomb Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Triumph Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	Preshot = {Ammo = "Pebble"},
	Midshot = {},
	Precast = {Ear2 = "Loquac. Earring"},
	Midcast = {},
	Endcast = {
		Ear2 = "Loquac. Earring",
		Hands = "Dusk Gloves +1",
		Waist = "Sonic Belt",
		Legs = "Byakko's Haidate"
	},
	PDT = {
		Head = "Darksteel Cap +1",
        Body = "Dst. Harness +1",
        Hands = "Dst. Mittens +1",
        Legs = "Dst. Subligar +1",
        Feet = "Dst. Leggings +1"
	},
	MDT = {
		Head = "Green Ribbon +1",
		Neck = "Jeweled Collar +1",
		Ear1 = "Merman's Earring",
        Ear2 = "Merman's Earring",
		Body = "Kirin's Osode",
        Ring1 = "Merman's Ring",
        Ring2 = "Merman's Ring",
		Back = "Resentment Cape"
	},
	Refresh = {},
	Charm = {
		Head = "Maat's Cap",
		Neck = "Temp. Torque",
		Body = "Kirin's Osode",
		Hands = "Monster Gloves",
		Feet = "Monster Gaiters"
	},
	Reward = {
		Head = "Maat's Cap",
		Body = "Kirin's Osode",
		Hands = "Ogre Gloves", 
		Feet = "Monster Gaiters"},
	Tame = {},
	CallBeast = {Hands = "Monster Gloves"},
	Day = {Ear1 = "Fenrir's Earring"}
};

local profile = {};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	--Universal binds
	helpers.CreateUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /lock /lac fwd lockable");
	
	--Virtue Stone
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /vs /lac fwd vs");
	
	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");
	
	--Mode Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^- /lac fwd mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mode /lac fwd mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /base /lac fwd base");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mdt /lac fwd mdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /pdt /lac fwd pdt");
	
	--Tp Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /baseset /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /power /lac fwd power");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /hybrid /lac fwd hybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /acc /lac fwd acc");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	varhelper.CreateCycle("Priority", { [1] = "Hybrid", [2] = "Accuracy", [3] = "Power"  });
	varhelper.CreateCycle("Mode", { [1] = "Base",  [2] = "PDT", [3] = "MDT",  } );	
	varhelper.CreateToggle("VS", false);
	varhelper.CreateToggle("MC", true);
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 1");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
	
	--tCrossbar
	AshitaCore:GetChatManager():QueueCommand(1, "/addon load tcrossbar");
end

profile.OnUnload = function()
	--Universal unbinds
	helpers.DestroyUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /lock");
	
	--Mode Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^-");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /base");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /pdt");

	--Tp Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^=");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /power");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /hybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /acc");
	
	--Delay Midcast unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mc");
	
	--Virtue Stone
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /vs");
	
	--tCrossbar
	AshitaCore:GetChatManager():QueueCommand(1, "/addon unload tcrossbar");
	
	varhelper.Destroy();
end

profile.HandleCommand = function(args)	
	if (args[1] == "lockable") then --Cycle Lockable Behavior
		--Unlock All
		if (varhelper.GetCycle("Lockable") == "Always") then
			gFunc.Enable("all");
			helpers.UnlockAll();
		end
		varhelper.AdvanceCycle("Lockable")
	elseif (args[1] == "mode") then --Cycle Modes
		varhelper.AdvanceCycle("Mode");
	elseif (args[1] == "base") then --Base Mode
		varhelper.SetCycle("Mode", 1);
	elseif (args[1] == "pdt") then --Pdt Mode
		varhelper.SetCycle("Mode", 2);
	elseif (args[1] == "mdt") then -- Mdt Mode
		varhelper.SetCycle("Mode", 3);
	elseif (args[1] == "baseset") then --Cycle TP Sets
		varhelper.AdvanceCycle("Priority");
	elseif (args[1] == "hybrid") then --Hybrid
		varhelper.SetCycle("Priority", 1);
	elseif (args[1] == "acc") then --Accuracy
		varhelper.SetCycle("Priority", 2);
	elseif (args[1] == "power") then --Power
		varhelper.SetCycle("Priority", 3);
	elseif (args[1] == "vs") then --Toggle Virtue Stones
		varhelper.AdvanceToggle("VS");
	elseif (args[1] == "mc") then 
		varhelper.AdvanceToggle("MC");
	else 
		helpers.ExecuteCommand(args[1]);
	end
end

profile.HandleDefault = function()
	local equipment = gData.GetEquipment();
	
	if (varhelper.GetCycle("Lockable") == "Always") then
		helpers.LockUsableEquipment(equipment);
	end
	
	local player = gData.GetPlayer();
	local environment = gData.GetEnvironment();
		
	--Resting
	if (player.Status == "Resting") then
		--Wait 18 before swapping to rest set
		helpers.DelaySet(sets.Resting, 18);
	else
		helpers.ResetDelay();
		--Engaged
		if (player.Status == "Engaged") then
			if (varhelper.GetCycle("Mode") == "Base") then
				gFunc.EquipSet("Engaged_" .. varhelper.GetCycle("Priority"));
				
				if (varhelper.GetToggle("VS")) then
					gFunc.Equip("ammo", "Virtue Stone");
				end
			else
				gFunc.EquipSet(varhelper.GetCycle("Mode"));
			end
		else --Idle
			if (varhelper.GetCycle("Mode") == "Base") then
				gFunc.EquipSet(sets.Idle);
				
				helpers.DucalAketonCheck(environment);
				
				--Lockable Override
				if (varhelper.GetCycle("Lockable") == "Idle") then
					gFunc.EquipSet(helpers.BuildLockableSet(equipment));
				end
			else
				gFunc.EquipSet(varhelper.GetCycle("Mode"));
			end
		end
	end
	
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	if(ability.Name == "Charm") then
		gFunc.EquipSet(sets.Charm);
	elseif(ability.Name == "Reward") then
		gFunc.EquipSet(sets.Reward);
	elseif(ability.Name == "Tame") then
		gFunc.EquipSet(sets.Tame);
	elseif(ability.Name == "Call Beast" or ability.Name == "Bestial Loyalty") then
		gFunc.EquipSet(sets.CallBeast);
	end
end

profile.HandleItem = function()
	local item = gData.GetAction();
	
	if (item.Name == "Prism Powder") then
		gFunc.EquipSet(common.sets.Invisible);
	elseif (item.Name == "Silent Oil") then
		gFunc.EquipSet(common.sets.Sneak);
	end
end

profile.HandlePrecast = function()
	local player = gData.GetPlayer();
	local spell = gData.GetAction();
	
	if (varhelper.GetToggle("MC")) then
		helpers.GetMidcastDelay(player, spell, settings.GearFastCast);
	end
	
	gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()
	gFunc.InterimEquipSet(sets.Midcast);
	gFunc.EquipSet(sets.Endcast);
end

profile.HandlePreshot = function()
	gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
	gFunc.EquipSet(sets.Midshot);
end

profile.HandleWeaponskill = function()
	local ws = gData.GetAction();
	local environment = gData.GetEnvironment();
	
	if (helpers.AccBoostedCheck(ws)) then
		gFunc.EquipSet(sets.WS_Single);
		
		if (helpers.TimeCheck(environment, "Daytime")) then
			gFunc.EquipSet(sets.Day);
		end
	elseif (varhelper.GetCycle("Priority") == "Power") then
		gFunc.EquipSet("WS_" .. varhelper.GetCycle("Priority"));
		
		if ( helpers.TimeCheck(environment, "Daytime")) then
			gFunc.EquipSet(sets.Day);
		end
	else
		gFunc.EquipSet("WS_" .. varhelper.GetCycle("Priority"));
	end
	
	--Gorgets
	gFunc.Equip("neck", common.ElementalGorgetTable[ws.Name]);
end

return profile;