class X2EventListener_TacticalUI extends X2EventListener;

var localized string RogueXComTurn;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(TurnTextAlteration());
	Templates.AddItem(EnemyUIAlteration());

	return Templates;
}

static function CHEventListenerTemplate EnemyUIAlteration()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'Marauders_UIColor');
	//explanation: vanilla X2EvenetLIstenerTemplates do not specify deferrals, instead always being on ELD_OnStateSubmitted.
	//PCSes need to engage as soon as possible, so we use the CH highlander instead.

	Template.RegisterInTactical = true;
	Template.AddCHEvent('OverrideEnemyHudColors', ChangeUIColor, ELD_Immediate);

	return Template;
}


static protected function EventListenerReturn ChangeUIColor(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComLWTuple Tuple;
	local XComGameState_BattleData BattleState;
	local EUIState uiState;
	Tuple = XComLWTuple(EventData);

	if(Tuple == none){
		return ELR_NoInterrupt;
	}

	uiState = EUIState(Tuple.Data[1].i);

	if(uiState != eUIState_Cash){
		return ELR_NoInterrupt; //if it has been changed, another mod is presumably in effect
	}

	BattleState = XComGameState_BattleData(`XCOMHistory.GetSingleGameStateObjectForClass(class'XComGameState_BattleData'));

	if(BattleState.ActiveSitreps.Find('RogueXComIncursion') != INDEX_NONE)
	{
		uiState = eUIState_Warning2;
		Tuple.Data[1].i = uiState;
	}

	return ELR_NoInterrupt;
}

static function CHEventListenerTemplate TurnTextAlteration()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'Marauders_TurnText');
	//explanation: vanilla X2EvenetLIstenerTemplates do not specify deferrals, instead always being on ELD_OnStateSubmitted.
	//PCSes need to engage as soon as possible, so we use the CH highlander instead.

	Template.RegisterInTactical = true;
	Template.AddCHEvent('SetFourthTeamStrings', ChangeTurnText, ELD_Immediate);

	return Template;
}

static protected function EventListenerReturn ChangeTurnText(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComLWTuple Tuple;
	local XComGameState_BattleData BattleState;
	Tuple = XComLWTuple(EventData);

	if(Tuple == none){
		return ELR_NoInterrupt;
	}

	if(Tuple.Data[2].s != class'UITurnOverlay'.default.m_sOtherTurn){
		return ELR_NoInterrupt; //some other mod has already altered this
	}

	BattleState = XComGameState_BattleData(`XCOMHistory.GetSingleGameStateObjectForClass(class'XComGameState_BattleData'));

	if(BattleState.ActiveSitreps.Find('RogueXComIncursion') != INDEX_NONE)
	{
		Tuple.Data[2].s = default.RogueXComTurn;
		Tuple.Data[0].b = true;
	}

	return ELR_NoInterrupt;
}
