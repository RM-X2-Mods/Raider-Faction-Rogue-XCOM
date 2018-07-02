class X2Helpers_RogueXCom extends Object config (GameData);

var config int ForceLevelForTierTwo;
var config int ForceLevelForTierThree;
var config int TierOnePodSize;
var config int TIerTwoPodSize;
var config int TierThreePodSize;

static function PreMissionUpdate(XComGameState NewGameState, XComGameState_MissionSite MissionState)
{
	local X2SelectedEncounterData NewEncounter, EmptyEncounter;
	local XComTacticalMissionManager TacticalMissionManager;
	local PrePlacedEncounterPair EncounterInfo;
	local array<X2CharacterTemplate> SelectedCharacterTemplates;
	local ConfigurableEncounter Encounter;
	local float AlienLeaderWeight, AlienFollowerWeight;
	local XComAISpawnManager SpawnManager;
	local int LeaderForceLevelMod;
	local MissionSchedule SelectedMissionSchedule;
	local array<Name> NamesToAdd, RandomEnemyNames;
	local float AlongLOP, FromLOP;
	local int i;
	local name GeneratedEnemy;

	//History = `XCOMHISTORY;
	EncounterInfo.EncounterID='RogueXCom_FL1'; 
	Encounter.MaxSpawnCount = default.TierOnePodSize;
	if(MissionState.SelectedMissionData.ForceLevel >= default.ForceLevelForTierThree)
	{
		EncounterInfo.EncounterID = 'RogueXCom_FL3';
		Encounter.MaxSpawnCount = default.TierThreePodSize;
		RandomEnemyNames.AddItem('XComSupport_M3');
		RandomEnemyNames.AddItem('XComSniper_M3');
		RandomEnemyNames.AddITem('XComHeavy_M3');
		RandomEnemyNames.AddItem('XComAssault_M3');
		RandomEnemyNames.AddITem('XComShiv_M2');
		RandomEnemyNames.AddItem('XComMecTrooper_M3');
	}

	else if(MissionState.SelectedMissionData.ForceLevel >= default.ForceLevelForTierTwo)
	{
		EncounterInfo.EncounterID = 'RogueXCom_FL2';
		Encounter.MaxSpawnCount = default.TierTwoPodSize;
		RandomEnemyNames.AddItem('XComSupport_M2');
		RandomEnemyNames.AddItem('XComSniper_M2');
		RandomEnemyNames.AddITem('XComHeavy_M2');
		RandomEnemyNames.AddItem('XComAssault_M2');
		RandomEnemyNames.AddITem('XComShiv_M1');
	}
	else 
	{
		RandomEnemyNames.AddItem('XComSupport_M1');
		RandomEnemyNames.AddItem('XComSniper_M1');
		RandomEnemyNames.AddITem('XComHeavy_M1');
		RandomEnemyNames.AddItem('XComAssault_M1');
	}
	for ( i = 0; i < Encounter.MaxSpawnCount; i++)
	{
		if(i < RandomEnemyNames.Length)
		{
			GeneratedEnemy = RandomEnemyNames[i]; // try using the list provided if it's there..
		}
		else
		{
			GeneratedEnemy = RandomEnemyNames[`SYNC_RAND_STATIC(RandomEnemyNames.Length)]; //or just add more random enemies if we go beyond it
		}
		NamesToAdd.AddItem(GeneratedEnemy);	
	}

	AlongLOP = `SYNC_RAND_STATIC(15) - `SYNC_RAND_STATIC(9) + 5;
	FromLOP = `SYNC_RAND_STATIC(10) - `SYNC_RAND_STATIC(5) + 5;
	EncounterInfo.EncounterZoneOffsetAlongLOP = AlongLOP; //randomized locations
	EncounterInfo.EncounterZoneOffsetFromLOP = FromLOP;
	EncounterInfo.EncounterZoneWidth=10.0;
	//EncounterInfo.EncounterZoneDepthOverride = 10.0;

	TacticalMissionManager = `TACTICALMISSIONMGR;
	SpawnManager = `SPAWNMGR;
	AlienLeaderWeight = 0.0;
	AlienFollowerWeight = 0.0;

	//TacticalMissionManager.GetConfigurableEncounter( EncounterInfo.EncounterID, Encounter, MissionState.SelectedMissionData.ForceLevel, MissionState.SelectedMissionData.AlertLevel );
	Encounter.EncounterID = EncounterInfo.EncounterID;
	
	Encounter.ForceSpawnTemplateNames = NamesToAdd;
	Encounter.TeamToSpawnInto = eTeam_Two;
	Encounter.ReinforcementCountdown = 1;

	TacticalMissionManager.GetMissionSchedule(MissionState.SelectedMissionData.SelectedMissionScheduleName, SelectedMissionSchedule);

	if( MissionState.SelectedMissionData.SelectedMissionScheduleName == '' )
	{
		`log("we were somehow given a missionstate with no schedule: fix it ourselves", , 'Raiders');
		MissionState = XComGameState_MissionSite(NewGameState.ModifyStateObject(class'XComGameState_MissionSite', MissionState.ObjectID));
		MissionState.UpdateSelectedMissionData();
		TacticalMissionManager.GetMissionSchedule(MissionState.SelectedMissionData.SelectedMissionScheduleName, SelectedMissionSchedule);
	}

	NewEncounter = EmptyEncounter;

	`log("Current Encounter ID is " $ Encounter.EncounterID, ,'Raiders');

	NewEncounter.SelectedEncounterName = Encounter.EncounterID;
	LeaderForceLevelMod = SpawnManager.GetLeaderForceLevelMod();

	// select the group members who will fill out this encounter group
	AlienLeaderWeight += SelectedMissionSchedule.AlienToAdventLeaderRatio;
	AlienFollowerWeight += SelectedMissionSchedule.AlienToAdventFollowerRatio;
	SpawnManager.SelectSpawnGroup(NewEncounter.EncounterSpawnInfo, MissionState.GeneratedMission.Mission, SelectedMissionSchedule, MissionState.GeneratedMission.Sitreps, Encounter ,MissionState.SelectedMissionData.ForceLevel, MissionState.SelectedMissionData.AlertLevel, SelectedCharacterTemplates, AlienLeaderWeight, AlienFollowerWeight, LeaderForceLevelMod);

	//NewEncounter.EncounterSpawnInfo.SelectedCharacterTemplateNames = NamesToAdd;
	NewEncounter.EncounterSpawnInfo.EncounterZoneWidth = EncounterInfo.EncounterZoneWidth;
	NewEncounter.EncounterSpawnInfo.EncounterZoneDepth = ((EncounterInfo.EncounterZoneDepthOverride >= 0.0) ? EncounterInfo.EncounterZoneDepthOverride : SelectedMissionSchedule.EncounterZonePatrolDepth);
	NewEncounter.EncounterSpawnInfo.EncounterZoneOffsetFromLOP = EncounterInfo.EncounterZoneOffsetFromLOP;
	NewEncounter.EncounterSpawnInfo.EncounterZoneOffsetAlongLOP = EncounterInfo.EncounterZoneOffsetAlongLOP;

	NewEncounter.EncounterSpawnInfo.SpawnLocationActorTag = EncounterInfo.SpawnLocationActorTag;

	MissionState.SelectedMissionData.SelectedEncounters.AddItem(NewEncounter);

}