local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	NukeSetHp = 942,
	NukeSetMp = 751,
	GearFastCast = 0.04,
	HpOffset = {
		["WHM"] = 38,
		["RDM"] = 56,
		["DRG"] = 79,
		["NIN"] = 56
	},
	MpOffset = {
		["WHM"] = 78,
		["RDM"] = 59
	}
};

settings.FirstNukeThreshold3 = settings.NukeSetMp + 55
settings.FirstNukeThreshold2 = settings.FirstNukeThreshold3 + 20;
settings.FirstNukeThreshold1 = settings.FirstNukeThreshold2 + 50;

local sets = {
	Idle = {
		Main = "Terra's Staff",
		Ammo = "Hedgehog Bomb",
		Head = "Zenith Crown +1",
        Neck = "Jeweled Collar +1",
        Ear1 = "Merman's Earring",
        Ear2 = "Merman's Earring",
        Body = "Sorcerer's Coat",
        Hands = "Src. Gloves +1",
		Ring1 = "Merman's Ring",  
		Ring2 = "Merman's Ring",
        Back = "Umbra Cape",
        Waist = "Hierarch Belt",
        Legs = "Src. Tonban +1",
        Feet = "Src. Sabots +1"
	},
	Idle_Spikes = {
		Ring2 = "Opuntia Hoop"
	},
	Resting = {
		Main = "Pluto's Staff",
        Ammo = "Hedgehog Bomb",
        Head = "Hydra Beret",
        Neck = "Checkered Scarf",
        Ear1 = "Relaxing Earring",
        Ear2 = "Magnetic Earring",
        Body = "Mahatma Hpl.",
        Hands = "Hydra Gloves",
		Ring1 = "Serket Ring",
        Back = "Merciful Cape",
        Waist = "Hierarch Belt",
        Legs = "Wzd. Tonban +1",
        Feet = "Hydra Gaiters"
	},
	Engaged = {},
	Precast = {
		Ear1 = "Loquac. Earring",
		Ring1 = "Serket Ring",
		Back = "Gigant Mantle",
		Feet = "Rostrum Pumps"
	},
	Precast_ForceHP = {
		Head = "Zenith Crown +1",
		Neck = "Checkered Scarf",
		Ear1 = "Loquac. Earring",
		Hands = "Zenith Mitts",
		Ring1 = "Serket Ring",
		Legs = "Zenith Slacks",
		Feet = "Rostrum Pumps"
	},
	Midcast = {
		Main = "Eremite's Wand", --25 SIRD
		Sub = "Genbu's Shield", --10 PDT
		Head = "Nashira Turban", --10 SIRD
		Neck = "Willpower Torque", --5 SIRD
		Ear2 = "Magnetic Earring", -- 8 SIRD
		Back = "Umbra Cape", -- 6/12 PDT
		Waist = "Sorcerer's Belt", --8 SIRD
		Feet = "Wizard's Sabots" --20 SIRD
	},
	Endcast_Nuke_Power = {
        Ammo = "Phtm. Tathlum",
        Head = "Maat's Cap",
        Neck = "Prudence Torque",
        Ear1 = "Moldavite Earring",
        Ear2 = "Novio Earring",
        Body = "Genie Weskit",
        Hands = "Zenith Mitts",
        Ring1 = "Snow Ring",
        Ring2 = "Omniscient Ring",
        Back = "Prism Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Mahatma Slops",
        Feet = "Src. Sabots +1"
	},
	Endcast_Nuke_Acc = {
		Ammo = "Phtm. Tathlum",
        Head = "Src. Petasos +1",
        Neck = "Prudence Torque",
        Ear1 = "Moldavite Earring",
        Ear2 = "Novio Earring",
        Body = "Genie Weskit",
        Hands = "Wzd. Gloves +1",
        Ring1 = "Snow Ring",
        Ring2 = "Omniscient Ring",
        Back = "Prism Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Mahatma Slops",
        Feet = "Src. Sabots +1"
	},
	Endcast_Nuke_Enmity = {
		Ammo = "Hedgehog Bomb", --1
		Head = "Src. Petasos +1", --3
		Neck = "Prudence Torque",
		Ear1 = "Novia Earring", --7
		Ear2 = "Novio Earring",
		Body = "Mahatma Hpl.", --4
		Hands = "Wzd. Gloves +1", --2
		Ring1 = "Snow Ring",
        Ring2 = "Omniscient Ring",
		Back = "Prism Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Mahatma Slops", --4
        Feet = "Src. Sabots +1" --2
	},
	Endcast_ElementalDebuff_Power = {
        Main = "Kirin's Pole",
		Ammo = "Phtm. Tathlum",
        Head = "Maat's Cap",
        Neck = "Prudence Torque",
        Ear1 = "Phtm. Earring +1",
        Ear2 = "Phtm. Earring +1",
        Body = "Mahatma Hpl.",
        Hands = "Wzd. Gloves +1",
        Ring1 = "Snow Ring",
        Ring2 = "Omniscient Ring",
        Back = "Prism Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Mahatma Slops",
        Feet = "Src. Sabots +1"
	},
	Endcast_ElementalDebuff_Acc = {
		Ammo = "Phtm. Tathlum",
        Head = "Src. Petasos +1",
        Neck = "Prudence Torque",
        Ear1 = "Phtm. Earring +1",
        Ear2 = "Phtm. Earring +1",
        Body = "Genie Weskit",
        Hands = "Wzd. Gloves +1",
        Ring1 = "Snow Ring",
        Ring2 = "Omniscient Ring",
        Back = "Merciful Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Mahatma Slops",
        Feet = "Nashira Crackows"
	},
	Endcast_Dark = {
		Ammo = "Phtm. Tathlum",
        Head = "Nashira Turban",
        Neck = "Dark Torque",
		Ear1 = "Loquac. Earring",
        Ear2 = "Phtm. Earring +1",
        Body = "Nashira Manteel",
        Hands = "Src. Gloves +1",
        Ring1 = "Snow Ring",
        Ring2 = "Omniscient Ring",
        Back = "Merciful Cape",
        Waist = "Swift Belt",
        Legs = "Wzd. Tonban +1",
        Feet = "Rostrum Pumps"
	},
	Endcast_Enfeebling = {
		Ammo = "Dream Sand",
		Head = "Genie Tiara",
        Neck = "Enfeebling Torque",
        Body = "Wzd. Coat +1",
		Hands = "Nashira Gages",
        Back = "Altruistic Cape",
        Legs = "Nashira Seraweels",
        Feet = "Rostrum Pumps"
	},
	Endcast_EnfeeblingMnd = {
		Ring1 = "Aqua Ring",
        Ring2 = "Thunder Ring",
	},
	Endcast_EnfeeblingInt = {
		Ammo = "Phtm. Tathlum",
		Ear1 = "Phtm. Earring +1",
		Ear2 = "Phtm. Earring +1",
		Ring1 = "Snow Ring",
        Ring2 = "Omniscient Ring",
		Waist = "Sorcerer's Belt"
	},
	Endcast_Healing = {
		Main = "Apollo's Staff",
		Ammo = "Dream Sand",
		Head = "Nashira Turban",
		Ear1 = "Loquac. Earring",
		Ear2 = "Novia Earring",
		Body = "Wzd. Coat +1",
		Hands = "Hydra Gloves",
		Ring1 = "Serket Ring",
		Back = "Altruistic Cape",
        Waist = "Swift Belt",
        Legs = "Mahatma Slops",
        Feet = "Hydra Gaiters"
	},
	Endcast_ConserveMP = {
		Ammo = "Dream Sand",
		Head = "Nashira Turban",
		Neck = "Uggalepih Pendant",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Body = "Nashira Manteel",
		Hands = "Zenith Mitts",
		Ring1 = "Serket Ring",
		Back = "Merciful Cape",
		Waist = "Swift Belt",
		Legs = "Nashira Seraweels",
		Feet = "Src. Sabots +1"
	},
	Endcast_Spikes = {
        Main = "Kirin's Pole",
        Ammo = "Dream Sand",
        Head = "Zenith Crown +1",
        Neck = "Prudence Torque",
        Ear1 = "Loquac. Earring",
        Ear2 = "Magnetic Earring",
        Body = "Mahatma Hpl.",
        Hands = "Wzd. Gloves +1",
        Ring1 = "Serket Ring",
        Ring2 = "Omniscient Ring",
        Back = "Prism Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Mahatma Slops",
        Feet = "Src. Sabots +1",
    },
	Endcast_Stoneskin = {
		Main = "Kirin's Pole",
		Ammo = "Dream Sand",
		Head = "Zenith Crown +1",
		Neck = "Stone Gorget",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
        Body = "Mahatma Hpl.",
		Hands = "Devotee's Mitts",
		Ring1 = "Aqua Ring",
		Ring2 = "Aqua Ring",
		Waist = "Swift Belt",
        Back = "Prism Cape",
        Legs = "Zenith Slacks",
        Feet = "Rostrum Pumps"
	},
	Endcast_Drain = {
		Ammo = "Phtm. Tathlum",
        Head = "Nashira Turban",
        Neck = "Dark Torque",
		Ear1 = "Loquac. Earring",
        Ear2 = "Phtm. Earring +1",
        Body = "Nashira Manteel",
        Hands = "Src. Gloves +1",
        Ring1 = "Snow Ring",
        Ring2 = "Overlord's Ring",
        Back = "Merciful Cape",
        Waist = "Swift Belt",
        Legs = "Wzd. Tonban +1",
        Feet = "Rostrum Pumps"
	},
	Endcast_Aspir = {
		Ammo = "Phtm. Tathlum",
        Head = "Nashira Turban",
        Neck = "Dark Torque",
		Ear1 = "Loquac. Earring",
        Ear2 = "Phtm. Earring +1",
        Body = "Nashira Manteel",
        Hands = "Src. Gloves +1",
        Ring1 = "Serket Ring",
        Ring2 = "Overlord's Ring",
        Back = "Merciful Cape",
        Waist = "Swift Belt",
        Legs = "Wzd. Tonban +1",
        Feet = "Rostrum Pumps"
	},
	Endcast_Stun = {
		Ammo = "Dream Sand",
        Head = "Nashira Turban",
        Neck = "Dark Torque",
		Ear1 = "Loquac. Earring",
        Ear2 = "Magnetic Earring",
        Body = "Nashira Manteel",
        Hands = "Nashira Gages",
        Ring1 = "Serket Ring",
        Ring2 = "Omniscient Ring",
        Back = "Merciful Cape",
        Waist = "Swift Belt",
        Legs = "Nashira Seraweels",
        Feet = "Rostrum Pumps"
	},
	Preshot = {ammo = "Pebble"},
	Midshot = {},
	DiabolosPole = {Main = "Diabolos's Pole"},
	Ring = {Ring2 = "Sorcerer's Ring"},
	DayMatch = {Legs = "Src. Tonban +1"},
	MagicBurst = {
		Ammo = "Dream Sand",
		Hands = "Src. Gloves +1"
	},
	FirstNuke1 = {Ammo = "Hedgehog Bomb", Head = "Zenith Crown +1", Ring1 = "Serket Ring"},
	FirstNuke2 = {Head = "Zenith Crown +1", Ammo = "Hedgehog Bomb"},
	FirstNuke3 = {Head = "Zenith Crown +1"}
 };
sets.Endcast_EnfeeblingMnd = gFunc.Combine(sets.Endcast_Enfeebling,sets.Endcast_EnfeeblingMnd)
sets.Endcast_EnfeeblingInt = gFunc.Combine(sets.Endcast_Enfeebling,sets.Endcast_EnfeeblingInt)


local profile = {};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	
	--Universal binds
	helpers.CreateUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /lock /lac fwd lockable");
	
	--Nuke Mode binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /nukemode /lac fwd nukemode");
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^- /lac fwd nukemode");
	
	--Force HP binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /forcehp /lac fwd forcehp");
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind !- /lac fwd forcehp");
	
	--Magic Burst binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mb /lac fwd mb");
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd mb");
	
	--First Nuke binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /fn /lac fwd fn");
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind != /lac fwd fn");
	
	--DOT Acc binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /dotacc /lac fwd dotacc");
    
	--Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");
	
	--Stun binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind !` /ma \"Stun\" <t>");
	
	--Elemental Seal binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^` /ja \"Elemental Seal\" <me>");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });	
	varhelper.CreateCycle("Nuke Mode", { [1] = "Power", [2] = "Acc", [3] = "Enmity" });
	varhelper.CreateToggle("Force HP", true);
	varhelper.CreateToggle("DOT Acc", false);
	varhelper.CreateToggle("MB", false);
	varhelper.CreateToggle("FN", true);
	varhelper.CreateToggle("MC", true);
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 3");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
end

profile.OnUnload = function()
	--Universal unbinds
	helpers.DestroyUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /lock");
	
	--Nuke Mode unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /nukemode");
    AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^-");
	
	--Force HP unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /forcehp");
    AshitaCore:GetChatManager():QueueCommand(-1, "/unbind !-");
	
	--Magic Burst unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mb");
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^=");
	
	--First Nuke unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /fn");
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind !=");
	
	--Delay Midcast unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /mc");
	
	--DOT Acc unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /dotacc");

	--Stun unbind
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind !`");
	
	--Elemental Seal unbind
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^`");
	
	varhelper.Destroy();
end

profile.HandleCommand = function(args)
	local action = gData.GetAction();

	if (args[1] == "lockable") then --Cycle Lockable Behavior
		--Unlock All
		if (varhelper.GetCycle("Lockable") == "Always") then
			gFunc.Enable("all");
			helpers.UnlockAll();
		end
		varhelper.AdvanceCycle("Lockable")
	elseif (args[1] == "nukemode") then --Cycle Nuke Sets
		varhelper.AdvanceCycle("Nuke Mode");
	elseif (args[1] == "mb") then 
		varhelper.AdvanceToggle("MB");
		if (varhelper.GetToggle("MB") and action ~= nil and action.Skill == "Elemental Magic") then
			gFunc.SetMidDelay(0);
			profile.HandleMidcast();
			gFunc.ForceEquipSet(sets.MagicBurst);
		end
	elseif (args[1] == "forcehp") then
		varhelper.AdvanceToggle("Force HP");
	elseif (args[1] == "fn") then
		varhelper.AdvanceToggle("FN");
	elseif (args[1] == "mc") then
		varhelper.AdvanceToggle("MC");
	elseif (args[1] == "dotacc") then
		varhelper.AdvanceToggle("DOT Acc");
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
	
	if (player.Status == "Resting") then
		--Wait 18 before swapping to rest set
		helpers.DelaySet(sets.Resting, 18);
	else
		helpers.ResetDelay();
	
		if (player.Status == "Engaged") then
			gFunc.EquipSet(sets.Engaged);		
		else
			gFunc.EquipSet(sets.Idle);
			
			if (gData.GetBuffCount("Ice Spikes") + gData.GetBuffCount("Shock Spikes") + gData.GetBuffCount("Blaze Spikes") > 0) then
				gFunc.EquipSet(sets.Idle_Spikes);
			end

			helpers.DucalAketonCheck(environment);
			
			--Lockable Override
			if (varhelper.GetCycle("Lockable") == "Idle") then
				gFunc.EquipSet(helpers.BuildLockableSet(equipment));
			end
		end
	end
end

profile.HandleAbility = function()
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
	
	if (spell.Skill == "Elemental Magic" and varhelper.GetToggle("Force HP") and not helpers.ElementalDebuffs:contains(spell.Name)) then
		gFunc.EquipSet(sets.Precast_ForceHP);
	else
		gFunc.EquipSet(sets.Precast);
	end
end

profile.HandleMidcast = function()
	local player = gData.GetPlayer();
	local spell = gData.GetAction(); 
	local environment = gData.GetEnvironment();
	
	gFunc.InterimEquipSet(sets.Midcast);
	
	--Elemental Magic
	if (spell.Skill == "Elemental Magic") then	
		gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
		
		--Ele DOTs
		if (helpers.ElementalDebuffs:contains(spell.Name)) then
			if (varhelper.GetToggle("DOT Acc")) then
				gFunc.EquipSet(sets.Endcast_ElementalDebuff_Acc);
			else
				gFunc.EquipSet(sets.Endcast_ElementalDebuff_Power);
			end	
		--Nukes
		else
			--Override Acc to Power when ES is on
			if (gData.GetBuffCount("Elemental Seal") == 1 and varhelper.GetCycle("Nuke Mode") == "Acc") then
				gFunc.EquipSet(sets.Endcast_Nuke_Power);
			else
				gFunc.EquipSet("Endcast_Nuke_" .. varhelper.GetCycle("Nuke Mode"));
			end
			--Obi Check
			if (helpers.ObiCheck(environment, spell.Element)) then
				gFunc.Equip("waist", common.ElementalObiTable[spell.Element]);
			end
			--Day Check
			if (helpers.DayCheck(environment, spell.Element) > 0) then
				gFunc.EquipSet(sets.DayMatch);
			end
			--Ugg Pendant
			if (helpers.UggPendantCheck(spell, helpers.CalculateOffset(settings.NukeSetMp, settings.MpOffset, player.SubJob) * 0.50)) then
				gFunc.EquipSet(common.sets.Pendant);
			end
			--Sorc Ring
			if (helpers.RingCheck(player, helpers.CalculateOffset(settings.NukeSetHp, settings.HpOffset, player.SubJob) * 0.76) or varhelper.GetToggle("Force HP")) then
				gFunc.EquipSet(sets.Ring);
			end
			--First Nuke 
			if (varhelper.GetToggle("FN")) then
				if (player.MP >= helpers.CalculateOffset(settings.FirstNukeThreshold1, settings.MpOffset, player.SubJob)) then
					gFunc.EquipSet(sets.FirstNuke1);
				elseif (player.MP >= helpers.CalculateOffset(settings.FirstNukeThreshold2, settings.MpOffset, player.SubJob)) then
					gFunc.EquipSet(sets.FirstNuke2);
				elseif (player.MP >= helpers.CalculateOffset(settings.FirstNukeThreshold3, settings.MpOffset, player.SubJob)) then
					gFunc.EquipSet(sets.FirstNuke3);
				end
			end
			--Magic Burst Mode
			if (varhelper.GetToggle("MB")) then
				gFunc.EquipSet(sets.MagicBurst);
			end		
		end
	--Dark Magic
	elseif (spell.Skill == "Dark Magic") then
		gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
		
		if (spell.Name == "Stun") then
			gFunc.EquipSet(sets.Endcast_Stun);
		else
			if ((spell.Name == "Drain" or spell.Name == "Aspir")) then
				gFunc.EquipSet("Endcast_" + spell.Name);

				--Diabolos Pole Check
				if (helpers.WeatherCheck(environment, spell.Element) > 0) then
					gFunc.EquipSet(sets.DiabolosPole);
				end			
			else
				gFunc.EquipSet(sets.Endcast_Dark);
			end

			--Obi Check
			if (helpers.ObiCheck(environment, spell.Element)) then
				gFunc.Equip("waist", common.ElementalObiTable[spell.Element]);
			end
		end	
	--Enfeebling Magic
	elseif (spell.Skill == "Enfeebling Magic") then
		gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
		
		if (helpers.MndDebuffs:contains(spell.Name)) then
			gFunc.EquipSet(sets.Endcast_EnfeeblingMnd);
		elseif (helpers.IntDebuffs:contains(spell.Name)) then
			gFunc.EquipSet(sets.Endcast_EnfeeblingInt);
		end
	--Healing Magic
	elseif (spell.Skill == "Healing Magic") then
		if spell.Name:startswith("Cur") and spell.Name ~="Cursna" then
			gFunc.EquipSet(sets.Endcast_Healing);
		else
			gFunc.EquipSet(sets.Endcast_ConserveMP);
		end
	--Enhancing Magic
	elseif (spell.Skill == "Enhancing Magic") then
		if (spell.Name == "Stoneskin") then
			gFunc.EquipSet(sets.Endcast_Stoneskin);
		elseif (spell.Name == "Sneak") then
			gFunc.EquipSet(sets.Endcast_ConserveMP);
			gFunc.EquipSet(common.sets.Sneak)
		elseif (spell.Name == "Invisible") then
			gFunc.EquipSet(sets.Endcast_ConserveMP);
			gFunc.EquipSet(common.sets.Invisible)
		elseif (spell.Name:endswith("Spikes")) then
			gFunc.EquipSet(sets.Endcast_Spikes)
		else 
			gFunc.EquipSet(sets.Endcast_ConserveMP);
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
end

return profile;