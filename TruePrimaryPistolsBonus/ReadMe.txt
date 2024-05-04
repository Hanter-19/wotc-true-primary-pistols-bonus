[h1]True Primary Pistols Bonus[/h1]
Provide a configurable bonus for when pistols/autopistols are equipped in the primary weapon slot using True Primary Secondaries

[h2]About[/h2]
This is a value-added feature for [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2133399183]Musashi's True Primary Secondaries[/url] that gives a bonus when wielding Pistols/Autopistols in the primary weapon slot (without dual wielding).

In the (both deprecated) [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1125431597]Primary Pistols[/url] or [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1142234205]Primary Secondaries[/url], there was a bonus to various stats when wielding primary pistols.

Possibly due to an oversight, this wasn't setup properly in True Primary Secondaries, even though most of the code is still there.

This mod restores the bonus (localized as the "[b]Focused Handling[/b]" ability in all pistols) and additionally exposes more stats to be configured at your leisure/peril.

The original bonus (the default config in this mod) is as follows:
[list]
	[*] Mobility +1
	[*]	Detection Radius Modifier 0.2
	[*] Damage +1
[/list]

You can tweak these values in [b]XComTruePrimaryPistolsBonus.ini[/b] in the Config folder, where' I've left comments explaining how to do so.
I've also additionally exposed many stats, including HP, Aim, Crit Chance, Defense, Dodge, etc. I've even included stats for which I have no idea what they do, but go ahead and knock yourself out.

[h2]FAQs[/h2]
[h3]Can I run True Primary Secondaries [i]without[/i] this mod?[/h3]
Yes. True Primary Secondaries works just fine on its own (make sure to also subscribe to [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2569592723]Musashi's Mods Fixes[/url] by Iridar though). You just won't get the totally cool and awesome bonus that was intentionally designed by Musashi.

[h3]Why is [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2094355561]Chimera Squad Icons Pack[/url] listed as a required mod?[/h3]
I am using an icon (O,13) from there for the "Focused Handling" ability (the ability/effect that gives the primary pistol bonus). If you are interested in making an original icon for the bonus, feel free to reach out and I would be happy to add incorporate that in this mod.
You can also customize the icon used by configuring it in [b]XComTruePrimaryPistolsBonus.ini[/b].

[h3]Will this work with ___?[/h3]
Check the [b]Compatibility[/b] section below.

[h3]Can I add this mid-campaign?[/h3]
Yes. [strike]In fact, based on my personal testing, it should even work mid-tactical.[/strike] As of version [b]2.0.0[/b], it is better to load a strategy save as some changes don't apply properly mid-tactical.

[h3]How do I configure the bonuses from primary pistols/autopistols?[/h3]
[url=https://steamcommunity.com/workshop/filedetails/discussion/3234316335/4354494235967728736/]This pinned discussion post[/url] has detailed instructions on how to configure the .ini file to do so.

[h3]What about other primary secondaries?[/h3]
When I finished version 1.0.0 of this mod, I realized I could probably make a generalized way to make this bonus separately configurable for [i]any[/i] weapon.
For example, you could configure primary melee weapons to grant defense bonuses, primary sawed-off shotguns to grant crit chance bonuses etc. The code would have to be quite different though, so I may potentially release that as a separate mod if my time and interests align.

[h3]Can I make a localization for this mod[/h3]
Yes, [strike]but there's an issue where I hardcoded the stat names in English for the ability description. I did it in the code so that the stats only appear when they are impacted. If a more experienced XCOM2 modder knows how to do this better, please let me know, thanks![/strike] as of version [b]2.0.0[/b], all text from this mod can be localized.

[h2]Compatibility[/h2]
[list]
	[*] Do [b]not[/b] use with [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1125431597]Primary Pistols[/url] or [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1142234205]Primary Secondaries[/url]
		They are both deprecated anyway and you should be using [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2133399183]True Primary Secondaries[/url] in this day and age.
	[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1280477867]RPG Overhaul[/url] 
		Yes.
	[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2567230730]Covert Infiltration[/url] 
		Yes. [strike]This mod doesn't touch anything to do with CI mechanics, though I think it would be interesting if primary pistols gave a bonus to Infiltration. If my time and interests align I may try making an update to add Infiltration bonuses when wielding primary pistols.[/strike] 
		As of version [b]2.0.0[/b], you can now configure the Infiltration hours in [b]XComInfiltration.ini[/b]. The default is -10 hours (bearing in mind pistols have a default of +2 hours, so the net effect is 2 - 10 = -8 hours)
	[*] [url=https://steamcommunity.com/workshop/filedetails/?id=2683996590]LWotC[/url] 
		Probably? I haven't played LWotC yet, so I can't say for sure what will happen, but since all this mod does is add a conditional ability to pistols, I think it should work just fine.
	[*] [b]Other mods that add new pistols/autopistols[/b] 
		Yes. As long as their weapon category in the code is 'pistol' or 'sidearm', this mod will apply the bonus to them using OPTC. Note that this means [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2833600827]Handcannons[/url] and [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2018729237]Smartpistols[/url] do not count, as they have their own weapon categories.
[/list]

[h2]Credits and Appreciation[/h2]
[list]
	[*] [url=https://steamcommunity.com/id/MusashiKensai/myworkshopfiles/?appid=268500]Musashi[/url] for [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2133399183]True Primary Secondaries[/url].
	[*] [url=https://steamcommunity.com/id/Iridar/myworkshopfiles/?appid=268500]Iridar[/url] for helping me debug an issue I was facing while coding this mod, over at the [url=https://discord.gg/BdDAcchS5r]XCOM 2 Modding Discord Channel[/url]. I seriously can't understate how much he's done for the XCOM2 modding community over the years. In fact, here's a shameless plug for his [url=https://www.patreon.com/Iridar]Patreon[/url] page.
	[*] [url=https://steamcommunity.com/profiles/76561198220395023/myworkshopfiles/?appid=268500]Zelfana[/url] for pointing out how to get the stats to update in the Armory UI.
[/list]

Everyone has permission to reuse my code (which is also available on [url=https://github.com/Hanter-19/wotc-true-primary-pistols-bonus]my github[/url]) or repackage it if necessary, especially if something breaks and I'm not actively modding XCOM 2 at the time. Just don't be a weirdo who reuploads other people's mods for internet clout??