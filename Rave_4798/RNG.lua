local varhelper = gFunc.LoadFile("common/varhelper.lua"); 
local helpers = gFunc.LoadFile("common/helpers.lua"); 
local common = gFunc.LoadFile("common/common.lua"); 

local settings = {
	GearFastCast = 0.02;
	GunName = "Hellfire +1",
	BasicBullet = "Silver Bullet",
	SpecialBullet = "Carapace Bullet",
	CannonName = "Culverin",
	BasicShell = "Cannon Shell",
	SpecialShell = "Heavy Shell",
	CrossbowName = "Ziska's Crossbow",
	BasicBolt = "Darksteel Bolt",
	SpecialBolt = "Gold Musketeer's bolt",
	BowName = "Loxley Bow",
	BasicArrow = "Demon Arrow",
	SpecialArrow = "Cmb.Cst. Arrow"
}

local sets = {
	Idle = {
		Head = "Green Ribbon +1",
		Neck = "Jeweled Collar +1",
		Ear1 = "Merman's Earring",
        Ear2 = "Merman's Earring",
		Body = "Kirin's Osode",
		Hands = "Blood Fng. Gnt.",
        Ring1 = "Merman's Ring",
        Ring2 = "Merman's Ring",
		Back = "Resentment Cape",
		Waist = "Scout's Belt",
		Legs = "Blood Cuisses",
        Feet = "Blood Greaves"
	},
	Resting = {},
	Engaged_None = {},
	Engaged_Power = {
		Head = "Optical Hat",
		Neck = "Peacock Amulet",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Kirin's Osode",
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
		Neck = "Peacock Amulet",
		Ear1 = "Beastly Earring",
		Ear2 = "Brutal Earring",
		Body = "Kirin's Osode",
		Hands = "War Gloves +1",
		Ring1 = "Rajas Ring",
		Ring2 = "Toreador's Ring",
		Back = "Forager's Mantle",
		Waist = "Sonic Belt",
		Legs = "Byakko's Haidate",
		Feet = "Marine M Boots"
	},
	WS = {
		Head = "Maat's Cap",
        Neck = "Faith Torque",
        Ear1 = "Drone Earring",
        Ear2 = "Novia Earring",
        Body = "Kirin's Osode",
        Hands = "Seiryu's Kote",
        Ring1 = "Rajas Ring",
        Ring2 = "Behemoth Ring +1",
        Back = "Amemet Mantle +1",
        Waist = "Scout's Belt",
        Legs = "Sct. Braccae +1",
        Feet = "Sct. Socks +1"
	},
	WS_Power = {
		Head = "Maat's Cap",
        Neck = "Faith Torque",
        Ear1 = "Drone Earring",
        Ear2 = "Novia Earring",
        Body = "Kirin's Osode",
        Hands = "Blood Fng. Gnt.",
        Ring1 = "Rajas Ring",
        Ring2 = "Triumph Ring",
        Back = "Amemet Mantle +1",
        Waist = "Scout's Belt",
        Legs = "Sct. Braccae +1",
        Feet = "Sct. Socks +1"
	},
	WS_Acc = {
		Head = "Maat's Cap",
        Neck = "Peacock Amulet",
        Ear1 = "Drone Earring",
        Ear2 = "Novia Earring",
        Body = "Kirin's Osode",
        Hands = "Seiryu's Kote",
        Ring1 = "Rajas Ring",
        Ring2 = "Behemoth Ring +1",
        Back = "Amemet Mantle +1",
        Waist = "Scout's Belt",
        Legs = "Sct. Braccae +1",
        Feet = "Sct. Socks +1"
	},
	Preshot = {
		Head="Hunter's Beret",
		Body="Scout's Jerkin"
	},
	Midshot_Power = {
		Head = "Maat's Cap",
        Neck = "Faith Torque",
        Ear1 = "Drone Earring",
        Ear2 = "Novia Earring",
        Body = "Kirin's Osode",
        Hands = "Blood Fng. Gnt.",
        Ring1 = "Rajas Ring",
        Ring2 = "Triumph Ring",
        Back = "Amemet Mantle +1",
        Waist = "Scout's Belt",
        Legs = "Sct. Braccae +1",
        Feet = "Sct. Socks +1"
	},
	Midshot_Hybrid = {
		Head = "Maat's Cap",
        Neck = "Faith Torque",
        Ear1 = "Drone Earring",
        Ear2 = "Novia Earring",
        Body = "Kirin's Osode",
        Hands = "Blood Fng. Gnt.",
        Ring1 = "Rajas Ring",
        Ring2 = "Behemoth Ring +1",
        Back = "Amemet Mantle +1",
        Waist = "Scout's Belt",
        Legs = "Sct. Braccae +1",
        Feet = "Sct. Socks +1"
	},
	Midshot_Accuracy = {
		Head = "Optical Hat",
        Neck = "Peacock Amulet",
        Ear1 = "Drone Earring",
        Ear2 = "Novia Earring",
        Body = "Kirin's Osode",
        Hands = "Seiryu's Kote",
        Ring1 = "Merman's Ring",
        Ring2 = "Behemoth Ring +1",
        Back = "Amemet Mantle +1",
        Waist = "Scout's Belt",
        Legs = "Sct. Braccae +1",
        Feet = "Blood Greaves"
	},
	Precast = {Ear1 = "Loquac. Earring"},
	Midcast = {
		Head = "Optical Hat",
		Neck = "Evasion Torque",
		Ear1 = "Musical Earring",
		Ear2 = "Novia Earring",
		Body = "Scp. Harness +1",
		Hands = "War Gloves +1",
		Back = "Boxer's Mantle",
		Waist = "Scouter's Rope",
		Legs = "Byakko's Haidate",
		Feet = "Dance Shoes +1"
	},
	Endcast = {
		Ear1 = "Loquac. Earring",
		Hands = "Dusk Gloves +1",
		Waist = "Sonic Belt",
		Legs = "Byakko's Haidate"
	},
	PDT = {},
	MDT = {
		Head = "Green Ribbon +1",
		Neck = "Jeweled Collar +1",
		Ear1 = "Merman's Earring",
        Ear2 = "Merman's Earring",
		Body = "Kirin's Osode",
        Ring1 = "Merman's Ring",
        Ring2 = "Merman's Ring",
		Back = "Resentment Cape",
		Legs = "Blood Cuisses",
        Feet = "Blood Greaves"
	},
	Sharpshot = {Legs = "Hunter's Braccae"},
	Scavenge = {Feet = "Hunter's Socks"},
	Camouflage = {Body = "Hunter's Jerkin"},
	Barrage = {Hands = "Htr. Bracers +1"},
	Shadowbind = {Hands = "Htr. Bracers +1"},
	Night = {Ear1 = "Fenrir's Earring"},
	Enmity = {
		Ear2 = "Novia Earring",
		Body = "Scout's Jerkin",
		Legs = "Sct. Braccae +1",
		Feet = "Sct. Socks +1"
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
	
	--Ra Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind ^= /lac fwd raset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /raset /lac fwd raset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /rapower /lac fwd rapower");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /rahybrid /lac fwd rahybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /raacc /lac fwd raacc");
	
	--Tp Cycle Binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /meleeset /lac fwd meleeset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /meleenone /lac fwd meleenone");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /meleepower /lac fwd meleepower");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /meleeacc /lac fwd meleeacc");
	
	--Delay Midcast binds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /mc /lac fwd mc");
	
	--Variable Helpers
	varhelper.Initialize();
	varhelper.CreateCycle("Mode", { [1] = "Base",  [2] = "PDT", [3] = "MDT" });
	varhelper.CreateCycle("Lockable", { [1] = "Idle", [2] = "Always", [3] = "Never" });
	varhelper.CreateCycle("RA Mode", { [1] = "Hybrid", [2] = "Accuracy", [3] = "Power" });
	varhelper.CreateCycle("Melee Mode", { [1] = "None", [2] = "Power", [3] = "Accuracy" });
	varhelper.CreateToggle("MC", true);
	
	--Macros
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 7");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");

	--tCrossbar
	AshitaCore:GetChatManager():QueueCommand(1, "/addon load tcrossbar");

	--Combine sets
	profile.Sets.Engaged_None = gFunc.Combine(sets.Idle, {});
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

	--Ra Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind ^=");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /raset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /rapower");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /rahybrid");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /raacc");

	--Tp Cycle Unbinds
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /meleeset");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /meleenone");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /meleepower");
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /meleeacc");
	
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
	elseif (args[1] == "base") then --Base Mode
		varhelper.SetCycle("Mode", 1);
	elseif (args[1] == "pdt") then --Pdt Mode
		varhelper.SetCycle("Mode", 2);
	elseif (args[1] == "mdt") then -- Mdt Mode
		varhelper.SetCycle("Mode", 3);
	elseif (args[1] == "meleeset") then --Cycle Melee Sets
		varhelper.AdvanceCycle("Melee Mode");
	elseif (args[1] == "meleenone") then --None
		varhelper.SetCycle("Melee Mode", 1);
	elseif (args[1] == "meleepower") then --Power
		varhelper.SetCycle("Melee Mode", 2);
	elseif (args[1] == "meleeacc") then --Accuracy
		varhelper.SetCycle("Melee Mode", 3);
	elseif (args[1] == "raset") then --Cycle RA Sets
		varhelper.AdvanceCycle("RA Mode");
	elseif (args[1] == "rahybrid") then --Hybrid
		varhelper.SetCycle("RA Mode", 1);
	elseif (args[1] == "raacc") then --Accuracy
		varhelper.SetCycle("RA Mode", 2);
	elseif (args[1] == "rapower") then --Power
		varhelper.SetCycle("RA Mode", 3);
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
				gFunc.EquipSet("Engaged_" .. varhelper.GetCycle("Melee Mode"));
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

	--Equip Ammo
	if (equipment.Range ~= nil and equipment.Range.Name == settings.GunName) then
		gFunc.Equip("Ammo", settings.BasicBullet);
	elseif (equipment.Range ~= nil and equipment.Range.Name == settings.BowName) then
		gFunc.Equip("Ammo", settings.BasicArrow);
	elseif (equipment.Range ~= nil and equipment.Range.Name == settings.CannonName) then
		gFunc.Equip("Ammo", settings.BasicShell);
	elseif (equipment.Range ~= nil and equipment.Range.Name == settings.CrossbowName) then
		gFunc.Equip("Ammo", settings.BasicBolt);
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	local equipment = gData.GetEquipment();
	gFunc.EquipSet(sets.Enmity);
	
	if (equipment.Range ~= nil and equipment.Range.Name == settings.GunName) then
		gFunc.Equip("Ammo", settings.BasicBullet);
	elseif (equipment.Range ~= nil and equipment.Range.Name == settings.BowName) then
		gFunc.Equip("Ammo", settings.BasicArrow);
	elseif (equipment.Range ~= nil and equipment.Range.Name == settings.CannonName) then
		gFunc.Equip("Ammo", settings.BasicShell);
	elseif (equipment.Range ~= nil and equipment.Range.Name == settings.CrossbowName) then
		gFunc.Equip("Ammo", settings.BasicBolt);
	end
	
	--Special Ammo Cancel
	if ((ability.Name == "Eagle Eye Shot" or ability.Name == "Shadowbind") and equipment.Ammo ~= nil) then
		if (equipment.Ammo.Name == settings.SpecialBullet) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Ammo.Name == settings.SpecialArrow) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Ammo.Name == settings.SpecialBolt) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Ammo.Name == settings.SpecialShell) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Range.Name == settings.CrossbowName) then
			gFunc.CancelAction();	
			gFunc.Error("Action Canceled: Special Ammo Protection");
		end
	end
	
	if (ability.Name == "Eagle Eye Shot") then
		gFunc.EquipSet(sets.WS_Power)
	elseif (ability.Name == "Sharpshot") then
		gFunc.EquipSet(sets.Sharpshot);
	elseif (ability.Name == "Scavenge") then
		gFunc.EquipSet(sets.Scavenge);
	elseif (ability.Name == "Camouflage") then
		gFunc.EquipSet(sets.Camouflage);
	elseif (ability.Name == "Barrage") then
		gFunc.EquipSet(sets.Barrage);
	elseif (ability.Name == "Shadowbind") then
		gFunc.EquipSet(sets.Shadowbind);
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
	local player = gData.GetPlayer();
	local equipment = gData.GetEquipment();
	gFunc.EquipSet(sets.Preshot);
	
	if (equipment.Range.Name == settings.GunName) then
		gFunc.Equip("Ammo", settings.BasicBullet);
	elseif (equipment.Range.Name == settings.BowName) then
		gFunc.Equip("Ammo", settings.BasicArrow);
	elseif (equipment.Range.Name == settings.CannonName) then
		gFunc.Equip("Ammo", settings.BasicShell);
	elseif (equipment.Range.Name == settings.CrossbowName) then
		gFunc.Equip("Ammo", settings.BasicBolt);
	end
	
	--Special Ammo Cancel
	if (equipment.Ammo ~= nil) then
		if (equipment.Ammo.Name == settings.SpecialBullet) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Ammo.Name == settings.SpecialArrow) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Ammo.Name == settings.SpecialBolt) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Ammo.Name == settings.SpecialShell) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (equipment.Range.Name == settings.CrossbowName) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");			
		end
	end
end

profile.HandleMidshot = function()
	local environment = gData.GetEnvironment();
	local barrage = gData.GetBuffCount("Barrage");
	local sharpshot = gData.GetBuffCount("Sharpshot");
	
	if (sharpshot == 1 and (not varhelper.GetCycle("RA Mode") == "Accuracy")) then
		gFunc.EquipSet(sets.Midshot_Power);
	else
		gFunc.EquipSet(sets["Midshot_" .. varhelper.GetCycle("RA Mode")]);
	end
	
	if (helpers.TimeCheck(environment, "Nighttime")) then
		gFunc.EquipSet(sets.Night);
	end
	
	if (barrage == 1) then
		gFunc.EquipSet(sets.Barrage);
	end
end

profile.HandleWeaponskill = function()
	local environment = gData.GetEnvironment();
	local ws = gData.GetAction();
	local equipment = gData.GetEquipment();
	local unlimitedShot = gData.GetBuffCount("Unlimited Shot");
	
	if (ws.Name == "Slug Shot" or ws.Name == "Sidewinder") then
		gFunc.EquipSet(sets.WS_Acc);
	elseif (helpers.AccBoostedCheck(ws)) then
		gFunc.EquipSet(sets.WS_Power);
	else
		gFunc.EquipSet(sets.WS);
	end
	
	if (helpers.TimeCheck(environment, "Nighttime")) then
		gFunc.EquipSet(sets.Night);
	end
	
	--Handle Bullets for Unlimited Shot
	if (equipment.Range.Name == settings.GunName) then
		if (unlimitedShot == 1) then
			gFunc.Equip("Ammo", settings.SpecialBullet);
		else
			gFunc.Equip("Ammo", settings.BasicBullet);
		end
	--Handle Arrows for Unlimited Shot
	elseif (equipment.Range.Name == settings.BowName) then
		if (unlimitedShot == 1) then
			gFunc.Equip("Ammo", settings.SpecialArrow);
		else
			gFunc.Equip("Ammo", settings.BasicArrow);
		end
	--Handle Shells for Unlimited Shot
	elseif (equipment.Range.Name == settings.CannonName) then
		if (unlimitedShot == 1) then
			gFunc.Equip("Ammo", settings.SpecialShell);
		else
			gFunc.Equip("Ammo", settings.BasicShell);
		end
	--Handle Bolts for Unlimited Shot
	elseif (equipment.Range.Name == settings.CrossbowName) then
		if (unlimitedShot == 1) then
			gFunc.Equip("Ammo", settings.SpecialBolt);
		end
	end
	
	--Gorgets
	gFunc.Equip("neck", common.ElementalGorgetTable[ws.Name]);
	
	--Block WS using special ammo without Unlimited Shot
	if (equipment.Ammo ~= nil) then
		if (unlimitedShot == 0 and equipment.Ammo.Name == settings.SpecialBullet) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (unlimitedShot == 0 and equipment.Ammo.Name == settings.SpecialArrow) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (unlimitedShot == 0 and equipment.Ammo.Name == settings.SpecialBolt) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		elseif (unlimitedShot == 0 and equipment.Ammo.Name == settings.SpecialShell) then
			gFunc.CancelAction();
			gFunc.Error("Action Canceled: Special Ammo Protection");
		end
	end
end

return profile;