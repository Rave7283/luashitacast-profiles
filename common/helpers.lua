local common = gFunc.LoadFile("common/common.lua"); 

local helpers = {};
--Lookups--------------------------------------------------------------
helpers.SandOriaZones = T{"Southern San d'Oria","Northern San d'Oria","Port San d'Oria","Chateau d'Oraguille"};
helpers.WindurstZones = T{"Windurst Waters","Windurst Walls","Port Windurst","Windurst Woods","Heavens Tower"};
helpers.BastokZones = T{"Bastok Mines","Bastok Markets","Port Bastok","Metalworks"};
helpers.JeunoZones = T{"Port Jeuno", "Lower Jeuno", "Upper Jeuno", "Ru'Lude Gardens"};
helpers.MndDebuffs = T{ "Slow", "Paralyze", "Slow II", "Paralyze II", "Addle", "Addle II" };
helpers.IntDebuffs = T{"Blind", "Blind II", "Gravity", "Poison", "Poison II", "Bind", "Sleep", "Sleep II", "Sleepga", "Sleepga II"};
helpers.ElementalDebuffs = T{ "Burn", "Rasp", "Drown", "Choke", "Frost", "Shock" };
helpers.NonObiSpells = T{"Stun", "Bio", "Bio II", "Bio III", "Burn", "Choke", "Drown", "Frost", "Rasp", "Shock"};
helpers.BloodPactPhysical = T{
	"Poison Nails", --Carbuncle
	"Camisado", --Diabolos
	"Moonlit Charge", "Crescent Fang", "Eclipse Bite", --Fenrir
	"Claw", "Predator Claws", --Garuda
	"Punch", "Double Punch", --Ifrit
	"Barracuda Dive", "Tail Whip", "Spinning Dive", --Leviathan
	"Shock Strike", "Chaotic Strike", --Ramuh
	"Axe Kick", "Double Slap", "Rush", --Shiva
	"Rock Throw", "Rock Buster", "Megalith Throw", "Mountain Buster", --Titan
	"Welt", "Roundhouse", "Hysteric Assault", --Siren
	"Regal Scratch" --Caitsith
};
helpers.BloodPactMagical = T{
	"Searing Light", "Meteorite", --Carbuncle
	"Nether Blast", "Somnolence", "Nightmare", --Diabolos
	"Howling Moon", --Fenrir
	"Aerial Blast", "Aero II", "Aero IV", "Wind Blade", --Garuda
	"Inferno", "Fire II", "Burning Strike", "Fire IV", "Flaming Crush", "Meteor Strike", --Ifrit
	"Tidal Wave", "Water II", "Water IV", "Grand Fall", --Leviathan
	"Judgment Bolt", "Thunder II", "Thunderspark", "Thunder IV", "Thunderstorm", --Ramuh
	"Diamond Dust", "Blizzard II", "Blizzard IV", "Heavenly Strike", --Shiva
	"Earthen Fury", "Stone II", "Stone IV", "Geocrush", --Titan
	"Clarsach Call", "Sonic Buffet", "Tornado II", --Siren
	"Level ? Holy" --Caitsith
};
helpers.CastTimeOverrides = {
	["Hunter's Prelude"] = 8000,
	["Archer's Prelude"] = 8000,
	["Banish III"] = 3000
};
helpers.WeakElements = {
	["Dark"] = "Light",
	["Light"] = "Dark",
	["Fire"] = "Water",
	["Water"] = "Thunder",
	["Thunder"] = "Earth",
	["Earth"] = "Wind",
	["Wind"] = "Ice",
	["Ice"] = "Fire"
};
helpers.PetElements = {
	["Carbuncle"] = "Light",
	["Ifrit"] = "Fire",
	["Shiva"] = "Ice",
	["Ramuh"] = "Thunder",
	["Leviathan"] = "Water",
	["Garuda"] = "Wind",
	["Titan"] = "Earth",
	["Fenrir"] = "Dark",
	["Diabolos"] = "Dark",
	["Caitsith"] = "Light",
	["Siren"] = "Wind",
	["LightSpirit"] = "Light",
	["FireSpirit"] = "Fire",
	["IceSpirit"] = "Ice",
	["ThunderSpirit"] = "Thunder",
	["WaterSpirit"] = "Water",
	["AirSpirit"] = "Wind",
	["EarthSpirit"] = "Earth",
	["DarkSpirit"] = "Dark",
};
helpers.AccBoostWeaponSkills = {
	--Axe
	["Smash Axe"] = true,
	["Gale Axe"] = true, 
	["Avalanche Axe"] = true, 
	["Spinning Axe"] = true, 
	["Calamity"] = true, 
	["Mistral Axe"] = true,
	--Dagger
	["Wasp String"] = true,
	["Shadowstitch"] = true,
	["Mandalic Stab"] = true,
	["Mercy Stroke"] = true,
	--Polearm
	["Leg Sweep"] = true,
	["Vorpal Thrust"] = true,
	["Wheeling Thrust"] = true,
	["Sonic Thrust"] = true,
	["Camlann's Torment"] = true,
	--Marksmanship
	["Detonator"] = true,
	["Coronach"] = true,
	--Archery
	["Empyreal Arrow"] = true,
	["Namas Arrow"] = true,
	--Sword
	["Flat Blade"] = true,
	["Circle Blade"] = true,
	--Great Sword
	["Spinning Slash"] = true,
	["Ground Strike"] = true,
	["Herculean Slash"] = true,
	["Scourge"] = true,
	["Torcleaver"] = true,
	--Scythe
	["Spiral Hell"] = true,
	["Catastrophe"] = true,
	["Quietus"] = true,
	--Great Axe
	["Shield Break"] = true,
	["Iron Tempest"] = true,
	["Armor Break"] = true,
	["Keen Edge"] = true,
	["Weapon Break"] = true,
	["Full Break"] = true,
	["Steel Cyclone"] = true,
	["Metatron Torment"] = true,
	["Fell Cleave"] = true
};
helpers.LockableEquipment = {
    ["Main"] = T{"Warp Cudgel", "Kgd. Signet Staff", "Fed. Signet Staff", "Treat Staff II", "Trick Staff II"},
    ["Sub"] = T{"Warp Cudgel"},
    ["Range"] = T{"Ebisu Fishing Rod"},
    ["Ammo"] = T{"Fly Lure", "Shrimp Lure", "Sinking Minnow", "Meatball"},
    ["Head"] = T{"Maat's Cap", "Reraise Hairpin", "Blink Band", "Snowman Cap", "Dream Hat +1", "Chef's Hat"},
    ["Neck"] = T{"Opo-opo Necklace"},
    ["Ear1"] = T{"Reraise Earring"},
    ["Ear2"] = T{"Reraise Earring"},
	["Body"] = T{"Worker Tunica","Custom Gilet +1", "Mandra. Suit", "Angler's Tunica", "Hume Gilet +1", "Lord's Yukata", "Culinarian's Apron","Fisherman's Apron"},
    ["Hands"] = T{"Worker Gloves","Dream Mittens +1", "Angler's Gloves"},
    ["Ring1"] = T{"Anniversary Ring", "Emperor Band", "Chariot Band", "Empress Band", "Homing Ring", "Tavnazian Ring", "Albatross Ring", "Dem Ring", "Holla Ring", "Mea Ring", "Altep Ring", "Yhoat Ring"},
    ["Ring2"] = T{"Anniversary Ring", "Emperor Band", "Chariot Band", "Empress Band", "Homing Ring", "Tavnazian Ring", "Albatross Ring", "Dem Ring", "Holla Ring", "Mea Ring", "Altep Ring", "Yhoat Ring"},
    ["Back"] = T{},
    ["Waist"] = T{"Mandragora Belt", "Rabbit Belt", "Gyokuto Obi"},
    ["Legs"] = T{"Worker Hose","Angler's Hose", "Hume Trunks +1"},
    ["Feet"] = T{"Worker Boots","Powder Boots","Dream Boots +1","Angler's Boots","Waders"}
};
helpers.UnlockedSlots = {
	["Main"] = true,
    ["Sub"] = true,
    ["Range"] = true,
    ["Ammo"] = true,
    ["Head"] = true,
    ["Neck"] = true,
    ["Ear1"] = true,
    ["Ear2"] = true,
	["Body"] = true,
    ["Hands"] = true,
    ["Ring1"] = true,
    ["Ring2"] = true,
    ["Back"] = true,
    ["Waist"] = true,
    ["Legs"] = true,
    ["Feet"] = true
}

helpers.delayTimer = 0;

--Functions------------------------------------------------------------
function helpers.GetMidcastDelay(player, spell, fastCastValue)
    local castTime = spell.CastTime
	
    if (player.MainJob == "RDM") then
        fastCastValue = fastCastValue + 0.2
    elseif (player.SubJob == "RDM") then
        fastCastValue = fastCastValue + 0.15
    end
	
    if (helpers.CastTimeOverrides[spell.Name] ~= nil) then
        castTime = helpers.CastTimeOverrides[spell.Name]
    end
	
    local minimumBuffer = 0.25 
    local packetDelay = 0.25
    local castDelay = ((castTime * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
    end
end

--Handles locking slots when certain items are equipped
function helpers.LockUsableEquipment(equipment)
	local emptySlots = {["Main"] = true, ["Sub"] = true, ["Range"] = true, ["Ammo"] = true, ["Head"] = true, ["Neck"] = true, ["Ear1"] = true, ["Ear2"] = true,	["Body"] = true, ["Hands"] = true, ["Ring1"] = true, ["Ring2"] = true, ["Back"] = true, ["Waist"] = true, ["Legs"] = true, ["Feet"] = true}
	
	for slot, item in pairs(equipment) do
		--gFunc.Message("Slot: " .. slot .. " Item: " .. item.Name);
		emptySlots[slot] = false;

		if (helpers.UnlockedSlots[slot] and helpers.LockableEquipment[slot]:contains(item.Name)) then
			gFunc.Disable(slot);
			helpers.UnlockedSlots[slot] = false;
		elseif ((not helpers.UnlockedSlots[slot]) and (not helpers.LockableEquipment[slot]:contains(item.Name))) then
			gFunc.Enable(slot);
			helpers.UnlockedSlots[slot] = true;
		end		
	end
	
	--Enable empty slots
	for slot, status in pairs(emptySlots) do
		if (status and (not helpers.UnlockedSlots[slot])) then
			gFunc.Enable(slot);
			helpers.UnlockedSlots[slot] = true;
		end
	end
end

--Builds an equip set out of the currently equiped lockable equipment
function helpers.BuildLockableSet(equipment)
	local lockableSet = {};
	
	for slot, item in pairs(equipment) do
		if (helpers.LockableEquipment[slot]:contains(item.Name)) then
			lockableSet[slot] = item;
		end
	end
	
	return lockableSet;
end

--Resets UnlockedSlots table to all slots unlocked
function helpers.UnlockAll()
	for slot, status in pairs(helpers.UnlockedSlots) do
		helpers.UnlockedSlots[slot] = true;
	end
end

--Returns true if WS is ACC Boosted (Single Hits Melee + certain ranged WS) and false is not
function helpers.AccBoostedCheck(weaponskill)
	if (helpers.AccBoostWeaponSkills[weaponskill.Name]) then
		return true;
	end
	
	return false;
end

--Returns true if MP will be low enough to proc pendant at spell resolution
function helpers.UggPendantCheck(spell, mpThreshold)
	if (spell.MpAftercast <= mpThreshold) then
        return true;
	else
		return false;
    end
end

--Returns true if HP and TP and below proper thresholds
function helpers.RingCheck(player, hpThreshold)
	if (player.HP <= hpThreshold and player.TP <= 1000) then
		return true;
	else
		return false;
	end
end

--Returns affinity to current weather ranging from -2 to 2  
function helpers.WeatherCheck(environment, element)
	local affinity = 0;
	
	if (environment.WeatherElement == element) then
		affinity = affinity + 1;
	elseif (environment.WeatherElement == helpers.WeakElements[element]) then
		affinity = affinity - 1;
	end
	
	if (environment.Weather:match("x2$")) then
		affinity = affinity * 2;
	end
	
	return affinity;
end

--Returns affinity to current day ranging from -1 to 1
function helpers.DayCheck(environment, element)
	local affinity = 0;
	
	if (environment.DayElement == element) then
		affinity = affinity + 1;
	elseif (environment.DayElement == helpers.WeakElements[element]) then
		affinity = affinity - 1;
	end
	
	return affinity;
end

--Returns true if spell element matches weather or day
function helpers.ObiCheck(environment, element)
	local affinity = 0;
	
	affinity = affinity + helpers.DayCheck(environment, element);
	affinity = affinity + helpers.WeatherCheck(environment, element);
	
	if(affinity > 0) then
		return true;
	else
		return false;
	end
end

--Returns true if time of day falls within given range
function helpers.TimeCheck(environment, dayPhase)
	if(dayPhase == "Daytime" and environment.Time > 6.0 and environment.Time < 18.0) then
		return true;
	elseif(dayPhase == "Nighttime" and (environment.Time > 18.0 or environment.Time < 6.0)) then 
		return true;
	elseif(dayPhase == "DuskToDawn" and (environment.Time > 17.0 or environment.Time < 7.0)) then
		return true;
	else 
		return false;
	end
end

--Delays swapping to a gear set for a certain number of seconds
function helpers.DelaySet(set, delay)
	if helpers.delayTimer == 0 then
		helpers.delayTimer = os.clock() + delay;
	end
	
	if (os.clock() > helpers.delayTimer) then
		gFunc.EquipSet(set);
		helpers.delayTimer = 0;
	end
end

function helpers.ResetDelay()
	helpers.delayTimer = 0;
end

--Equips a city Aketon if in a valid zone
function helpers.AketonCheck(environment)
	if (helpers.SandOriaZones:contains(environment.Area)) then
		gFunc.EquipSet(common.sets.SandOria);
	elseif (helpers.BastokZones:contains(environment.Area)) then
		gFunc.EquipSet(common.sets.Bastok);
	elseif (helpers.WindurstZones:contains(environment.Area)) then
		gFunc.EquipSet(common.sets.Windurst);
	end
end

--Equips a Ducal Aketon if in a valid zone
function helpers.DucalAketonCheck(environment)
	if (helpers.SandOriaZones:contains(environment.Area) or helpers.BastokZones:contains(environment.Area) or helpers.WindurstZones:contains(environment.Area) or helpers.JeunoZones:contains(environment.Area)) then
		gFunc.EquipSet(common.sets.Jeuno);	
	end
end

--Creates universal binds
function helpers.CreateUniversalBinds()
	--HandleDefault triggers after any call to HandleCommand
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias /hd /lac fwd hd");
end

--Destroys universal binds
function helpers.DestroyUniversalBinds()
	--HandleDefault
	AshitaCore:GetChatManager():QueueCommand(-1, "/alias delete /hd");
end

--Handles universal binds
function helpers.ExecuteCommand(command)
	if (command == "fishmode") then
		gFunc.Enable("Range", false);
		gFunc.Enable("Body", false);
		gFunc.Enable("Hands", false);
		gFunc.Enable("Legs", false);
		gFunc.Enable("Feet", false);
		gFunc.ForceEquipSet(common.sets.Fishing);		
	elseif (command == "cookmode") then
		gFunc.Enable("Main", false);
		gFunc.Enable("Head", false);
		gFunc.Enable("Body", false);
		gFunc.ForceEquipSet(common.sets.Cooking);
	elseif (command == "minemode") then
		gFunc.Enable("Body", false);
		gFunc.Enable("Hands", false);
		gFunc.Enable("Feet", false);
		gFunc.ForceEquipSet(common.sets.Mining);
	elseif (command == "logmode") then
		gFunc.Enable("Body", false);
		gFunc.Enable("Hands", false);
		gFunc.Enable("Legs", false);
		gFunc.ForceEquipSet(common.sets.Logging);
	end
end

return helpers