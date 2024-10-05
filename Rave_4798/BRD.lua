local varhelper = gFunc.LoadFile('common/varhelper.lua'); 
local helpers = gFunc.LoadFile('common/helpers.lua'); 
local common = gFunc.LoadFile('common/common.lua'); 

local settings = {
	SongPrecastSetHp = 1324,
	GearFastCast = 0.04;
	GearSongFastCast = 0.41;
};

local instrumentTable = {
	["Elegy"] = "Horn +1",
    ["Foe Lullaby"] = "Hamelin Flute",
    ["Requiem"] = "Hamelin Flute",
    ["Horde Lullaby"] = "Sorrowful Harp",
    ["Threnody"] = "Sorrowful Harp",
	["Finale"] = "Hamelin Flute",
    ["Paeon"] = "Ebony Harp +1",
    ["Ballad"] = "Hamelin Flute",
	["BigBallad"] = "Sorrowful Harp",
    ["Minne"] = "Hamelin Flute",
	["Minuet"] = "Cornette +1",
	["Madrigal"] = "Traversiere +1",
	["Prelude"] = "Hamelin Flute",
	["Mambo"] = "Hamelin Flute",
	["March"] = "Faerie Piccolo",
	["Etude"] = "Hamelin Flute",
	["Carol"] = "Crumhorn +1",
	["Mazurka"] = "Sorrowful Harp",
	["Hymnus"] = "Sorrowful Harp"
};

local sets = {
	Idle = {
		Main = "Terra's Staff",
        Range = "Hamelin Flute",
        Head = "Darksteel Cap +1",
        Neck = "Jeweled Collar +1",
        Ear1 = "Merman's Earring",
        Ear2 = "Merman's Earring",
        Body = "Dst. Harness +1",
        Hands = "Dst. Mittens +1",
        Ring1 = "Merman's Ring",
        Ring2 = "Merman's Ring",
        Back = "Umbra Cape",
        Waist = "Scouter's Rope",
        Legs = "Dst. Subligar +1",
        Feet = "Dst. Leggings +1"
	},
	Resting = {
		Main = "Pluto's Staff",
		Head = "Hydra Beret",
        Neck = "Checkered Scarf",
        Ear1 = "Relaxing Earring",
        Body = "Mahatma Hpl.",
		Hands = "Hydra Gloves",
        Legs = "Baron's Slops",
		Feet = "Hydra Gaiters"
	},
	Engaged = {},
	WS = {},
	Precast = {
		Ear2 = "Loquac. Earring",
		Feet = "Rostrum Pumps"
	},
	Precast_Song = {
		Head = "Brd. Roundlet +1",
        Ear2 = "Loquac. Earring",
		Body = "Sha'ir Manteel",
        Hands = "Dusk Gloves +1",
        Ring1 = "Minstrel's Ring",
        Ring2 = "Bomb Queen Ring",
        Back = "Gigant Mantle",
		Waist = "Ocean Sash",
        Legs = "Dusk Trousers +1",
        Feet = "Rostrum Pumps"
	},
	Midcast = {},
	Endcast_ConserveMp = {},
	Endcast_Cure = {
		Main = "Apollo's Staff",
        Ammo = "Hedgehog Bomb",
        Head = "Maat's Cap",
        Neck = "Faith Torque",
        Ear1 = "Novia Earring",
        Body = "Mahatma Hpl.",
        Hands = "Chl. Cuffs +1",
        Ring1 = "Aqua Ring",
        Ring2 = "Thunder Ring",
        Back = "Altruistic Cape",
        Waist = "Sonic Belt",
        Legs = "Mahatma Slops",
        Feet = "Suzaku's Sune-Ate",
	},
	Endcast_Stoneskin = {
		Main = "Neptune's Staff",
        Head = "Maat's Cap",
        Neck = "Stone Gorget",
        Body = "Mahatma Hpl.",
        Ring1 = "Aqua Ring",
        Ring2 = "Thunder Ring",
        Back = "Prism Cape",
        Waist = "Sonic Belt",
        Legs = "Mahatma Slops",
        Feet = "Suzaku's Sune-Ate"
	},
	Endcast_BuffSong = {
		Head = "Brd. Roundlet +1",
		Ear1 = "Musical Earring",
        Hands = "Chl. Cuffs +1",
        Back = "Astute Cape",
        Waist = "Sonic Belt",
        Legs = "Byakko's Haidate"
	},
	Endcast_DebuffSong = {
		Head = "Brd. Roundlet +1",
        Neck = "Temp. Torque",
        Ear1 = "Musical Earring",
        Ear2 = "Beastly Earring",
        Body = "Mahatma Hpl.",
        Hands = "Chl. Cuffs +1",
        Ring1 = "Angel's Ring",
        Ring2 = "Angel's Ring",
        Back = "Astute Cape",
        Waist = "Corsette +1",
        Legs = "Mahatma Slops",
        Feet = "Dance Shoes +1"
	},
	Preshot = {ammo = "Pebble"},
	Midshot = {},
	PDT = {
		Main = "Terra's Staff",
        Head = "Darksteel Cap +1",
        Body = "Dst. Harness +1",
        Hands = "Dst. Mittens +1",
        Back = "Umbra Cape",
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
        Legs = "Byakko's Haidate",
        Feet = "Suzaku's Sune-Ate"
	},
	HPDown = {
		Head = "Zenith Crown +1",
		Waist = "Scouter's Rope"
	},
	Ring = {Ring1 = "Minstrel's Ring"},
	Refresh = {
		Head = "displaced",
        Body = "Royal Cloak"
	},
	LockStyle = {}
};

sets.Midcast = gFunc.Combine(sets.Idle, sets.Midcast);
sets.Endcast_BuffSong = gFunc.Combine(sets.Idle,sets.Endcast_BuffSong);
sets.Endcast_DebuffSong = gFunc.Combine(sets.Idle,sets.Endcast_DebuffSong);

local profile = {};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	--Universal Binds
	helpers.CreateUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /lock /lac fwd lockable");
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd lockable");
	
	--Mode Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^- /lac fwd mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mode /lac fwd mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /base /lac fwd base");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mdt /lac fwd mdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /pdt /lac fwd pdt");
	
	--Force HP binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /forcehp /lac fwd forcehp");
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind !- /lac fwd forcehp");
	
	--Big Ballad binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /bigballad /lac fwd bigballad");
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind != /lac fwd bigballad");
	
	--Refresh Idle binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /refresh /lac fwd refresh");
	
	--Foe Lullaby Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind !` /ma \"Foe Lullaby\" <t>");
	
	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	varhelper.CreateCycle("Mode", { [1] = "Base",  [2] = "PDT", [3] = "MDT" });
	varhelper.CreateToggle("Force HP", true);
	varhelper.CreateToggle("Ballad", false);
	varhelper.CreateToggle("Refresh", false);
	varhelper.CreateToggle("MC", true);
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 8");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
	
	--tCrossbar
	AshitaCore:GetChatManager():QueueCommand(1, "/addon load tcrossbar");
end

profile.OnUnload = function()
	--Universal unbinds
	helpers.DestroyUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /lock");
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^=");
	
	--Force HP unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /forcehp");
    AshitaCore:GetChatManager():QueueCommand(-1, "/unbind !-");
	
	--Big Ballad unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /bigballad");
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind !=");
	
	--Refresh unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /refresh");
	
	--Foe Lullaby unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind !`");
	
	--Delay Midcast unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mc");
	
	--Mode Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^-");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mode");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /base");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mdt");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /pdt");
	
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
	elseif (args[1] == 'bigballad') then
		varhelper.AdvanceToggle('Ballad');
	elseif (args[1] == "forcehp") then
		varhelper.AdvanceToggle("Force HP");
	elseif (args[1] == "refresh") then
		varhelper.AdvanceToggle("Refresh");
	elseif (args[1] == 'mode') then --Cycle Modes
		varhelper.AdvanceCycle('Mode');
	elseif (args[1] == 'base') then --Tp Mode
		varhelper.SetCycle('Mode', 1);
	elseif (args[1] == 'pdt') then --Pdt Mode
		varhelper.SetCycle('Mode', 2);
	elseif (args[1] == 'mdt') then -- Mdt Mode
		varhelper.SetCycle('Mode', 3);
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
				gFunc.EquipSet(sets.Engaged);
			else
				gFunc.EquipSet(varhelper.GetCycle("Mode"));
			end
		else --Idle
			if (varhelper.GetCycle("Mode") == "Base") then
				gFunc.EquipSet(sets.Idle);
				
				--Idle Refresh
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
end

profile.HandleItem = function()
	local item = gData.GetAction();
	
	if (item.Name == 'Prism Powder') then
		gFunc.EquipSet(common.sets.Invisible);
	elseif (item.Name == 'Silent Oil') then
		gFunc.EquipSet(common.sets.Sneak);
	end
end

profile.HandlePrecast = function()
	local spell = gData.GetAction();
	local player = gData.GetPlayer();
	
    if (spell.Skill == "Singing") then
		gFunc.EquipSet(sets.Precast);
		--Force Ring Proc
		if (varhelper.GetToggle("Force HP")) then
			gFunc.ForceEquipSet(sets.HPDown);
		end
		--Use special song precast
		if (helpers.RingCheck(player, settings.SongPrecastSetHp * 0.76) or varhelper.GetToggle("Force HP")) then
			gFunc.EquipSet(sets.Precast_Song);
		end

		if (varhelper.GetToggle("MC")) then
			helpers.GetMidcastDelay(player, spell, settings.GearSongFastCast);
		end
	else
		if (varhelper.GetToggle("MC")) then
			helpers.GetMidcastDelay(player, spell, settings.GearFastCast);
		end	
		gFunc.EquipSet(sets.Precast);
	end
end

profile.HandleMidcast = function()
	local spell = gData.GetAction();

	if (varhelper.GetToggle("Refresh")) then
		gFunc.InterimEquipSet(gFunc.Combine(sets.Midcast, sets.Refresh));
	else
		gFunc.InterimEquipSet(sets.Midcast);
	end
	
    if (spell.Skill == "Singing") then
		--Elegy
		if spell.Name:endswith("Elegy") then 
			gFunc.EquipSet(sets.Endcast_DebuffSong);
			gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
			gFunc.Equip("range", instrumentTable["Elegy"]);
		--Lullaby
		elseif spell.Name:endswith("Lullaby") then
			gFunc.EquipSet(sets.Endcast_DebuffSong);
			gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
			if (spell.Name == "Foe Lullaby") then 
				gFunc.Equip("range", instrumentTable["Foe Lullaby"]);
			else
				gFunc.Equip("range", instrumentTable["Horde Lullaby"]);
			end
		--Requiem
		elseif spell.Name:startswith("Foe Requiem") then 
			gFunc.EquipSet(sets.Endcast_DebuffSong);
			gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
			gFunc.Equip("range", instrumentTable["Requiem"]);
		--Threnody
		elseif spell.Name:endswith("Threnody") then 
			gFunc.EquipSet(sets.Endcast_DebuffSong);
			gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
			gFunc.Equip("range", instrumentTable["Threnody"]);
		--Finale
		elseif spell.Name:endswith("Finale") then
			gFunc.EquipSet(sets.Endcast_DebuffSong);
			gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
			gFunc.Equip("range", instrumentTable["Finale"]);
		--Minne
		elseif spell.Name:startswith("Knight") then
			gFunc.EquipSet(sets.Endcast_BuffSong);
			gFunc.Equip("range", instrumentTable["Minne"]);
		--Minuet
		elseif spell.Name:startswith("Valor") then 
			gFunc.EquipSet(sets.Endcast_BuffSong);
			gFunc.Equip("range", instrumentTable["Minuet"]);
		--Madrigal
		elseif spell.Name:endswith("Madrigal") then 
			gFunc.EquipSet(sets.Endcast_BuffSong);
			gFunc.Equip("range", instrumentTable["Madrigal"]);
		--Prelude
		elseif spell.Name:endswith("Prelude") then
			gFunc.EquipSet(sets.Endcast_BuffSong);
			gFunc.Equip("range", instrumentTable["Prelude"]);
		--Mambo
		elseif spell.Name:endswith("Mambo") then
			gFunc.EquipSet(sets.Endcast_BuffSong);
			gFunc.Equip("range", instrumentTable["Mambo"]);
		--March
		elseif spell.Name:endswith("March") then
			gFunc.EquipSet(sets.Endcast_BuffSong);
			gFunc.Equip("range", instrumentTable["March"]);
		--Etude
		elseif spell.Name:endswith("Etude") then
			gFunc.EquipSet(sets.Endcast_BuffSong);
			gFunc.Equip("range", instrumentTable["Etude"]);
		--Carol
		elseif spell.Name:endswith("Carol") then
			gFunc.Equip("range", instrumentTable["Carol"]);
			gFunc.EquipSet(sets.Endcast_BuffSong);
		--Paeon
		elseif spell.Name:startswith("Army") then 
			gFunc.EquipSet(sets.Idle);
			gFunc.Equip("range", instrumentTable["Paeon"]);
		--Ballad
		elseif spell.Name:startswith("Mage") then
			gFunc.EquipSet(sets.Idle);
			if (varhelper.GetToggle("Ballad")) then
				gFunc.Equip("range", instrumentTable["BigBallad"]);
			else
				gFunc.Equip("range", instrumentTable["Ballad"]);
			end
		--Mazurka
		elseif spell.Name:endswith("Mazurka") then
			gFunc.EquipSet(sets.Idle);
			gFunc.Equip("range", instrumentTable["Mazurka"]);
		--Hymnus
		elseif spell.Name:endswith("Hymnus") then
			gFunc.EquipSet(sets.Idle);
			gFunc.Equip("range", instrumentTable["Hymnus"]);
		else
			gFunc.EquipSet(sets.Endcast_BuffSong);
		end
    else
		gFunc.InterimEquipSet(sets.Midcast);
		
		--Healing Magic
		if (spell.Skill == "Healing Magic") then
			if spell.Name:startswith("Cur") and spell.Name ~="Cursna" then
				gFunc.EquipSet(sets.Endcast_Cure);
			else
				gFunc.EquipSet(sets.Endcast_ConserveMp);
			end
		--Enhancing Magic
		elseif (spell.Skill == "Enhancing Magic") then
			if spell.Name == "Stoneskin" then
				gFunc.EquipSet(sets.Endcast_Stoneskin);
			else 
				gFunc.EquipSet(sets.Endcast_ConserveMp);
			end
		end
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
	
	gFunc.EquipSet(sets.WS);
	
	--Gorgets
	gFunc.Equip("neck", common.ElementalGorgetTable[ws.Name]);
end

return profile;