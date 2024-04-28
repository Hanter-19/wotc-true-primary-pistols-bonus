class X2TemplateHelper_TruePrimaryPistolsBonus extends Object config (TruePrimaryPistolsBonus);

var config bool		bLOG;

var config bool		bAFFECT_MOBILITY;
var config bool		bAFFECT_DETECTIONMODIFIER;
var config bool		bAFFECT_DAMAGE;
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

static function PatchPrimaryPistolsBonus()
{
	local X2AbilityTemplateManager			TemplateManager;
	local X2AbilityTemplate					Template;
	local X2Effect							Effect;
	local bool								bHasBonusDamageEffect;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_BonusWeaponDamage		BonusDamageEffect;
	local StatChange						StatChange;
	local int i;

	bHasBonusDamageEffect = false;
	
	TemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	Template = TemplateManager.FindAbilityTemplate('PrimaryPistolsBonus');
	if (Template != none)
	{
		Template.IconImage = "img:///UILibrary_MZChimeraIcons.WeaponMod_Pistol_Enhanced";
		Template.AbilityTargetConditions.AddItem(new class'TruePrimaryPistolsBonus.X2Condition_PrimaryPistolNotDual');
		Template.bDisplayInUITooltip = true;
		Template.bDisplayInUITacticalText = true;

		foreach Template.AbilityTargetEffects(Effect)
		{
			// Stat Change Effect
			PersistentStatChangeEffect = X2Effect_PersistentStatChange(Effect);
			if (PersistentStatChangeEffect != none) // Assumes that this perk in TruePrimarySecondaries always has a persistent stat change
			{
				PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
				
				// Empty m_aStatChanges so we can replace it with everything we want
				for (i = PersistentStatChangeEffect.m_aStatChanges.length; i > -1; i--)
				{
					if (default.bLOG)
					{
						`LOG("TruePrimaryPistolsBonus : Removing stat change" @ PersistentStatChangeEffect.m_aStatChanges[i].StatType @ "from" @ Template.Name);
					}
					PersistentStatChangeEffect.m_aStatChanges.Remove(i, 1);
				}
				PersistentStatChangeEffect.m_aStatChanges.length = 0;

				// Now start adding the stat changes we want
				if (default.bAFFECT_MOBILITY)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.PRIMARY_PISTOL_BONUS_MOBILITY);	
				}

				if (default.bAFFECT_DETECTIONMODIFIER)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.PRIMARY_PISTOL_BONUS_DETECTIONMODIFIER);	
				}

				// Other optional stuff
				if (default.bAFFECT_HP)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, default.PRIMARY_PISTOL_BONUS_HP);	
				}

				if (default.bAFFECT_AIM)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.PRIMARY_PISTOL_BONUS_AIM);	
				}

				if (default.bAFFECT_DEFENSE)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, default.PRIMARY_PISTOL_BONUS_DEFENSE);	
				}

				if (default.bAFFECT_WILL)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, default.PRIMARY_PISTOL_BONUS_WILL);	
				}

				if (default.bAFFECT_HACKING)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_Hacking, default.PRIMARY_PISTOL_BONUS_HACKING);	
				}

				if (default.bAFFECT_SIGHTRADIUS)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_SightRadius, default.PRIMARY_PISTOL_BONUS_SIGHTRADIUS);	
				}

				if (default.bAFFECT_DODGE)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.PRIMARY_PISTOL_BONUS_DODGE);	
				}

				if (default.bAFFECT_ARMOR)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.PRIMARY_PISTOL_BONUS_ARMOR);	
				}

				if (default.bAFFECT_PIERCING)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorPiercing, default.PRIMARY_PISTOL_BONUS_PIERCING);	
				}

				if (default.bAFFECT_PSI)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, default.PRIMARY_PISTOL_BONUS_PSI);	
				}

				if (default.bAFFECT_HACKINGDEFENSE)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_HackDefense, default.PRIMARY_PISTOL_BONUS_HACKINGDEFENSE);	
				}

				if (default.bAFFECT_DETECTIONRADIUS)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionRadius, default.PRIMARY_PISTOL_BONUS_DETECTIONRADIUS);	
				}

				if (default.bAFFECT_CRITCHANCE)
				{
					PersistentStatChangeEffect.AddPersistentStatChange(eStat_CritChance, default.PRIMARY_PISTOL_BONUS_CRITCHANCE);	
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
			}

			// Bonus Damage Effect
			BonusDamageEffect = X2Effect_BonusWeaponDamage(Effect);
			if (default.bAFFECT_DAMAGE && BonusDamageEffect != none)
			{
				bHasBonusDamageEffect = true;
				BonusDamageEffect.BonusDmg = default.PRIMARY_PISTOL_BONUS_DAMAGE;
				BonusDamageEffect.bDisplayInSpecialDamageMessageUI = true;
				BonusDamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
				if (default.bLOG)
				{
					`LOG("TruePrimaryPistolsBonus : Update bonus damage:" @ BonusDamageEffect.BonusDmg);
				}
			}
		}

		// Add bonus damage effect if it did not already exist
		if (default.bAFFECT_DAMAGE && !bHasBonusDamageEffect)
		{
			BonusDamageEffect = new class'X2Effect_BonusWeaponDamage';
			BonusDamageEffect.BonusDmg = default.PRIMARY_PISTOL_BONUS_DAMAGE;
			BonusDamageEffect.bDisplayInSpecialDamageMessageUI = true;
			BonusDamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
			Template.AddTargetEffect(BonusDamageEffect);
			if (default.bLOG)
			{
				`LOG("TruePrimaryPistolsBonus : Added bonus damage:" @ BonusDamageEffect.BonusDmg);
			}
		}
	}
	else
	{
		`LOG("TruePrimaryPistolsBonus ERROR : Unable to find PrimaryPistolsBonus AbilityTemplate!");
	}
}