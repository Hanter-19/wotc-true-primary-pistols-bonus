//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_TruePrimaryPistolsBonus.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_TruePrimaryPistolsBonus extends X2DownloadableContentInfo;

var config(Infiltration) int PRIMARY_PISTOL_INFIL_HOURS_ADDED;

var localized string strHP;
var localized string strAblativeHP;
var localized string strArmor;
var localized string strMobility;
var localized string strPrimaryWeaponAim;
var localized string strPrimaryWeaponCritChance;
var localized string strAimWhenFlanking;
var localized string strCritChanceWhenFlanking;
var localized string strPrimaryWeaponDamage;
var localized string strPrimaryWeaponCritDamage;
var localized string strArmorPiercing;
var localized string strWill;
var localized string strDodge;
var localized string strDefense;
var localized string strHacking;
var localized string strHackingDefense;
var localized string strPsiStrength;
var localized string strDetectionRadiusModifier;
var localized string strDetectionRadius;
var localized string strSightRadius;
var localized string strSeeMovement;
var localized string strHearingRadius;
var localized string strStrength;
var localized string strUtilityItems;
var localized string strFlightFuel;
var localized string strAlertLevel;
var localized string strBackpackSize;
var localized string strJob;

var localized string strInfiltration;

delegate ModifyTemplate(X2DataTemplate DataTemplate);

// Highlander hook to modify the array returned by XComGameState_Unit:GetEarnedSoldierAbilities
// We will use this to conditionally add the PrimaryPistolInfilBonus ability
static function ModifyEarnedSoldierAbilities(out array<SoldierClassAbilityType> EarnedAbilities, XComGameState_Unit UnitState)
{
	local SoldierClassAbilityType NewAbility;
	NewAbility.AbilityName = 'HanterPrimaryPistolsBonus';
	NewAbility.ApplyToWeaponSlot = eInvSlot_PrimaryWeapon; // Not sure if this actually makes a difference

	// Add the ability only when a pistol is equipped in the primary weapon slot and nowhere else (ie no dual wielding)
	if (class'LoadoutApiFactory'.static.GetLoadoutApi().HasPrimaryPistolEquipped(UnitState) && EarnedAbilities.Find('AbilityName', NewAbility.AbilityName) == INDEX_NONE)
	{
		`LOG(GetFuncName() @ "Adding" @ NewAbility.AbilityName @ "to" @ UnitState.GetFirstName() @ UnitState.GetNickName() @ UnitState.GetLastName(), class'X2Ability_TruePrimaryPistolsBonus'.default.bLOG, 'TruePrimaryPistolsBonus');
		EarnedAbilities.AddItem(NewAbility);
	}
}

// For localization
static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
    local name			TagText;
	// local X2AbilityTemplate				PrimaryPistolBonusAbility;
	// local X2AbilityTemplateManager		AbilityTemplateManager;

    TagText = name(InString);

	switch (TagText)
	{
		case 'PrimaryPistolBonusBulletPoints':
			OutString = "";

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_HP)
			{
				OutString $= default.strHP @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HP);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_SHIELDHP)
			{
				OutString $= default.strAblativeHP @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_SHIELDHP);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_ARMOR)
			{
				OutString $= default.strArmor @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_ARMOR);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_MOBILITY)
			{
				OutString $= default.strMobility @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_MOBILITY);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_AIM)
			{
				OutString $= default.strPrimaryWeaponAim @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_AIM);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_CRITCHANCE)
			{
				OutString $= default.strPrimaryWeaponCritChance @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_CRITCHANCE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_FLANKINGAIM)
			{
				OutString $= default.strAimWhenFlanking @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_FLANKINGAIM);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_FLANKINGCRITCHANCE)
			{
				OutString $= default.strCritChanceWhenFlanking @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_FLANKINGCRITCHANCE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DAMAGE)
			{
				OutString $= default.strPrimaryWeaponDamage @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DAMAGE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_CRIT_DAMAGE)
			{
				OutString $= default.strPrimaryWeaponCritDamage @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_CRIT_DAMAGE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_PIERCING)
			{
				OutString $= default.strArmorPiercing @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_PIERCING);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_WILL)
			{
				OutString $= default.strWill @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_WILL);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DODGE)
			{
				OutString $= default.strDodge @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DODGE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DEFENSE)
			{
				OutString $= default.strDefense @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DEFENSE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_HACKING)
			{
				OutString $= default.strHacking @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HACKING);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_HACKINGDEFENSE)
			{
				OutString $= default.strHackingDefense @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HACKINGDEFENSE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_PSI)
			{
				OutString $= default.strPsiStrength @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_PSI);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DETECTIONMODIFIER)
			{
				OutString $= default.strDetectionRadiusModifier @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DETECTIONMODIFIER);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DETECTIONRADIUS)
			{
				OutString $= default.strDetectionRadius @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DETECTIONRADIUS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_SIGHTRADIUS)
			{
				OutString $= default.strSightRadius @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_SIGHTRADIUS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_SEEMOVEMENT)
			{
				OutString $= default.strSeeMovement @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_SEEMOVEMENT);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_HEARINGRADIUS)
			{
				OutString $= default.strHearingRadius @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HEARINGRADIUS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_STRENGTH)
			{
				OutString $= default.strStrength @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_STRENGTH);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_UTILITYITEMS)
			{
				OutString $= default.strUtilityItems @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_UTILITYITEMS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_FLIGHTFUEL)
			{
				OutString $= default.strFlightFuel @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_FLIGHTFUEL);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_ALERTLEVEL)
			{
				OutString $= default.strAlertLevel @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_ALERTLEVEL);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_BACKPACKSIZE)
			{
				OutString $= default.strBackpackSize @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_BACKPACKSIZE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_JOB)
			{
				OutString $= default.strJob @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_JOB);
			}

			if (IsDLCLoaded('CovertInfiltration'))
			{
				`LOG(GetFuncName() @ "Covert Infiltration Mod detected", class'X2Ability_TruePrimaryPistolsBonus'.default.bLOG, 'TruePrimaryPistolsBonus');
				OutString $= default.strInfiltration @ string(default.PRIMARY_PISTOL_INFIL_HOURS_ADDED);
				// TODO: figure out how to dynamically fetch the Infiltration modifier
				//AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
				//PrimaryPistolBonusAbility = AbilityTemplateManager.FindAbilityTemplate('HanterPrimaryPistolsBonus');
				//OutString $= "<br/><Bullet/>Infiltration Hours:" @ string(class'X2InfiltrationModTemplateManager'.static.GetInfilTemplateManager().GetInfilTemplateFromAbility(PrimaryPistolBonusAbility).HoursAdded);
			}

			return true;
		
		default:
			return false;
	}
}

// Helper to check whether other mods are loaded
static function bool IsDLCLoaded (coerce name DLCName)
{
	local XComOnlineEventMgr OnlineEventMgr;
	local int index;

	OnlineEventMgr = `ONLINEEVENTMGR;

	for (index = 0; index < OnlineEventMgr.GetNumDLC(); ++index)
	{
		if (DLCName == OnlineEventMgr.GetDLCNames(index)) return true;
	}

	return false;
}

// Boilerplate helper code from https://www.reddit.com/r/xcom2mods/wiki/wotc_modding/optc/
static private function IterateTemplatesAllDiff(class TemplateClass, delegate<ModifyTemplate> ModifyTemplateFn)
{
    local X2DataTemplate                                    IterateTemplate;
    local X2DataTemplate                                    DataTemplate;
    local array<X2DataTemplate>                             DataTemplates;
    local X2DownloadableContentInfo_TruePrimaryPistolsBonus         CDO;

    local X2ItemTemplateManager             ItemMgr;
    local X2AbilityTemplateManager          AbilityMgr;
    local X2CharacterTemplateManager        CharMgr;
    local X2StrategyElementTemplateManager  StratMgr;
    local X2SoldierClassTemplateManager     ClassMgr;

    if (ClassIsChildOf(TemplateClass, class'X2ItemTemplate'))
    {
        CDO = GetCDO();
        ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

        foreach ItemMgr.IterateTemplates(IterateTemplate)
        {
            if (!ClassIsChildOf(IterateTemplate.Class, TemplateClass)) continue;

            ItemMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {   
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2AbilityTemplate'))
    {
        CDO = GetCDO();
        AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

        foreach AbilityMgr.IterateTemplates(IterateTemplate)
        {
            if (!ClassIsChildOf(IterateTemplate.Class, TemplateClass)) continue;

            AbilityMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2CharacterTemplate'))
    {
        CDO = GetCDO();
        CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
        foreach CharMgr.IterateTemplates(IterateTemplate)
        {
            if (!ClassIsChildOf(IterateTemplate.Class, TemplateClass)) continue;

            CharMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2StrategyElementTemplate'))
    {
        CDO = GetCDO();
        StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
        foreach StratMgr.IterateTemplates(IterateTemplate)
        {
            if (!ClassIsChildOf(IterateTemplate.Class, TemplateClass)) continue;

            StratMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2SoldierClassTemplate'))
    {

        CDO = GetCDO();
        ClassMgr = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
        foreach ClassMgr.IterateTemplates(IterateTemplate)
        {
            if (!ClassIsChildOf(IterateTemplate.Class, TemplateClass)) continue;

            ClassMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }    
}

static private function ModifyTemplateAllDiff(name TemplateName, class TemplateClass, delegate<ModifyTemplate> ModifyTemplateFn)
{
    local X2DataTemplate                                    DataTemplate;
    local array<X2DataTemplate>                             DataTemplates;
    local X2DownloadableContentInfo_TruePrimaryPistolsBonus         CDO;

    local X2ItemTemplateManager             ItemMgr;
    local X2AbilityTemplateManager          AbilityMgr;
    local X2CharacterTemplateManager        CharMgr;
    local X2StrategyElementTemplateManager  StratMgr;
    local X2SoldierClassTemplateManager     ClassMgr;

    if (ClassIsChildOf(TemplateClass, class'X2ItemTemplate'))
    {
        ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
        ItemMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2AbilityTemplate'))
    {
        AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
        AbilityMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2CharacterTemplate'))
    {
        CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
        CharMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2StrategyElementTemplate'))
    {
        StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
        StratMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2SoldierClassTemplate'))
    {
        ClassMgr = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
        ClassMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else return;

    CDO = GetCDO();
    foreach DataTemplates(DataTemplate)
    {
        CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
    }
}

static private function X2DownloadableContentInfo_TruePrimaryPistolsBonus GetCDO()
{
    return X2DownloadableContentInfo_TruePrimaryPistolsBonus(class'XComEngine'.static.GetClassDefaultObjectByName(default.Class.Name));
}

protected function CallModifyTemplateFn(delegate<ModifyTemplate> ModifyTemplateFn, X2DataTemplate DataTemplate)
{
    ModifyTemplateFn(DataTemplate);
}