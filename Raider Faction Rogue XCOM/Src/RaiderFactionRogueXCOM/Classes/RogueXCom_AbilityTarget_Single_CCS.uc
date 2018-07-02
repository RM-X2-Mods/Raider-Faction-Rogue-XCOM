class RogueXCom_AbilityTarget_Single_CCS extends X2AbilityTarget_Single config (GameData);

var config int ROGUE_CCS_RANGE;
var config bool ROGUE_CCS_PROC_ON_OWN_TURN;

simulated function name GetPrimaryTargetOptions(const XComGameState_Ability Ability, out array<AvailableTarget> Targets)
{
	local XComGameState_Unit	CCS_ShooterUnit, TargetUnit;
	local int					i;
	local name					Code;
		
	Code = super.GetPrimaryTargetOptions(Ability,Targets);
	CCS_ShooterUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(Ability.OwnerStateObject.ObjectID));

	for (i = Targets.Length - 1; i >= 0; --i)
	{
		TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(Targets[i].PrimaryTarget.ObjectID));
		if (CCS_ShooterUnit.TileDistanceBetween(TargetUnit) > default.ROGUE_CCS_RANGE)
		{
			Targets.Remove(i,1);
		}								
	}	
	if ((Code == 'AA_Success') && (Targets.Length < 1))
	{
		return 'AA_NoTargets';
	}	
	return code;
}

simulated function bool ValidatePrimaryTargetOption(const XComGameState_Ability Ability, XComGameState_Unit SourceUnit, XComGameState_BaseObject TargetObject)
{
	local bool					b_valid;
	local XComGameState_Unit	TargetUnit;

	b_valid = Super.ValidatePrimaryTargetOption(Ability, SourceUnit, TargetObject);
	TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(TargetObject.ObjectID));
	if (TargetUnit == none)
		return false;
	if (b_valid)
	{
		if (SourceUnit.TileDistanceBetween(TargetUnit) > default.ROGUE_CCS_RANGE)
		{
			return false;
		}
		if(!default.ROGUE_CCS_PROC_ON_OWN_TURN && X2TacticalGameRuleset(XComGameInfo(class'Engine'.static.GetCurrentWorldInfo().Game).GameRuleset).GetCachedUnitActionPlayerRef().ObjectID == SourceUnit.ControllingPlayer.ObjectID)
		{
			return false;
		}
	}
	return b_valid;
}

