// Used in the ModifyEarnedAbilities approach
class X2Effect_PrimaryPistolBonus extends X2Effect_Persistent config (TruePrimaryPistolsBonus);

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item	SourceWeapon;
    
    SourceWeapon = AbilityState.GetSourceWeapon();

	if (SourceWeapon != none && (SourceWeapon.GetWeaponCategory() == 'pistol' || SourceWeapon.GetWeaponCategory() == 'sidearm') && class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult))
	{
		// Bonus Crit Damage
		if (AppliedData.AbilityResultContext.HitResult == eHit_Crit && class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_CRIT_DAMAGE)
		{
			return class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_CRIT_DAMAGE;
		}
		
		// Bonus Damage
		if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_DAMAGE)
		{
			return class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_DAMAGE;
		}
	}

	return 0;
}

defaultproperties
{
    bDisplayInSpecialDamageMessageUI = true
}

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local ShotModifierInfo ModInfo;
	local XComGameState_Item SourceWeapon;

	SourceWeapon = AbilityState.GetSourceWeapon();

	if (SourceWeapon != none && (SourceWeapon.GetWeaponCategory() == 'pistol' || SourceWeapon.GetWeaponCategory() == 'sidearm'))
	{
		// Aim Bonus
		if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_AIM)
		{
			ModInfo.ModType = eHit_Success;
			ModInfo.Reason = FriendlyName;
			ModInfo.Value = class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_AIM;
			ShotModifiers.AddItem(ModInfo);
		}

		// Crit Chance Bonus
		if (class'X2Ability_TruePrimaryPistolsBonus'.default.bAFFECT_CRITCHANCE)
		{
			ModInfo.ModType = eHit_Crit;
			ModInfo.Reason = FriendlyName;
			ModInfo.Value = class'X2Ability_TruePrimaryPistolsBonus'.default.PRIMARY_PISTOL_BONUS_CRITCHANCE;
			ShotModifiers.AddItem(ModInfo);	
		}
	}
}