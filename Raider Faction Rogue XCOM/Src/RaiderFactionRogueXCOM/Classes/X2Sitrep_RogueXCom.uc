class X2SitRep_RogueXCom extends X2SitRepEffect;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	// incursion - one pod on the field
	Templates.AddItem(CreateRogueXComIncursionTemplate());

	return Templates;

}


// This effect won't operate if the mission kismet isn't properly rigged to support it
static function X2SitRepEffectTemplate CreateRogueXComIncursionTemplate()
{
	local X2SitRepEffect_AddTeam Template;

	`CREATE_X2TEMPLATE(class'X2SitRepEffect_AddTeam', Template, 'RogueXComIncursionEffect');

	Template.TeamToMake = eTeam_Two; //this lets it uses alien turn music

	return Template;
}
