local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.07;
};

local healingBreathThresholdLookup = {
    ["WHM"] = 742,
    ["RDM"] = 742,
	["BLM"] = 742,
    ["BLU"] = 742,
    ["PLD"] = 495,
    ["DRK"] = 495,
    ["NIN"] = 495,
};

local sets = {
	Idle = {
		Neck = "Jeweled Collar +1",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Hands = "Homam Manopolas",
		Ring1 = "Merman's Ring",  
		Ring2 = "Merman's Ring",
		Back = "Boxer's Mantle",
		Legs = "Blood Cuisses",
		Feet = "Blood Greaves"
	},
	Resting = {},
	Engaged_Hybrid = {
		Head = "Homam Zucchetto",
		Neck = "Love Torque",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Homam Corazza",
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
		Ear1 = "Beastly Earring",
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
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Homam Corazza",
		Hands = "Dusk Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"
	},
	WS_Single = {
        Head = "Maat's Cap",
        Neck = "Love Torque",
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
        Neck = "Love Torque",
        Ear1 = "Beastly Earring",
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
		Head = "Maat's Cap",
        Neck = "Love Torque",
        Ear1 = "Beastly Earring",
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
	WS_Power = {
		Head = "Maat's Cap",
        Neck = "Love Torque",
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
	Preshot = {ammo = "Pebble"},
	Midshot = {
		Legs = "Dusk Trousers +1",
		Feet = "Homam Gambieras" 
	},
	Precast = {
		Head = "Drachen Armet",
		Ear1 = "Loquac. Earring",
		Legs = "Homam Cosciales"
	},
	Midcast = {},
	Endcast = {
		Head = "Homam Zucchetto",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Hands = "Dusk Gloves +1",
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
	AncientCircle = {Legs = "Drn. Brais +1"},
	SpiritLink = {},
	Jump = {
		Head = "Maat's Cap",
        Neck = "Love Torque",
        Ear1 = "Beastly Earring",
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
	HighJump = {
		Head = "Maat's Cap",
        Neck = "Love Torque",
        Ear1 = "Beastly Earring",
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
	BreathProc = {
		Head = "Drachen Armet",
		Neck = "Evasion Torque",
		Ear1 = "Cassie Earring",
		Body = "Homam Corazza",
		Hands = "Homam Manopolas",
		Ring1 = "Bomb Queen Ring",
		Ring2 = "Toreador's Ring",
		Back = "Gigant Mantle",
		Waist = "Ocean Sash",
		Legs = "Homam Cosciales",
		Feet = "Homam Gambieras"        
	},
	BreathEffect = {
		Head = "Wym. Armet +1",
		Body = "Wyvern Mail",
		Legs = "Drn. Brais +1",
		Feet = "Homam Gambieras" 
	},
	Day = {Ear1 = "Fenrir's Earring"}
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
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /baseset /lac fwd baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /power /lac fwd power");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /hybrid /lac fwd hybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /acc /lac fwd acc");
	
	--Carbonara Toggle
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /carbonara /lac fwd carbonara");
	
	--Force Proc Toggle
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /forceproc /lac fwd forceproc");
	
	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	varhelper.CreateCycle("Priority", { [1] = "Hybrid", [2] = "Accuracy", [3] = "Power"  });
	varhelper.CreateCycle("Mode", { [1] = "Base",  [2] = "PDT", [3] = "MDT",  } );
	varhelper.CreateToggle("Carbonara", false);
	varhelper.CreateToggle("ForceProc", false);
	varhelper.CreateToggle("MC", true);
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 6");
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
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /baseset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /power");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /hybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /acc");
	
	--Carbonara Toggle
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /carbonara");
	
	--Force Proc Toggle
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /forceproc");
	
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
	elseif (args[1] == "baseset") then --Cycle TP Sets
		varhelper.AdvanceCycle("Priority");
	elseif (args[1] == "hybrid") then --Hybrid
		varhelper.SetCycle("Priority", 1);
	elseif (args[1] == "acc") then --Accuracy
		varhelper.SetCycle("Priority", 2);
	elseif (args[1] == "power") then --Power
		varhelper.SetCycle("Priority", 3);
	elseif (args[1] == "carbonara") then --Carbonara Toggle
		varhelper.AdvanceToggle("Carbonara");
	elseif (args[1] == "forceproc") then --Force Drachen Armet Proc Set Toggle
		varhelper.AdvanceToggle("ForceProc");
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
	local petAction = gData.GetPetAction();
	
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
	
	if (petAction ~= nil and petAction.Name:startswith("Healing")) then
		gFunc.EquipSet(sets.BreathEffect);
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	
	if (ability.Name == "Jump") then
		gFunc.EquipSet(sets.Jump);
	elseif (ability.Name == "High Jump") then
		gFunc.EquipSet(sets.HighJump);
	elseif (ability.Name == "Ancient Circle") then
		gFunc.EquipSet(sets.AncientCircle);
	elseif (ability.Name == "Spirit Link") then
		gFunc.EquipSet(sets.SpiritLink);
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
	local player = gData.GetPlayer();

	gFunc.InterimEquipSet(sets.Midcast);

	local hpForComparison = player.HP;
	
	if (varhelper.GetToggle("Carbonara")) then
		hpForComparison = hpForComparison - 80;
	end

	if (hpForComparison < healingBreathThresholdLookup[player.SubJob] or varhelper.GetToggle("ForceProc")) then
		gFunc.EquipSet(sets.BreathProc);
	else
		gFunc.EquipSet(sets.Midcast);
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
	
	--Gorgets
	if (ws.Name ~= "Penta Thrust" and ws.Name ~= "Drakesbane") then
		gFunc.Equip("neck", common.ElementalGorgetTable[ws.Name]);
	end
end

return profile;