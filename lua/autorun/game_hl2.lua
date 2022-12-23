local duplicator_Allow = duplicator.Allow
local IsMounted = IsMounted
local list_Set = list.Set

local function addWeapon( name, class, category, npc )
	list_Set('Weapon', class, {
		['Category'] = category,
		['ClassName'] = class,
		['PrintName'] = name,
		['Author'] = 'VALVe',
		['Spawnable'] = true
	})

	if (npc) then
		list.Add('NPCUsableWeapons', {
			['class'] = class,
			['title'] = name
		})
	end

	duplicator_Allow( class )
end

local function addEntity( name, class, category, offset )
	list_Set('SpawnableEntities', class, {
		['PrintName'] = name,
		['ClassName'] = class,
		['Category'] = category,
		['NormalOffset'] = offset or 32,
		['DropToFloor'] = true,
		['Author'] = 'VALVe'
	})

	duplicator_Allow( class )
end

do

	local category = 'Half-Life 2'

	-- Ammo
	addEntity( 'AR2 Ammo', 'item_ammo_ar2', category, -8 )
	addEntity( 'AR2 Ammo (Large)', 'item_ammo_ar2_large', category, -8 )

	addEntity( 'Pistol Ammo', 'item_ammo_pistol', category, -4 )
	addEntity( 'Pistol Ammo (Large)', 'item_ammo_pistol_large', category, -4 )

	addEntity( '357 Ammo', 'item_ammo_357', category, -4 )
	addEntity( '357 Ammo (Large)', 'item_ammo_357_large', category, -4 )

	addEntity( 'SMG Ammo', 'item_ammo_smg1', category, -2 )
	addEntity( 'SMG Ammo (Large)', 'item_ammo_smg1_large', category, -2 )

	addEntity( 'SMG Grenade', 'item_ammo_smg1_grenade', category, -10 )
	addEntity( 'Crossbow Bolts', 'item_ammo_crossbow', category, -10 )
	addEntity( 'Shotgun Ammo', 'item_box_buckshot', category, -10 )
	addEntity( 'AR2 Orb', 'item_ammo_ar2_altfire', category, -2 )
	addEntity( 'RPG Rocket', 'item_rpg_round', category, -10 )

	-- Dynamic materials; gives player what he needs most (health, shotgun ammo, suit energy, etc)
	-- addEntity( 'Dynamic Supplies', 'item_dynamic_resupply', category )

	-- Items
	addEntity( 'Suit Battery', 'item_battery', category, -4 )
	addEntity( 'Health Kit', 'item_healthkit', category, -8 )
	addEntity( 'Health Vial', 'item_healthvial', category, -4 )
	addEntity( 'Suit Charger', 'item_suitcharger', category )
	addEntity( 'Health Charger', 'item_healthcharger', category )
	addEntity( 'HEV Suit', 'item_suit', category, 0 )

	addEntity( 'Thumper', 'prop_thumper', category )
	addEntity( 'Combine Mine', 'combine_mine', category, -8 )
	addEntity( 'Zombine Grenade', 'npc_grenade_frag', category, -8 )
	addEntity( 'Helicopter Grenade', 'grenade_helicopter', category, 4 )

	if IsMounted( 'ep2' ) then
		game.AddParticles( 'particles/striderbuster.pcf' )
		addEntity( '#HL2E2_SM_MAGNUSSON', 'weapon_striderbuster', category )
	end

	-- Weapons
	addWeapon( '#HL2_GravityGun', 'weapon_physcannon', category )
	addWeapon( '#HL2_StunBaton', 'weapon_stunstick', category, true )
	addWeapon( '#HL2_Grenade', 'weapon_frag', category )
	addWeapon( '#HL2_Crossbow', 'weapon_crossbow', category, true )
	addWeapon( '#HL2_Bugbait', 'weapon_bugbait', category )
	addWeapon( '#HL2_RPG', 'weapon_rpg', category, true )
	addWeapon( '#HL2_Crowbar', 'weapon_crowbar', category, true )
	addWeapon( '#HL2_Shotgun', 'weapon_shotgun', category, true )
	addWeapon( '#HL2_Pistol', 'weapon_pistol', category, true )
	addWeapon( '#HL2_SLAM', 'weapon_slam', category )
	addWeapon( '#HL2_SMG1', 'weapon_smg1', category, true )
	addWeapon( '#HL2_Pulse_Rifle', 'weapon_ar2', category, true )
	addWeapon( '#HL2_357Handgun', 'weapon_357', category, true )
	-- addWeapon( '#HL2_AlyxGun', 'weapon_alyxgun', category, true )
	-- addWeapon( '#HL2_Annabelle', 'weapon_annabelle', category, true )

	if IsMounted( 'hl1' ) or IsMounted( 'hl1mp' ) then
		category = 'Half-Life: Source'

		addWeapon( '#HL1S_SNARKS', 'weapon_snark', category )
		addWeapon( '#HL1S_HAND_GRENADE', 'weapon_handgrenade', category )
		addWeapon( '#HL1S_MP5', 'weapon_mp5_hl1', category )
		addWeapon( '#HL1S_HORNET_GUN', 'weapon_hornetgun', category )
		addWeapon( '#HL1S_SATCHEL', 'weapon_satchel', category )
		addWeapon( '#HL1S_TRIPMINE', 'weapon_tripmine', category )
		addWeapon( '#HL1S_SCROSSBOW', 'weapon_crossbow_hl1', category )
		addWeapon( '#HL1S_357_HANDGUN', 'weapon_357_hl1', category )
		addWeapon( '#HL1S_RPG_LAUNCHER', 'weapon_rpg_hl1', category )
		addWeapon( '#HL1S_SPAS_12', 'weapon_shotgun_hl1', category )
		addWeapon( '#HL1S_GLOCK', 'weapon_glock_hl1', category, true )
		addWeapon( '#HL1S_TAY_CANNON', 'weapon_gauss', category )
		addWeapon( '#HL1S_GLUON_GUN', 'weapon_egon', category )
		addWeapon( '#HL1S_CROWBAR', 'weapon_crowbar_hl1', category )

		addEntity( '#HL1S_CROSSBOW_BOLTS', 'ammo_crossbow', category, 0 )
		addEntity( '#HL1S_URANIUM', 'ammo_gaussclip', category, 0 )
		addEntity( '#HL1S_GLOCK_CLIP', 'ammo_glockclip', category, 0 )
		addEntity( '#HL1S_MP5_CLIP', 'ammo_mp5clip', category, 0 )
		addEntity( '#HL1S_MP5_AMMO_CRATE', 'ammo_9mmbox', category, 0 )
		addEntity( '#HL1S_MP5_GRENADES', 'ammo_mp5grenades', category, 0 )
		addEntity( '#HL1S_357_AMMO', 'ammo_357', category, 0 )
		addEntity( '#HL1S_RPG_ROCKETS', 'ammo_rpgclip', category, 0 )
		addEntity( '#HL1S_SPAS_12_AMMO', 'ammo_buckshot', category, 0 )
		addEntity( '#HL1S_URANIUM_EGON', 'ammo_egonclip', category, 0 )
		-- addEntity( 'MP5 Ammo', 'ammo_9mmclip', category, 0 )
		-- addEntity( 'MP5 Ammo', 'ammo_9mmar', category, 0 )
		-- addEntity( 'MP5 Grenade', 'ammo_argrenades', category, 0 )

	end

end

addWeapon( '#GMOD_Physgun', 'weapon_physgun', 'Other' )
