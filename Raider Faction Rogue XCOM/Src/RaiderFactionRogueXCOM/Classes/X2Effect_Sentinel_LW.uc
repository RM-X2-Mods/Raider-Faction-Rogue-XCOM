class X2Effect_Sentinel_LW extends X2Effect_Persistent config (GameData);

var config int SENTINEL_LW_USES_PER_TURN;
var config array<name> SENTINEL_LW_ABILITYNAMES;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local X2EventManager						EventMgr;
	local Object								EffectObj;
	local XComGameState_Unit					UnitState;

	EventMgr = `XEVENTMGR;
	EffectObj = NewEffectState;
	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(NewEffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

	EventMgr.RegisterForEvent(EffectObj, 'Sentinel_LWTriggered', NewEffectState.TriggerAbilityFlyover, ELD_OnStateSubmitted, , UnitState);
}

simulated function OnEffectRemoved(const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState, bool bCleansed, XComGameState_Effect RemovedEffectState)
{
	
	super.OnEffectRemoved(ApplyEffectParameters, NewGameState, bCleansed, RemovedEffectState);

}


function bool PostAbilityCostPaid(XComGameState_Effect EffectState, XComGameStateContext_Ability AbilityContext, XComGameState_Ability kAbility, XComGameState_Unit SourceUnit, XComGameState_Item AffectWeapon, XComGameState NewGameState, const array<name> PreCostActionPoints, const array<name> PreCostReservePoints)
{
	local X2EventManager						EventMgr;
	local XComGameState_Ability					AbilityState;       //  used for looking up our source ability (Sentinel_LW), not the incoming one that was activated
	local UnitValue								SentinelUses;
	local int									totalUses;
	
	totalUses = SourceUnit.GetUnitValue('RM_SentinelUses', SentinelUses) ? int(SentinelUses.fValue) : 0;
	If (totalUses > 0)	 
	{
		if (totalUses >= default.SENTINEL_LW_USES_PER_TURN)		
			return false;
	}
	if (XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID)) == none)
		return false;
	if (SourceUnit.ReserveActionPoints.Length != PreCostReservePoints.Length && default.SENTINEL_LW_ABILITYNAMES.Find(kAbility.GetMyTemplateName()) != -1)
	{
		AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.AbilityStateObjectRef.ObjectID));		
		if (AbilityState != none)
		{
			SourceUnit.ReserveActionPoints = PreCostReservePoints;
			SourceUnit.SetUnitFloatValue('RM_SentinelUses', totalUses + 1, eCleanup_BeginTurn);
			NewGameState.AddStateObject(SourceUnit);
			EventMgr = `XEVENTMGR;
			EventMgr.TriggerEvent('Sentinel_LWTriggered', AbilityState, SourceUnit, NewGameState);
			return true;	
		}
	}
	return false;
}