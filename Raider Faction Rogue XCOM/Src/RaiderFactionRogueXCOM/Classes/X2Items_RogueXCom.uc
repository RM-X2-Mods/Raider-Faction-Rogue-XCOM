class X2Items_RogueXCom extends X2Item_DefaultWeapons config(GameData);

var config WeaponDamageValue ROGUE_PISTOL_M1_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_PISTOL_M2_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_PISTOL_M3_WPN_BASEDAMAGE;


var config WeaponDamageValue ROGUE_SHOTGUN_M1_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_RIFLE_M1_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_SNIPER_M1_WPN_BASEDAMAGE;
var config WeaponDamageValue CANNON_WPN_BASEDAMAGE;

var config WeaponDamageValue ROGUE_SHOTGUN_M2_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_RIFLE_M2_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_SNIPER_M2_WPN_BASEDAMAGE;
var config WeaponDamageValue CANNON_M2_WPN_BASEDAMAGE;
var config WeaponDamageValue SHIVCANNON_M2_WPN_BASEDAMAGE;

var config WeaponDamageValue ROGUE_SHOTGUN_M3_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_RIFLE_M3_WPN_BASEDAMAGE;
var config WeaponDamageValue ROGUE_SNIPER_M3_WPN_BASEDAMAGE;
var config WeaponDamageValue CANNON_M3_WPN_BASEDAMAGE;
var config WeaponDamageValue SHIVCANNON_M3_WPN_BASEDAMAGE;
var config WeaponDamageValue MECTROOPERCANNON_M3_WPN_BASEDAMAGE;

var config WeaponDamageValue ROCKETEERM1_ROCKETEERLAUNCHER_BASEDAMAGE;
var config WeaponDamageValue ROCKETEERM2_ROCKETEERLAUNCHER_BASEDAMAGE;

var config int ROCKETEERM1_ROCKETEERLAUNCHER_ISOUNDRANGE;
var config int ROCKETEERM1_ROCKETEERLAUNCHER_IENVIRONMENTDAMAGE;
var config int ROCKETEERM1_ROCKETEERLAUNCHER_CLIPSIZE;
var config int ROCKETEERM1_ROCKETEERLAUNCHER_RANGE;
var config int ROCKETEERM1_ROCKETEERLAUNCHER_RADIUS;
var config int ROCKETEERM1_IDEALRANGE;

var config int ROCKETEERM2_ROCKETEERLAUNCHER_ISOUNDRANGE;
var config int ROCKETEERM2_ROCKETEERLAUNCHER_IENVIRONMENTDAMAGE;
var config int ROCKETEERM2_ROCKETEERLAUNCHER_CLIPSIZE;
var config int ROCKETEERM2_ROCKETEERLAUNCHER_RANGE;
var config int ROCKETEERM2_ROCKETEERLAUNCHER_RADIUS;
var config int ROCKETEERM2_IDEALRANGE;


var config int CANNON_WPN_ICLIPSIZE;
var config int CANNON_IDEALRANGE;

var config int SHIVCANNON_WPN_ICLIPSIZE;
var config int SHIVCANNON_IDEALRANGE;

var config int MECCANNON_CLIPSIZE;
var config int MECCANNON_IDEALRANGE;

var config int Rifle_MagSize;
var config int Rifle_IdealRange;
var config int Sniper_MagSize;
var config int Sniper_IdealRange;
var config int Shotgun_WPN_ICLIPSIZE;
var config int Shotgun_IDEALRANGE;



var config int SmokeGrenadeHitModMk1;
var config int SmokeGrenadeHitModMk2;
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateRoguePistol('XComPistol_M1'));
	Weapons.AddItem(CreateRoguePistol('XComPistol_M2'));
	Weapons.AddItem(CreateRoguePistol('XComPistol_M3'));

	Weapons.AddItem(CreateRogueRocket('XComRocket_M1'));
	Weapons.AddItem(CreateRogueRocket('XComRocket_M2'));

	Weapons.AddItem(CreateRogueSmoke('XComSmoke_M1'));
	Weapons.AddItem(CreateRogueSmoke('XComSmoke_M2'));
	//Weapons.AddItem(CreateRogueFrag('XComFrag_M1'));

	Weapons.AddItem(CreateRogueMedikit('XComMedikit_M1'));
	Weapons.AddItem(CreateRogueMedikit('XComMedikit_M2'));


	Weapons.AddItem(CreateRogueSniper('XComSniper_M1'));
	Weapons.AddItem(CreateRogueShotgun('XComShotgun_M1'));
	Weapons.AddItem(CreateRogueRifle('XComRifle_M1'));
	Weapons.AddItem(CreateRogueCannon('XComCannon_M1'));

	Weapons.AddItem(CreateRogueSniper('XComSniper_M2'));
	Weapons.AddItem(CreateRogueShotgun('XComShotgun_M2'));
	Weapons.AddItem(CreateRogueRifle('XComRifle_M2'));
	Weapons.AddItem(CreateRogueCannon('XComCannon_M2'));

	Weapons.AddItem(CreateRogueSniper('XComSniper_M3'));
	Weapons.AddItem(CreateRogueShotgun('XComShotgun_M3'));
	Weapons.AddItem(CreateRogueRifle('XComRifle_M3'));
	Weapons.AddItem(CreateRogueCannon('XComCannon_M3'));

	Weapons.AddItem(CreateRogueSHIVCannon('XComSHIVCannon_M2'));
	Weapons.AddItem(CreateRogueSHIVCannon('XComSHIVCannon_M3'));

	Weapons.AddItem(CreateRogueMECCannon('XComMecCannon_M3'));

	return Weapons;

}


// **************************************************************************
// ***                          Mediktis	                             ***
// **************************************************************************

static function X2DataTemplate CreateRogueMedikit(name TemplateName)
{
	local X2WeaponTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, templatename);
	Template.ItemCat = 'heal';
	Template.WeaponCat = class'X2Item_DefaultUtilityItems'.default.MedikitCat;

	Template.InventorySlot = eInvSlot_Utility;
	Template.StowedLocation = eSlot_RearBackPack;
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Medkit";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.iClipSize = 2;
	Template.iRange = class'X2Item_DefaultUtilityItems'.default.MEDIKIT_RANGE_TILES;
	Template.bMergeAmmo = true;

	if(TemplateName == 'XComMedikit_M1')
	{
		Template.Abilities.AddItem('MedikitHeal');
		Template.Abilities.AddItem('MedikitBonus');
	}
	else
	{
		Template.Abilities.AddItem('NanoMedikitHeal');
		Template.Abilities.AddItem('NanoMedikitBonus');
	}
	Template.GameArchetype = "WP_Medikit.WP_Medikit";

	Template.CanBeBuilt = false;
	Template.TradingPostValue = 15;
	Template.PointsToComplete = 0;
	Template.Tier = 0;

	Template.bShouldCreateDifficultyVariants = true;

	return Template;
}

// **************************************************************************
// ***                          SMoke Grenade                             ***
// **************************************************************************

static function X2DataTemplate CreateRogueSmoke(name TemplateName)
{
	local X2GrenadeTemplate Template;
	local X2Effect_ApplySmokeGrenadeToWorld WeaponEffect;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, TemplateName);

	Template.WeaponCat = 'utility';
	Template.ItemCat = 'utility';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Smoke_Grenade";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.AddAbilityIconOverride('ThrowGrenade', "img:///UILibrary_PerkIcons.UIPerk_grenade_smoke");
	Template.AddAbilityIconOverride('LaunchGrenade', "img:///UILibrary_PerkIcons.UIPerk_grenade_smoke");
	Template.iRange = class'X2Item_DefaultGrenades'.default.SMOKEGRENADE_RANGE;
	Template.iRadius = class'X2Item_DefaultGrenades'.default.SMOKEGRENADE_RADIUS;

	Template.iSoundRange = class'X2Item_DefaultGrenades'.default.SMOKEGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultGrenades'.default.SMOKEGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = 7;
	Template.PointsToComplete = class'X2Item_DefaultGrenades'.default.SMOKEGRENADE_IPOINTS;
	Template.iClipSize = class'X2Item_DefaultGrenades'.default.SMOKEGRENADE_ICLIPSIZE;
	Template.Tier = 0;

	Template.Abilities.AddItem('ThrowGrenade');
	Template.bFriendlyFireWarning = false;

	WeaponEffect = new class'X2Effect_ApplySmokeGrenadeToWorld';	
	Template.ThrownGrenadeEffects.AddItem(WeaponEffect);
	if(TemplateName == 'XComSmoke_M1')
	{
		Template.ThrownGrenadeEffects.AddItem(SmokeGrenadeEffect());
	}
	else
	{
		Template.iClipSize = class'X2Item_DefaultGrenades'.default.SMOKEGRENADE_ICLIPSIZE * 2;
		Template.ThrownGrenadeEffects.AddItem(Mk2SmokeGrenadeEffect());
	}
	Template.LaunchedGrenadeEffects = Template.ThrownGrenadeEffects;

	Template.GameArchetype = "WP_Grenade_Smoke.WP_Grenade_Smoke";

	Template.CanBeBuilt = false;

	// Cost

	// Soldier Bark
	Template.OnThrowBarkSoundCue = 'SmokeGrenade';

	return Template;
}

static function X2Effect SmokeGrenadeEffect()
{
	local X2Effect_SmokeGrenade Effect;

	Effect = new class'X2Effect_SmokeGrenade';
	//Must be at least as long as the duration of the smoke effect on the tiles. Will get "cut short" when the tile stops smoking or the unit moves. -btopp 2015-08-05
	Effect.BuildPersistentEffect(class'X2Effect_ApplySmokeGrenadeToWorld'.default.Duration + 1, false, false, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, class'X2Item_DefaultGrenades'.default.SmokeGrenadeEffectDisplayName, class'X2Item_DefaultGrenades'.default.SmokeGrenadeEffectDisplayDesc, "img:///UILibrary_PerkIcons.UIPerk_grenade_smoke");
	Effect.HitMod = default.SmokeGrenadeHitModMk1;
	Effect.DuplicateResponse = eDupe_Refresh;
	return Effect;
}

static function X2Effect Mk2SmokeGrenadeEffect()
{
	local X2Effect_SmokeGrenade Effect;

	Effect = new class'X2Effect_SmokeGrenade';
	//Must be at least as long as the duration of the smoke effect on the tiles. Will get "cut short" when the tile stops smoking or the unit moves. -btopp 2015-08-05
	Effect.BuildPersistentEffect(class'X2Effect_ApplySmokeGrenadeToWorld'.default.Duration + 1, false, false, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, class'X2Item_DefaultGrenades'.default.SmokeGrenadeEffectDisplayName, class'X2Item_DefaultGrenades'.default.SmokeGrenadeEffectDisplayDesc, "img:///UILibrary_PerkIcons.UIPerk_grenade_smoke");
	Effect.HitMod = default.SmokeGrenadeHitModMk2;
	Effect.DuplicateResponse = eDupe_Refresh;
	return Effect;
}
// **************************************************************************
// ***                          Rocket		                              ***
// **************************************************************************

static function X2DataTemplate CreateRogueRocket(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Template.WeaponCat = 'heavy';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Rocket_Launcher";
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";

	if(TemplateName == 'XComRocket_M1')
	{
		Template.BaseDamage = default.ROCKETEERM1_ROCKETEERLAUNCHER_BASEDAMAGE;
		Template.iSoundRange = default.ROCKETEERM1_ROCKETEERLAUNCHER_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.ROCKETEERM1_ROCKETEERLAUNCHER_IENVIRONMENTDAMAGE;
		Template.iClipSize = default.ROCKETEERM1_ROCKETEERLAUNCHER_CLIPSIZE;
		Template.iRange = default.ROCKETEERM1_ROCKETEERLAUNCHER_RANGE;
		Template.iRadius = default.ROCKETEERM1_ROCKETEERLAUNCHER_RADIUS;
	}
	else
	{
		Template.BaseDamage = default.ROCKETEERM2_ROCKETEERLAUNCHER_BASEDAMAGE;
		Template.iSoundRange = default.ROCKETEERM2_ROCKETEERLAUNCHER_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.ROCKETEERM2_ROCKETEERLAUNCHER_IENVIRONMENTDAMAGE;
		Template.iClipSize = default.ROCKETEERM2_ROCKETEERLAUNCHER_CLIPSIZE;
		Template.iRange = default.ROCKETEERM2_ROCKETEERLAUNCHER_RANGE;
		Template.iRadius = default.ROCKETEERM2_ROCKETEERLAUNCHER_RADIUS;
	}
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "WP_Heavy_RocketLauncher.WP_Heavy_RocketLauncher";
	//Template.GameArchetype = "WP_Heavy_RocketLauncher.WP_Heavy_RocketLauncher_Powered";
	Template.bMergeAmmo = true;
	Template.DamageTypeTemplateName = 'Explosion';

	Template.Abilities.AddItem('RocketLauncher');
	Template.Abilities.AddItem('RocketFuse');

	Template.CanBeBuilt = false;
		
	return Template;
}

// **************************************************************************
// ***                          Shotgun		                              ***
// **************************************************************************
static function X2DataTemplate CreateRogueShotgun(name TemplateName)
{
	local X2WeaponTemplate Template;

		`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Template.WeaponPanelImage = "_ConventionalShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	
	if (TemplateName == 'XComShotgun_M1' || TemplateName == 'XComShotgun_M2'){
		Template.WeaponTech = 'conventional';
	}
	else
	{
		Template.WeaponTech = 'magnetic';
	}
	Template.strImage = "img:///UILibrary_Common.ConvShotgun.ConvShotgun_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = default.SHORT_CONVENTIONAL_RANGE;
    Template.iClipSize = default.Shotgun_WPN_ICLIPSIZE; 

    Template.iSoundRange = default.Shotgun_MAGNETIC_ISOUNDRANGE;

	if (TemplateName == 'XComShotgun_M1')
	{
		Template.BaseDamage = default.ROGUE_SHOTGUN_M1_WPN_BASEDAMAGE;
	}
	else if (TemplateName == 'XComShotgun_M2')
	{
		Template.BaseDamage = default.ROGUE_SHOTGUN_M2_WPN_BASEDAMAGE;
	}
	else
	{
		Template.BaseDamage = default.ROGUE_SHOTGUN_M3_WPN_BASEDAMAGE;
	}
    Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.Shotgun_MAGNETIC_IENVIRONMENTDAMAGE;
    Template.iIdealRange = default.Shotgun_IDEALRANGE; //check this

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	//Template.GameArchetype = "WP_Shotgun_CV.WP_Shotgun_CV";
	//Template.GameArchetype = "BetterWeapons.WP_Shotgun_MG";
	if (TemplateName == 'XComShotgun_M1')
	{
		// This all the resources; sounds, animations, models, physics, the works.
		Template.GameArchetype = "WP_Shotgun_CV.WP_Shotgun_CV";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';
		Template.AddDefaultAttachment('Foregrip', "ConvShotgun.Meshes.SM_ConvShotgun_ForegripA" /*FORGRIP INCLUDED IN MAG IMAGE*/);
		Template.AddDefaultAttachment('Mag', "ConvShotgun.Meshes.SM_ConvShotgun_MagA", , "img:///UILibrary_Common.ConvShotgun.ConvShotgun_MagA");
		Template.AddDefaultAttachment('Reargrip', "ConvShotgun.Meshes.SM_ConvShotgun_ReargripA" /*REARGRIP IS INCLUDED IN THE TRIGGER IMAGE*/);
		Template.AddDefaultAttachment('Stock', "ConvShotgun.Meshes.SM_ConvShotgun_StockA", , "img:///UILibrary_Common.ConvShotgun.ConvShotgun_StockA");
		Template.AddDefaultAttachment('Trigger', "ConvShotgun.Meshes.SM_ConvShotgun_TriggerA", , "img:///UILibrary_Common.ConvShotgun.ConvShotgun_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}
	else if (TemplateName == 'XComShotgun_M2')
	{
		Template.GameArchetype = "MrKX1WTier1.WP_X1Shotgun_CV";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';
		Template.AddDefaultAttachment('Foregrip', "ConvShotgun.Meshes.SM_ConvShotgun_ForegripA" /*FORGRIP INCLUDED IN MAG IMAGE*/);
		Template.AddDefaultAttachment('Mag', "", , "");
		Template.AddDefaultAttachment('Reargrip', "" /*REARGRIP IS INCLUDED IN THE TRIGGER IMAGE*/);
		Template.AddDefaultAttachment('Stock', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvShotgun_Stock", , "");
		Template.AddDefaultAttachment('Trigger', "ConvShotgun.Meshes.SM_ConvShotgun_TriggerA", , "");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}
	else
	{
		Template.Abilities.ADdItem('CloseCombatSpecialistAttack_RogueXCom');
		Template.Abilities.AddItem('RapidFire');
		// This all the resources; sounds, animations, models, physics, the works.
		Template.GameArchetype = "WP_Shotgun_MG.WP_Shotgun_MG";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';
		Template.AddDefaultAttachment('Foregrip', "MagShotgun.Meshes.SM_MagShotgun_ForegripA", , "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_ForegripA");
		Template.AddDefaultAttachment('Mag', "MagShotgun.Meshes.SM_MagShotgun_MagA", , "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_MagA");
		Template.AddDefaultAttachment('Reargrip', "MagShotgun.Meshes.SM_MagShotgun_ReargripA" /* included in trigger image */);
		Template.AddDefaultAttachment('Stock', "MagShotgun.Meshes.SM_MagShotgun_StockA", , "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_StockA");
		Template.AddDefaultAttachment('Trigger', "MagShotgun.Meshes.SM_MagShotgun_TriggerA", , "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}
	Template.iPhysicsImpulse = 5;

	Template.fKnockbackDamageAmount = 10.0f;
	Template.fKnockbackDamageRadius = 16.0f;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}

// **************************************************************************
// ***                          PISTOL		                             ***
// **************************************************************************
static function X2DataTemplate CreateRoguePistol(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';

	if (TemplateName == 'XComPistol_M1' || TemplateName == 'XComPistol_M2'){
		Template.WeaponTech = 'conventional';
	}
	else
	{
		Template.WeaponTech = 'magnetic';
	}

	Template.strImage = "img:///UILibrary_Common.ConvSecondaryWeapons.ConvPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";

	Template.RangeAccuracy = default.SHORT_CONVENTIONAL_RANGE;

	if (TemplateName == 'XComPistol_M1'){
		Template.BaseDamage = default.Rogue_PISTOL_M1_WPN_BASEDAMAGE;
	}
	else if (TemplateName == 'XComPistol_M2')
	{
		Template.BaseDamage = default.Rogue_PISTOL_M2_WPN_BASEDAMAGE;
		Template.Abilities.AddItem('RogueGunslinger');
	}
	else
	{
		Template.BaseDamage = default.Rogue_PISTOL_M3_WPN_BASEDAMAGE;
		Template.Abilities.AddItem('RogueGunslinger');
	}

	Template.Aim = default.Pistol_CONVENTIONAL_AIM;
	Template.CritChance = default.Pistol_CONVENTIONAL_CRITCHANCE;
	Template.InfiniteAmmo = true;
	Template.iClipSize = 99;
	Template.iSoundRange = default.Pistol_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.Pistol_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.iIdealRange = default.Shotgun_IDEALRANGE; //check this

	//Template.InfiniteAmmo = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolStandardShot');
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');


	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');	
	
	if (TemplateName == 'XComPistol_M1'){
		Template.GameArchetype = "WP_Pistol_CV.WP_Pistol_CV";
	}
	else if (TemplateName == 'XComPistol_M2')
	{
		Template.GameArchetype = "MrKX1WTier1.WP_PistolX1_CV";
	}
	else
	{
		Template.GameArchetype = "WP_Pistol_MG.WP_Pistol_MG";
	}
	Template.iPhysicsImpulse = 5;
	
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	//Template.bHideClipSizeStat = true;

	return Template;
}


// **************************************************************************
// ***                          Assault Rifle                             ***
// **************************************************************************
static function X2DataTemplate CreateRogueRifle(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	if(TemplateName == 'XComRifle_M1' || TemplateName == 'XComRifle_M2')
	{
		Template.WeaponTech = 'conventional';
	}
	else
	{
		Template.WeaponTech = 'magnetic';
	}
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = default.FLAT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.ROGUE_RIFLE_M1_WPN_BASEDAMAGE;

	if(TemplateName == 'XComRifle_M2')
	{
		Template.BaseDamage = default.ROGUE_RIFLE_M2_WPN_BASEDAMAGE;
		Template.Abilities.AddItem('Suppression');
	}
	else if(TemplateName == 'XComRifle_M3')
	{
		Template.BaseDamage = default.ROGUE_RIFLE_M3_WPN_BASEDAMAGE;
		Template.Abilities.AddItem('Suppression');
	}
	Template.iClipSize = default.Rifle_MagSize;
	Template.iSoundRange = default.ASSAULTRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ASSAULTRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 1;
	Template.iTypicalActionCost = 2;
	Template.iIdealRange = default.Rifle_IdealRange;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	if(TemplateName == 'XComRifle_M1')
	{
		// This all the resources; sounds, animations, models, physics, the works.
		Template.GameArchetype = "WP_AssaultRifle_CV.WP_AssaultRifle_CV";

		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
		Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
		Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
		Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
		Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
		Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	}
	else if (TemplateName == 'XComRifle_M2')
	{
		Template.GameArchetype = "MrKX1WTier1.WP_X1AssaultRifle_CV";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
		Template.AddDefaultAttachment('Mag', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvAssaultRifle_BaseMag", , "");
		Template.AddDefaultAttachment('Optic', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvAssaultRifle_BaseOptics", , "");
		Template.AddDefaultAttachment('Stock', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvAssaultRifle_BaseStock", , "");
		Template.AddDefaultAttachment('Reargrip', "", , "");
		Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "");
	}
	else
	{
		Template.GameArchetype = "WP_AssaultRifle_MG.WP_AssaultRifle_MG";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
		Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
		Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
		Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
		Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_StockA");
		Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}
	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';
	
	return Template;
}


// **************************************************************************
// ***                       Sniper Rifle                                 ***
// **************************************************************************

static function X2DataTemplate CreateRogueSniper(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Template.WeaponPanelImage = "_ConventionalSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	if(TemplateName == 'XComSniper_M1' || TemplateName == 'XComSniper_M2')
	{
		Template.WeaponTech = 'conventional';
	}
	else
	{
		Template.WeaponTech = 'magnetic';
	}
	Template.strImage = "img:///UILibrary_Common.ConvSniper.ConvSniper_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = default.LONG_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.ROGUE_SNIPER_M1_WPN_BASEDAMAGE;

	if(TemplateName == 'XComSniper_M2')
	{
		Template.BaseDamage = default.ROGUE_SNIPER_M2_WPN_BASEDAMAGE;
	}
	else if (TemplateName == 'XComSniper_M3')
	{
		Template.BaseDamage = default.ROGUE_SNIPER_M3_WPN_BASEDAMAGE;
	}
	Template.Aim = default.SNIPERRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.SNIPERRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.Sniper_MagSize;
	Template.iSoundRange = default.SNIPERRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SNIPERRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 1;
	
	Template.iIdealRange = default.Sniper_IdealRange;
	Template.bIsLargeWeapon = true;
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	if(TemplateName == 'XComSniper_M1')
	{
		Template.GameArchetype = "WP_SniperRifle_CV.WP_SniperRifle_CV";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
		Template.AddDefaultAttachment('Mag', "ConvSniper.Meshes.SM_ConvSniper_MagA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_MagA");
		Template.AddDefaultAttachment('Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_OpticA");
		Template.AddDefaultAttachment('Reargrip', "ConvSniper.Meshes.SM_ConvSniper_ReargripA" /*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
		Template.AddDefaultAttachment('Stock', "ConvSniper.Meshes.SM_ConvSniper_StockA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_StockA");
		Template.AddDefaultAttachment('Suppressor', "ConvSniper.Meshes.SM_ConvSniper_SuppressorA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_SuppressorA");
		Template.AddDefaultAttachment('Trigger', "ConvSniper.Meshes.SM_ConvSniper_TriggerA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}
	else if (TemplateName == 'XComSniper_M2')
	{
	    Template.GameArchetype = "MrKX1WTier1.WP_X1SniperRifle_CV";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
		Template.AddDefaultAttachment('Mag', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvSniper_MagA", , "");
		Template.AddDefaultAttachment('Optic', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvSniper_Optics", , "");
		Template.AddDefaultAttachment('Reargrip', "" /*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
		Template.AddDefaultAttachment('Stock', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvSniper_Stock", , "");
		Template.AddDefaultAttachment('Suppressor', "MrKX1WTier1.SkeletalMeshes.SM_X1ConvSniper_Muzzle", , "");
		Template.AddDefaultAttachment('Trigger', "ConvSniper.Meshes.SM_ConvSniper_TriggerA", , "");
	}
	else
	{
		Template.GameArchetype = "WP_SniperRifle_MG.WP_SniperRifle_MG";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
		Template.AddDefaultAttachment('Mag', "MagSniper.Meshes.SM_MagSniper_MagA", , "img:///UILibrary_Common.UI_MagSniper.MagSniper_MagA");
		Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_Common.UI_MagSniper.MagSniper_OpticA");
		Template.AddDefaultAttachment('Reargrip',   "MagSniper.Meshes.SM_MagSniper_ReargripA" /* image included in TriggerA */);
		Template.AddDefaultAttachment('Stock', "MagSniper.Meshes.SM_MagSniper_StockA", , "img:///UILibrary_Common.UI_MagSniper.MagSniper_StockA");
		Template.AddDefaultAttachment('Suppressor', "MagSniper.Meshes.SM_MagSniper_SuppressorA", , "img:///UILibrary_Common.UI_MagSniper.MagSniper_SuppressorA");
		Template.AddDefaultAttachment('Trigger', "MagSniper.Meshes.SM_MagSniper_TriggerA", , "img:///UILibrary_Common.UI_MagSniper.MagSniper_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

// **************************************************************************
// ***                       Cannon		                                  ***
// **************************************************************************
static function X2DataTemplate CreateRogueCannon(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';

	if(TemplateName == 'XComCannon_M1'){
		Template.WeaponTech = 'conventional';
		Template.strImage = "img:///UILibrary_Common.ConvCannon.ConvCannon_Base";
	}
	else if (TemplateName == 'XComCannon_M2')
	{
		Template.WeaponTech = 'conventional';
		Template.strImage = "img:///UILibrary_MrKWeapons.Inv_LMG";
	}
	else
	{
		Template.WeaponTech = 'magnetic';
		Template.strImage = "img:///UILibrary_Common.UI_MagCannon.MagCannon_Base";
	}
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.iClipSize = default.CANNON_WPN_ICLIPSIZE;
    Template.iSoundRange = class'X2Item_DefaultWeapons'.default.Shotgun_MAGNETIC_ISOUNDRANGE;

	if (TemplateName == 'XComCannon_M1'){
		Template.BaseDamage = default.Cannon_WPN_BASEDAMAGE;
	}
	else if (TemplateName == 'XComCannon_M2')
	{
		Template.BaseDamage = default.Cannon_M2_WPN_BASEDAMAGE;
		Template.Abilities.AddItem('Holotargeting');
	}
	else
	{
		Template.BaseDamage = default.Cannon_M3_WPN_BASEDAMAGE;
		Template.Abilities.AddItem('Holotargeting');
	}
    Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.Shotgun_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.iIdealRange = default.CANNON_IDEALRANGE;
	Template.NumUpgradeSlots = 3;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	//Template.GameArchetype = "WP_Cannon_CV.WP_Cannon_CV";
	//Template.GameArchetype = "BetterWeapons.WP_Cannon_MG";

	if (TemplateName == 'XComCannon_M1')
	{
		Template.GameArchetype = "WP_Cannon_CV.WP_Cannon_CV";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
		Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
		Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
		Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
		Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
		Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
		Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}

	else if (TemplateName == 'XComCannon_M2')
	{
		Template.GameArchetype = "MrKX1WTier1.WP_X1cannon_CV";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
		Template.AddDefaultAttachment('Mag', "MrKX1WTier1.SkeletalMeshes.SM_X1HeavyMG_Mag", , "");
		//Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
		//Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
		//Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
		//Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
		Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "");
		//Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
		//Template.BonusWeaponEffects.AddItem(BoltCasterStunEffect());
	}
	else
	{
		Template.GameArchetype = "WP_Cannon_MG.WP_Cannon_MG";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
		Template.AddDefaultAttachment('Mag', "MagCannon.Meshes.SM_MagCannon_MagA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_MagA");
		Template.AddDefaultAttachment('Reargrip',   "MagCannon.Meshes.SM_MagCannon_ReargripA");
		Template.AddDefaultAttachment('Foregrip', "MagCannon.Meshes.SM_MagCannon_StockA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_StockA");
		Template.AddDefaultAttachment('Trigger', "MagCannon.Meshes.SM_MagCannon_TriggerA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_TriggerA");
		Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	}

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Projectile_MagAdvent';

	return Template;
}
// **************************************************************************
// ***                      SHIV  Cannon		                                  ***
// **************************************************************************

static function X2DataTemplate CreateRogueSHIVCannon(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, templateName);
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvCannon.ConvCannon_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.iClipSize = default.SHIVCANNON_WPN_ICLIPSIZE;
    Template.iSoundRange = class'X2Item_DefaultWeapons'.default.Shotgun_MAGNETIC_ISOUNDRANGE;

	if (TemplateName == 'XComSHIVCannon_M1'){
		Template.BaseDamage = default.Cannon_WPN_BASEDAMAGE;
	}
	else if (TemplateName == 'XComSHIVCannon_M2')
	{
		Template.BaseDamage = default.SHIVCannon_M2_WPN_BASEDAMAGE;
		Template.Abilities.ADdItem('CloseCombatSpecialistAttack_RogueXCom');
	}

	Template.NumUpgradeSlots = 0;
	Template.bIsLargeWeapon = true;

	Template.iIdealRange = default.SHIVCANNON_IDEALRANGE;
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Suppression');
	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XEU_SHIV.Archetypes.WP_SHIV_minigun";
//	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
//	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
//	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
//	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
//	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
//	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
//	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;



	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

// **************************************************************************
// ***                     MEC  Cannon		                                  ***
// **************************************************************************
static function X2DataTemplate CreateRogueMecCannon(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, templateName);
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	if(TemplateName == 'XComMecCannon_M1' || TemplateName == 'XComMecCannon_M2')
	{
		Template.WeaponTech = 'conventional';
	}
	else
	{
		Template.WeaponTech = 'magnetic';
	}
	Template.WeaponCat = 'cannon';

	Template.strImage = "img:///UILibrary_Common.ConvCannon.ConvCannon_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	Template.iClipSize = default.MECCANNON_CLIPSIZE;
    Template.iSoundRange = class'X2Item_DefaultWeapons'.default.Shotgun_MAGNETIC_ISOUNDRANGE;

	if (TemplateName == 'XComMecCannon_M1'){
		Template.BaseDamage = default.Cannon_WPN_BASEDAMAGE;
	}
	else if (TemplateName == 'XComMecCannon_M2')
	{
		Template.BaseDamage = default.SHIVCannon_M2_WPN_BASEDAMAGE;
		Template.Abilities.ADdItem('CloseCombatSpecialistAttack_RogueXCom');
	}
	else
	{
		Template.BaseDamage = default.MECTROOPERCANNON_M3_WPN_BASEDAMAGE;
		Template.Abilities.AddItem('RogueCollateralDamage');
		Template.GameArchetype = "DLC_3_WP_SparkRifle_MG.WP_SparkRifle_MG";
		Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	}
	Template.NumUpgradeSlots = 0;
	Template.bIsLargeWeapon = true;

	Template.iIdealRange = default.MECCANNON_IDEALRANGE;
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Suppression');

	
	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;



	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}