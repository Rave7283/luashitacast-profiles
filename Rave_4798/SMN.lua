local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.04;
};

local sets = {
	Idle = {
		Main = "Terra's Staff",
		Ammo = "Hedgehog Bomb",
		Head = "Zenith Crown +1",
        Neck = "Jeweled Collar +1",
        Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
        Body = "Yinyang Robe",
        Hands = "Smn. Bracers +1",
        Ring1 = "Evoker's Ring",
		Ring2 = "Serket Ring",
        Back = "Umbra Cape",
        Waist = "Hierarch Belt",
        Legs = "Evk. Spats +1",
        Feet = "Smn. Pigaches +1",
	},
	Resting = {
		Main = "Pluto's Staff",
		Head = "Hydra Beret",
		Neck = "Checkered Scarf",
		Ear1 = "Relaxing Earring",
		Ear2 = "Magnetic Earring",
		Body = "Mahatma Hpl.",
		Hands = "Hydra Gloves",
		Waist = "Hierarch Belt",
		Legs = "Baron's Slops",
		Feet = "Hydra Gaiters"
	},
	Engaged = {},
	Precast = {
		Ear1 = "Loquac. Earring",
		Feet = "Rostrum Pumps"
	},
	Precast_Summoning = {
		Ear1 = "Loquac. Earring",
		Feet = "Evoker's Boots"
	},
	Midcast = {
		Main = "Eremite's Wand", --25 SIRD
		Sub = "Genbu's Shield", --10 PDT
		Neck = "Willpower Torque", --5 SIRD
		Ear2 = "Magnetic Earring" -- 8 SIRD
	},
	Endcast_Summoning = {
		Head = "Evoker's Horn",
		Neck = "Summoning Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
		Back = "Astute Cape"
	},
	Endcast_Healing = {
		Main = "Apollo's Staff"
	},
	Endcast_Stoneskin = {
		Main = "Kirin's Pole",
		Head = "Zenith Crown +1",
		Neck = "Stone Gorget",
        Body = "Mahatma Hpl.",
        Back = "Prism Cape",
        Legs = "Mahatma Slops",
        Feet = "Rostrum Pumps"
	},
	Endcast_ConserveMP = {Ear2 = "Magnetic Earring"},
	Preshot = {ammo = "Pebble"},
	Midshot = {},
	WS = {},
	BloodPactCooldown = {
		Head = "Summoner's Horn",
		Body = "Yinyang Robe",
		Hands = "Smn. Bracers +1",
		Legs = "Summoner's Spats",
		Feet = "Smn. Pigaches +1"
	},
	BloodPactPhysical = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Ear1 = "Beastly Earring",
		Body = "Summoner's Dblt.",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
		Back = "Astute Cape",
		Legs = "Evk. Spats +1",
		Feet = "Smn. Pigaches +1"
	},
	BloodPactMagical = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
		Back = "Astute Cape",
		Feet = "Smn. Pigaches +1"
	},
	BloodPactSkill = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
		Back = "Astute Cape",
		Feet = "Nashira Crackows"
	},
	Perpetuation = {
		Ear1 = "Beastly Earring",
		Body = "Yinyang Robe",
		Hands = "Nashira Gages",
		Ring1 = "Evoker's Ring",
		Legs = "Evk. Spats +1",
		Feet = "Evk. Pigaches +1"
	},
	Carbuncle = {
		Body = "Yinyang Robe",
		Hands = "Carbuncle Mitts",
		Feet = "Smn. Pigaches +1"
	},
	DayMatch = {
		Body = "Summoner's Dblt."
	},
	WeatherMatch = {Head = "Summoner's Horn"}
}

local profile = {};
profile.Sets = sets;

local function HandlePetAction(petAction)
	if (helpers.BloodPactPhysical:contains(petAction.Name)) then
		gFunc.EquipSet(sets.BloodPactPhysical);
	elseif (helpers.BloodPactMagical:contains(petAction.Name)) then
		gFunc.EquipSet(sets.BloodPactMagical);
	else
		gFunc.EquipSet(sets.BloodPactSkill);
	end
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	
	--Universal binds
	helpers.CreateUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /lock /lac fwd lockable");
	
	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	varhelper.CreateToggle("MC", true);
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 4");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
	
	--tCrossbar
	AshitaCore:GetChatManager():QueueCommand(1, "/addon load tcrossbar");
end

profile.OnUnload = function()
	--Universal unbinds
	helpers.DestroyUniversalBinds();
	
	--Lockables Bind
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /lock");
	
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
	local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
	
	--Handle Bloodpacts
	if (petAction ~= nil) then
		HandlePetAction(petAction);
	else
		--Handle Status		
		if (player.Status == "Resting") then
			--Wait 18 before swapping to rest set
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
		
		--Handle Perpetuation
		if (pet ~= nil) then
			gFunc.EquipSet(sets.Perpetuation);

			if (helpers.DayCheck(environment, helpers.PetElements[pet.Name]) > 0) then
				gFunc.EquipSet(sets.DayMatch);
			end

			if (helpers.WeatherCheck(environment, helpers.PetElements[pet.Name]) > 0) then
				gFunc.EquipSet(sets.WeatherMatch);
			end
			
			if (pet.Name == "Carbuncle") then
				gFunc.EquipSet(sets.Carbuncle);
			end
			
			gFunc.Equip("main", common.ElementalStaffTable[helpers.PetElements[pet.Name]]);		
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	
	if (ability.Type == "Blood Pact: Ward" or ability.Type == "Blood Pact: Rage") then
		gFunc.EquipSet(sets.BloodPactCooldown);
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
	local petAction = gData.GetPetAction();
	local spell = gData.GetAction();
	local player = gData.GetPlayer();
	
	if (varhelper.GetToggle("MC")) then
		helpers.GetMidcastDelay(player, spell, settings.GearFastCast);
	end
	
	--Handle Bloodpacts
	if (petAction ~= nil) then
		HandlePetAction(petAction);
	else
		--Precast
		if (spell.Skill == "Summoning") then
			gFunc.EquipSet(sets.Precast_Summoning);
		else
			gFunc.EquipSet(sets.Precast);
		end
	end
end

profile.HandleMidcast = function()
	local spell = gData.GetAction(); 
	local petAction = gData.GetPetAction();
	
	if (petAction == nil) then
		gFunc.InterimEquipSet(sets.Midcast);
	end
	
	--Summoning Magic
	if (spell.Skill == "Summoning") then
		gFunc.EquipSet(sets.Endcast_Summoning);
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
	
	--Handle Bloodpact Override
	if (petAction ~= nil) then
		HandlePetAction(petAction);
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