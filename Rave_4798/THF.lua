local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.07;
};

local sets = {
	Idle = {
		Head = "Rog. Bonnet +1",
		Neck = "Evasion Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Body = "Scp. Harness +1",
		Hands = "War Gloves +1",
		Ring1 = "Merman's Ring",
        Ring2 = "Merman's Ring",
		Back = "Boxer's Mantle",
		Waist = "Scouter's Rope",
		Legs = "Raven Hose",
		Feet = "Dance Shoes +1"
	},
	IdleEva = {
		Head = "Rog. Bonnet +1"
	},
	Resting = {},
	Engaged_Hybrid = {
		Head = "Homam Zucchetto",
		Neck = "Love Torque",
		Ear1 = "Stealth Earring",
		Ear2 = "Brutal Earring",
		Body = "Rapparee Harness",
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
		Neck = "Love Torque",
		Ear1 = "Stealth Earring",
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
	Engaged_Power = {
		Head = "Homam Zucchetto",
		Neck = "Love Torque",
		Ear1 = "Stealth Earring",
		Ear2 = "Brutal Earring",
		Body = "Rapparee Harness",
		Hands = "Dusk Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Flame Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Engaged_SA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Stealth Earring",
		Ear2 = "Brutal Earring",
		Body = "Dragon Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	Engaged_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Breeze Ring",
		Back = "Forager's Mantle",
		Waist = "R.K. Belt +2",
		Legs = "Dusk Trousers +1",
		Feet = "Marine M Boots"
	},
	Engaged_SA_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Single = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Dragon Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Single_SA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Dragon Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Single_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Breeze Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Single_SA_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Hybrid = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Hecatomb Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Hybrid_SA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Dragon Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Hybrid_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Breeze Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Hybrid_SA_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Accuracy = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Homam Corazza",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Life Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Accuracy_SA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Homam Corazza",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Life Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Accuracy_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Homam Corazza",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Life Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Accuracy_SA_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Homam Corazza",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Life Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Power = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Dragon Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Power_SA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Brutal Earring",
		Body = "Dragon Harness",
		Hands = "Hct. Mittens +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Power_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Breeze Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	WS_Power_SA_TA = {
		Head = "Maat's Cap",
		Neck = "Love Torque",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Hands = "Rog. Armlets +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Thunder Ring",
		Back = "Forager's Mantle",
		Waist = "Warwolf Belt",
		Legs = "Dusk Trousers +1",
		Feet = "Hct. Leggings +1"
	},
	Preshot = {},
	Midshot = {
		Head = "Optical Hat",
		Neck = "Peacock Amulet",
		Ear1 = "Genin Earring",
		Ear2 = "Drone Earring",
		Body = "Dragon Harness",
		Ring1 = "Merman's Ring", 
		Ring2 = "Behemoth Ring +1", 
		Back = "Amemet Mantle +1",
		Waist = "R.K. Belt +2",
		Legs = "Dusk Trousers +1",
		Feet = "Homam Gambieras"
	},
	Midshot_Bloody = {
        Head = "Maat's Cap",
        Neck = "Prudence Torque",
        Ear1 = "Phtm. Earring +1",
        Ear2 = "Phtm. Earring +1",
        Body = "Dragon Harness",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Back = "Amemet Mantle +1",
        Waist = "R.K. Belt +2",
        Legs = "Dusk Trousers +1",
        Feet = "Homam Gambieras",
    },
	Precast = {
		Ear2 = "Loquac. Earring",
		Legs = "Homam Cosciales"
	},
	Midcast = {
		Head = "Rog. Bonnet +1"
	},
	Endcast = {
		Head = "Homam Zucchetto",
		Neck = "Evasion Torque",
		Ear1 = "Novia Earring",
		Ear2 = "Loquac. Earring",
		Body = "Rapparee Harness",
		Hands = "Dusk Gloves +1",
		Back = "Boxer's Mantle",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	Endcast_ConserveMP = {
		Ear1 = "Magnetic Earring"
	},
	Evasion = {
		Head = "Optical Hat",
		Neck = "Evasion Torque",
		Ear1 = "Musical Earring",
		Ear2 = "Novia Earring",
		Body = "Scp. Harness +1",
		Hands = "War Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Breeze Ring",
		Back = "Boxer's Mantle",
		Waist = "Scouter's Rope",
		Legs = "Raven Hose",
		Feet = "Dance Shoes +1"
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
		Back = "Resentment Cape",
	},
	Flee = {Feet = "Rogue's Poulaines"},
	TrickAttack = {Hands = "Rog. Armlets +1"},
	Hide = {},
	Steal = {
		Head = "Rog. Bonnet +1",
        Neck = "Jeweled Collar +1", --Make sure evasion torque isn't on
        Ear1 = "Cassie Earring",
        Body = "Homam Corazza",
        Hands = "Thief's Kote",
        Ring1 = "Bomb Queen Ring",
        Ring2 = "Rogue's Ring",
        Back = "Gigant Mantle",
        Waist = "Ocean Sash",
        Legs = "Assassin's Culottes",
        Feet = "Rogue's Poulaines"
	},
	Mug = {},
    TH = {
        Neck = "Nanaa's Charm",
		Hands = "Asn. Armlets +1"
    },
	EnmityUp = {
		Hands = "Asn. Armlets +1",
		Back = "Assassin's Cape",
		Waist = "Warwolf Belt",
		Legs = "Assassin's Culottes"
	},
	HpDown = {
	},
	MovementSpeed = {Feet = "Trotter Boots"}
};

sets.Idle = gFunc.Combine(sets.Idle, sets.MovementSpeed);
sets.Midcast = gFunc.Combine(sets.Evasion, sets.Midcast);
sets.PDT = gFunc.Combine(sets.Evasion, sets.PDT)
sets.Hide = gFunc.Combine(sets.EnmityUp, sets.Hide);
sets.Bully = gFunc.Combine(sets.EnmityUp, sets.TH);
sets.Mug = gFunc.Combine(gFunc.Combine(sets.EnmityUp, sets.TH), sets.Mug);
sets.HpDown = gFunc.Combine(sets.PDT, sets.HpDown);

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
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /eva /lac fwd eva");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mdt /lac fwd mdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /pdt /lac fwd pdt");
	
	--Tp Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /baseset /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /power /lac fwd power");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /hybrid /lac fwd hybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /acc /lac fwd acc");
	
	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");
	
	--TH Toggle Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /th /lac fwd th");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateToggle("TH", false);
	varhelper.CreateToggle("MC", true);
	varhelper.CreateCycle("Priority", { [1] = "Hybrid", [2] = "Accuracy", [3] = "Power" });
	varhelper.CreateCycle("Mode", { [1] = "Base", [2] = "Evasion", [3] = "PDT", [4] = "MDT" });	
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 2");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
	
	--tCrossbar
	AshitaCore:GetChatManager():QueueCommand(-1, "/addon load tcrossbar");
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
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /eva");
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
	
	--TH Toggle Unbind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /th");
	
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
	elseif (args[1] == "eva") then --Eva Mode
		varhelper.SetCycle("Mode", 2);
	elseif (args[1] == "pdt") then --Pdt Mode
		varhelper.SetCycle("Mode", 3);
	elseif (args[1] == "mdt") then -- Mdt Mode
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
	elseif (args[1] == "th") then
		varhelper.AdvanceToggle("TH");
		
		if (varhelper.GetToggle("TH")) then
			gFunc.ForceEquipSet(sets.TH);
			gFunc.Disable("neck", false);
			gFunc.Disable("hands", false);
		else
			gFunc.Enable("neck", false);
			gFunc.Enable("hands", false);
		end
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
	local sa = gData.GetBuffCount("Sneak Attack");
    local ta = gData.GetBuffCount("Trick Attack");
	
	--Resting
	if (player.Status == "Resting") then
		--Wait 18 before swapping to rest set
		helpers.RestingHelper(true, sets.Resting);
	else
		helpers.RestingHelper(false, sets.Resting);
		--Engaged
		if (player.Status == "Engaged") then
			if (sa == 1) and (ta == 1) then
				gFunc.EquipSet(sets.Engaged_SA_TA);
			elseif (sa == 1) then
				gFunc.EquipSet(sets.Engaged_SA);
			elseif (ta == 1) then
				gFunc.EquipSet(sets.Engaged_TA);
			else 
				if (varhelper.GetCycle("Mode") == "Base") then
					gFunc.EquipSet(sets["Engaged_" .. varhelper.GetCycle("Priority")]);
				else
					gFunc.EquipSet(varhelper.GetCycle("Mode"));
				end
			end
		else --Idle
			if (varhelper.GetCycle("Mode") == "Base") then
				gFunc.EquipSet(sets.Idle);
					
				--Lockable Override
				if (varhelper.GetCycle("Lockable") == "Idle") then
					gFunc.EquipSet(helpers.BuildLockableSet(equipment));
				end
			else
				gFunc.EquipSet(varhelper.GetCycle("Mode"));

				if (varhelper.GetCycle("Mode") == "Evasion") then
					gFunc.EquipSet(sets.IdleEva);
				end
			end

			helpers.DucalAketonCheck(environment);

			--Movement speed Override
			if (player.IsMoving) then
				gFunc.EquipSet(sets.MovementSpeed);
			end
		end
	end
	
	
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	gFunc.EquipSet(common.sets.Blink)

	if (ability.Name == "Flee") then
		gFunc.EquipSet(sets.Flee);
	elseif (ability.Name == "Hide") then
		gFunc.EquipSet(sets.Hide);
	elseif (ability.Name == "Steal") then
		gFunc.ForceEquipSet(sets.HPDown);
		gFunc.EquipSet(sets.Steal);
	elseif (ability.Name == "Mug") then
		gFunc.EquipSet(sets.Mug);
	elseif (ability.Name == "Trick Attack") then
		gFunc.EquipSet(sets.TrickAttack);
	elseif (ability.Name == "Bully") then
		gFunc.EquipSet(sets.Bully);
	elseif (ability.Name == "Accomplice" or ability.Name == "Collaborator") then
		gFunc.EquipSet(sets.EnmityUp);
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
	gFunc.EquipSet(sets.Endcast);

	if (spell.MpCost ~= nil and spell.MpCost > 0) then
		gFunc.EquipSet(sets.Endcast_ConserveMP);
	end
end

profile.HandlePreshot = function()
	gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
	local environment = gData.GetEnvironment();
	local equipment = gData.GetEquipment();
	
	if (equipment["Ammo"] ~= nil and equipment["Ammo"].Name == "Bloody Bolt") then
		gFunc.EquipSet(sets.Midshot_Bloody);
		
		if (helpers.ObiCheck(environment, "Dark")) then
			gFunc.Equip("waist", common.ElementalObiTable["Dark"]);
		end
	else
		gFunc.EquipSet(sets.Midshot);
	end
end

profile.HandleWeaponskill = function()
	local ws = gData.GetAction();	
	local sata = "";	
	if (gData.GetBuffCount("Sneak Attack") == 1) then sata = sata + "_SA" end
	if (gData.GetBuffCount("Trick Attack") == 1) then sata = sata + "_TA" end
	
	if (helpers.AccBoostedCheck(ws)) then
		gFunc.EquipSet(sets["WS_Single" .. sata]);
	else
		gFunc.EquipSet(sets["WS_" .. varhelper.GetCycle("Priority") .. sata]);
	end
		
	--Gorgets
	if (ws.Name ~= "Dancing Edge" and ws.Name ~= "Evisceration") then
		gFunc.Equip("neck", common.ElementalGorgetTable[ws.Name]);
	end
end

return profile;