local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.04;
};

local sets = {
	Idle = {
        Main = "Terra's Staff",
        Ammo = "Fortune Egg",
		Head = "displaced",
        Neck = "Stone Gorget",
        Ear1 = "Phtm. Earring +1",
        Ear2 = "Phtm. Earring +1",
        Body = "Royal Cloak",
        Hands = "Raven Bracers",
        Ring1 = "Serket Ring",
        Ring2 = "Ether Ring",
        Back = "Red Cape +1",
        Legs = "Raven Hose",
        Feet = "Crow Gaiters"
    },
	Resting = {
        Main = "Pluto's Staff",
		Neck = "Checkered Scarf",
		Ear1 = "Relaxing Earring",
        Back = "Wizard's Mantle",
        Legs = "Baron's Slops"
    },
	Engaged = {},
	Precast = {},
	Precast_ForceHP = {},
	Midcast = {},
	Endcast_ElementalNuke = {},
	Endcast_ElementalDebuff = {},
	Endcast_Dark = {},
	Endcast_Enfeebling = {},
	Endcast_EnfeeblingMnd = {
		Neck = "Ajari Necklace"
	},
	Endcast_EnfeeblingInt = {},
	Endcast_Healing = {
        Main = "Apollo's Staff",
		Head = "Raven Beret",
		Neck = "Ajari Necklace",
		Body = "Raven Jupon",
		Hands = "Raven Bracers",
		Legs = "Raven Hose",
        Feet = "Crow Gaiters"
    },
	Endcast_ConserveMP = {},
	Endcast_Stoneskin = {
		Neck = "Stone Gorget"
	},
	Preshot = {ammo = "Pebble"},
	Midshot = {},
	Ring = {Ring2 = "Medicine Ring"}
};

local profile = {};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	
	--Universal binds
	helpers.CreateUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /lock /lac fwd lockable");
	
    --Midcast binds
    AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");

	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	varhelper.CreateToggle("MC", true);
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 9");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
end

profile.OnUnload = function()
	--Universal unbinds
	helpers.DestroyUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /lock");
	
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
	
	if (player.Status == "Resting") then
		helpers.RestingHelper(true, sets.Resting);
	else
		helpers.RestingHelper(false, sets.Resting);
	
		if (player.Status == "Engaged") then
			gFunc.EquipSet(sets.Engaged);		
		else
			gFunc.EquipSet(sets.Idle);
			
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
			gFunc.EquipSet(sets.Endcast_ElementalDebuff);	
		--Nukes
		else
			gFunc.EquipSet(sets.Endcast_ElementalNuke);

			--Obi Check
			if (helpers.ObiCheck(environment, spell.Element)) then
				gFunc.Equip("waist", common.ElementalObiTable[spell.Element]);
			end
			--Ugg Pendant
			if (helpers.UggPendantCheck(spell, settings.NukeSetMp * 0.50)) then
				gFunc.EquipSet(common.sets.Pendant);
			end
		end
	--Dark Magic
	elseif (spell.Skill == "Dark Magic") then
		gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
		gFunc.EquipSet(sets.Endcast_Dark);
		
		--Diabolos Check
		if ((spell.Name == "Drain" or spell.Name == "Aspir") and helpers.WeatherCheck(environment, spell.Element) > 0) then
			gFunc.EquipSet(sets.DiabolosPole);
		end
		--Obi Check
		if(helpers.ObiCheck(environment, spell.Element)) then
			gFunc.Equip("waist", common.ElementalObiTable[spell.Element]);
		end
	--Enfeebling Magic
	elseif (spell.Skill == "Enfeebling Magic") then
		gFunc.Equip("main", common.ElementalStaffTable[spell.Element]);
		
		if (helpers.MndDebuffs:contains(spell.Name)) then
			gFunc.EquipSet(gFunc.Combine(sets.Endcast_Enfeebling,sets.Endcast_EnfeeblingMnd));
		elseif (helpers.IntDebuffs:contains(spell.Name)) then
			gFunc.EquipSet(gFunc.Combine(sets.Endcast_Enfeebling,sets.Endcast_EnfeeblingInt));
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