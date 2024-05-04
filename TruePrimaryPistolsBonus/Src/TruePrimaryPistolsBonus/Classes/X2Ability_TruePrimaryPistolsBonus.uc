class X2Ability_TruePrimaryPistolsBonus extends X2Ability config(TruePrimaryPistolsBonus);

var config bool		bLOG;

var config string	PRIMARY_PISTOL_BONUS_ICON;

var config bool		bSHOW_STAT_MARKUP;
var config bool		bAFFECT_MOBILITY;
var config bool		bAFFECT_DETECTIONMODIFIER;
var config bool		bAFFECT_DAMAGE;
var config bool		bAFFECT_CRIT_DAMAGE;
var config bool		bAFFECT_HP;
var config bool		bAFFECT_AIM;
var config bool		bAFFECT_DEFENSE;
var config bool		bAFFECT_WILL;
var config bool		bAFFECT_HACKING;
var config bool		bAFFECT_SIGHTRADIUS;
var config bool		bAFFECT_DODGE;
var config bool		bAFFECT_ARMOR;
var config bool		bAFFECT_PIERCING;
var config bool		bAFFECT_PSI;
var config bool		bAFFECT_HACKINGDEFENSE;
var config bool		bAFFECT_DETECTIONRADIUS;
var config bool		bAFFECT_CRITCHANCE;
var config bool		bAFFECT_STRENGTH;
var config bool		bAFFECT_SEEMOVEMENT;
var config bool		bAFFECT_HEARINGRADIUS;
var config bool		bAFFECT_FLANKINGCRITCHANCE;
var config bool		bAFFECT_FLANKINGAIM;
var config bool		bAFFECT_SHIELDHP;
var config bool		bAFFECT_UTILITYITEMS;
var config bool		bAFFECT_FLIGHTFUEL;
var config bool		bAFFECT_ALERTLEVEL;
var config bool		bAFFECT_BACKPACKSIZE;
var config bool		bAFFECT_JOB;

var config int		PRIMARY_PISTOL_BONUS_MOBILITY;
var config float	PRIMARY_PISTOL_BONUS_DETECTIONMODIFIER;
var config int		PRIMARY_PISTOL_BONUS_DAMAGE;
var config int		PRIMARY_PISTOL_BONUS_CRIT_DAMAGE;
var config int		PRIMARY_PISTOL_BONUS_HP;
var config int		PRIMARY_PISTOL_BONUS_AIM;
var config int		PRIMARY_PISTOL_BONUS_DEFENSE;
var config int		PRIMARY_PISTOL_BONUS_WILL;
var config int		PRIMARY_PISTOL_BONUS_HACKING;
var config int		PRIMARY_PISTOL_BONUS_SIGHTRADIUS;
var config int		PRIMARY_PISTOL_BONUS_DODGE;
var config int		PRIMARY_PISTOL_BONUS_ARMOR;
var config int		PRIMARY_PISTOL_BONUS_PIERCING;
var config int		PRIMARY_PISTOL_BONUS_PSI;
var config int		PRIMARY_PISTOL_BONUS_HACKINGDEFENSE;
var config float	PRIMARY_PISTOL_BONUS_DETECTIONRADIUS;
var config int		PRIMARY_PISTOL_BONUS_CRITCHANCE;
var config int		PRIMARY_PISTOL_BONUS_STRENGTH;
var config float	PRIMARY_PISTOL_BONUS_SEEMOVEMENT;
var config float	PRIMARY_PISTOL_BONUS_HEARINGRADIUS;
var config int		PRIMARY_PISTOL_BONUS_FLANKINGCRITCHANCE;
var config int		PRIMARY_PISTOL_BONUS_FLANKINGAIM;
var config int		PRIMARY_PISTOL_BONUS_SHIELDHP;
var config int		PRIMARY_PISTOL_BONUS_UTILITYITEMS;
var config int		PRIMARY_PISTOL_BONUS_FLIGHTFUEL;
var config int		PRIMARY_PISTOL_BONUS_ALERTLEVEL;
var config int		PRIMARY_PISTOL_BONUS_BACKPACKSIZE;
var config int		PRIMARY_PISTOL_BONUS_JOB;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(HanterPrimaryPistolsBonus());

	return Templates;
}

static function X2AbilityTemplate HanterPrimaryPistolsBonus()
{
	local X2AbilityTemplate					Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_PrimaryPistolBonus		PrimaryPistolEffect;
	local StatChange						StatChange;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HanterPrimaryPistolsBonus');
	Template.IconImage = default.PRIMARY_PISTOL_BONUS_ICON;
	//Template.IconImage = "img:///UILibrary_MZChimeraIcons.WeaponMod_Pistol_Enhanced";

	Template.bDisplayInUITooltip = true;
	Template.bDisplayInUITacticalText = true;


	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);

	// Now start adding the stat changes we want
	if (default.bAFFECT_MOBILITY)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.PRIMARY_PISTOL_BONUS_MOBILITY);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.PRIMARY_PISTOL_BONUS_MOBILITY);
		}
	}

	if (default.bAFFECT_DETECTIONMODIFIER)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.PRIMARY_PISTOL_BONUS_DETECTIONMODIFIER);
	}

	if (default.bAFFECT_HP)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, default.PRIMARY_PISTOL_BONUS_HP);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, default.PRIMARY_PISTOL_BONUS_HP);
		}
	}

	if (default.bAFFECT_DEFENSE)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, default.PRIMARY_PISTOL_BONUS_DEFENSE);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.DefenseLabel, eStat_Defense, default.PRIMARY_PISTOL_BONUS_DEFENSE);
		}
	}

	if (default.bAFFECT_WILL)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, default.PRIMARY_PISTOL_BONUS_WILL);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, default.PRIMARY_PISTOL_BONUS_WILL);
		}
	}

	if (default.bAFFECT_HACKING)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Hacking, default.PRIMARY_PISTOL_BONUS_HACKING);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.TechLabel, eStat_Hacking, default.PRIMARY_PISTOL_BONUS_HACKING);
		}
	}

	if (default.bAFFECT_SIGHTRADIUS)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_SightRadius, default.PRIMARY_PISTOL_BONUS_SIGHTRADIUS);
	}

	if (default.bAFFECT_DODGE)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.PRIMARY_PISTOL_BONUS_DODGE);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, default.PRIMARY_PISTOL_BONUS_DODGE);
		}
	}

	if (default.bAFFECT_ARMOR)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.PRIMARY_PISTOL_BONUS_ARMOR);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, default.PRIMARY_PISTOL_BONUS_ARMOR);
		}
	}

	if (default.bAFFECT_PIERCING)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorPiercing, default.PRIMARY_PISTOL_BONUS_PIERCING);
	}

	if (default.bAFFECT_PSI)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, default.PRIMARY_PISTOL_BONUS_PSI);
		if (default.bSHOW_STAT_MARKUP)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseLabel, eStat_PsiOffense, default.PRIMARY_PISTOL_BONUS_PSI);
		}
	}

	if (default.bAFFECT_HACKINGDEFENSE)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_HackDefense, default.PRIMARY_PISTOL_BONUS_HACKINGDEFENSE);
	}

	if (default.bAFFECT_DETECTIONRADIUS)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionRadius, default.PRIMARY_PISTOL_BONUS_DETECTIONRADIUS);
	}

	if (default.bAFFECT_STRENGTH)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Strength, default.PRIMARY_PISTOL_BONUS_STRENGTH);	
	}

	if (default.bAFFECT_SEEMOVEMENT)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_SeeMovement, default.PRIMARY_PISTOL_BONUS_SEEMOVEMENT);	
	}

	if (default.bAFFECT_HEARINGRADIUS)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_HearingRadius, default.PRIMARY_PISTOL_BONUS_HEARINGRADIUS);	
	}

	if (default.bAFFECT_FLANKINGCRITCHANCE)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_FlankingCritChance, default.PRIMARY_PISTOL_BONUS_FLANKINGCRITCHANCE);	
	}

	if (default.bAFFECT_SHIELDHP)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, default.PRIMARY_PISTOL_BONUS_SHIELDHP);	
	}

	if (default.bAFFECT_FLANKINGAIM)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_FlankingAimBonus, default.PRIMARY_PISTOL_BONUS_FLANKINGAIM);	
	}

	if (default.bAFFECT_UTILITYITEMS)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_UtilityItems, default.PRIMARY_PISTOL_BONUS_UTILITYITEMS);	
	}

	if (default.bAFFECT_FLIGHTFUEL)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_FlightFuel, default.PRIMARY_PISTOL_BONUS_FLIGHTFUEL);	
	}

	if (default.bAFFECT_ALERTLEVEL)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_AlertLevel, default.PRIMARY_PISTOL_BONUS_ALERTLEVEL);	
	}

	if (default.bAFFECT_BACKPACKSIZE)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_BackpackSize, default.PRIMARY_PISTOL_BONUS_BACKPACKSIZE);	
	}

	if (default.bAFFECT_JOB)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Job, default.PRIMARY_PISTOL_BONUS_JOB);	
	}

	if (default.bLOG)
	{		
		`LOG("TruePrimaryPistolsBonus : Set the following stat changes:");
		foreach PersistentStatChangeEffect.m_aStatChanges(StatChange)
		{
			`LOG("---->" @ StatChange.StatType @ ":" @ StatChange.StatAmount);
		}
	}

	Template.AddTargetEffect(PersistentStatChangeEffect);

	// For aim and damage bonuses
	PrimaryPistolEffect = new class'X2Effect_PrimaryPistolBonus';
	PrimaryPistolEffect.BuildPersistentEffect(1, true, false, false);
	PrimaryPistolEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(PrimaryPistolEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;
}