class XGCharacterGenerator_RogueXCom extends XGCharacterGenerator;

function TSoldier CreateTSoldier( optional name CharacterTemplateName, optional EGender eForceGender, optional name nmCountry = '', optional int iRace = -1, optional name ArmorName )
{
	local XComLinearColorPalette HairPalette;
	local X2SimpleBodyPartFilter BodyPartFilter;
	local X2CharacterTemplate CharacterTemplate;
	local TAppearance DefaultAppearance;

	kSoldier.kAppearance = DefaultAppearance;	
	
	CharacterTemplate = SetCharacterTemplate(CharacterTemplateName, ArmorName);
	

	nmCountry = PickOriginCountry();
	

	BodyPartFilter = `XCOMGAME.SharedBodyPartFilter;

	//When generating new characters, consider the DLC pack filters.
	//Use the player's settings from Options->Game Options to pick which DLC / Mod packs this generated soldier should draw from
	UpdateDLCPackFilters();
	
	
	SetCountry(nmCountry);
	SetRace(iRace);
	SetGender(eForceGender);
	SetArmorTints(CharacterTemplate);	
	BodyPartFilter.Set(EGender(kSoldier.kAppearance.iGender), ECharacterRace(kSoldier.kAppearance.iRace), kSoldier.kAppearance.nmTorso, !IsSoldier(CharacterTemplateName), , DLCNames);
	SetBanditHead(BodyPartFilter, CharacterTemplate);
	SetBanditAccessories(BodyPartFilter, CharacterTemplateName);

		kSoldier.kAppearance.nmTorso = (kSoldier.kAppearance.iGender == eGender_Female) ? 'DLC_0_ResistanceWarrior_E_F' : 'DLC_0_ResistanceWarrior_E_M';

		kSoldier.kAppearance.nmLeftArm =  '';
		kSoldier.kAppearance.nmRightArm =  '';
		kSoldier.kAppearance.nmLeftForearm = '';
		kSoldier.kAppearance.nmRightForearm = '';

		kSoldier.kAppearance.nmShins = '';
		kSoldier.kAppearance.nmTorsoDeco = '';
		kSoldier.kAppearance.nmThighs = '';

		kSoldier.kAppearance.nmLegs = '';

	
	//kSoldier.kAppearance.nmHead = (kSoldier.kAppearance.iGender == eGender_Female) ? 'Invisible_Bandit_F' : 'Invisible_Bandit_M';

	HairPalette = `CONTENT.GetColorPalette(ePalette_HairColor);
	kSoldier.kAppearance.iHairColor = ChooseHairColor(kSoldier.kAppearance, HairPalette.BaseOptions); // Only generate with base options
	kSoldier.kAppearance.iEyeColor = Rand(5); 
	kSoldier.kAppearance.iWeaponTint = 5; //should make it gun metal grey
	kSoldier.kAppearance.iSkinColor = Rand(5);


	SetVoice(CharacterTemplateName, nmCountry);



	SetAttitude();
	//GenerateName( kSoldier.kAppearance.iGender, kSoldier.nmCountry, kSoldier.strFirstName, kSoldier.strLastName, kSoldier.kAppearance.iRace );

	BioCountryName = kSoldier.nmCountry;
	return kSoldier;
}


function SetBanditAccessories(X2SimpleBodyPartFilter BodyPartFilter, name CharacterTemplateName)
{
	local X2BodyPartTemplateManager PartTemplateManager;

	PartTemplateManager = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager();

	if(kSoldier.kAppearance.iGender == eGender_Male)
	{
		if(`SYNC_FRAND() < NewSoldier_BeardChance){
			RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmBeard, "Beards", BodyPartFilter.FilterByGenderAndNonSpecialized);
		}
		else{
			SetBodyPartToFirstInArray(PartTemplateManager, kSoldier.kAppearance.nmBeard, "Beards", BodyPartFilter.FilterAny);
		}
	}
	//Custom settings depending on whether the unit is a soldier or not
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmPatterns, "Patterns", BodyPartFilter.FilterAny);
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmWeaponPattern, "Patterns", BodyPartFilter.FilterAny);
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmTattoo_LeftArm, "Tattoos", BodyPartFilter.FilterAny);
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmTattoo_RightArm, "Tattoos", BodyPartFilter.FilterAny);
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmHaircut, "Hair", BodyPartFilter.FilterByGenderAndNonSpecialized);
	
}

function SetBanditHead(X2SimpleBodyPartFilter BodyPartFilter, X2CharacterTemplate CharacterTemplate)
{
	local X2BodyPartTemplateManager PartTemplateManager;

	PartTemplateManager = class'X2BodyPartTemplateManager'.static.GetBodyPartTemplateManager();


	BodyPartFilter.AddCharacterFilter('Soldier', CharacterTemplate.bHasCharacterExclusiveAppearance); // Make sure heads get filtered properly
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmHead, "Head", BodyPartFilter.FilterByGenderAndRaceAndCharacter);
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmScars, "Scars", BodyPartFilter.FilterByCharacter);
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmEye, "Eyes", BodyPartFilter.FilterAny);
	RandomizeSetBodyPart(PartTemplateManager, kSoldier.kAppearance.nmTeeth, "Teeth", BodyPartFilter.FilterAny);
	
	

}