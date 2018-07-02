//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_RaiderFactionRogueXCOM.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_RaiderFactionRogueXCOM extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{


}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{

}


/// <summary>
/// Called just before the player launches into a tactical a mission while this DLC / Mod is installed.
/// </summary>
/// 
static event OnPreMission(XComGameState NewGameState, XComGameState_MissionSite MissionState)
{

	if( HasSITREP(MissionState))
	{
		class'X2Helpers_RogueXCom'.static.PreMissionUpdate(NewGameState, MissionState);
		//DarkXComHQ.NumSinceAppearance = 0;
	}

}


static function bool HasSITREP(XComGameState_MissionSite MissionState)
{
	local name SITREP;
	local X2StrategyElementTemplateManager StgrMgr;
	
	local CHXComGameVersionTemplate VersionCheck;
	StgrMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	VersionCheck = CHXComGameVersionTemplate(StgrMgr.FindStrategyElementTemplate('CHXComGameVersion'));

	if(VersionCheck == none){
		return false; //no highlander
	}
	else
	{
		if(VersionCheck.GetVersionNumber() < ((1 * 100000000) + (10 * 10000))){ //below 1.10
			return false; //incorrect highlander
		}
	}

	foreach MissionState.TacticalGameplayTags(SITREP)
	{
		if(SITREP == 'SITREP_RogueXComIncursion')
		{
		`log(" mission has Marauder SITREP, adding.", ,'Marauders');
			return true;
		}
	}

	if(MissionState.GeneratedMission.Sitreps.Find('RogueXComIncursion') != INDEX_NONE)
	{
		`log("mission has Marauder SITREP, adding.", ,'Marauders');
		return true;
	}

	return false;
}