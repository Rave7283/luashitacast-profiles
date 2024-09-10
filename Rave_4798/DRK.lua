local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.07;
};

local sets = {
	Idle = {
		Neck = "Parade Gorget",
		Hands = "Homam Manopolas",
		Legs = "Blood Cuisses"
	},
	Resting = {},
	Engaged_Hybrid = {
		Head = "Homam Zucchetto",
		Neck = "Peacock Amulet",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Hauberk",
		Hands = "Dusk Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Engaged_Accuracy = {
		Head = "Homam Zucchetto",
		Neck = "Peacock Amulet",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Hauberk",
		Hands = "Homam Manopolas",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Engaged_Power = {
		Head = "Homam Zucchetto",
		Neck = "Peacock Amulet",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Hauberk",
		Hands = "Dusk Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Flame Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	WS_Single = {
		Head = "Maat's Cap",
        Neck = "Peacock Amulet",
        Ear1 = "Merman's Earring",
        Ear2 = "Brutal Earring",
        Body = "Hecatomb Harness",
        Hands = "Hct. Mittens +1",
        Ring1 = "Rajas Ring",
        Ring2 = "Flame Ring",
        Back = "Forager's Mantle",
        Waist = "Warwolf Belt",
        Legs = "Dusk Trousers +1",
        Feet = "Hct. Leggings +1"
	},	
	WS_Hybrid = {
        Head = "Maat's Cap",
        Neck = "Peacock Amulet",
        Ear1 = "Merman's Earring",
        Ear2 = "Brutal Earring",
        Body = "Hecatomb Harness",
        Hands = "Hct. Mittens +1",
        Ring1 = "Rajas Ring",
        Ring2 = "Toreador's Ring",
        Back = "Forager's Mantle",
        Waist = "Warwolf Belt",
        Legs = "Dusk Trousers +1",
        Feet = "Hct. Leggings +1"
	},
	WS_Accuracy = {
		Head = "Optical Hat",
        Neck = "Peacock Amulet",
        Ear1 = "Merman's Earring",
        Ear2 = "Brutal Earring",
        Body = "Hecatomb Harness",
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
        Neck = "Peacock Amulet",
        Ear1 = "Merman's Earring",
        Ear2 = "Brutal Earring",
        Body = "Hecatomb Harness",
        Hands = "Hct. Mittens +1",
        Ring1 = "Rajas Ring",
        Ring2 = "Flame Ring",
        Back = "Forager's Mantle",
        Waist = "Warwolf Belt",
        Legs = "Dusk Trousers +1",
        Feet = "Hct. Leggings +1"
	},
	ShieldBreak = {
        Head = "Optical Hat",
        Neck = "Peacock Amulet",
        Ear1 = "Merman's Earring",
        Ear2 = "Brutal Earring",
        Body = "Homam Corazza",
        Hands = "Homam Manopolas",
        Ring1 = "Rajas Ring",
        Ring2 = "Toreador's Ring",
        Back = "Forager's Mantle",
        Waist = "Life Belt",
        Legs = "Homam Cosciales",
        Feet = "Homam Gambieras",
	},
	Preshot = {},
	Midshot = {},
	Precast = {
		Ear1 = "Loquac. Earring",
		Legs = "Homam Cosciales"
	},
	Midcast = {
		Ear2 = "Magnetic Earring", -- 8 SIRD
		Neck = "Willpower Torque", --5 SIRD
	},
	Endcast = {
		Head = "Homam Zucchetto",
		Ear1 = "Loquac. Earring",
		Hands = "Dusk Gloves +1",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Endcast_Elemental = {
		Head = "Homam Zucchetto",
        Neck = "Elemental Torque",
        Ear2 = "Phtm. Earring +1",
        Hands = "Homam Manopolas",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Back = "Merciful Cape",
        Waist = "Sonic Belt",
        Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Endcast_Dark = {
        Head = "Homam Zucchetto",
        Neck = "Dark Torque",
        Ear2 = "Phtm. Earring +1",
        Hands = "Homam Manopolas",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Back = "Merciful Cape",
        Waist = "Sonic Belt",
        Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Endcast_Enfeebling = {
		Head = "Homam Zucchetto",
        Neck = "Enfeebling Torque",
        Ear2 = "Phtm. Earring +1",
        Hands = "Homam Manopolas",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Back = "Altruistic Cape",
        Waist = "Sonic Belt",
        Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Endcast_Enhancing = {
		Head = "Homam Zucchetto",
		Ear1 = "Loquac. Earring",
		Hands = "Homam Manopolas",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
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
        Ring1 = "Merman's Ring",
        Ring2 = "Merman's Ring",
		Legs = "Blood Cuisses",
        Feet = "Blood Greaves"
	},
	LastResort = {},
	Souleater = {},
	WeaponBash = {},
	Day = {Ear1 = "Fenrir's Earring"},
	Zerg = {
		Ammo = "Happy Egg",
		Head = "Homam Zucchetto",
		Neck = "Evasion Torque",
		Ear1 = "Cassie Earring",
		Ear2 = "Brutal Earring",
		Body = "Gloom Breastplate",
		Hands = "Dusk Gloves +1",
		Ring1 = "Bomb Queen Ring",
		Ring2 = "Toreador's Ring",
		Back = "Gigant Mantle",
		Waist = "Ocean Sash",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras" 
	}
};

local profile = {};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	--Universal Binds
	helpers.CreateUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /lock /lac fwd lockable");
	
	--Mode Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^- /lac fwd mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mode /lac fwd mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /base /lac fwd base");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mdt /lac fwd mdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /pdt /lac fwd pdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /zerg /lac fwd zerg");
	
	--Tp Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /baseset /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /power /lac fwd power");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /hybrid /lac fwd hybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /acc /lac fwd acc");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateToggle("MC", true);
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	varhelper.CreateCycle("Mode", { [1] = "Base",  [2] = "PDT", [3] = "MDT", [4] = "Zerg" });
	varhelper.CreateCycle("Priority", { [1] = "Hybrid", [2] = "Accuracy", [3] = "Power"  });

	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");

	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 10");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
	
	--tCrossbar
	AshitaCore:GetChatManager():QueueCommand(1, "/addon load tcrossbar");
end

profile.OnUnload = function()
	--Universal Unbinds
	helpers.DestroyUniversalBinds();

	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /lock");

	--Mode Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^-");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /base");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /pdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /zerg");

	--Tp Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^=");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /power");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /hybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /acc");
	
	--Delay Midcast unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mc");
	
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
	elseif (args[1] == "base") then --Priority
		varhelper.SetCycle("Mode", 1);
	elseif (args[1] == "pdt") then --Pdt Mode
		varhelper.SetCycle("Mode", 2);
	elseif (args[1] == "mdt") then -- Mdt Mode
		varhelper.SetCycle("Mode", 3);
	elseif (args[1] == "zerg") then --Eva Mode
		varhelper.SetCycle("Mode", 4);
	elseif (args[1] == "baseset") then --Cycle TP Sets
		varhelper.AdvanceCycle("Priority");
	elseif (args[1] == "hybrid") then --Hybrid
		varhelper.SetCycle("Priority", 1);
	elseif (args[1] == "acc") then --Accuracy
		varhelper.SetCycle("Priority", 2);
	elseif (args[1] == "power") then --Power
		varhelper.SetCycle("Priority", 3);
	elseif (args[1] == "mc") then 
		varhelper.AdvanceToggle("MC");
	else 
		helpers.ExecuteCommand(args[1]);
	end
end

profile.HandleDefault = function()
	local equipment = gData.GetEquipment();
	local player = gData.GetPlayer();
	local environment = gData.GetEnvironment();
	local souleater = gData.GetBuffCount("Souleater");
	
	if (varhelper.GetCycle("Lockable") == "Always") then
		helpers.LockUsableEquipment(equipment);
	end

	if (varhelper.GetCycle("Mode") == "Zerg") then
		gFunc.EquipSet(sets.Zerg);
	else
		--Resting
		if (player.Status == "Resting") then
			--Wait 18 before swapping to rest set
			helpers.RestingHelper(true, sets.Resting);
		else
			helpers.RestingHelper(false, sets.Resting);
			--Engaged
			if (player.Status == "Engaged") then
				if (varhelper.GetCycle("Mode") == "Base") then
					gFunc.EquipSet("Engaged_" .. varhelper.GetCycle("Priority"));
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
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	gFunc.EquipSet(common.sets.Blink)
	
	if(ability.Name == "Last Resort") then
		gFunc.EquipSet(sets.LastResort);
	elseif (ability.Name == "Souleater") then
		gFunc.EquipSet(sets.Souleater);
	elseif (ability.Name == "Weapon Bash") then
		gFunc.EquipSet(sets.WeaponBash);
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
	local player = gData.GetPlayer();
	local spell = gData.GetAction(); 
	local environment = gData.GetEnvironment();
	
	gFunc.InterimEquipSet(sets.Midcast);
	
	--Elemental Magic
	if (spell.Skill == "Elemental Magic") then	
		gFunc.EquipSet(sets.Endcast_Elemental);
		
		if(helpers.ObiCheck(environment, spell.Element)) then
			gFunc.Equip("waist", common.ElementalObiTable[spell.Element]);
		end
	--Dark Magic
	elseif (spell.Skill == "Dark Magic") then
		gFunc.EquipSet(sets.Endcast_Dark);
		if (spell.Name == "Drain" or spell.Name == "Drain II" or spell.Name == "Aspir")  then
			--Obi Check
			if(helpers.ObiCheck(environment, spell.Element)) then
				gFunc.Equip("waist", common.ElementalObiTable[spell.Element]);
			end
		end	
	--Enhancing Magic
	elseif (spell.Skill == "Enfeebling Magic") then
		gFunc.EquipSet(sets.Endcast_Enfeebling);
	--Enhancing Magic
	elseif (spell.Skill == "Enhancing Magic") then
		gFunc.EquipSet(sets.Endcast_Enhancing);
	else
		gFunc.EquipSet(sets.Endcast);
	end
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
		gFunc.EquipSet(sets["WS_" .. varhelper.GetCycle("Priority")]);
		
		if (helpers.TimeCheck(environment, "Daytime")) then
			gFunc.EquipSet(sets.Day);
		end
	else
		gFunc.EquipSet(sets["WS_" .. varhelper.GetCycle("Priority")]);
	end
	
	if (ws.Name == "Shield Break") then
		gFunc.EquipSet(sets.ShieldBreak);
	end

	--Gorgets
	gFunc.Equip("neck", common.ElementalGorgetTable[ws.Name]);
end

return profile;