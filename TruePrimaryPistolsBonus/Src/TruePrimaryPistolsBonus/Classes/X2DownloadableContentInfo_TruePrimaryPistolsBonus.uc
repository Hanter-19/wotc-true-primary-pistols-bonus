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
				OutString $= "<br/><Bullet/>HP:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HP);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_SHIELDHP)
			{
				OutString $= "<br/><Bullet/>Ablative HP:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_SHIELDHP);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_ARMOR)
			{
				OutString $= "<br/><Bullet/>Armor:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_ARMOR);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_MOBILITY)
			{
				OutString $= "<br/><Bullet/>Mobility:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_MOBILITY);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_AIM)
			{
				OutString $= "<br/><Bullet/>Primary Weapon Aim:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_AIM);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_CRITCHANCE)
			{
				OutString $= "<br/><Bullet/>Primary Weapon Crit Chance:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_CRITCHANCE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_FLANKINGAIM)
			{
				OutString $= "<br/><Bullet/>Aim when Flanking:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_FLANKINGAIM);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_FLANKINGCRITCHANCE)
			{
				OutString $= "<br/><Bullet/>Crit Chance when Flanking:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_FLANKINGCRITCHANCE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DAMAGE)
			{
				OutString $= "<br/><Bullet/>Primary Weapon Damage:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DAMAGE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_CRIT_DAMAGE)
			{
				OutString $= "<br/><Bullet/>Primary Weapon Crit Damage:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_CRIT_DAMAGE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_PIERCING)
			{
				OutString $= "<br/><Bullet/>Armor Piercing:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_PIERCING);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_WILL)
			{
				OutString $= "<br/><Bullet/>Will:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_WILL);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DODGE)
			{
				OutString $= "<br/><Bullet/>Dodge:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DODGE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DEFENSE)
			{
				OutString $= "<br/><Bullet/>Defense:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DEFENSE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_HACKING)
			{
				OutString $= "<br/><Bullet/>Hacking:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HACKING);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_HACKINGDEFENSE)
			{
				OutString $= "<br/><Bullet/>Hacking Defense:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HACKINGDEFENSE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_PSI)
			{
				OutString $= "<br/><Bullet/>Psi Strength:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_PSI);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DETECTIONMODIFIER)
			{
				OutString $= "<br/><Bullet/>Detection Radius Modifier:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DETECTIONMODIFIER);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DETECTIONRADIUS)
			{
				OutString $= "<br/><Bullet/>Detection Radius:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DETECTIONRADIUS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_SIGHTRADIUS)
			{
				OutString $= "<br/><Bullet/>Sight Radius:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_SIGHTRADIUS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_SEEMOVEMENT)
			{
				OutString $= "<br/><Bullet/>See Movement:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_SEEMOVEMENT);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_HEARINGRADIUS)
			{
				OutString $= "<br/><Bullet/>Hearing Radius:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_HEARINGRADIUS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_STRENGTH)
			{
				OutString $= "<br/><Bullet/>Strength:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_STRENGTH);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_UTILITYITEMS)
			{
				OutString $= "<br/><Bullet/>Utility Items:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_UTILITYITEMS);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_FLIGHTFUEL)
			{
				OutString $= "<br/><Bullet/>Flight Fuel:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_FLIGHTFUEL);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_ALERTLEVEL)
			{
				OutString $= "<br/><Bullet/>Alert Level:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_ALERTLEVEL);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_BACKPACKSIZE)
			{
				OutString $= "<br/><Bullet/>Backpack Size:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_BACKPACKSIZE);
			}

			if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_JOB)
			{
				OutString $= "<br/><Bullet/>Job:" @ string(class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_JOB);
			}

			if (IsDLCLoaded('CovertInfiltration'))
			{
				`LOG(GetFuncName() @ "Covert Infiltration Mod detected", class'X2Ability_TruePrimaryPistolsBonus'.default.bLOG, 'TruePrimaryPistolsBonus');
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