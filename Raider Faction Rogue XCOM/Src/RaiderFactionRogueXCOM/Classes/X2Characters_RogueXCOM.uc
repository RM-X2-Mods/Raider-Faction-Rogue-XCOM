class X2Characters_RogueXCOM extends X2Character_DefaultCharacters config(GameData_CharacterStats);


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	//mutinous
	Templates.AddItem(CreateTemplate_XComAssault('XComAssault_M1'));
	Templates.AddItem(CreateTemplate_XComSniper('XComSniper_M1'));
	Templates.AddItem(CreateTemplate_XComSupport('XComSupport_M1'));
	Templates.AddItem(CreateTemplate_XComHeavy('XCOMHeavy_M1'));

	//rogue
	Templates.AddItem(CreateTemplate_XComAssault('XComAssault_M2'));
	Templates.AddItem(CreateTemplate_XComSniper('XComSniper_M2'));
	Templates.AddItem(CreateTemplate_XComSupport('XComSupport_M2'));
	Templates.AddItem(CreateTemplate_XComHeavy('XCOMHeavy_M2'));
	Templates.AddItem(CreateTemplate_XComSHIV('XComShiv_M1'));

	//Renegade
	Templates.AddItem(CreateTemplate_XComAssault('XComAssault_M3'));
	Templates.AddItem(CreateTemplate_XComSniper('XComSniper_M3'));
	Templates.AddItem(CreateTemplate_XComSupport('XComSupport_M3'));
	Templates.AddItem(CreateTemplate_XComHeavy('XCOMHeavy_M3'));
	Templates.AddItem(CreateTemplate_XComSHIV('XComShiv_M2'));
	Templates.AddItem(CreateTemplate_XComMEC('XComMecTrooper_M3'));

	return Templates;
}

//Assault
static function X2CharacterTemplate CreateTemplate_XComAssault(name templatename)
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	CharTemplate= new(None, string(templatename)) class'X2CharacterTemplate'; CharTemplate.SetTemplateName(templatename);;

	// Auto-Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'RogueXCom_BaseLoot';
	CharTemplate.Loot.LootReferences.AddItem(Loot);

	// Timed Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'AdvTrooperM1_TimedLoot';
	CharTemplate.TimedLoot.LootReferences.AddItem(Loot);
	Loot.LootTableName = 'AdvTrooperM1_VultureLoot';
	CharTemplate.VultureLoot.LootReferences.AddItem(Loot);


	CharTemplate.UnitSize = 1;
	CharTemplate.CharacterGroupName = 'Raider_XCom';
	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.strBehaviorTree = "RogueXComAssaultRoot";
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bDiesWhenCaptured = true;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bCanBeCarried = false;
	CharTemplate.bCanBeRevived = true;

	CharTemplate.bIsTooBigForArmory = false;
	CharTemplate.bStaffingAllowed = false;
	CharTemplate.bAppearInBase = false; // Do not appear as filler crew or in any regular staff slots throughout the base
	CharTemplate.bWearArmorInBase = false;
	
	CharTemplate.bAllowRushCam = true;
	CharTemplate.strMatineePackages.AddItem("CIN_Soldier");
	//CharTemplate.strIntroMatineeSlotPrefix = "Char";
	//CharTemplate.strLoadingMatineeSlotPrefix = "Soldier";
	CharTemplate.strMatineePackages.AddItem("CIN_Advent");
	CharTemplate.RevealMatineePrefix = "CIN_Advent_Trooper";
	CharTemplate.GetRevealMatineePrefixFn = GetAdventMatineePrefix;
	
	//CharTemplate.DefaultSoldierClass = 'Rookie';
	CharTemplate.DefaultLoadout = 'XComAssault_M1';
	CharTemplate.Abilities.AddItem('RunAndGun');

	if(templateName == 'XComAssault_M2')
	{
		CharTemplate.DefaultLoadout = 'XComAssault_M2';
		CharTemplate.Abilities.AddItem('LightningReflexes');
		CharTemplate.Abilities.AddItem('RogueTacticalSense');
	}
	else if(templateName == 'XComAssault_M3')
	{
		CharTemplate.DefaultLoadout = 'XComAssault_M3';
		CharTemplate.Abilities.AddItem('LightningReflexes');
		CharTemplate.Abilities.AddItem('RogueTacticalSense');
		CharTemplate.Abilities.AddItem('CloseCombatSpecialist_RogueXCom');
	}

	//CharTemplate.RequiredLoadout = 'RequiredSoldier';
	CharTemplate.BehaviorClass=class'XGAIBehavior';

	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	//CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;

	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_RogueXcom';
	
	CharTemplate.PhotoboothPersonality = 'Personality_Normal';

	return CharTemplate;
}
//Sniper
static function X2CharacterTemplate CreateTemplate_XComSniper(name templatename)
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	CharTemplate= new(None, string(templatename)) class'X2CharacterTemplate'; CharTemplate.SetTemplateName(templatename);;

	// Auto-Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'RogueXCom_BaseLoot';
	CharTemplate.Loot.LootReferences.AddItem(Loot);

	// Timed Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'AdvTrooperM1_TimedLoot';
	CharTemplate.TimedLoot.LootReferences.AddItem(Loot);
	Loot.LootTableName = 'AdvTrooperM1_VultureLoot';
	CharTemplate.VultureLoot.LootReferences.AddItem(Loot);


	CharTemplate.UnitSize = 1;
	CharTemplate.CharacterGroupName = 'Raider_XCom';
	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.strBehaviorTree = "RogueXComSniperRoot";
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bDiesWhenCaptured = true;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bCanBeCarried = false;
	CharTemplate.bCanBeRevived = true;

	CharTemplate.bIsTooBigForArmory = false;
	CharTemplate.bStaffingAllowed = false;
	CharTemplate.bAppearInBase = false; // Do not appear as filler crew or in any regular staff slots throughout the base
	CharTemplate.bWearArmorInBase = false;
	
	CharTemplate.bAllowRushCam = true;
	CharTemplate.strMatineePackages.AddItem("CIN_Soldier");
	//CharTemplate.strIntroMatineeSlotPrefix = "Char";
	//CharTemplate.strLoadingMatineeSlotPrefix = "Soldier";
	CharTemplate.strMatineePackages.AddItem("CIN_Advent");
	CharTemplate.RevealMatineePrefix = "CIN_Advent_Trooper";
	CharTemplate.GetRevealMatineePrefixFn = GetAdventMatineePrefix;
	
	//CharTemplate.DefaultSoldierClass = 'Rookie';
	CharTemplate.DefaultLoadout = 'XComSniper_M1';
	if(templateName == 'XComSniper_M2')
	{
		CharTemplate.DefaultLoadout = 'XComSniper_M2';
		CharTemplate.Abilities.AddItem('CoolUnderPressure');
		
	}
	else if(templateName == 'XComSniper_M3')
	{
		CharTemplate.DefaultLoadout = 'XComSniper_M2';
		CharTemplate.Abilities.AddItem('CoolUnderPressure');
		CharTemplate.Abilities.AddItem('RogueXComLowProfile');
		CharTemplate.Abilities.AddItem('SkirmisherStrike');
	}
	//CharTemplate.RequiredLoadout = 'RequiredSoldier';
	CharTemplate.BehaviorClass=class'XGAIBehavior';

	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	//CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;

	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_RogueXcom';
	
	CharTemplate.PhotoboothPersonality = 'Personality_Normal';

	return CharTemplate;
}
//Support
static function X2CharacterTemplate CreateTemplate_XComSupport(name templatename)
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	CharTemplate= new(None, string(templatename)) class'X2CharacterTemplate'; CharTemplate.SetTemplateName(templatename);;

	// Auto-Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'RogueXCom_BaseLoot';
	CharTemplate.Loot.LootReferences.AddItem(Loot);

	// Timed Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'AdvTrooperM1_TimedLoot';
	CharTemplate.TimedLoot.LootReferences.AddItem(Loot);
	Loot.LootTableName = 'AdvTrooperM1_VultureLoot';
	CharTemplate.VultureLoot.LootReferences.AddItem(Loot);


	CharTemplate.UnitSize = 1;
	CharTemplate.CharacterGroupName = 'Raider_XCom';
	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.strBehaviorTree = "RogueXComSupportRoot";
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bDiesWhenCaptured = true;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bCanBeCarried = false;
	CharTemplate.bCanBeRevived = true;

	CharTemplate.bIsTooBigForArmory = false;
	CharTemplate.bStaffingAllowed = false;
	CharTemplate.bAppearInBase = false; // Do not appear as filler crew or in any regular staff slots throughout the base
	CharTemplate.bWearArmorInBase = false;
	
	CharTemplate.bAllowRushCam = true;
	CharTemplate.strMatineePackages.AddItem("CIN_Soldier");
	//CharTemplate.strIntroMatineeSlotPrefix = "Char";
	//CharTemplate.strLoadingMatineeSlotPrefix = "Soldier";
	CharTemplate.strMatineePackages.AddItem("CIN_Advent");
	CharTemplate.RevealMatineePrefix = "CIN_Advent_Trooper";
	CharTemplate.GetRevealMatineePrefixFn = GetAdventMatineePrefix;
	
	//CharTemplate.DefaultSoldierClass = 'Rookie';
	CharTemplate.DefaultLoadout = 'XComSupport_M1';
	if(templateName == 'XComSupport_M2')
	{
		CharTemplate.DefaultLoadout = 'XComSupport_M2';
		CharTemplate.Abilities.AddItem('FieldMedic');

	}
	else if (templateName == 'XComSupport_M3')
	{
		CharTemplate.DefaultLoadout = 'XComSupport_M3';
		CharTemplate.Abilities.AddItem('FieldMedic');
		CharTemplate.Abilities.AddItem('RogueSentinel');
	}
	//CharTemplate.RequiredLoadout = 'RequiredSoldier';
	CharTemplate.BehaviorClass=class'XGAIBehavior';

	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	//CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;

	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_RogueXcom';
	
	CharTemplate.PhotoboothPersonality = 'Personality_Normal';

	return CharTemplate;
}
//Heavy
static function X2CharacterTemplate CreateTemplate_XComHeavy(name templatename)
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	CharTemplate= new(None, string(templatename)) class'X2CharacterTemplate'; CharTemplate.SetTemplateName(templatename);;

	// Auto-Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'RogueXCom_BaseLoot';
	CharTemplate.Loot.LootReferences.AddItem(Loot);

	// Timed Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'AdvTrooperM1_TimedLoot';
	CharTemplate.TimedLoot.LootReferences.AddItem(Loot);
	Loot.LootTableName = 'AdvTrooperM1_VultureLoot';
	CharTemplate.VultureLoot.LootReferences.AddItem(Loot);


	CharTemplate.UnitSize = 1;
	CharTemplate.CharacterGroupName = 'Raider_XCom';
	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.strBehaviorTree = "RogueXComHeavyRoot";
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bDiesWhenCaptured = true;
	CharTemplate.bAppearanceDefinesPawn = true;
	CharTemplate.bIsAfraidOfFire = true;
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.bCanBeCarried = false;
	CharTemplate.bCanBeRevived = true;

	CharTemplate.bIsTooBigForArmory = false;
	CharTemplate.bStaffingAllowed = false;
	CharTemplate.bAppearInBase = false; // Do not appear as filler crew or in any regular staff slots throughout the base
	CharTemplate.bWearArmorInBase = false;
	
	CharTemplate.bAllowRushCam = true;
	CharTemplate.strMatineePackages.AddItem("CIN_Soldier");
	//CharTemplate.strIntroMatineeSlotPrefix = "Char";
	//CharTemplate.strLoadingMatineeSlotPrefix = "Soldier";
	CharTemplate.strMatineePackages.AddItem("CIN_Advent");
	CharTemplate.RevealMatineePrefix = "CIN_Advent_Trooper";
	CharTemplate.GetRevealMatineePrefixFn = GetAdventMatineePrefix;
	
	//CharTemplate.DefaultSoldierClass = 'Rookie';
	CharTemplate.DefaultLoadout = 'XComHeavy_M1';
	if(templateName == 'XComHeavy_M2')
	{
		CharTemplate.DefaultLoadout = 'XComHeavy_M2';
		CharTemplate.Abilities.AddItem('SkirmisherStrike');
	}
	else if (templateName == 'XComHeavy_M3')
	{
		CharTemplate.DefaultLoadout = 'XComHeavy_M3';
		CharTemplate.Abilities.AddItem('SkirmisherStrike');
	}
	//CharTemplate.RequiredLoadout = 'RequiredSoldier';
	CharTemplate.BehaviorClass=class'XGAIBehavior';

	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	//CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;

	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_RogueXcom';
	
	CharTemplate.PhotoboothPersonality = 'Personality_Normal';

	return CharTemplate;
}
//SHIV
static function X2CharacterTemplate CreateTemplate_XComSHIV(name TemplateName)
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, templateName);

	// Auto-Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'RogueXCom_BaseLoot';
	CharTemplate.Loot.LootReferences.AddItem(Loot);

	// Timed Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'AdvTrooperM1_TimedLoot';
	CharTemplate.TimedLoot.LootReferences.AddItem(Loot);
	Loot.LootTableName = 'AdvTrooperM1_VultureLoot';
	CharTemplate.VultureLoot.LootReferences.AddItem(Loot);


	CharTemplate.UnitSize = 1;
	CharTemplate.CharacterGroupName = 'Raider_XCom';


	CharTemplate.BehaviorClass=class'XGAIBehavior';
	CharTemplate.strBehaviorTree = "RogueXComShivRoot";



	//CharTemplate.strMatineePackage = "CIN_Muton"; 
	//CharTemplate.strMatineePackages.AddItem("CIN_Muton"); //update with new cinematic?

	CharTemplate.UnitSize = 1;

	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = false;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = false;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = false;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = true;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bAppearInBase = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;
	CharTemplate.bAllowRushCam = false;

	CharTemplate.bCanTakeCover = false; //!
	CharTemplate.bDiesWhenCaptured = true;
	
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false; 
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = true;
	CharTemplate.bIsSoldier = false; //will be true when implementing into game
	//CharTemplate.bIsTurret = true;
	CharTemplate.bIsMeleeOnly = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;

	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.AddTemplateAvailablility(CharTemplate.BITFIELD_GAMEAREA_Multiplayer); // Allow in MP!
	CharTemplate.MPPointValue = CharTemplate.XpKillscore * 10;

	CharTemplate.Abilities.AddItem('RobotImmunities');
	if(TemplateName == 'XComShiv_M1')
	{
	
		CharTemplate.strPawnArchetypes.AddItem("XEU_SHIV.Archetypes.ARC_GameUnit_SHIV2");
		CharTemplate.DefaultLoadout='XComSHIV_M1';
	}
	else if(TemplateName == 'XComShiv_M2')
	{
		CharTemplate.DefaultLoadout='XComSHIV_M2';
		CharTemplate.strPawnArchetypes.AddItem("XEU_SHIV.Archetypes.ARC_GameUnit_SHIV3");
		CharTemplate.Abilities.AddItem('RogueSentinelRegen');
		CharTemplate.Abilities.AddItem('CloseCombatSpecialist_RogueXCom');
		CharTemplate.Abilities.AddItem('RogueSHIVCover');
	}
	CharTemplate.strMatineePackages.AddItem("CIN_Spark");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";
	CharTemplate.strIntroMatineeSlotPrefix = "Spark";
	CharTemplate.strLoadingMatineeSlotPrefix = "SparkSoldier";

	CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;
	CharTemplate.strHackIconImage = "UILibrary_Common.TargetIcons.Hack_robot_icon";

	CharTemplate.CustomizationManagerClass = class'XComCharacterCustomization_Spark';
	CharTemplate.UICustomizationMenuClass = class'UICustomize_SparkMenu';
	CharTemplate.UICustomizationInfoClass = class'UICustomize_SparkInfo';
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_SPARK';

	return CharTemplate;


}

static function X2CharacterTemplate CreateTemplate_XComMec(name TemplateName)
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, templateName);

	// Auto-Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'RogueXCom_BaseLoot';
	CharTemplate.Loot.LootReferences.AddItem(Loot);

	// Timed Loot
	Loot.ForceLevel = 0;
	Loot.LootTableName = 'AdvTrooperM1_TimedLoot';
	CharTemplate.TimedLoot.LootReferences.AddItem(Loot);
	Loot.LootTableName = 'AdvTrooperM1_VultureLoot';
	CharTemplate.VultureLoot.LootReferences.AddItem(Loot);


	CharTemplate.UnitSize = 1;
	CharTemplate.CharacterGroupName = 'Raider_XCom';


	CharTemplate.BehaviorClass=class'XGAIBehavior';
	CharTemplate.strBehaviorTree = "RogueXComMecRoot";



	//CharTemplate.strMatineePackage = "CIN_Muton"; 
	//CharTemplate.strMatineePackages.AddItem("CIN_Muton"); //update with new cinematic?

	CharTemplate.UnitSize = 1;

	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = false;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = false;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = false;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = true;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = true;    
	CharTemplate.bAppearInBase = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;
	CharTemplate.bAllowRushCam = false;

	CharTemplate.bCanTakeCover = false; //!
	CharTemplate.bDiesWhenCaptured = true;
	
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false; 
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bWeakAgainstTechLikeRobot = true;
	CharTemplate.bIsSoldier = false; //will be true when implementing into game
	//CharTemplate.bIsTurret = true;
	CharTemplate.bIsMeleeOnly = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;

	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.AddTemplateAvailablility(CharTemplate.BITFIELD_GAMEAREA_Multiplayer); // Allow in MP!
	CharTemplate.MPPointValue = CharTemplate.XpKillscore * 10;

	//CharTemplate.Abilities.AddItem('RobotImmunities');

	CharTemplate.DefaultLoadout='XComMecTrooper_M3';
	CharTemplate.Abilities.AddItem('SkirmisherStrike');
	CharTemplate.Abilities.AddItem('RogueAbsorptionFields');

	CharTemplate.strMatineePackages.AddItem("CIN_Soldier");
	CharTemplate.strMatineePackages.AddItem("CIN_Spark");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";
	CharTemplate.strIntroMatineeSlotPrefix = "Spark";
	CharTemplate.strLoadingMatineeSlotPrefix = "SparkSoldier";

	CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);
	CharTemplate.ImmuneTypes.AddItem('Fire');
	CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_XCom;
	
	CharTemplate.CustomizationManagerClass = class'XComCharacterCustomization_Spark';
	CharTemplate.UICustomizationMenuClass = class'UICustomize_SparkMenu';
	CharTemplate.UICustomizationInfoClass = class'UICustomize_SparkInfo';
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_RogueXcom_Mec';

	return CharTemplate;


}