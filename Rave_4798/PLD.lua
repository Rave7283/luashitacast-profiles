local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.07;
};

local sets = {
	Idle = {
		Neck = "Parade Gorget",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Ring1 = "Merman's Ring",  
		Ring2 = "Merman's Ring",
		Legs = "Blood Cuisses",
		Feet = "Blood Greaves"
	},
	Resting = {
		Neck = "Parade Gorget",
		Ear1 = "Relaxing Earring",
		Ear2 = "Magnetic Earring",
		Waist = "Hierarch Belt"
	},
	Engaged_Offense = {
		Head = "Homam Zucchetto",
		Neck = "Fortitude Torque",
        Ear1 = "Merman's Earring",
        Ear2 = "Brutal Earring",
        Body = "Homam Corazza",
        Hands = "Homam Manopolas",
		Ring1 = "Rajas Ring",
        Ring2 = "Toreador's Ring",
        Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
        Feet = "Homam Gambieras" 
	},
	Engaged_Defense = {
		Head = "Homam Zucchetto",
		Neck = "Parade Gorget",
        Ear1 = "Merman's Earring",
        Ear2 = "Brutal Earring",
        Body = "Homam Corazza",
        Hands = "Homam Manopolas",
		Ring1 = "Rajas Ring",
        Ring2 = "Toreador's Ring",
        Back = "Boxer's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Blood Cuisses",
        Feet = "Blood Greaves"
	},
	Refresh = {
		Head = "displaced",
		Neck = "Parade Gorget",
		Body = "Royal Cloak",
	},
	WS = {
		Head = "Maat's Cap",
        Neck = "Fortitude Torque",
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
	WS_Single = {
		Head = "Maat's Cap",
        Neck = "Fortitude Torque",
        Ear1 = "Merman's Earring",
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
	Preshot = {},
	Midshot = {},
	Precast = {
		Ear2 = "Loquac. Earring",
		Legs = "Homam Cosciales"
	},
	Midcast = {
		Ear2 = "Magnetic Earring", --8 SIRD
		Neck = "Willpower Torque", --5 SIRD
		Feet = "Glt. Leggings +1"
	},
	Endcast_Cure = {
		Head = "Homam Zucchetto",
        Hands = "Homam Manopolas",
		Back = "Resentment Cape",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
        Feet = "Homam Gambieras" 
	},
	Endcast_Enmity = {
		Head = "Homam Zucchetto",
        Hands = "Homam Manopolas",
		Back = "Resentment Cape",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
        Feet = "Homam Gambieras" 
	},
	Endcast_MAB = {
		Head = "Homam Zucchetto",
		Ear1 = "Moldavite Earring",
		Ear2 = "Novio Earring",
        Hands = "Homam Manopolas",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
        Feet = "Homam Gambieras" 
	},
	Endcast_Stoneskin = {
		Head = "Homam Zucchetto",
		Neck = "Stone Gorget",
		Ear2 = "Magnetic Earring",
        Hands = "Homam Manopolas",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
        Feet = "Homam Gambieras" 
	},
	Endcast_ConserveMP = {
		Head = "Homam Zucchetto",
		Ear2 = "Magnetic Earring",
        Hands = "Homam Manopolas",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
        Feet = "Homam Gambieras"
	},
	Evasion = {},
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
		Back = "Resentment Cape",
		Legs = "Blood Cuisses",
        Feet = "Blood Greaves"
	},
	Sentinel = {Feet = "Vlr. Leggings +1"},
	Cover = {Head = "Gallant Coronet"},
	ShieldBash = {},
	Rampart = {Head = "Valor Coronet"},
	Chivalry = {},
	HolyCircle = {Feet = "Glt. Leggings +1"},
	HpDown = {
		Head = "remove",
		Neck = "Jeweled Collar +1",
		Ear1 = "Merman's Earring",
        Ear2 = "Merman's Earring",
		Body = "remove",
		Hands = "remove",
		Ring1 = "Serket Ring",
		Ring2 = "Ether Ring",
		Back = "Boxer's Mantle",
		Waist = "Warwolf Belt",
		Legs = "remove",
		Feet = "remove"
	},
	HpUp = {
		Head = "Homam Zucchetto",
        Body = "Homam Corazza",
        Hands = "Homam Manopolas",
		Ring1 = "Bomb Queen Ring",
		Ring2 = "Toreador's Ring",
        Back = "Gigant Mantle",
		Waist = "Ocean Sash",
		Legs = "Homam Cosciales",
        Feet = "Marine M Boots" 
	},
	Enmity = {
		Head = "Valor Coronet",
		Hands = "Homam Manopolas",
		Back = "Resentment Cape",
		Waist = "Warwolf Belt",
		Feet = "Vlr. Leggings +1"
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
	
	--Tp Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd tpset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /tpset /lac fwd tpset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /offense /lac fwd offense");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /defense /lac fwd defense");

	--Refresh Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /refresh /lac fwd refresh");

	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");

	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("TP Mode", { [1] = "Offense", [2] = "Defense" });
	varhelper.CreateCycle("Mode", { [1] = "Base", [2] = "PDT", [3] = "MDT" });
	varhelper.CreateToggle("Refresh", false);
	varhelper.CreateToggle("MC", true);
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });	
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 5");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
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

	--Tp Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^=");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /tpset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /offense");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /defense");
	
	--Refresh Unbind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /refresh /lac fwd refresh");
	
	--Delay Midcast unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mc");
	
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
	elseif (args[1] == "tpset") then --Cycle TP Sets
		varhelper.AdvanceCycle("TP Mode");
	elseif (args[1] == "tpoff") then --Offense
		varhelper.SetCycle("TP Mode", 1);
	elseif (args[1] == "tpdef") then --Defense
		varhelper.SetCycle("TP Mode", 2);
	elseif (args[1] == "refresh") then
		varhelper.AdvanceToggle("Refresh");
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
		helpers.RestingHelper(true, sets.Resting);
	else
		helpers.RestingHelper(false, sets.Resting);
		--Engaged
		if (player.Status == "Engaged") then
			if (varhelper.GetCycle("Mode") == "Base") then
				--Refresh Override Check
				if (varhelper.GetToggle("Refresh")) then
					gFunc.EquipSet(gFunc.Combine(sets["Engaged_" .. varhelper.GetCycle("TP Mode")], sets.Refresh));
				else
					gFunc.EquipSet("Engaged_" .. varhelper.GetCycle("TP Mode"));
				end
			else
				gFunc.EquipSet(varhelper.GetCycle("Mode"));
			end
		else --Idle
			if (varhelper.GetCycle("Mode") == "Base") then
				gFunc.EquipSet(sets.Idle);
				
				--Refresh Override Check
				if (varhelper.GetToggle("Refresh")) then
					gFunc.EquipSet(sets.Refresh);
				end
				
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
	gFunc.EquipSet(sets.Enmity);
	
	if (ability.Name == "Sentinel") then
		gFunc.EquipSet(sets.Sentinel);
	elseif (ability.Name == "Cover") then
		gFunc.EquipSet(sets.Cover);
	elseif (ability.Name == "Shield Bash") then
		gFunc.EquipSet(sets.ShieldBash);
	elseif (ability.Name == "Rampart") then
		gFunc.EquipSet(sets.Rampart);
	elseif (ability.Name == "Chivalry") then
		gFunc.EquipSet(sets.Chivalry);
	elseif (ability.Name == "Holy Circle") then
		gFunc.EquipSet(sets.HolyCircle);
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
	local spell = gData.GetAction(); 
	gFunc.InterimEquipSet(sets.Midcast);
	
	--Divine Magic
	if (spell.Skill == "Divine Magic") then
		if (spell.Name:startswith("Banish") or spell.Name == "Holy") then
			gFunc.EquipSet(sets.Endcast_MAB);
		else
			gFunc.EquipSet(sets.Endcast_Enmity);
		end
	--Healing Magic
	elseif (spell.Skill == "Healing Magic") then
		if spell.Name:startswith("Cur") and spell.Name ~="Cursna" then
			gFunc.EquipSet(sets.Endcast_Cure);
		else
			gFunc.EquipSet(sets.Endcast_ConserveMP);
		end
	--Enhancing Magic
	elseif (spell.Skill == "Enhancing Magic") then
		if spell.Name == "Stoneskin" then
			gFunc.EquipSet(sets.Endcast_Stoneskin);
		else 
			gFunc.EquipSet(sets.Endcast_ConserveMP);
		end
	else
		gFunc.EquipSet(sets.Endcast_Enmity);
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
	
	if (helpers.AccBoostedCheck(ws)) then
		gFunc.EquipSet(sets.WS_Single);
	elseif (ws.Name == "Starlight" or ws.Name == "Moonlight") then
		return;
	else
		gFunc.EquipSet(sets.WS);
	end
	
	--Gorgets
	gFunc.Equip("neck", common.ElementalGorgetTable[ws.Name]);
end

return profile;