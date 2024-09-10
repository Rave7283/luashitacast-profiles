local common = T{};

common.ElementalStaffTable = {
    ["Fire"] = "Vulcan's Staff",
    ["Earth"] = "Terra's Staff",
    ["Water"] = "Neptune's Staff",
    ["Wind"] = "Auster's Staff",
    ["Ice"] = "Aquilo's Staff",
    ["Thunder"] = "Jupiter's Staff",
    ["Light"] = "Apollo's Staff",
    ["Dark"] = "Pluto's Staff"
};

common.ElementalObiTable = {
    ["Fire"] = "Karin Obi",
    ["Earth"] = "Dorin Obi",
    ["Water"] = "Suirin Obi",
    ["Wind"] = "Furin Obi",
    ["Ice"] = "Hyorin Obi",
    ["Thunder"] = "Rairin Obi",
    ["Light"] = "Korin Obi",
    ["Dark"] = "Anrin Obi"
};

common.ElementalGorgetTable = {
	--Dagger
	["Wasp Sting"] = "Soil Gorget",
	["Gust Slash"] = "Breeze Gorget",
	["Shadowstitch"] = "Aqua Gorget",
	["Viper Bite"] = "Soil Gorget",
	["Cyclone"] = "Breeze Gorget",
	["Dancing Edge"] = "Soil Gorget",
	["Shark Bite"] = "Breeze Gorget",
	["Evisceration"] = "Soil Gorget",
	["Aeolian Edge"] = "Breeze Gorget",
	["Exenterator"] = "Breeze Gorget",
	["Mercy Stroke"] = "Soil Gorget",
	["Rudra's Storm"] = "Soil Gorget",
	["Mandalic Stab"] = "Flame Gorget",
	["Mortdant Rime"] = "Breeze Gorget",
	["Pyrrhic Kleos"] = "Soil Gorget",
	--Axe
	["Raging Axe"] = "Breeze Gorget",
	["Smash Axe"] = "Aqua Gorget",
	["Gale Axe"] = "Breeze Gorget",
	["Avalanche Axe"] = "Soil Gorget",
	["Spinning Axe"] = "Soil Gorget",
	["Rampage"] = "Soil Gorget",
	["Calamity"] = "Soil Gorget",
	["Mistral Axe"] = "Flame Gorget",
	["Decimation"] = "Flame Gorget",
	["Bora Axe"] = "Breeze Gorget",
	["Ruinator"] = "Breeze Gorget",
	["Onslaught"] = "Soil Gorget",
	["Cloudsplitter"] = "Breeze Gorget",
	["Primal Rend"] = "Soil Gorget",
	--Polearm
	["Double Thrust"] = "Light Gorget",
	["Thunder Thrust"] = "Thunder Gorget",
	["Raiden Thrust"] = "Thunder Gorget",
	["Leg Sweep"] = "Thunder Gorget",
	["Penta Thrust"] = "Shadow Gorget",
	["Vorpal Thrust"] = "Aqua Gorget",
	["Skewer"] = "Light Gorget",
	["Wheeling Thrust"] = "Flame Gorget",
	["Impulse Drive"] = "Soil Gorget",
	["Sonic Thrust"] = "Soil Gorget",
	["Stardiver"] = "Soil Gorget",
	["Geirskogul"] = "Flame Gorget",
	["Camlann's Torment"] = "Flame Gorget",
	["Drakesbane"] = "Flame Gorget",
	--Archery
	["Flaming Arrow"] = "Flame Gorget",
	["Piercing Arrow"] = "Light Gorget",
	["Dulling Arrow"] = "Flame Gorget",
	["Sidewinder"] = "Breeze Gorget",
	["Blast Arrow"] = "Light Gorget",
	["Arching Arrow"] = "Flame Gorget",
	["Empyreal Arrow"] = "Flame Gorget",
	["Refulgent Arrow"] = "Light Gorget",
	["Apex Arrow"] = "Breeze Gorget",
	["Namas Arrow"] = "Flame Gorget",
	["Jishnu's Radiance"] = "Flame Gorget",
	--Marksmanship
	["Hot Shot"] = "Flame Gorget",
	["Split Shot"] = "Light Gorget",
	["Sniper Shot"] = "Flame Gorget",
	["Slug Shot"] = "Breeze Gorget",
	["Blast Shot"] = "Light Gorget",
	["Heavy Shot"] = "Flame Gorget",
	["Detonator"] = "Flame Gorget",
	["Numbing Shot"] = "Breeze Gorget",
	["Last Stand"] = "Flame Gorget",
	["Coronach"] = "Soil Gorget",
	["Wildfire"] = "Soil Gorget",
	["Trueflight"] = "Breeze Gorget",
	["Leaden Salute"] = "Soil Gorget",
	--Sword
	["Fast Blade"] = "Flame Gorget",
	["Burning Blade"] = "Light Gorget",
	["Red Lotus Blade"] = "Flame Gorget",
	["Flat Blade"] = "Thunder Gorget",
	["Shining Blade"] = "Soil Gorget",
	["Seraph Blade"] = "Soil Gorget",
	["Circle Blade"] = "Thunder Gorget",
	["Vorpal Blade"] = "Soil Gorget",
	["Swift Blade"] = "Soil Gorget",
	["Savage Blade"] = "Breeze Gorget",
	["Requiescat"] = "Soil Gorget",
	["Knights of Round"] = "Flame Gorget",
	["Chant Du Cygne"] = "Flame Gorget",
	["Death Blossom"] = "Breeze Gorget",
	["Atonement"] = "Flame Gorget",
	["Expiacion"] = "Soil Gorget",
	["Uriel Blade"] = "Flame Gorget",
	["Glory Slash"] = "Flame Gorget",
	--Scythe
	["Slice"] = "Soil Gorget",
	["Dark Harvest"] = "Aqua Gorget",
	["Shadow of Death"] = "Snow Gorget",
	["Nightmare Scythe"] = "Soil Gorget",
	["Spinning Scythe"] = "Soil Gorget",
	["Vorpal Scythe"] = "Soil Gorget",
	["Guillotine"] = "Snow Gorget",
	["Cross Reaper"] = "Snow Gorget",
	["Spiral Hell"] = "Snow Gorget",
	["Infernal Scythe"] = "Aqua Gorget",
	["Entropy"] = "Soil Gorget",
	["Catastrophe"] = "Soil Gorget",
	["Quietus"] = "Snow Gorget",
	["Insurgency"] = "Flame Gorget",
	--Greatsword
	["Hard Slash"] = "Soil Gorget",
	["Power Slash"] = "Light Gorget",
	["Frostbite"] = "Snow Gorget",
	["Freezebite"] = "Snow Gorget",
	["Shockwave"] = "Aqua Gorget",
	["Crescent Moon"] = "Soil Gorget",
	["Sickle Moon"] = "Soil Gorget",
	["Spinning Slash"] = "Breeze Gorget",
	["Ground Strike"] = "Breeze Gorget",
	["Herculean Slash"] = "Breeze Gorget",
	["Resolution"] = "Breeze Gorget",
	["Scourge"] = "Flame Gorget",
	["Torcleaver"] = "Snow Gorget",
	["Dimidiation"] = "Breeze Gorget",
	--Great Axe
	["Shield Break"] = "Thunder Gorget",
	["Iron Tempest"] = "Soil Gorget",
	["Sturmwind"] = "Soil Gorget",
	["Armor Break"] = "Thunder Gorget",
	["Keen Edge"] = "Shadow Gorget",
	["Weapon Break"] = "Thunder Gorget",
	["Raging Rush"] = "Snow Gorget",
	["Full Break"] = "Snow Gorget",
	["Steel Cyclone"] = "Snow Gorget",
	["Fell Cleave"] = "Breeze Gorget",
	["Upheavel"] = "Flame Gorget",
	["Metatron Torment"] = "Flame Gorget",
	["Ukko's Fury"] = "Breeze Gorget",
	["King's Justice"] = "Breeze Gorget"
}

common.sets = T{
	Bastok = {Body = "Ducal Aketon"},
	SandOria = {Body = "Ducal Aketon"},
	Windurst = {Body = "Ducal Aketon"},
	Jeuno = {Body = "Ducal Aketon"},
	Fishing = {
		Range = "Ebisu Fishing Rod", 
		Body = "Fisherman's Apron", 
		Hands = "Angler's Gloves", 
		Legs = "Angler's Hose", 
		Feet = "Waders" 
	},
	Logging = {
		Body = "Worker Tunica", 
		Hands = "Worker Gloves", 
		Legs = "Worker Hose"
	},
	Mining = {
		Body = "Worker Tunica", 
		Hands = "Worker Gloves", 
		Feet = "Worker Boots"
	},
	Cooking = {
		Main = "Hocho",
		Head = "Chef's Hat", 
		Body = "Culinarian's Apron"
	},
	Sneak = {
		Back = "Skulker's Cape",
		Feet = "Dream Boots +1"
	},
	Invisible = {
		Hands = "Dream Mittens +1",
		Back = "Skulker's Cape"
	},
	Pendant = {Neck = "Uggalepih Pendant"},
	Blink = {
		Head = "Charity Cap"
	}
};

return common