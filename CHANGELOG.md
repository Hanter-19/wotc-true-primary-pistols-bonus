# 2.0.0
## Big code refactor
- Bonus is now applied via a new `HanterPrimaryPistolsBonus` ability instead of the original ability from True Primary Secondaries.
    - This is to allow greater control over the bonus
- Bonus is now applied via `ModifyEarnedSoldierAbilities` from Community Highlander instead of `OnPostTemplateCreation`
    - This is to enable support for Covert Infiltration, where Ability-based infiltration modifiers are setup via `SoldierClassAbilityType`
### User impact from code refactor
- Please note that due to the code changes, the old Localization no longer works (the class has been changed to `HanterPrimaryPistolsBonus`). Any users with custom Localization changes will need to update them
- Likewise for configurations, the class change to `X2Ability_TruePrimaryPistolsBonus` will break any users' local configs, and they will need to update their custom configs to match the new setup
- The `Focused Handling` effect will no longer show in the weapon screen in the Armory UI. It will now show in the character's ability screen in the Armory UI instead
## Feature updates
- Covert Infiltration infiltration hours modifier now supported (configure in `XComInfiltration.ini`)
    - Default is -10 hours (net effect of -8 hours after taking into account default +2 hours for all pistols)
- Crit Damage now supported
    - Default disabled
- Applicable stat modifiers will now show in the Armory UI
- All text can now be localized

# 1.0.0
- Equipping pistols or autopistols in the primary weapon slot (without dual wielding) grants the following bonuses:
    - Mobility +1
    - Detection Radius Modifier 0.2
    - Damage +1
- Values for the above stats and other stats are configurable in XComTruePrimaryPistolsBonus.ini