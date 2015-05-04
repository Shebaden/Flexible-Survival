Version 2 of Doran by Blue Bishop begins here.
[ Version 2.0 - Body Modification and Gender Regard]

"Adds Doran to Flexible Survivals Wandering Monsters table"

Section 1.0 - Doran Coding Miscellany

when play begins:
	add { "Peculiar Dragon" } to infections of guy;
	add { "Peculiar Dragon" } to infections of furry;

dorgr is text that varies. [A dorger is you!]
dorlastfed is a number that varies. dorlastfed is usually 555. [Doran Last Fed Timer]
dorgenreg is a truth state that varies. [Doran Gender Regard. Boolean, false = male, true = female]
dorrolereg is a number that varies. dorrolereg is usually 2. [Doran Role Regard. Numeric, 0 = Dominant Doran, 1 = Random/Neutral (Not implemented in base), 2 = Submissive Doran]
dorroleint is a number that varies. dorroleint is usually 2. [Doran Role Intensity. Numeric. 0 = full dominant, 1-3 = neutral, 4 = full submissive]
dordomtop is a number that varies. [Doran Dominance Topic. Numeric. 0 = Player didn't submit, 1 = player did submit, 2 Doran's voluntary dominance revealed]
dorfirsttalk is a truth state that varies. dorfirsttalk is usually false. [Flag to detect if the player's talked to Doran at least once]
dorwassnub is a truth state that varies. dorwassnub is usually false. [Innoculous flag used to ward backend sex calculations and sex cooldown if you decide against having sex with Doran]
dorfedtype is a number that varies. dorfedtype is usually 1. [Determines what kind of food Doran will give you, clever girl...]
dorreq is an action applying to nothing. [Doran Request Command]
dorrim is an action applying to nothing. [Hidden Request Tree for warding Rimjob scene]
dorautint is a number that varies. dorautint is usually 0. [Doran Auto-Fire Intensity, 0 = Off, 1 = Strict, 2 = Loose]
dorbb is a truth state that varies. dorbb is usually false. [Doran Blue-Balling, True indicates for the final sex roll to increase player libido instead of decrease]
dorauto is a truth state that varies. dorauto is usually false. [Doran Automatic, True indicates that Doran initiated the sex himself for the purpose of the player-submissive scenes]
dorrjd is a number that varies. dorrjd is usually -1. [Doran Rimjob Disuasion, true indicates that the player does not want the aformentioned scene in their dom doran pool]
dorautr is a truth state that varies. dorautr is usually false. [Doran Auto-fire Reveal, true indicates that the player's used this interaction at least once]
dornpbb is a number that varies. dornpbb is usually 0. [Doran Non-Player Blue-Balling, used to indicate if Doran has received orgasm denial/neglect]
dorinternal is a truth state that varies. dorinternal is usually false. [Doran Internal. True = No balls/sheath]
dorballmod is a number that varies. dorballmod is usually -1. [Doran ball size. -1 = Not exposited 0 = Normal, 1 = Expanded]
dortitmod is a number that varies. dortitmod is usually -1.[Doran Breast modifier. -1 = Not Exposited, 0 = None, 1 = Present, 2 = Lactating]
doransgender is a truth state that varies. doransgender is usually false. [Doran's "dorgenreg". False = Male, True = Female]
dormodtop is a number that varies. [Doran modification topic]
dorgentop is a number that varies. [Doran's gender topic]

Section 1.1 - Doran Monster Responses

to say losetodoran:
	if hp of player > 0:
		say "     You quickly surrender to the dragon, which seems to briefly confuse him. Once it's clear you're really submitting, he only snorts, audibly regarding your gesture with an odd measure of disappointment, before turning tail and departing.";
		say "     It's particularly strange that any beast around these parts to so readily reject an opportunity to abuse a potential victim further.";
		now dordomtop is 1;
	otherwise:
		say "     He's about to set upon you again before you collapse, too exhausted to contend him any further, which causes him to yield once more. When it's apparent that you have no more fight in you, he seems rather pleased with himself, strutting around you in a rather gloating, energetic manner for a bit.";
		say "     Satisfied with his little victory dance, he then turns to depart. Though you've got no particular issue with this, he doesn't seem all that interested in abusing you any further, a very strange thing for a beast to do in these parts";
		if a random chance of 1 in 2 succeeds and dorlastfed - turns >= 16:
			if a random chance of 1 in 2 succeeds:
				say ". He even returns a few seconds later, bottle of water in maw, before setting it down in front of you and retreating a second time, extremely peculiar...";
				add "water bottle" to invent of player;
			otherwise:
				say ". He even returns a few seconds later, can of food in maw, before setting it down in front of you and retreating a second time, extremely peculiar...";
				add "food" to invent of player;
			now dorlastfed is turns;
		otherwise:
			say ".";

to say beatdoran:
	now calcnumber is -1;
	if cockname of player is listed in infections of internallist:
		now dorinternal is true; [Doran becomes internal if the player is also internal when he's beaten. There should be no other way to modify it at this time -- though a shortcut will be needed for when saving is implemented]
	say "     You're about to strike down the dragon before he suddenly backs out, maw opening to speak.";
	say "     'I yield, I yield! You are my victor, I will contest such a person no further.' It's a little surprising that the beast speaks when he hasn't made so much as a peep up to this point. 'It's quite clear who's the stronger one here...' He slowly begins to step back, and you're not sure if he's going to turn tail and run.";
	say "     'To be honest, I'm not surprised my victor defeated me; I can see they're a determined one. In any case, this victory makes me theirs to do with as they please.' He bows slightly in punctuation of his concession, oddly willing to offer himself to you in the wake of your victory.";
	say "     'What would my victor subject me to?'";
	if cocks of player > 0 or cunts of player > 0:
		say "     By your wagering, you could ";
		if cunts of player > 0:
			if cocks of player > 0 and cunt length of player > 4:
				say "[link]mount him (1)[as]1[end link], make him [link]suck your dick (2)[as]2[end link], [link]eat your cunt (3)[as]3[end link], [link]ride the dragon (4)[as]4[end link], ";
				if scalevalue of player > 1 or player is twistcapped:
					say "[link]ride the dragon anally (5)[as]5[end link], or [link]turn down (0)[as]0[end link] his offer.";
					while calcnumber < 0 or calcnumber > 5:
						say "Choice? (0-5)>[run paragraph on]";
						get a number;
					if calcnumber is 1:
						say "[dorvic_1]"; [fuck the dragon]
					otherwise if calcnumber is 2:
						say "[dorvic_2]"; [oral cock]
					otherwise if calcnumber is 3:
						say "[dorvic_3]"; [oral cunt]
					otherwise if calcnumber is 4:
						say "[dorvic_4]"; [cunt sex]
					otherwise if calcnumber is 5:
						say "[dorvic_5]"; [anal sex]
					otherwise:
						say "[dorvic_snub]"; [turn down]
				otherwise:
					say "ride the dragon anally (Too small!), or [link]turn down (0)[as]0[end link] his offer.";
					while calcnumber < 0 or calcnumber > 4:
						say "Choice? (0-4)>[run paragraph on]";
						get a number;
					if calcnumber is 1:
						say "[dorvic_1]"; [fuck the dragon]
					otherwise if calcnumber is 2:
						say "[dorvic_2]"; [oral cock]
					otherwise if calcnumber is 3:
						say "[dorvic_3]"; [oral cunt]
					otherwise if calcnumber is 4:
						say "[dorvic_4]"; [cunt sex]
					otherwise:
						say "[dorvic_snub]"; [turn down]
			otherwise if cocks of player > 0:
				say "[link]mount him (1)[as]1[end link], make him [link]suck your dick (2)[as]2[end link], [link]eat your cunt (3)[as]3[end link], ride the dragon (Too small!)";
				if scalevalue of player > 1 or player is twistcapped:
					say "[link]ride the dragon anally (4)[as]4[end link], or [link]turn down (0)[as]0[end link] his offer.";
					while calcnumber < 0 or calcnumber > 4:
						say "Choice? (0-4)>[run paragraph on]";
						get a number;
					if calcnumber is 1:
						say "[dorvic_1]"; [fuck the dragon]
					otherwise if calcnumber is 2:
						say "[dorvic_2]"; [oral cock]
					otherwise if calcnumber is 3:
						say "[dorvic_3]"; [oral cunt]
					otherwise if calcnumber is 4:
						say "[dorvic_5]"; [anal sex]
					otherwise:
						say "[dorvic_snub]"; [turn down]
				otherwise:
					say "ride the dragon anally (Too small!), or [link]turn down (0)[as]0[end link] his offer.";
					while calcnumber < 0 or calcnumber > 3:
						say "Choice? (0-3)>[run paragraph on]";
						get a number;
					if calcnumber is 1:
						say "[dorvic_1]"; [fuck the dragon]
					otherwise if calcnumber is 2:
						say "[dorvic_2]"; [oral cock]
					otherwise if calcnumber is 3:
						say "[dorvic_3]"; [oral cunt]
					otherwise:
						say "[dorvic_snub]"; [turn down]
			otherwise:
				say "make him [link]eat your cunt (1)[as]1[end link], ";
				if cunt length of player > 4:
					say "[link]ride the dragon (2)[as]2[end link], ";
					if scalevalue of player > 1 or player is twistcapped:
						say "[link]ride the dragon anally (3)[as]3[end link], or [link]turn down (0)[as]0[end link] his offer.";
						while calcnumber < 0 or calcnumber > 3:
							say "Choice? (0-3)>[run paragraph on]";
							get a number;
						if calcnumber is 1:
							say "[dorvic_3]"; [oral cunt]
						otherwise if calcnumber is 2:
							say "[dorvic_4]"; [cunt sex]
						otherwise if calcnumber is 3:
							say "[dorvic_5]"; [anal sex]
						otherwise:
							say "[dorvic_snub]"; [turnd own]
					otherwise:
						say "ride the dragon anally (Too small!), or [link]turn down (0)[as]0[end link] his offer.";
						while calcnumber < 0 or calcnumber > 2:
							say "Choice? (0-2)>[run paragraph on]";
							get a number;
						if calcnumber is 1:
							say "[dorvic_3]"; [oral cunt]
						otherwise if calcnumber is 2:
							say "[dorvic_4]"; [cunt sex]
						otherwise:
							say "[dorvic_snub]"; [cunt sex]
				otherwise:
					say "ride the dragon (Too small!), ";
					if scalevalue of player > 1 or player is twistcapped:
						say "[link]ride the dragon anally (2)[as]2[end link], or [link]turn down (0)[as]0[end link] his offer.";
						while calcnumber < 0 or calcnumber > 2:
							say "Choice? (0-2)>[run paragraph on]";
							get a number;
						if calcnumber is 1:
							say "[dorvic_3]"; [oral cunt]
						otherwise if calcnumber is 2:
							say "[dorvic_5]"; [anal sex]
						otherwise:
							say "[dorvic_snub]"; [turnd own]
					otherwise:
						say "ride the dragon anally (Too small!), or [link]turn down (0)[as]0[end link] his offer.";
						while calcnumber < 0 or calcnumber > 1:
							say "Choice? (0-1)>[run paragraph on]";
							get a number;
						if calcnumber is 1:
							say "[dorvic_3]"; [oral cunt]
						otherwise:
							say "[dorvic_snub]"; [cunt sex]
		otherwise:
			say "[link]mount him (1)[as]1[end link], make him [link]suck your dick (2)[as]2[end link], ";
			if scalevalue of player > 1 or player is twistcapped:
				say "[link]ride the dragon anally (3)[as]3[end link], or [link]turn down (0)[as]0[end link] his offer.";
				while calcnumber < 0 or calcnumber > 3:
					say "Choice? (0-3)>[run paragraph on]";
					get a number;
				if calcnumber is 1:
					say "[dorvic_1]"; [fuck the dragon]
				otherwise if calcnumber is 2:
					say "[dorvic_2]"; [oral cock]
				otherwise if calcnumber is 3:
					say "[dorvic_5]"; [anal sex]
				otherwise:
					say "[dorvic_snub]"; [turn down]
			otherwise:
				say "ride the dragon anally (Too small!), or [link]turn down (0)[as]0[end link] his offer.";
				while calcnumber < 0 or calcnumber > 2:
					say "Choice? (0-2)>[run paragraph on]";
					get a number;
				if calcnumber is 1:
					say "[dorvic_1]"; [fuck the dragon]
				otherwise if calcnumber is 2:
					say "[dorvic_2]"; [oral cock]
				otherwise:
					say "[dorvic_snub]"; [turn down]
	otherwise:
		say "     You point out that you lack the proper equipment, and thusly have little to gain from such an interaction. This revelation seems to confuse him a fair bit, but he otherwise concedes.";
		say "     'Very well; however, if things change for my victor, I'm always available.' He goes on to explain where he resides. Apparently there's a cave within a not-too-distant [bold type]Rocky Outcropping[roman type], and his instructions are clear enough that you should have no issue getting there, 'Doran's the name, by the way.'";
		say "     Once he's done, he makes to leave in that direction, scaled and well-toned ass waving at you in his departure, as though to entice you to follow.";
	choose row monster from the table of random critters;
	now the rocky outcropping is known;
	now area entry is "nowhere";
	
to say dorandesc:
	now dorfedtype is a random number between 1 and 2;
	say "     Upon your travels through the plains, a rather peculiar sight approaches you from the distance. It would appear to be some manner of large, feral dragon, turquoise scales immaculately shimmering in the [if daytimer is day]day[otherwise]night [end if]light. Very much well-toned and muscled, he struts towards you with a very deliberate, formal poise. He doesn't appear immediately threatening, sizing you up with with a silent--if albeit somewhat energetic--demeanour before his poise shifts, apparently as to challenge you to combat.";
	
Section 1.2 - Doran Monster Sex Pool

to say dorvic_1: [fuck the dragon]
	say "     You suggest, rather bluntly, that he bend over and offer himself to you. The dragon, particularly excited by your blunt request, turns around, [if scalevalue of player < 4]lowering himself to the ground before [end if]hiking his tail over to leave your entry unexposed. Shapely ass revealed before you, he's already quite aroused by the prospect of your imminent abuse, knotted, fleshy, and impressive dick [if dorinternal is true]bulging out from his meagre genital slit and[otherwise]and ample, scaled balls[end if] exposed to the open air.";
	say "     'My victor ought not worry for my welfare, abuse me as much as it pleases them.' It's glaringly obvious by now that this beast is very heavily inclined towards submission. You expose your [cock size desc of player] dick[smn] before [ghim], [if cock length of player > 17]a very eager look in his eyes at the prospect of getting[otherwise]clearly eager to be[end if] impaled by [if cocks of player > 1]one of those things[otherwise]such a thing[end if].";
	say "     Approaching the dragon, you more rigorously invoke your arousal by grinding[if cocks of player > 1] one of[end if] your hardening shaft[smn] against his well-toned rear, scales immaculate and smooth under your touch, illustrating that the creature takes very good care of his appearance. Slowly, you sink the[if cockname of player is listed in infections of bluntlist] blunt[end if] head of[if cocks of player > 1] one of[end if] your[if cock length of player > 17] impressive[end if] tool[smn] past his fleshy, yielding anal ring, eliciting from the beast a series of approving moans at your initial pace.";
	if cock length of player > 17:
		say "     Very quickly, his supple hole becomes increasingly strained to abide your member, but this only entices the beast to coax you on. 'Further, further!' Is his reply, and with a bit of work and pre's slick lubrication his tight tailpipe grows progressively willing to take your sizeable tool[if cockname of player is listed in infections of knotlist], up to the knot[end if], granting you the freedom to start fucking him proper.";
	otherwise:
		say "     He shows absolutely no difficulty in abiding your member[if cockname of player is listed in infections of knotlist], even tying its knot almost immediately[end if]. He doesn't seem to mind your ease, and is more inclined to revel in your exploitation of his form, supple abyss almost overwhelming in how assertively it milks the organ. 'Harder, harder!' Is his demand, greedy for your abuse, as you're compelled to start fucking him proper.";
	say "     [If scalevalue of player > 3]Body visibly rocking against each successive thrust[otherwise]Larger body barely moved by[end if] each successive thrust, [if cockname of player is not listed in infections of internallist]your balls audibly slap against [ghim], a wordless remark on[otherwise]overtaken by[end if] your rising, wanton fervor. Your embrace on the reptile grows increasingly slick, coated by a thin veneer of sweat.";
	say "     'P-please, fill me with C-cum...!' At the very cusp of your bliss, you maintain enough control to determine if you'd like to pull out at the last second, shall you? Else you will give the greedy dragon what he wants.";
	if player consents:
		say "     Before you are completely overtaken, you wrench your [cock size desc of player] cock from the beast, quickly jacking it[if cocks of player > 2] and one of its brothers[otherwise if cocks of player is 2] and its brother[end if] off before you cry out, coating his ass[if scalevalue of player > 3] and back[end if] with gouts of your thick, virile seed";
	otherwise:
		say "     Succumbing to your tainted urges, you [if cockname of player is listed in infections of knotlist and cock length of player > 17]make one final push, tying yourself with the beast before you cry out[otherwise if cockname of player is listed in infections of knotlist]soon cry out, tying your cock within him one final time[otherwise]soon cry out, hilting your cock within him[end if], gouts of your thick, virile seed flooding his depths[if cocks of player > 2], its brothers staining his behind[otherwise if cocks of player is 2], its brother staining his behind[end if].";
	say ". It takes you some time to recover, eventually [if scalevalue of player < 4]climbing[otherwise]pulling yourself[end if] off. The dragon lays there for a bit, panting himself in the wake of being ravaged. He eventually does crawl back to his feet, looking satisfied.";
	say "     'I rather enjoyed that, victor! Perhaps they would be interested in another go sometimes down the line?' He goes on to explain where he resides. Apparently there's a cave within [bold type]Rocky Outcropping[roman type] not far from here, and his instructions are clear enough that you should have no issue getting there. 'Doran's the name, by the way.'";
	say "     Finished, he turns to depart in that direction, his prior poise somewhat diminished under the exhausted weight of his cum-stained[if cock length of player > 17] and no doubt quite sore[end if] form.";

to say dorvic_2: [oral cock]
	say "     You see no harm in humouring the dragon, freeing yourself of any obstruction that might cover you before gesturing to your [cock size desc of player] cock[smn], to which he eagerly struts toward. Too eager, in fact...";
	say "     'Hum, my victor is wont to such simple affections. I'm happy to oblige.' Scaled lips parting to expose his teeth, you no doubt feel slightly concerned that this might be some manner of trick the beast is about to play on you, but the fear is assuaged when those same lips envelop [if cocks of player > 2]one of them, taloned hand moving to stroke one of its brothers[otherwise if cocks of player is 2]one of them, taloned hand moving to stroke its brother[otherwise]it[end if]. Humid breath enveloping your lower torso, you abide his thick tongue's initial, teasing query.";
	say "     'Oh, my victor [if cock length of player > 17]is so well-endowed, I wonder if I'll properly be able to pleasure them[otherwise]tastes so inviting, I'm going to enjoy this[end if].' He pulls away briefly to offer this remark, '...If I might be so selfish, this offering leaves me quite aroused, might my victor grant me the chance to offer myself some pleasure as I attend to them?' You imagine [ghe][']d not be as capable of pleasuring you with his attention split, shall you oblige his request? Otherwise you'll ensure his attention remains solely on you.";
	if player consents:
		say "     You decide to allow him this opportunity, to which he eagerly obliges, hand moving [if cocks of player > 1]away from your spare cock to attend his own[otherwise]over to attend his own cock[end if] before his maw envelops your flesh a second time, his endeavours now much more deliberate. Dexterous, slick appendage eager to wrap around your [cock size desc of player] tool, he would exhibit a voracious desire to satisfy your need[if cock length of player < 17], frequently pushing the limits of his endurance to engulf your impressive dick[end if]. As his need for self-pleasure rises, so does the pace in which he bobs against you become erratic, driving you ever-closer to bliss along the way.";
		say "     You're just about to blow! But with his attention diverted you could exploit this opportunity to shame him further by pulling out and ejaculating on his face, should you? Else you will give the dragon what he clearly wants.";
		if player consents:
			say "     Right at the very last second, you pull your dick free of the beast, your dick[smn] soon erupting thereafter upon his unsuspecting face. Trapped in the throes of his own bliss, he can only regard the demeaning act with a wanton embrace, form a writhing and twitching mess as he lets you stain the beast with your [cum load size of player] load. When all is said is done he's a shameful sight, wallowing in a puddle of his own spunk.";
		otherwise:
			say "     Soon thereafter your dick[if cocks of player > 1]s erupt[otherwise] erupts[end if], flooding the dragon's maw with your virile seed as he's caught between swallowing down your [cum load size of player] payload and the throes of his own bliss, allowing you watch the beast's writhing, twitching form as [if cocks of player > 2]your unattended organs stain the ground, mixing with[otherwise if cocks of player is 2]your unattended organ stains the ground, mixing with[otherwise]he wallows in a puddle of[end if] his own spunk.";
	otherwise:
		say "     You choose to disallow such an act, to which he concedes with little further thought on the matter, maw enveloping your cock a second time, his endeavours now much more deliberate. Dexterous, slick appendage eager to wrap around your [cock size desc of player] tool, he exhibits a voracious desire to satisfy your need[if cock length of player < 17], frequently pushing the limits of his endurance to engulf your impressive dick[end if]. He retains a very methodical, calculated pace[if cocks of player > 2], occasionally switching to one of your other dicks to keep you sensitive to his tongue's influence[otherwise if cocks of player > 1], occasionally switching to the other dick in his grip to keep you sensitive to his tongue's influence[otherwise if cunts of player > 1], occasionally stopping only to offer some passing affection to one of your cunts[otherwise if cunts of player is 1], occasionally stopping only to offer some passing affection to your cunt[end if], audible moans escaping your lips as you're rapidly pushed ever-closer to bliss.";
		say "     The air is filled with the sound of the dragon's wet affection for but a few minutes before he drives you to orgasm, organ[smn] erupting against his tongue[if cocks of player > 1] and talon[end if]. With a disciplined determination, he milks you dry of every last drop of your [cum load size of player] payload, [if cocks of player > 2]talon bunching up at your second dick's head that he might lick it clean when he concludes with the first, though he is not so dexterous that he can stop the others from spilling all over the ground[otherwise if cocks of player is 2]talon bunching up at your second dick's head that he might lick it clean when he is concludes with the first[otherwise]licking it clean once you might offer no more for him[end if][if cock width of player > 24]. He doesn't seem even remotely phased by the amount you offer him; rather, [ghe][']d be quite jovial over it, reveling in your excess[end if].";
	say "     'Alright, I certainly hope my victor was pleased...' It takes him a moment to recover, cleaning himself off and regaining what composure might have slipped from him prior. 'That was satisfying! Perhaps you would be interested in another go sometimes down the line?' He goes on to explain where he resides. Apparently there's a cave within [bold type]Rocky Outcropping[roman type] not far from here, and his instructions are clear enough that you should have no issue getting there. 'Doran's the name, by the way.'";
	say "     Finished, he turns to depart in that direction, scaled and well-toned ass waving at you in his departure, as though to entice you to follow.";

to say dorvic_3: [oral cunt]
	say "     You see no harm in humouring the dragon, freeing yourself of any obstruction that might cover you before gesturing to your [cunt size desc of player] cunt[sfn], to which he eagerly struts toward. Too eager, in fact...";
	say "     'Hum, my victor is wont to such simple affections. I'm happy to oblige.' Scaled lips parting to expose his teeth, you no doubt feel slightly concerned that this might be some manner of trick the beast is about to play on you, but the fear is assuaged when those same lips embrace [if cunts of player > 1]one of them[otherwise]it[end if][if cocks of player > 1], taloned hand moving to stroke one of your exposed dicks[otherwise if cocks of player is 1], taloned hand moving to stroke your exposed dick[otherwise if cunts of player > 1], taloned hand moving to stroke one of its sisters[otherwise if cunts of player is 2], taloned hand moving to stroke its sister[end if]. Humid breath enveloping your lower torso, you abide his thick tongue's initial, teasing query, testing your supple folds and their pliability.";
	say "     'Oh, my victor [if cunt length of player > 17]is so spacious, I wonder if I'll properly be able to pleasure them[otherwise]tastes so inviting, I'm going to enjoy this[end if].' He pulls away briefly to offer this remark, '...If I might be so selfish, your offering leaves me quite aroused, might you grant me the chance to offer myself some pleasure as I attend to you?' You imagine [ghe][']d not be as capable of pleasuring you with his attention split, shall you oblige his request? Otherwise you'll ensure his attention remains solely on you.";
	if player consents:
		say "     You decide to allow him this opportunity, to which he eagerly obliges, hand moving [if cocks of player > 0]away from your cock to attend his own[otherwise if cunts of player > 1]away from your spare portal to attend his dick[otherwise]over to attend his dick[end if] before his maw envelops your pussy a second time, his endeavours now much more deliberate. Dexterous, slick appendage eager to dive within your [cunt size desc of player] depths, he exhibits a voracious desire to satisfy your need, [if cunt length of player < 17]your ease compelling his fervor further[end if]. As his need for self-pleasure rises, so does the pace in which his tongue attends you become erratic, driving you ever-closer to bliss along the way.";
		if cocks of player > 0:
			say "     You're just about to blow! But with his attention diverted you could exploit this opportunity to shame him further by ejaculating on his face, should you? Else you'll spare the dragon of this indignity.";
			if player consents:
				say "     Right as you find your bliss, you pull his tongue free from you, aiming your dick[smn] at him and, soon thereafter, erupting upon his unsuspecting face. Trapped in the throes of his own bliss, he can only regard the demeaning act with a wanton embrace, form a writhing and twitching mess as he lets you stain the beast with your [cum load size of player] load. When all is said is done, he's a shameful sight, wallowing in a puddle of his own spunk.";
			otherwise:
				say "     Soon thereafter you cry out in bliss, supple passage tightening against the dragon's tongue, cock[smn] erupting into the open air, staining your crotch and the ground with your seed. He's clearly caught between attending you and being in the throes of his own bliss, allowing you watch his writhing, twitching form as the beast's dick unloads impotently into the ground, wallowing in a puddle of his own spunk.";
		otherwise:
			say "     It's not long before you finally cry out in bliss, supple passage tightening against the dragon's tongue. He's clearly caught between attending you and being in the throes of his own bliss, allowing you watch his writhing, twitching form as the beast's dick unloads impotently into the ground, wallowing in a puddle of his own spunk.";
	otherwise:
		say "     You choose to disallow such an act, to which he concedes with little further thought on the matter, maw enveloping your pussy a second time, his endeavours now much more deliberate. Dexterous, slick appendage eager to dive within your [cunt size desc of player] depths, he exhibits a voracious desire to satisfy your need[if cunt length of player > 17], your ease of access only compelling his fervour further[end if]. He retains a very methodical, calculated pace[if cocks of player > 1], occasionally stopping only to offer some passing affection to one of your dicks[otherwise if cocks of player is 1], occasionally stopping only to offer some passing affection to your dick[otherwise if cunts of player > 2], occasionally switching to attend one of your other cunts to keep you sensitive to his influence[otherwise if cunts of player is 2], occasionally switching to your other cunt to keep you sensitive to his influence[end if], audible moans escaping your lips as you're rapidly pushed ever-closer to bliss.";
		say "     The air is filled with the sound of the dragon's wet affection for but a few minutes before he drives you to orgasm, feminine portal tightening around his tongue[if cocks of player > 0] as your cock[smn] erupt, staining yourself with your [cum load size of player] payload[end if]. With a disciplined dedication, he licks you clean until it is barren with naught but a thin veneer of his saliva.";
	say "     'Alright, I certainly hope my victor was pleased...' It takes him a moment to recover, cleaning himself off and regaining what composure might have slipped from him prior. 'That was satisfying! Perhaps my victor would be interested in another go sometime down the line?' He goes on to explain where he resides. Apparently there's a cave within [bold type]Rocky Outcropping[roman type] not far from here, and his instructions are clear enough that you should have no issue getting there. 'Doran's the name, by the way.'";
	say "     Finished, he turns to depart in that direction, scaled and well-toned ass waving at you in his departure, as though to entice you to follow.";

to say dorvic_4: [cunt sex]
	say "     With some curiosity, your eyes wander down upon the dragon's more private regions. Already aroused at the prospect of your imminent exploitation, you can see his exposed, fleshy dick already emerged from the ";
	if dorinternal is true:
		say "genital slit which housed it prior. Knotted and distinctly draconic, it's a fairly intimidating tool.";
	otherwise:
		say "sheath which housed it prior. Knotted and distinctly draconic, it's a fairly intimidating tool. Behind it hangs an equally impressive pair of heavy, scaled balls.";
	say "     'Ah, I see my victor would like to take their dragon out for a little ride, perhaps?' His remark comes as little surprise given how you've been ogling him for a fair while, though perhaps more surprising is how obliging he is towards the prospect, even with what he might get out of it. You agree, to which he slowly lays down, rolling on his back to give you a fuller, more intimate view of his towering rod, 'I am theirs to do with as they please.'";
	say "     [if scalevalue of player < 4 and cunt length of player < 12]A little sheepishly, y[otherwise]Y[end if]ou approach [ghim], relinquishing any obstruction you might have adorned prior before your hands move to feel the organ. Soft, yielding flesh juxtaposed against his much firmer, scaled undercarriage, it's already eager to ooze pre against your touch. [if cunt length of player < 12]The thing is rather frightening, to be honest; at the very least it'll be quite a challenge to fit, even the dragon seems a little uncertain you can take him[otherwise]Quite well endowed, you imagine there'll be some challenge in getting the thing in, though you doubt it'll be that difficult for someone of your capability[end if].";
	if scalevalue of player < 4:
		say "     'Ah, does my victor require aid? I'll be as careful as someone of my size might allow.' It's clear he thinks you'll need some assistance getting it in, accept his offer? Else you'll stick to your guns.";
		if player consents:
			say "     You decide to consent to his aid, to which his taloned forepaws descend upon you, ever-so-gently lining up [if cunts of player > 1]one of your cunts[otherwise]your cunt[end if] with his proudly jutting tool. Mindful of your regard, you're slowly forced upon rod, quickly contending with his flared head. [if cunt length of player > 17]Your difficulty is only brief before you sink the head into your depths entirely, your subsequent ease much to the dragon's surprise[otherwise]After much work and strained grunts, the two of you manage to sink the head into your depths, the rest taking somewhat less work, up to the knot[end if]. Done helping you, the beast lets you go, allowing you to continue on your own pace.";
		otherwise:
			say "     You suggest against his aid, intent on taking care of this yourself as you line up [if cunts of player > 1]one of your cunts[otherwise]your cunt[end if] with his proudly jutting tool. Taking a moment to breath, you slowly force yourself upon the rod, quickly contending with his flared head. [if cunt length of player > 17]Your difficulty is only brief before you sink the head into your depths entirely, your subsequent ease much to the dragon's surprise[otherwise]After much work and strained grunts, you manage to sink the head into your depths, the rest taking somewhat less work, up to the knot[end if].";
	otherwise:
		say "     Climbing over the beast, you carefully up your rear with his proudly jutting tool. Briefly teasing [if cunts of player > 1]one of your cunts[otherwise]your cunt[end if] with it, much to the groans of the dragon's approval, you slowly force yourself upon the rod, flared head slowly sinking into the supple, yielding folds of its flesh [if cunt length of player < 12]After much work and strained grunts, you manage to sink the head into your depths, the rest taking somewhat less work, up to the knot[otherwise if cunt length of player > 17]Struck by a rather impish urge, you abruptly descend upon his tool in its entirety, so pliable that you envelop his knot with almost no difficulty. This surprise is enough to cause him to moan loudly, a gout of pre spurting from the organ, so suddenly enveloped as it is[otherwise]Past his head, your remaining descent is a fair bit easier, up to his knot, the size of which is sufficiently challenging to compel you against dealing with just yet[end if].";
	say "     'Oh, m-my victor is so [if cunt length of player < 12]t-tight[otherwise if cunt length of player > 17]s-skilled[otherwise]f-firm[end if].' His discourse is mixed with deep moans, elicited as you build a motion of riding the dragon's powerful dick, [if cocks of player > 1]your own bouncing in the open air, staining the dragon's scales with their slick fluids[otherwise if cocks of player is 1]your own bouncing in the open air, staining the dragon's scales with its slick fluids[otherwise]stuffed portal eagerly milking the beast for what he's worth[end if][if scalevalue of player < 3], body visibly bulging to contain the organ[end if].";
	say "     You can tell, by the creature's rising fervour, that he's about to erupt, and it might be ideal to pull out just before then. Shall you? Lest you abide the fullness of his carnal fury.";
	if player consents:
		say "     Just on the cusp of the beast's bliss, you [if cunt length of player < 12]wrench[otherwise]pull[end if] yourself free of the cock, rapidly frotting your [if cocks of player > 0]own dick[smn][otherwise]cunt[sfn][end if] against his throbbing, pre-slicked tool just before he cries out, gout after successive gout painting the dragon's torso and face with his own jizz. Soon there after, your desperate endeavour is rewarded when you find your own bliss, [if cocks of player > 0]dick[smn] spending your [cum load size of player] payload against [ghim][otherwise if cunts of player > 0]cunt[sfn] staining his crotch with your release[end if], mixing with his own, the reptile now an embarrassing, cum-stained mess.";
		say "     Eventually, you step off of the dragon, letting him clean himself off.";
		say "     'Oh, how very naughty, making a mess of me like that!' He feigns insult, taking a moment to regain his posture. 'That was satisfying! Perhaps my victor would be interested in another go sometimes down the line?' He goes on to explain where he resides. Apparently there's a cave within [bold type]Rocky Outcropping[roman type] not far from here, and his instructions are clear enough that you should have no issue getting there. 'Doran's the name, by the way.'";
	otherwise:
		say "     Compelled by your wanton hunger, [if cunt length of player < 12]you take considerable effort to finally tie yourself with the beast's knot[otherwise if cunt length of player > 17]making one, final descent, engulfing him fully[otherwise]you take one final effort to tie yourself with the beast's knot[end if], more than enough to cause him to cry out, pumping your womb full with gout after successive gout of his voluminous jizz[if scalevalue of player < 4], body visibly bulging to abide this release[end if], sparse remnants sputtering from your tied hole to stain the beast's crotch as you contend with your own bliss[if cocks of player > 0], dick[smn] unloading your [cum load size of player] payload against his torso[end if].";
		say "     Eventually, you pull yourself free of the dragon's now-softened organ, stepping off of him.";
		say "     'Oh, my victor is quite impressive at being able to take me.' He offers his praise before getting back up, taking a moment to regain his posture. 'That was satisfying! Perhaps they would be interested in another go sometimes down the line?' He goes on to explain where he resides. Apparently there's a cave within [bold type]Rocky Outcropping[roman type] not far from here, and his instructions are clear enough that you should have no issue getting there. 'Doran's the name, by the way.'";
	say "     Finished, he turns to depart in that direction, scaled and well-toned ass waving at you in his departure, as though to entice you to follow.";


to say dorvic_5: [anal sex]
	say "     With some curiosity, your eyes wander down upon the dragon's more private regions. Already aroused at the prospect of your imminent exploitation, you can see his exposed, fleshy dick already emerged from the ";
	if dorinternal is true:
		say "genital slit which housed it prior. Knotted and distinctly draconic, it's a fairly intimidating tool.";
	otherwise:
		say "sheath which housed it prior. Knotted and distinctly draconic, it's a fairly intimidating tool. Behind it hangs an equally impressive pair of heavy, scaled balls.";
	say "     'Ah, I see my victor would like to take his dragon out for a little ride, perhaps?' His remark comes as little surprise given how you've been ogling him for a fair while, though perhaps more surprising is how obliging he is towards the prospect, even with what he might get out of it. You agree, to which he slowly lays down, rolling on his back to give you a fuller, more intimate view of his towering dick, 'I am their's to do with as they please.'";
	say "     [if scalevalue of player < 4]A little sheepishly, y[otherwise]Y[end if]ou approach [ghim], relinquishing any obstruction you might have adorned prior before your hands move to feel the organ. Soft, yielding flesh juxtaposed against his much firmer, scaled undercarriage, it's already eager to ooze pre against your touch. [if scalevalue of player < 4 and player is not twistcapped]The thing is rather frightening, to be honest; at the very least it'll be quite a challenge to fit, even the dragon seems a little uncertain you can take [ghim][otherwise]Quite well endowed, you imagine there'll be some challenge in getting the thing in, though you doubt it'll be that difficult for someone of your capability[end if].";
	if scalevalue of player < 4:
		say "     'Ah, does my victor require aid? I'll be as careful as someone of my size might allow.' It's clear he thinks you'll need some assistance getting it in, accept his offer? Else you'll stick to your guns.";
		if player consents:
			say "     You decide to consent to his aid, to which his taloned forepaws descend upon you, ever-so gently lining up your ass with his proudly jutting tool. Mindful of your regard, you're slowly forced upon rod, quickly contending with his flared head. [if scalevalue of player is 3 and player is twistcapped]Your difficulty is only brief before you sink the head into your depths entirely, your subsequent ease much to the dragon's surprise[otherwise if scalevalue of player < 3]Much in spite your peculiar talent, it takes quite a bit of work for him to effectively sink the head into your depths, though the dragon is surprised you can even take him in the first place[otherwise]After much work and strained grunts, the two of you manage to sink the head into your depths, the rest taking somewhat less work, up to the knot[end if]. Done helping you, the beast lets you go, allowing you to continue on your own pace.";
		otherwise:
			say "     You suggest against his aid, intent on taking care of this yourself as you line up your ass with his proudly jutting tool. Taking a moment to breath, you slowly force yourself upon the rod, quickly contending with his flared head. [if scalevalue of player is 3 and player is twistcapped]Your difficulty is only brief before you sink the head into your depths entirely, your subsequent ease much to the dragon's surprise[otherwise if scalevalue of player < 3]Much in spite your peculiar talent, it takes quite a bit of work for you to effectively sink the head into your depths, though the dragon is surprised you can even take him in the first place[otherwise]After much work and strained grunts, you manage to sink the head into your depths, the rest taking somewhat less work, up to the knot[end if].";
	otherwise:
		say "     Climbing over the beast, you carefully line up your ass with his proudly jutting rod. Briefly teasing your anal ring with it, much to the groans of the dragon's approval, you slowly force yourself upon the rod, flared head slowly sinking into your supple, yielding depths. [if player is twistcapped]Struck by a rather impish urge, you abruptly descend upon his tool in its entirety, so pliable that you envelop his knot with almost no difficulty. This surprise is enough to cause him to moan loudly, a gout of pre spurting from his suddenly enveloped tool[otherwise]Past his head, your descent is a fair bit easier, up to his knot, the size of which is sufficiently challenging to compel you against dealing with just yet[end if].";
	say "     'Oh, m-my victor is so [if scalevalue of player < 4]t-tight[otherwise if player is twistcapped]s-skilled[otherwise]f-firm[end if].' His discourse is mixed with deep moans, elicited as you build a motion of riding the dragon's powerful dick, [if cocks of player > 0]your own bouncing in the open air[otherwise]cunt[sfn] dripping against the open air[end if], staining the dragon's scales with [if cocks of player > 1 or cunts of player > 1]their[otherwise]its[end if] slick fluids[if scalevalue of player < 3], stretched to the limits of your ability to contain the organ[end if].";
	say "     You can tell, by the creature's rising fervour, that he's about to erupt, it might be ideal to pull out just before then. Shall you? Lest you abide the fullness of his carnal fury.";
	if player consents:
		say "     Just on the cusp of the beast's bliss, you [if scalevalue of player < 4]wrench[otherwise]pull[end if] yourself free of the cock, rapidly frotting your [if cocks of player > 0]own dick[smn][otherwise]cunt[sfn][end if] against his throbbing, pre-slicked tool just before he cries out, gout after successive gout painting the dragon's torso and face with his own jizz. Soon thereafter, your desperate endeavour is rewarded when you find your own bliss, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against [ghim][otherwise if cunts of player > 0]cunt[sfn] staining his crotch with your release[end if], mixing with his own, the reptile now an embarrassing, cum-stained mess.";
		say "     Eventually, you step off of the dragon, letting him clean himself off.";
		say "     'Oh, now very naughty, making a mess of me like that!' He feigns insult, taking a moment to regain his posture. 'That was satisfying! Perhaps my victor would be interested in another go sometimes down the line?' He goes on to explain where he resides. Apparently there's a cave within [bold type]Rocky Outcropping[roman type] not far from here, and his instructions are clear enough that you should have no issue getting there. 'Doran's the name, by the way.'";
	otherwise:
		say "     Compelled by your wanton hunger, [if scalevalue of player < 4]you take considerable effort to finally tie yourself with the beast's knot[otherwise if player is twistcapped]making one, final descent, engulfing him fully[otherwise]you take one final effort to tie yourself with the beast's knot[end if], more than enough to cause him to cry out, pumping your bowels full with gout after successive gout of his voluminous jizz[if scalevalue of player < 3], body visibly bulging to abide this release[end if], sparse remnants sputtering from your tied hole to stain the beast's crotch as you contend with your own bliss, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against his torso[otherwise if cunts of player > 0]cunt[sfn] staining his torso with your release[end if].";
		say "     Eventually, you pull yourself free of the dragon's now-softened organ, stepping off of him.";
		say "     'Oh, my victor quite impressive at being able to take me.' He offers his praise before getting back up, taking a moment to regain his posture. 'That was satisfying! Perhaps they would be interested in another go sometimes down the line?' He goes on to explain where he resides. Apparently there's a cave within [bold type]Rocky Outcropping[roman type] not far from here, and his instructions are clear enough that you should have no issue getting there. 'Doran's the name, by the way.'";
	say "     Finished, he turns to depart in that direction, scaled and well-toned ass waving at you in his departure, as though to entice you to follow.";

to say dorvic_snub: [turn down]
	say "     Not in the mood, or perhaps weirded out by the creature's odd demeanour and eagerness to submit, you decide to reject his offer. He seems to ponder this for a moment before conceding.";
	say "     'Very well; however, if my victor changes their mind, I'm always available.' He goes on to explain where he resides. Apparently there's a cave within a not-too-distant [bold type]Rocky Outcropping[roman type], and his instructions are clear enough that you should have no issue getting there, 'Doran's the name, by the way.'";
	say "     Once he's done, he makes to leave in that direction, scaled and well-toned ass waving at you in his departure, as though to entice you to follow.";

Section 2 - Monster Insertion

Table of random critters (continued)
name	attack	defeated	victory	desc	face	body	skin	tail	cock	face change	body change	skin change	ass change	cock change	str	dex	sta	per	int	cha	sex	hp	lev	wdam	area	cocks	cock length	cock width	breasts	breast size	male breast size	cunts	cunt length	cunt width	libido	loot	lootchance	scale (number)	body descriptor (text)	type (text)	magic (truth state)	resbypass (truth state)	non-infectious (truth state)	nocturnal (truth state)	altcombat (text)
--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	-- 	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--;

When Play begins:
	Choose a blank row from Table of random critters;
	now name entry is "Peculiar Dragon";
	now attack entry is "     [one of]With great poise, the dragon[or]Strutting close to you, he[or]He[or]The dragon[at random] [one of]sweeps his tail at you, knocking you with a concussive thud[or]strikes you with the palm of his talon, a rather painful affair even if he refrains from using his claws[or]headbutts you rather fiercely, knocking you back[or]flaps his wings in your direction, sending a thundering gust of wind upon you[at random] before he yields[one of], preening and gesturing as though to taunt you[or], strutting about a bit to give you a chance to retaliate[or], preparing for what retaliation you might offer up against [ghim][or][at random].";
	now defeated entry is "[beatdoran]";	
	now victory entry is "[losetodoran]";	
	now desc entry is "[dorandesc]";
	now face entry is "now a head described by this text"; [Non-infectious, descriptors assumedly irrelevant.]
	now body entry is "that of a well-described new form put here";
	now skin entry is "fur/scales/patterns that now cover your";
	now tail entry is "Your tail gets a full sentence ending in a period.";
	now cock entry is "thesaurian";	
	now face change entry is "your head changes in some descriptive manner";
	now body change entry is "your body takes on a newly described form";	
	now skin change entry is "you gain fur/scales/skin/patterns described herein";
	now ass change entry is "your tail or ass changes in the manner described by this text";	
	now cock change entry is "it takes on a new, kinky form";
	now str entry is 17;
	now dex entry is 24;
	now sta entry is 16;
	now per entry is 12;
	now int entry is 20;
	now cha entry is 16;
	now sex entry is "nochange";
	now hp entry is 105;
	now lev entry is 16;
	now wdam entry is 17;
	now area entry is "Plains";
	now cocks entry is 1;
	now cock length entry is 18;
	now cock width entry is 18;
	now breasts entry is 0;
	now breast size entry is 0;
	now male breast size entry is 0;
	now cunts entry is 0;
	now cunt length entry is 0;
	now cunt width entry is 0;
	now libido entry is 45;
	now loot entry is "";
	now lootchance entry is 0;
	now scale entry is 4;
	now body descriptor entry is "erudite";
	now type entry is "conceptual";
	now magic entry is false;
	now resbypass entry is false;
	now non-infectious entry is true;
	blank out the nocturnal entry;
	now altcombat entry is "firebreath";


Section 3.0 - Doran NPC Core

Rocky Outcropping is a room. It is fasttravel. It is private. It is sleepsafe.
Outcropping Exit is a door. Outcropping Exit is dangerous. The marea of Outcropping Exit is "Plains". Outcropping Exit is undescribed. Outcropping Exit is east of Rocky Outcropping.
the description of Rocky Outcropping is "[rockydesc]".
to say rockydesc:
	dorangendercheck;
	say "     The cavernous alcove, of which Doran resides in, is quite large and spacious for the [gdragon]. You find it littered with various bits and baubles [ghe]'s no doubt stumbled upon and collected for [ghis] amusement, though nothing of particular interest or value catches your eye. It's a little unkempt, but isn't all that bad all things considered. [if daytimer is day]For the most part light floods in from the cave's entrance, though there's also a campfire, near the cave's center, which still contains a few errant, glowing embers, indicative of its recent use[otherwise]Faint starlight creeps in from the outside, though the main source of illumination remains [ghis] roaring campfire at the cave's center[end if]. No doubt the surrounding outcropping of stone shields the place from the wind, making the cave relatively calm and quiet.".
Doran is a man. Doran is in Rocky Outcropping.
the linkaction of Doran is "Possible Actions: [link]talk[as]talk doran[end link], [link]smell[as]smell doran[end link], [link]fuck[as]fuck doran[end link], [link]request[as]request doran[end link], [link]discuss[as]discuss doran[end link][line break]".
the description of Doran is "[doranlook]".
the fuckscene of Doran is "[doransex]".
instead of sniffing Rocky Outcropping:
	say "     It has the obvious scent of earth and burnt wood, which more than overpowers any scent the generally fastidious Doran leaves behind.";
instead of sniffing Doran:
	say "     [one of]There's a slightly [gmasculine] air about [ghim], though [ghe] otherwise remains fairly well-kept[or]There's a slightly [gmasculine] air about [ghim], though [ghe] otherwise remains fairly well-kept[or]I hope there isn't something off-putting about my smell, else I appreciate the affection[or]There's a slightly [gmasculine] air about [ghim], though [ghe] otherwise remains fairly well-kept[stopping].";

to say doranlook:
	dorangendercheck;
	if dorfirsttalk is false:
		say "     The [gdragon] seems more intent on striking up a dialogue with you than giving you a proper opportunity to inspect [ghim]. You should probably talk to [ghim] first.";
	otherwise:
		say "     To facilitate your examination Doran stands erect.  [gche]'s about what you'd expect from a traditional, western-styled [gdragon]; a scaled, impressively-sized, winged quadruped. Clad in turquoise scales, [ghis] underside is accented with with rougher, larger, and less saturated scales. Against [if daytimer is day]daylight[otherwise]fire's light[end if], [ghis] scales shimmer rather dazzlingly, illustrative of how much [ghe] fusses over [ghis] appearance.";
		say "     That vain pride is even further enforced by [ghis] posture, deliberately regal and restrained, you imagine the demeanour would be somewhat awkward to pull off, but it's clear [ghe]'s had a lot of practice doing it. You can command [ghim] to unfurl [ghis] wings, which -- when filtering the [if daytimer is day]sun's light -- create an emerald shade upon the rocky ground[otherwise]fire's light -- create a shade of emerald against the cave walls[end if] as it passes through the translucent membrane.";
		if dortitmod > 0:
			say "     [gchis] chest carries a pair of ample, scaled breasts. You imagine it's not anatomically correct for a feral creature to have mammaries there, though you suppose the entire notion of having them on a reptile at all dismisses that line of thought. They're quite large, and though they're taut enough to retain their voluptuous shape, they still yield a fair amount against your touch";
			if dortitmod > 1:
				say ". Your groping causes a small bead of milk to drip from them";
			say ".";
		if dorinternal is true:
			say "     Commanded to offer you a more intimate view of [ghis] private regions, you can clearly see [ghis] flush, chitinous undercarriage. Genital slit plainly visible before you, its lips yield slightly against your touch. [gchis] impressive, knotted dick remains obfuscated by its home, pointed head peeking through it, always eager for attention";
		otherwise:
			if dorballmod > 0:
				say "     Commanded to offer you a more intimate view of [ghis] private regions, you can clearly see [ghis] oversized, scaled package. Chitinous frame rendering [ghis] sack taut, they are still somewhat yielding to your touch, and are disproportionately large compared to his other assets. [gchis] impressive, knotted dick remains obfuscated by [ghis] sheath, pointed head peeking through it, always eager for attention";
			otherwise:
				say "     Commanded to offer you a more intimate view of [ghis] private regions, you can clearly see [ghis] ample, scaled package. Chitinous frame rendering [ghis] sack taut, they are still somewhat yielding to your touch. [gchis] impressive, knotted dick remains obfuscated by [ghis] sheath, pointed head peeking through it, always eager for attention";
		if dorballmod > 0:
			say ". The thing is prone to leaking, even when left completely alone";
		say ".";
		say "     [italic type]Doran presently regards you as [if dorgenreg is true]female[otherwise]male[end if][if doransgender is false] and themself as female[end if]. [gchis] sexual demeanour remains [if dorrolereg is 0]domineering[otherwise if dorrolereg is 2]submissive[otherwise]reasonable[end if] towards you, as you've commanded[if dorroleint is 0 and dorrolereg is 0], the severity of which being intense[otherwise if dorroleint is 4 and dorrolereg is 2], the severity of which being intense[otherwise if dorrolereg is not 1], the severity of which being fairly restrained[end if].[roman type]";
		
Instead of conversing the Doran:
	dorangendercheck;
	if dorfirsttalk is false:
		say "     'Ah, so my victor decided to join me, then?' The [gdragon] regards you upon your approach, having laid down next to the campfire, '...Though I think the name [']victor['] will end up being a little grating, yes?' [gche] exposes a toothy grin, something clearly on [ghis] mind.";
		if breast size of player > 0:
			say "     'By what I can guess, you would argue that you're female, yes? -- This no doubt seems like an obvious answer to you, but you'll be surprised how things end up around here; it can be very confusing. Please correct me if I'm wrong.' Do you agree with [ghis] assessment? Else [ghe] will just assume the opposite is true.";
			if player consents:
				say "     'Okay. My apologies for making a -- no doubt -- rather insulting query, but I wanted to be absolutely sure.'";
				now dorgenreg is true;
				now dorgr is "Mistress";
			otherwise:
				say "     'Oh, my sincerest apologies! My trespass must be forgiven, one knows how things can get around here[if cocks of player is 0 and cunts of player > 0] -- or perhaps my victor is female and they just like being considered a man, how very naughty[end if].'";
				now dorgenreg is false;
				now dorgr is "Master";
		otherwise:
			say "     'By what I can guess, you could very well be male, yes? -- This no doubt seems like an obvious answer to you, but you'll be surprised how often one can easily have difficulty making the distinction. Please correct me if I'm wrong.' Do you agree with [ghis] assessment? Else [ghe] will just assume the opposite is true.";
			if player consents:
				say "     'Okay. My apologies for making a -- no doubt -- rather insulting query, but I wanted to be absolutely sure.'";
				now dorgenreg is false;
				now dorgr is "Master";
			otherwise:
				say "     'Oh, my sincerest apologies! My trespass must be forgiven, one knows how things can get around here[if cocks of player > 0 and cunts of player is 0] -- or perhaps my victor is male and they just like being considered a lady, how very naughty[end if].'";
				now dorgenreg is true;
				now dorgr is "Mistress";
		say "     'In any case, my victor shall henceforth be regarded as my [dorgr] -- of course, feel free to [bold type]request[roman type] of me if one's body or mind changes on that assessment.' You can't help but raise an eyebrow at this new title, and your expression is quickly apparent to the [gdragon]. 'Is that not how it should be? [dorgr] is the first one to beat me and by succeeding me I am their property; I'm theirs to do with as they wish.' It's very strange that any individual would so willingly bestow ownership of themselves upon another, should you contest [ghim] over it?";
		if player consents: 
			say "     You immediately voice your disagreement with the notion of someone being declared as mere property to another, but [ghe] dismisses the thought wholeheartedly, 'If [dorgr] cares for my well being enough to worry over such things then under their care they'll ensure it.' It seems [ghis] mind cannot be changed on this matter. At the very least it's [ghis] idea.";
			[may want to fix a neutral doran offer here]
		otherwise: 
			say "     You're not exactly sure this is right for [ghim] to do, or why [ghe]'s so insistent on the distinction, but it's clearly [ghis] idea and [ghe] seems fine with it, not that there seems any way to change [ghis] mind on the matter.";
		if player is submissive: 
			say "     Your submissive inclination compels you to point out that this isn't exactly your [']area of expertise['], to which [ghe] quickly dismisses.";
			say "     'Oh, worry not. I'll happily play the domineering role for my [dorgr], if that is what they wish.' Instinctively, you agree to this arrangement, 'Say no more of it, if my [dorgr] wants to be used then used they shall be.'";
			now dorrolereg is 0;
			now dordomtop is 2;
		say "     'That's all I need to know, [dorgr], feel free to ask of me any need that enters their mind.' [gche] lets you off to continue as you were.";
		now dorfirsttalk is true;
		now the vmusings of Doran is "[doranmusing]"; [Activate Muse]
	otherwise:
		say "     '";
		if a random chance of 1 in 6 succeeds:
			say "[if dorrolereg is 0][one of]Perhaps my [dorgr] can be mine for a little longer[or]How is my [dorgr][at random][otherwise][one of]Perhaps [dorgr] can stay a little longer[or]How is [dorgr][at random][end if]?'";
		otherwise if a random chance of 3 in 10 succeeds:
			say "[if dorrolereg is 0][one of]My [dorgr] is looking particularly slutty today[or]My hope is that I might get to use my [dorgr][or]My [dorgr] makes for a great toy[at random][otherwise][one of][dorgr] is looking particularly entrancing today[or]My hope is that I might please [dorgr][or][dorgr] treats me well[at random][end if].'";
		otherwise:
			say "[one of]On a particularly windy day, the whistling sound made here can be quite calming[or]Getting wood around here can be rather difficult--oh don't give me that look, I mean the trees[or]Moving around in the city is a bit too much trouble for me; not much to scavenge in the streets and few buildings are '[gdragon]-accessible'[or]I'd take care when wandering out there[or][dorgr] might want to ask me first before eating any of the fruit around here; better yet, just avoid the stuff altogether[or]Local monsters usually stay away from around here, thankfully[or]I find a good sense of humor or a good love of fun can get one through the hardest days[at random].'";

to say doransex:
	dorangendercheck;
	if cocks of player is 0 and cunts of player is 0:
		say "     Your lack of proper sexual outlet makes the prospect of such an interaction with the [gdragon] a little one-sided, and as such you decide against it.";
	otherwise if dorfirsttalk is false:
		say "     You should probably talk to the [gdragon] first before you get down to any sort of business.";
	otherwise if lastfuck of Doran - turns <= 8:
		if dorrolereg is 0:
			say "     'Oh, my [dorgr] is interested in another go, so soon? I'm afraid I'm still too tired from the last bout. I'll be more than eager to have my fun with them when I'm up to it.'";
		otherwise:
			say "     'Again, [dorgr]? Oh, they must forgive me, I'm still absolutely exhausted! I don't mean to turn tail, I just wouldn't be any good at pleasing them, I'm sorry.'";	
	otherwise:
		say "[dorsexprot]"; [Invoke Doran Sex Protocol]

dorneutroll is a number that varies. dorneutroll is usually 0. [Doran Neutral Roll. Doran decides which position he'll take after last sex. 1 = Dominant, 2 = Submissive]
	
to say dorsexprot: [Doran Sex Protocol]
	if dorneutroll is 0, now dorneutroll is a random number between 1 and 2; [Safeguard]
	if dorrolereg < 2 and dorroleint is 4, decrease dorroleint by 1; [Free push to reduce switching time]
	if dorrolereg > 0 and dorroleint is 0, increase dorroleint by 1;
	if dorrpis > 0: [Is a Roleplay In Session?]
		say "[dorrpsp]"; [Doran Roleplay Sex Protocol]
	otherwise if dorrolereg is 0 or (dorrolereg is 1 and dorneutroll is 1): [Dom sex pool]
		now dorvorpcf is false;
		now dorvornpcf is false;
		now dorvornpa is false;
		if dorrolereg is 1 and a random chance of 1 in 2 succeeds:
			say "[dorneut_1]"; [69 Scene]
		otherwise if anallevel is 3 and dorroleint is 0 and (("Kinky" is listed in feats of player and a random chance of 1 in 5 succeeds) or (a random chance of 1 in 8 succeeds)) and dorrjd is not 1:
			say "[dordom_6]"; [rimjob scene]
		otherwise if dorballmod > 0 and dorinternal is false and dorroleint is 0 and (("Kinky" is listed in feats of player and a random chance of 1 in 4 succeeds) or (a random chance of 1 in 7 succeeds)):
			say "[dordom_9]"; [Ball Worship]
		otherwise if dorballmod > 0 and (("Kinky" is listed in feats of player and a random chance of 1 in 3 succeeds) or (a random chance of 1 in 6 succeeds)):
			say "[dordom_10]"; [Cum Worship]
		otherwise if anallevel is not 1 and (cunts of player is 0 or anallevel is 3) and ((cunts of player is 0 and ((anallevel is 3 and a random chance of 2 in 3 succeeds) or (anallevel is 2 and a random chance of 1 in 2 succeeds))) or (cunts of player > 0 and a random chance of 1 in 4 succeeds)) and (scalevalue of player > 1 or player is twistcapped):
			say "[dordom_1]"; [anal sex scene]
		otherwise if cunts of player > 0 and cunt length of player > 4 and a random chance of 1 in 3 succeeds:
			say "[dordom_2]"; [cunt sex scene]
		otherwise if (cock length of player > 17 and a random chance of 1 in 3 succeeds) or (cock length of player < 19 and a random chance of 1 in 2 succeeds): [Dominant Doran Handjob Scenes]
			if (cocks of player > 0 and cunts of player is 0) or (cocks of player > 0 and cunts of player > 0 and a random chance of 1 in 2 succeeds):
				say "[dordom_4]"; [Cock-Focused Iteration]
			otherwise:
				say "[dordom_5]"; [Cunt-Focused Iteration]
		otherwise if cocks of player > 0 and a random chance of 1 in 2 succeeds: [Dominant Doran Riding player's cock scenes]
			if cock length of player > 18 and a random chance of 2 in 3 succeeds:
				say "[dordom_7]"; [Riding on Top]
			otherwise:
				say "[dordom_8]"; [Riding Behind]
		otherwise:
			say "[dordom_3]"; [oral sex scene]
	otherwise: [Sub sex pool]
		now calcnumber is -1;
		say "     Upon requesting for a bit of action, Doran gets up and moves over to you[if dorrolereg is 1], [ghis] demeanour suggesting [ghe]'s in a more submissive mood[end if].";
		say "     '[one of]Yes[or]Certainly[or]Of course[at random], [dorgr]. [one of]What is their wish[or]How would they have me[or]How may I service them[at random]?'";
		let trixieexit be 0;
		while trixieexit is 0:
			say "[bold type]Choices:[roman type][line break]";
			say "(1) [if cocks of player > 0][link]Mount [ghim][as]1[end link][otherwise][italic type]Male-specific interaction[roman type][end if][line break]";
			say "(2) [if cocks of player > 0][link]Suck your dick[as]2[end link][otherwise][italic type]Male-specific interaction[roman type][end if][line break]";
			say "(3) [if cunts of player > 0][link]Eat your cunt[as]3[end link][otherwise][italic type]Female-specific interaction[roman type][end if][line break]";
			say "(4) [if cunts of player > 0][link]Ride [ghim][as]4[end link][otherwise][italic type]Female-specific interaction[roman type][end if] [if cunts of player > 0 and cunt length of player < 8][italic type]- Too small![roman type][end if][line break]";
			say "(5) [link]Ride [ghim] anally[as]5[end link] [if scalevalue of player < 2 and player is not twistcapped][italic type]- Too small![roman type][end if][line break]";
			say "(6) [link]Receive Rimjob[as]6[end link][line break]";
			say "(7) [link]Pleasure [ghim] orally[as]7[end link][line break]";
			say "(8) [if dorballmod > 0][link]Self Milking[as]8[end link][otherwise][italic type]Bodymod-Specific interaction[roman type][end if][line break]";
			say "[line break]";
			say "(0) [link]'Nevermind.'[as]0[end link][line break]";	
			while 1 is 1:
				say "Choice? (0-5)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 7:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				if cocks of player is 0:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
				otherwise:
					say "[dorsub_1]"; [fuck the dragon]
					now trixieexit is 1;
			otherwise if calcnumber is 2:
				if cocks of player is 0:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
				otherwise:
					say "[dorsub_2]"; [oral cock]
					now trixieexit is 1;
			otherwise if calcnumber is 3:
				if cunts of player is 0:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
				otherwise:
					say "[dorsub_3]"; [oral cunt]
					now trixieexit is 1;
			otherwise if calcnumber is 4:
				if cunts of player is 0 or cunt length of player < 5:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
				otherwise:
					say "[dorsub_4]"; [cunt sex]
					now trixieexit is 1;
			otherwise if calcnumber is 5:
				if scalevalue of player < 2 and player is not twistcapped:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
				otherwise:
					say "[dorsub_5]"; [anal sex]
					now trixieexit is 1;
			otherwise if calcnumber is 6:
				say "[dorsub_6]"; [Rimjob Scene]
				now trixieexit is 1;
			otherwise if calcnumber is 7:
				say "[dorsub_7]"; [Oral Giving Scene]
				now trixieexit is 1;
			otherwise if calcnumber is 8:
				if dorballmod > 0:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
				otherwise:
					say "[dorsub_8]"; [Self Milking]
					now trixieexit is 1;
			otherwise:
				say "[dorsub_snub]"; [turn down]
				now trixieexit is 1;
	if dorwassnub is false:
		if dorrolereg is 0 and dorroleint > 0:
			decrease dorroleint by 1;
		otherwise if dorrolereg is 2 and dorroleint < 4:
			increase dorroleint by 1;
		otherwise if dorrolereg is 1:
			if dorroleint > 2:
				decrease dorroleint by 1;
			otherwise if dorroleint < 2:
				increase dorroleint by 1;
			now dorneutroll is a random number between 1 and 2;
		now lastfuck of Doran is turns;
		if dorbb is true:
			increase libido of player by 5;
			if libido of player > 100:
				now libido of player is 100;
		otherwise:
			if libido of player > 25:
				decrease libido of player by ((libido of player / 20) + 1);
		if dorvorreg > 1 and dorrolereg is 0 and dorrpis is 0, follow the turnpass rule;
		now dorrpis is 0;
		now dorrp_tv1 is 0;
		now dorrp_tv2 is 0;
		now dorrp_tv3 is 0;
		now dorrp_tv4 is 0;
		if dornpbb > 0, decrease dornpbb by 1;
	otherwise:
		now dorwassnub is false;
	now dorbb is false;
	
an everyturn rule:
	if player is in Rocky Outcropping and Doran is visible: [Auto-Fire Protocol]
		if dorroleint is 0 and dorrolereg is 0 and dorautint > 0 and (cunts of player > 0 or cocks of player > 0) and dorrpis is 0:
			let x be 0;
		otherwise:
			continue the action;
		if (dorautint is 1 and lastfuck of Doran - turns < 9) or (dorautint is 2 and lastfuck of doran - turns < 17):
			continue the action;	
		now dorauto is true;
		say "[dorsexprot]";
		now dorauto is false;

understand "rimjob doran" as dorrim.

check dorrim:
	if Doran is not visible, say "That's not a verb I recognise." instead;
	
carry out dorrim:
	if dorrolereg is 0 and anallevel is 3:
		if dorrjd is -1:
			say "     You approach Doran, advising against having [ghim] force you to attend of [ghis] ass when having sex, which appears to briefly confuse the [gdragon].";
			say "     'Oh... My apologies, I got the impression you might be into that sort of thing, perhaps I misperceived your obsession with ass?' You ask if this is a problem, to which [ghe] shakes [ghis] head in response, 'Of course not, the last thing I'd want to do is make my [dorgr] uncomfortable... Well, uncomfortable in a way they don't enjoy. If they command it, then it shall be done.' Shall you?";
			now dorrjd is 0;
			if player consents:
				now dorrjd is 1;
				say "     'Very well, my apologies if I caused any sort of inconvenience.'";
			otherwise:
				say "     'Oh, uh, alright. Don't be afraid to ask this of me again if it does bother you.'";
		otherwise:
			if dorrjd is 0:
				say "     'Would my [dorgr] rather not have their [gdragon] sit on their face?'";
				if player consents:
					say "     'Then worry no longer about it.'";
					now dorrjd is 1;
				otherwise:
					say "     'Very well, I'll think no more of this concern.'";
			otherwise:
				say "     'Has my [dorgr] changed their mind on this particular subject?'";
				if player consents:
					say "     'Alright, I'll certainly exploit this new freedom.'";
					now dorrjd is 0;
				otherwise:
					say "     'Very well, I'll think no more of this concern.'";
	otherwise:
		say "     You are not eligible for this particular interaction, indicating that you shouldn't encounter what it entails anyways.";			

Section 3.1 - Doran NPC Dominant Sex Pool

to say dordom_1: [Anal Sex] [BODY MODDED]
	if dorauto is true:
		say "     Suddenly, you feel scaled talons firmly pin you against the ground. The [gdragon] roughly exposing your ass before [ghis] hungering eyes, [ghe]'s clearly desperate to use you.";
		say "     '[one of]Hmpf[or]Tsk[or]Well then[at random], [one of]I'm rather fond of my [dorgr]'s ass, and for too long it's been missing one key ingredient[or]I think my [dorgr] needs to learn their place for their absence[or]my [dorgr] is such a cum dumpster, they forget to attend to their [gdragon][at random], [one of]don't they think[or]wouldn't they agree[at random]?' [gchis] remark carrying the sting of your neglect,";
	otherwise:
		say "     Upon your [if dorroleint is 0]plea[otherwise]request[end if] for sex, the [gdragon] gets up and struts around you in silence, barely regarding [if dorroleint is 0]your offering[otherwise]you[end if] before you're firmly pinned to the ground, immodest talons carefully exposing your ass before [ghis] discerning eyes.";
		say "     '[one of]Ah, yes[or]Hmm[or]Well then[at random], [if dorroleint is 0][one of]I'm rather fond of my [dorgr]'s ass, but I'm thinking it's missing one key ingredient[or]I think my [dorgr] needs to learn their place[or]I'm certain my [dorgr] is the best cum dumpster around[at random][otherwise][one of]I'm certain my [dorgr] likes surprises[or]I could stare at my [dorgr]'s ass like this for hours, but that would just be a waste[or]I think my [dorgr] is due for a good dicking[at random][end if], [one of]don't they think[or]yes[or]wouldn't they agree[at random]?' [gche] remarks before";
	say " you're made watch on";
	if anallevel is 3 and a random chance of 2 in 3 succeeds:
		say ", creature's head descending upon your rear before you feel [ghis] tongue's wet[if dorroleint is 0], familiar[end if] caress against your exposed hole. [if dorroleint is 0]You beg for [ghim] to to thrust [ghis] slick organ upon your depths, much to [ghis] amusement, teasing you for but a moment longer before [ghe] obliges, causing you to moan as[otherwise]Briefly teasing you, wanton moans escaping your lips, it's not long before[end if] you feel it force its way past your anal ring.";
		say "     Writhing, indignant intrusion encountering ";
		if scalevalue of player < 4:
			if player is twistcapped:
				say "only slight";
			otherwise:
				say "a fair bit of";
		otherwise:
			say "little";
		say " resistance in its movement through your bowels, each shoving advance of the twitching thing forcing another gasp from your lips. [gche] subjects you to this ritual for a [if dorroleint is 0]considerable[otherwise]fair[end if] amount of time, leaving your ass a slick[if dorroleint is 0] and dripping[end if] mess before [ghe]'s finally satisfied[if dorroleint is 0], so aroused by this abuse that you could climax off of it alone, if not for the [gdragon]'s keen eye tempering restraint[end if].";
	otherwise:
		say ", spare talon brought within [ghis] maw before it's exposed once more, now-slick digit descending upon your behind, offering its[if dorroleint is 0] familiar[end if] caress against your exposed hole. [if dorroleint is 0]You beg for [ghim] to to force [ghis] finger upon your depths, much to [ghis] amusement, teasing you for but a moment longer before [ghe] obliges, causing you to moan as[otherwise]Briefly teasing you, wanton moans escaping your breath, it's not long before[end if] you feel it plunge its way past your anal ring.";
		say "     Firm, curving intrusion contending with ";
		if scalevalue of player < 4:
			if player is twistcapped:
				say "only slight";
			otherwise:
				say "a fair bit of";
		otherwise:
			say "little";
		say " resistance in its movement through your bowels, each shoving advance of the thing forcing another gasp from your lips. [gche] subjects you to this ritual for a [if dorroleint is 0]considerable[otherwise]fair[end if] amount of time, leaving your ass a slick and [if dorroleint is 0]significantly[end if] loosened up mess before [ghe]'s finally satisfied[if dorroleint is 0], so aroused by this abuse that you could climax off of it alone, if not for the [gdragon]'s keen eye tempering restraint[end if].";
	if dorroleint is 0:
		say "     '[one of]Tsk[or]Oh[or]Hm[or]Ha[or]Heh[at random], [one of]my [dorgr] is quite the needy[if scalevalue of player < 5] little[end if] slut, aren't they[or]I know how to get my[if scalevalue of player < 5] little[end if] [dorgr] to make all the right noises, don't I[or]if my[if scalevalue of player < 5] little[end if] [dorgr] could see all the ways they writhe, they'd say they look very silly, wouldn't they[at random]";
	otherwise:
		say "     '[one of]Mmm[or]Yes[or]Ah[at random], [one of]I think my [dorgr] likes that, don't they[or]that's just the opening act, my [dorgr], think they can last the whole way[or]I'm sure that'll prepare my [dorgr] enough for what is to follow, wont it[at random]";
	say "?' Not [if dorroleint is 0]granted[otherwise]given[end if] the opportunity to reply, you're instead made to groan[if dorroleint is 0] needily[end if] as you feel tip of [ghis] flared[if dorballmod > 0], perpetually oozing[end if] dick against your already-stretched hole";
	if scalevalue of player > 3:
		say ". No doubt certain that your large, [bodydesc of player] form will abide [ghim] with little difficulty, [ghe] -- with a firm grunt -- forces the whole of [ghis] cockhead in a single thrust, much to your [if dorroleint is 0]moaning approval[otherwise]groaning regard[end if] for such harsh treatment as [ghe] slowly plunges the remainder in, up to [ghis] knot.";
	otherwise:
		say ". [if dorroleint is 0]Trusting in your ability to take [ghim], [ghe] shows very little restraint in pushing [ghis] cockhead in, forcing strained moans of intense pleasure out of you as it's quickly squeezed through your tight ring[otherwise]Taking great care not to hurt you, [ghe] slowly pushes [ghis] cockhead in, forcing groans in intense pleasure to escape you as it's gradually squeezed through your tight ring[end if]. With some additional effort [ghe]'s able to work on the remainder and is soon enveloped by your flesh, up to [ghis] knot.";
	if scalevalue of player < 4 and dorroleint is 0 and a random chance of 1 in 2 succeeds:
		say "     The [gdragon] briefly subjecting you to the substantial weight of [ghis] impressive frame, your [if cocks of player > 0]blatantly hard, [cock size desc of player] dick[smn] grind[smv] against the ground, staining it with your pre[otherwise]oozing, unattended cunt[sfn] stain[sfv] the ground with your honey[end if]. Not quite satisfied with the angle [ghe]'s subjected [ghis] little toy to, [ghe] grabs a hold of you, keeping you in position as [ghe] shifts onto [ghis] back.";
		say "     '[one of]My [dorgr] is so very small, I wouldn't want to make them too uncomfortable, just yet[or]This way, I get a better view of my [dorgr], as they squirm[or]For such a little [dorgr], they certainly know how to make my dick disappear[at random].' [gche] teases you, much in response to your preceding chain of moans as [ghe] relegates you to a mere sex toy for [ghis] perverse desire, forcibly riding you up and down [ghis] [if dorballmod > 0]sputtering[otherwise]throbbing[end if], draconic length[if scalevalue of player < 3], visibly bulging in order to contain [ghim][end if]. Pleading for [ghis] reciprocation, [ghe] can't help but at least somewhat oblige [ghis] ['][dorgr]['], a talon moving to [if cocks of player > 1]stroke one of your exposed cocks, no doubt rendered hard from the[otherwise if cocks of player is 1]stroke your exposed cock, no doubt rendered hard from the[otherwise if cunts of player > 1]tease one of your dripping, unattended portals, no doubt aching for need following this[otherwise]tease your dripping, unattended portal, no doubt aching for need following this[end if] ordeal.";
		say "     [gche] grows increasingly determined to impale you with [ghis] knot. Your hole [if player is twistcapped]only briefly[otherwise]somewhat[end if] stubborn about it before [ghe] finally makes headway, causing you to slowly cry out in the wake of each subsequent inch before you're finally rewarded the token reprieve of engulfing the whole of [ghis] tool. This development, however, fails to make [ghim] yield for longer than a couple seconds, as you soon find your thighs slapping against the beast's [if dorinternal is true]smooth crotch[otherwise]voluminous sack[end if] at a rapidly increasing pace.";
		if libido of player > 35:
			say "     The powerful dick's assault is more than enough to make you almost immediately cry out, ";
			if cocks of player > 0: 
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against your[if scalevalue of player < 4] immensely[end if] strained prostate, staining the [gdragon]'s thighs and crotch with your [cum load size of player] load";
			otherwise if cunts of player > 0:
				say "puss[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the[if scalevalue of player < 4] immense[end if] intrusion, staining the [gdragon]'s crotch with your sexual fluids";
			say ". Doran would doubtlessly chide you for so easily succumbing if [ghe] wasn't so wrapped up in matters of [ghis] own, approaching climax, forcing you firm against [ghis] crotch one last time before roaring out, gout after overwhelming, continuous gout of cum flooding your bowels, ";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole.";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if].";
		otherwise:
			say "     Soon thereafter, Doran trembling with an unbridled, wanton fury, [ghe] forces you firm against [ghis] crotch a final time before roaring out, gout after overwhelming, continuous gout of cum flooding your bowels,";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if]";
			say ". It's enough to make you cry out in your own climax, ";
			if cocks of player > 0:
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against your[if scalevalue of player < 4] immensely[end if] strained prostate, staining the [gdragon]'s thighs and crotch with your [cum load size of player] load.";
			otherwise if cunts of player > 0:
				say "puss[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the[if scalevalue of player < 4] immense[end if] intrusion, staining the [gdragon]'s crotch with your sexual fluids.";
		say "     Shifting back onto [ghis] feet, [ghe] offers slight care in pulling you free of [ghis] dick, knot audibly popping from your stretched hole before planting you on the ground once more, soon followed by [if dorballmod > 0]an excessive[otherwise]a[end if] flood of the beast's thick, heady ejaculate thereafter. Feeling particularly devious, [ghe] revels in your pitiful state, aiming [ghis] [if dorballmod > 0]perpetually[otherwise]still[end if] cum-oozing dick at your head and upper torso to [if dorballmod > 0]drench[otherwise]sully[end if] them as well.";
	otherwise:
		say "     Subjecting you to the substantial weight of [ghis] impressive frame, [if scalevalue of player < 4]the [gdragon] nonetheless takes considerable care to not crush or suffocate you under [ghim], overwhelming heat of [ghis] rising fervor easily blanketing you[otherwise]the overwhelming heat of the [gdragon]'s rising fervor quickly blanketing you[end if]. You can't help but moan as your [if cocks of player > 1]blatantly hard, [cock size desc of player] dicks grind against the ground, staining it with your pre[otherwise if cocks of player is 1]blatantly hard, [cock size desc of player] dick grinds against the ground, staining it with your pre[otherwise if cunts of player > 1]oozing, unattended cunts stain the ground with your honey[otherwise]oozing, unattended cunt stains the ground with your honey[end if].";
		say "     '[one of]Hnf[or]Mnf[or]Mmf[or]Ah[at random], ";
		if dorroleint is 0:
			say "[one of]my [dorgr] is a tight[if scalevalue of player < 4] little[end if] bitch[or]I think my[if scalevalue of player < 4] little[end if] [dorgr] enjoy being fucked silly[or]I love it when my[if scalevalue of player < 4] little[end if] [dorgr] is under me like this[at random]";
		otherwise:
			say "[one of]my[if scalevalue of player < 4] little[end if] [dorgr] is so tight[or]I'm going to fuck my[if scalevalue of player < 4] little[end if] [dorgr] silly[or]I love it when my[if scalevalue of player < 4] little[end if] [dorgr] lets me do this[at random]";
		say "!' [gchis] remark strained against [ghis] increasing fervor, each powerful thrust sending a tremor through your[if scalevalue of player < 4] diminutive,[end if] [bodytype of player] body. [gche] grows increasingly determined to impale you with [ghis] knot. Your hole [if player is twistcapped or scalevalue of player > 3]only briefly[otherwise]somewhat[end if] stubborn about it before [ghe] finally makes headway, causing you to slowly cry out the wake of each subsequent inch before you're finally rewarded the token reprieve of engulfing the whole of [ghis] tool. This development, however, fails to make [ghim] yield for longer than a couple seconds, as you quickly feel [ghis] [if dorinternal is true]smooth crotch[otherwise if dorballmod > 0]massive sack[otherwise]voluminous sack[end if] slap against your [if cock width of player > 0 and cockname of player is not listed in infections of internallist and dorinternal is false]own[otherwise if scalevalue of player < 4 and dorinternal is false]thighs[otherwise]crotch[end if] in rapid succession.";
		if libido of player > 35:
			say "     The powerful dick's assault is more than enough to make you almost immediately cry out, ";
			if cocks of player > 0: 
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against your[if scalevalue of player < 4] immensely[end if] strained prostate, staining you and the ground with your [cum load size of player] load";
			otherwise if cunts of player > 0:
				say "puss[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the[if scalevalue of player < 4] immense[end if] intrusion, staining you and the ground your sexual fluids";
			say ". Doran would doubtlessly [if dorroleint is 0]chide you for so easily succumbing[otherwise]remark on how easily you succumbed[end if] if [ghe] wasn't so wrapped up in matters of [ghis] own, approaching climax, forcing [ghis] crotch firm against you a final time before roaring out, gout after overwhelming, continuous gout of cum flooding your bowels, ";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole.";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if].";
		otherwise:
			say "     Soon thereafter, Doran trembling with an unbridled, wanton fury, [ghe] forces [ghis] crotch firm against you one last time before roaring out, gout after overwhelming, continuous gout of cum flooding your bowels, ";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if]";
			say ". It's enough to make you cry out in your own climax, ";
			if cocks of player > 0: 
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against your[if scalevalue of player < 4] immensely[end if] strained prostate, staining you and the ground with your [cum load size of player] load.";
			otherwise if cunts of player > 0:
				say "puss[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the[if scalevalue of player < 4] immense[end if] intrusion, staining you and the ground your sexual fluids.";
		say "     Panting atop you for a moment as [ghe] recovers from the ordeal, [ghe] slowly attends to the matter of pulling you free of [ghis] dick, knot audibly popping from your stretched hole before planting you on the ground once more, soon followed by [if dorballmod > 0]an excessive[otherwise]a[end if] flood of the beast's thick, heady ejaculate thereafter";
		if dorroleint is 0:
			say ". Feeling particularly devious, [ghe] revels in your pitiful state, aiming [ghis] [if dorballmod > 0]perpetually[otherwise]still[end if] cum-oozing dick at your[if scalevalue of player < 4] head and upper[end if] torso to [if dorballmod > 0]drench[otherwise]sully[end if] them as well.";
		otherwise:
			say ".";
	if dorroleint is 0:
		say "     '[one of]Ah[or]Right[or]Well[at random], [one of]then[or]now[or]moving on[at random]...' Clearly [ghis] stamina has recovered a bit, as [ghe] now struts cheerfully around you, [if scalevalue of player < 5]moving[otherwise]climbing[end if] over your head to offer [ghis][if dorballmod > 0] perpetually[end if] oozing, spent dick to your face, '[one of]Get to work, my [dorgr] would make for a poor cum slut if they didn't finish up[or]A good [dorgr] cleans up after their messes[or]My [dorgr] always finishes their job[at random]!' Still exhausted and sore yourself, you slowly oblige the [gdragon]'s indignant, prodding insistence";
		if dorballmod > 0:
			say ", even though [ghe]'s clearly relegating you to an impossible task. Tongue caressing the softened organ, your efforts pained by you already-stuffed state, its made worse by the fact that any effort to clean [ghim] just makes a bigger mess.";
			say "     '[one of]Oh[or]Hm[or]Ah[at random]? [one of]Tsk, I think [dorgr] might be regretting this change[or]Only [dorgr]'s [gdragon] will say when they're done[or][dorgr] reaps what they sow[at random]!' [gche] forces you to continue this vain task cleaning [ghim], guzzling down [ghis] thick, salty fluids until you're on the verge of blacking out before [ghe] finally lets you off.";
		otherwise:
			say ". Tongue caressing the softened organ, your efforts pained by you already-stuffed state, it's difficult to lick [ghim] clean without causing [ghim] to ooze further. After some time you manage to complete your task, though you yourself remain an embarrassing, cum-stained mess.";
	now dorvorpcf is true;
	if dorvorreg is 2 and scalevalue of player < 4:
		say "     '[if dorroleint is 0][one of]Heh[or]Mmm[or]Tsk[at random], [one of]I think it's safe to say that my meal of a [dorgr] is rightly prepared[or]looking at them now, my [dorgr] is such an appetizing little slut[or]I don't think I'm finished with using my little [dorgr] just yet[at random][otherwise][one of]Moving on[or]Very well[or]Alright then[at random], [one of]I hope my [dorgr] is eager for a little trip[or]I'm eager to make a meal of my so very obliging [dorgr][or]I think I can afford a some [']special['] fun with my [dorgr][at random][end if].' Licking [ghis] lips, an implicit illustration of what is to follow, you feel [ghis] tongue upon you once more, briefly tasting [ghis] meal-to-be as [ghe] offers you a moment to catch your breath.";
		dorvore;
	otherwise:
		say "     '[one of]Well done[or]Many thanks[or]My thanks[at random], [if dorroleint is 0][one of]my [dorgr] takes their [gdragon] like a good slut[or]I always enjoy filling my [dorgr] with their [gdragon]'s cum[or]I look forward to using my [dorgr] in the future[at random][otherwise][one of]my [dorgr] treats their [gdragon] well[or]I always enjoy my [dorgr]'s attention[or]I look forward to having more fun with my [dorgr] in the future[at random][end if].' Following [ghis] adulation [ghe] [if dorroleint is 0]nonetheless appears rather fond of leaving you as a mess, letting you off to clean yourself[otherwise]helps to clean you off, tongue's slick affection shared with you[end if] before resting back at the campfire once more.";
	
to say dordom_2: [Cunt Sex] [BODY MODDED]
	if dorauto is true:
		say "     Suddenly, you feel scaled talons firmly pin you against the ground. The [gdragon] roughly exposing your ass before [ghis] hungering eyes, [ghe]'s clearly desperate to use you.";
		say "     '[one of]Tsk[or]Hmph[or]Well then[at random], [one of]My [dorgr] has been neglected of a proper breeding[or]my [dorgr] clearly needs to be put in their place for their absence[or]I'm more than eager to have my way with my [dorgr][at random], [one of]don't they think[or]wouldn't they agree[at random]?' [gchis] remark carrying the sting of your neglect,";
	otherwise:
		say "     Upon your [if dorroleint is 0]plea[otherwise]request[end if] for sex, the [gdragon] gets up and struts around you in silence, barely regarding [if dorroleint is 0]your offering[otherwise]you[end if] before you're firmly pinned to the ground, immodest talons carefully exposing your ass before [ghis] discerning eyes.";
		say "     '[one of]Ah, yes[or]Hmm[or]Well then[at random], [if dorroleint is 0][one of]I think my [dorgr] is in dire need of good breeding[or]my [dorgr] clearly needs to be put in their place[or]I'm certain my [dorgr]'s eager for me to have my way with them[at random][otherwise][one of]my [dorgr] looks so inviting[or]I'm certain my [dorgr] likes surprises[or][at random]I could stare at my [dorgr]'s ass like this for hours, but that would just be a waste[end if], [one of]don't they think[or]wouldn't they agree[at random]?' [gche] remarks before";
	say " you're made watch on";
	if a random chance of 1 in 2 succeeds:
		say ", creature's head descending upon your rear before you feel [ghis] tongue's wet[if dorroleint is 0], familiar[end if] caress against your exposed cunt[sfn]. [if dorroleint is 0]You beg for [ghim] to to thrust [ghis] slick organ upon your depths, much to [ghis] amusement, teasing you for but a moment longer before [ghe] obliges, causing you to moan as[otherwise]Briefly teasing you, wanton moans escaping your lips, it's not long before[end if] you feel it force its way past [if cunts of player > 1]the supple folds of one[otherwise]your supple folds[end if].";
		say "     Writhing, indignant intrusion encountering [if cunt length of player > 17]little[otherwise if cunt length of player > 11]only slight[otherwise]a fair bit of[end if] resistance in its movement through your depths, each shoving advance of the twitching thing forcing another gasp from your lips. [gche] subjects you to this ritual for a [if dorroleint is 0]considerable[otherwise]fair[end if] amount of time, leaving your hole a slick[if dorroleint is 0] and dripping[end if] mess before [ghe]'s finally satisfied[if dorroleint is 0], so aroused by this abuse that you could climax off of it alone, if not for the [gdragon]'s keen eye tempering restraint[end if].";
	otherwise:
		say ", spare talon brought within [ghis] maw before it's exposed once more, now-slick digit descending upon your behind, offering its[if dorroleint is 0] familiar[end if] caress against your exposed cunt[sfn]. [if dorroleint is 0]You beg for [ghim] to to force [ghis] finger upon your depths, much to [ghis] amusement, teasing you for but a moment longer before [ghe] obliges, causing you to moan as[otherwise]Briefly teasing you, wanton moans escaping your breath, it's not long before[end if] you feel it plunge its way past [if cunts of player > 1]the supple folds of one[otherwise]your supple folds[end if].";
		say "     Firm, curving intrusion contending with [if cunt length of player > 17]little[otherwise if cunt length of player > 11]only slight[otherwise]a fair bit of[end if] resistance in its movement through your depths, each shoving advance of the thing forcing another gasp from your lips. [gche] subjects you to this ritual for a [if dorroleint is 0]considerable[otherwise]fair[end if] amount of time, leaving your hole a slick and[if dorroleint is 0] significantly[end if] loosened up mess before [ghe]'s finally satisfied[if dorroleint is 0], so aroused by this abuse that you could climax off of it alone, if not for the [gdragon]'s keen eye tempering restraint[end if].";
	if dorroleint is 0:
		say "     '[one of]Tsk[or]Oh[or]Hm[or]Ha[or]Heh[at random], [one of]my [dorgr] is quite desperate for their [gdragon]'s cock, aren't they[or]my [dorgr] is desperate to be bred, aren't they[or]Oh, if my [dorgr] could see all the ways they writhe, they'd say they look very silly, wouldn't they[at random]";
	otherwise:
		say "     '[one of]Mmm[or]Yes[or]Ah[at random], [one of]I think my [dorgr] likes that, don't they[or]That's just the opening act, my [dorgr], think they can last the whole way[or]I'm sure that will prepare my [dorgr] enough for what is to follow, wont it[at random]";
	say "?' Not [if dorroleint is 0]granted[otherwise]given[end if] the opportunity to reply, you're instead made to groan[if dorroleint is 0] needily[end if] as you feel tip of [ghis] flared[if dorballmod > 0], perpetually oozing[end if] dick against your already-stretched portal";
	if cunt length of player > 17:
		say ". No doubt certain that your sufficiently well-endowed to abide [ghim] with little difficulty, [ghe] -- with a firm grunt -- forces the whole of [ghis] cockhead in a single thrust, much to your [if dorroleint is 0]moaning approval[otherwise]groaning regard[end if] for such harsh treatment as [ghe] slowly plunges the remainder in, up to [ghis] knot.";
	otherwise:
		say ". [if dorroleint is 0]Trusting in your ability to take [ghim], [ghe] shows very little restraint in pushing [ghis] cockhead in, forcing tainted moans of intense pleasure out of you as it's squeezed through[otherwise]Taking great care not to hurt you, [ghe] slowly forces [ghis] cockhead in, forcing groans in intense pleasure to escape you as it's gradually squeezed through[end if] your tight entrance. With some additional effort [ghe]'s able to work on the remainder and is soon enveloped by your flesh, up to [ghis] knot.";
	if scalevalue of player < 4 and dorroleint is 0 and a random chance of 1 in 2 succeeds:
		say "     The [gdragon] briefly subjecting you to the substantial weight of [ghis] impressive frame, you[if cocks of player > 0]r blatantly hard, [cock size desc of player] dick[smn] grind against the ground, staining it with your pre[otherwise if cunts of player > 1]r oozing, unattended cunt[sfn] stain the ground with your honey[otherwise] must endure the feel of [ghis] coarse scales as they grind against you[end if]. Not quite satisfied with the angle [ghe]'s subjected [ghis] little toy to, [ghe] grabs a hold of you, keeping you in position as [ghe] shifts onto [ghis] side.";
		say "     '[one of]I'm certain my [dorgr] would prefer to be violated in the open air[or]Oh, my [dorgr] is exceptional at being used[or]I'm always afraid I'm going to lose my [dorgr] under there[at random].' [gche] teases you, much in response to your preceding chain of moans as [ghe] relegates you to a mere sex toy for [ghis] perverse desire, forcibly riding you across the length of [ghis] [if dorballmod > 0]sputtering[otherwise]throbbing[end if], draconic organ[if scalevalue of player < 3], visibly bulging in order to contain [ghim][end if]. Writhing against the [gdragon]'s scaled thigh as [ghe] grinds you across it, ";
		if cocks of player > 0 or cunts of player > 1:
			say "[ghe] can't help but further subject ['][dorgr]['] to this wanton affection, one of [ghis] talons moving to[if cocks of player > 1]stroke one of your exposed cocks, no doubt rendered hard from the[otherwise if cocks of player is 1]stroke your exposed cock, no doubt rendered hard from the[otherwise if cunts of player > 2]tease one of your dripping, unattended portals, no doubt aching for need following this[otherwise]tease your dripping, unattended portal, no doubt aching for need following this[end if] ordeal.";
		otherwise:
			say "[ghe] lowers [ghis] head down to meet you with [ghis] tongue's slick affection, heated breath washing over you, no doubt made increasingly shallow by [ghis] rising fervor.";
		say "     [gche] grows increasingly determined to impale you with [ghis] knot. Your hole [if cunt length of player > 13]only briefly[otherwise]somewhat[end if] stubborn about it before [ghe] finally makes headway, causing you to slowly cry out the wake of each subsequent inch before you're finally rewarded the token reprieve of engulfing the whole of [ghis] tool. This development, however, fails to make [ghim] yield for longer than a couple seconds, as you quickly find your thighs slapping against the beast's [if dorinternal is true]smooth crotch[otherwise]voluminous sack[end if] at a rapidly increasing pace.";
		if libido of player > 35:
			say "     The powerful dick's assault is more than enough to make you almost immediately cry out, ";
			if cocks of player > 0:
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against the [if cunt length of player > 13]somewhat[otherwise]immensely[end if] straining intrusion, staining the [gdragon]'s thigh and the ground with your [cum load size of player] load";
			otherwise:
				say "pussy[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the[if cunt length of player < 14] immense[end if] intrusion, staining the [gdragon]'s thigh and the ground with your sexual fluids";
			say ". Doran would doubtlessly chide you for so easily succumbing if [ghe] wasn't so wrapped up in matters of [ghis] own, approaching climax, forcing you firm against [ghis] crotch one last time time before roaring out, gout after overwhelming, continuous gout flooding your womb, ";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole.";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if].";
		otherwise:
			say "     Soon thereafter, Doran trembling with an unbridled, wanton fury, [ghe] forces you firm against [ghis] crotch one last time before immediately roaring out, gout after overwhelming, continuous gout of cum flooding your womb, ";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if]";
			say ". It's enough to make you cry out in your own climax, ";
			if cocks of player > 0: 
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against the [if cunt length of player > 13]somewhat[otherwise]immensely[end if] straining intrusion, staining the [gdragon]'s thigh and the ground with your [cum load size of player] load.";
			otherwise:
				say "pussy[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the[if cunt length of player < 14] immense[end if] intrusion, staining the [gdragon]'s thigh and the ground with your sexual fluids.";
		say "     Shifting back onto [ghis] feet, [ghe] offers slight care in pulling you free of [ghis] dick, knot audibly popping from your stretched hole before planting you on the ground once more, soon followed by [if dorballmod > 0]an excessive[otherwise]a[end if] flood of the beast's thick, heady ejaculate thereafter. Feeling particularly devious, [ghe] revels in your pitiful state, aiming [ghis] [if dorballmod > 0]perpetually[otherwise]still[end if] cum-oozing dick at your head and upper torso to [if dorballmod > 0]drench[otherwise]sully[end if] them as well.";
	otherwise:
		say "     Subjecting you to the substantial weight of [ghis] impressive frame, [if scalevalue of player < 4]the [gdragon] nonetheless takes considerable care to not crush or suffocate you under [ghim], overwhelming heat of [ghis] rising fervor easily blanketing you[otherwise]the overwhelming heat of the [gdragon]'s rising fervor quickly blanketing you[end if]. You can't help but moan as you[if cocks of player > 0]r blatantly hard, [cock size desc of player] dick[smn] grind[smv] against the ground, staining it with your pre[otherwise if cunts of player > 2]r oozing, unattended cunts stain the ground with your honey[otherwise if cunts of player > 1]r oozing, unattended cunt stains the ground with your honey[otherwise] feel the [gdragon] reaching down to offer [ghis] tongue's slick affection, heated breath washing over you with every excited pant[end if].";
		say "     '[one of]Hnf[or]Mnf[or]Mmf[or]Ah[at random],";
		if dorroleint is 0:
			say "[one of]I'm going to enjoy ruining my [dorgr][or]my [dorgr] will be walking funny after this[at random]";
		otherwise:
			say "[one of]my [dorgr] might walk funny for a little while after this[or]I'm going to fuck my [dorgr] silly[at random]";
		say "!' [gchis] remark strained against [ghis] increasing fervour, each powerful thrust sending a tremor through your[if scalevalue of player < 4] diminutive,[end if] [bodytype of player] body. [gche] grows increasingly determined to impale you with [ghis] knot. Your hole [if cunt length of player > 13]only briefly[otherwise]somewhat[end if] stubborn about it before [ghe] finally makes headway, causing you to slowly cry out in the wake of each subsequent inch before you're finally rewarded the token reprieve of engulfing the whole of [ghis] tool. This development, however, fails to make [ghim] yield for longer than a couple seconds, as you quickly feel [ghis] [if dorinternal is true]smooth crotch[otherwise if dorballmod > 0]massive sack[otherwise]voluminous sack[end if] slap against your [if cock width of player > 0 and cockname of player is not listed in infections of internallist and dorinternal is false]own[otherwise if scalevalue of player < 4]thighs[otherwise]crotch[end if] in rapid succession.";
		if libido of player > 35:
			say "     The powerful dick's assault is more than enough to make you almost immediately cry out, ";
			if cocks of player > 0:
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against the [if cunt length of player > 13]somewhat[otherwise]immensely[end if] straining intrusion, staining the ground with your seed [cum load size of player] load";
			otherwise:
				say "puss[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the immense intrusion, staining you and the ground your sexual fluids";
			say ". Doran would doubtlessly [if dorroleint is 0]chide you for so easily succumbing[otherwise]remark on how easily you succumbed[end if] if [ghe] wasn't so wrapped up in matters of [ghis] own, approaching climax, forcing [ghis] crotch firm against you a final time before roaring out, gout after overwhelming, continuous gout of cum flooding your womb, ";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole.";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if].";		
		otherwise:
			say "     Soon thereafter, Doran trembling with an unbridled, wanton fury, [ghe] forces [ghis] crotch firm against you one last time before roaring out, gout after overwhelming, continuous gout of cum flooding your womb, ";
			if dorballmod > 0:
				say "belly [if scalevalue of player < 4]immediately and distinctly[otherwise]quickly[end if] bloating to abide [ghis] massive, torrential load, until the -- almost seemingly absurd -- release starts to sputter from your [if scalevalue of player < 4]over[end if]stuffed hole";
			otherwise:
				say "[if scalevalue of player < 3]belly visibly bloating to abide [ghis] load[otherwise]quickly leaking from your stuffed hole when you can't contain any more[end if]";
			say ". It's enough to make you cry out in your own climax, ";
			if cocks of player > 0:
				say "cock[if cocks of player > 1]s'[otherwise]'s[end if] sputtering forcibly erratic against the [if cunt length of player > 13]somewhat[otherwise]immensely[end if] straining intrusion, staining the ground with your seed [cum load size of player] load";
			otherwise:
				say "puss[if cunts of player > 1]ies'[otherwise]y's[end if] gushing forcibly strained against the immense intrusion, staining you and the ground your sexual fluids";
		say "     Panting atop you for a moment as [ghe] recovers from the ordeal, [ghe] slowly attends to the matter of pulling you free of [ghis] dick, knot audibly popping from your stretched hole before planting you on the ground once more, soon followed by [if dorballmod > 0]an excessive[otherwise]a[end if] flood of the beast's thick, heady ejaculate thereafter";
		if dorroleint is 0:
			say ". Feeling particularly devious, [ghe] revels in your pitiful state, aiming [ghis] [if dorballmod > 0]perpetually[otherwise]still[end if] cum-oozing dick at your[if scalevalue of player < 4] head and upper[end if] torso to [if dorballmod > 0]drench[otherwise]sully[end if] them as well.";
		otherwise:
			say ".";
	if dorroleint is 0:
		say "     '[one of]Ah[or]Right[or]Well[at random], [one of]then[or]now[or]moving on[at random]...' Clearly [ghis] stamina has recovered a bit, as [ghe] now struts cheerfully around you, [if scalevalue of player < 5]moving[otherwise]climbing[end if] over your head to offer [ghis][if dorballmod > 0] perpetually[end if] oozing, spent dick to your face, '[one of]Get to work, my [dorgr] would make for a poor cum slut if they didn't finish up[or]A good [dorgr] cleans up after their messes[or]My [dorgr] always finishes their job[at random]!' Still exhausted and sore yourself, you slowly oblige the [gdragon]'s indignant, prodding insistence";
		if dorballmod > 0:
			say ", even though [ghe] is clearly relegating you to an impossible task. Tongue caressing the softened organ, your efforts pained by you already-stuffed state, its made worse by the fact that any effort to clean [ghim] just makes a bigger mess.";
			say "     '[one of]Oh[or]Hm[or]Ah[at random]? [one of]Tsk, I think [dorgr] might be regretting this change[or]Only [dorgr]'s [gdragon] will say when they're done[or][dorgr] reaps what they sow[at random]!' [gche] forces you to continue this vain task cleaning [ghim], guzzling down [ghis] thick, salty fluids until you're on the verge of blacking out before [ghe] finally lets you off.";
		otherwise:
			say ". Tongue caressing the softened organ, your efforts pained by you already-stuffed state, it's difficult to lick [ghim] clean without causing [ghim] to ooze further. After some time you manage to complete your task, though you yourself remain an embarrassing, cum-stained mess.";
	now dorvorpcf is true;
	if dorvorreg is 2 and scalevalue of player < 4:
		say "     '[if dorroleint is 0][one of]Heh[or]Mmm[or]Tsk[at random], [one of]I think it's safe to say that my meal of a [dorgr] is rightly prepared[or]looking at them now, my [dorgr] is such an appetizing little slut[or]I don't think I'm finished with using my little [dorgr] just yet[at random][otherwise][one of]Moving on[or]Very well[or]Alright then[at random], [one of]I hope my [dorgr] is eager for a little trip[or]I'm eager to make a meal of my so very obliging [dorgr][or]I think I can afford a some [']special['] fun with my [dorgr][at random][end if].' Licking [ghis] lips, an implicit illustration of what is to follow, you feel [ghis] tongue upon you once more, briefly tasting [ghis] meal-to-be as [ghe] offers you a moment to catch your breath.";
		dorvore;
	otherwise:
		say "     '[one of]Well done[or]Many thanks[or]My thanks[at random], [if dorroleint is 0][one of]my [dorgr] takes their [gdragon] like a good slut[or]I always enjoy filling my [dorgr] with their [gdragon]'s cum[or]I look forward to using my [dorgr] in the future[at random][otherwise][one of]my [dorgr] treats their [gdragon] well[or]I always enjoy my [dorgr]'s attention[or]I look forward to having more fun with my [dorgr] in the future[at random][end if].' Following [ghis] adulation [ghe] [if dorroleint is 0]nonetheless appears rather fond of leaving you as a mess, letting you off to clean yourself[otherwise]helps to clean you off, tongue's slick affection shared with you[end if] before resting back at the campfire once more.";

to say dordom_3: [Oral Sex] [BODY MODDED]
	if dorauto is true:
		say "     You, rather abruptly, find yourself pulled next to the[if daytimer is day] smoldering[end if] campfire by Doran, a wanton look about [ghim] as [ghe] forces you into giving [ghim] your undivided attention, poised silhouette partially outlined against the [if daytimer is day]creeping daylight[otherwise]fire[end if].";
		say "     '[one of]My [dorgr]'s is due for sucking off their [gdragon][or]Too long has my dick been neglected of my [dorgr]'s attention[or]My [dorgr] clearly needs the taste of their [gdragon][at random].' With [ghis] command appointed, [if scalevalue of player > 3]your head is forced to descend[otherwise]you're forced to descend[end if]";
	otherwise:
		say "     [if dorroleint is 0]Pleading with[otherwise]Gesturing to[end if] Doran for sex, [ghe] briefly ponders what [ghe] might subject you to, scratching [ghis] chin as [ghe] lays there next to the[if daytimer is day] smoldering[end if] campfire before finally coming to [ghis] decision. [gche] stands upright, rigid, poised silhouette partially outlined against the [if daytimer is day]creeping daylight[otherwise]fire[end if].";
		say "     '[if dorroleint is 0][one of]I think my [dorgr]'s best suited for sucking off their [gdragon][or]My dick's eager for my [dorgr]'s attention[or]I know my [dorgr] longs for a taste of their [gdragon][at random][otherwise][one of]I think it's only fair that my [dorgr] offers me some oral satisfaction[or]I want my [dorgr] to grant their [gdragon]'s dick some much-needed attention[or]I long for the touch of my [dorgr]'s lips[at random][end if]";
		say ".' With [ghis] [if dorroleint is 0]command appointed[otherwise]request made[end if] you approach [ghim], [if scalevalue of player > 3]head [end if][if dorroleint is 0]eagerly [end if]descending";
	say " upon the [gdragon]'s muscular, scaled undercarriage. Well-toned frame heaving with each excited breath, you're given ample view of the beast's[if dorrolereg is 0] enticing[end if] cock[if dorballmod > 0 and dorinternal is false] and oversized balls[end if], already peeking from it's [if dorinternal is true]slit[otherwise]sheath[end if] with barely containable anticipation[if dorballmod > 0], dripping as it's perpetually want to do[end if]. [if dorrolereg is 0]Immediately[otherwise]Soon enough[end if] your lips descend upon its exposed tip, tongue's affection inviting its growth within their embrace, much to [ghis] moaning approval.";
	say "     '[one of]Mmm[or]Ah[or]Yes[at random], [if dorroleint is 0][one of]my [dorgr] is such a good little slut[or]my [dorgr] can't resist the sight of dick[or]I don't think anybody would make a better pet than my [dorgr][at random][otherwise][one of]my [dorgr]'s tongue feels so nice[or]I wish only for more, my [dorgr][or]please don't stop, my [dorgr][at random][end if].' Compelled to work harder, your [if scalevalue of player > 3]tongue shifts to attend[otherwise]digits rise to caress[end if] [ghis] [if dorinternal is true]organ's ill-fitting home[otherwise if dorballmod > 0]greatly oversized, scaled ballsack[otherwise]ponderous, scaled ballsack[end if], further inviting [ghis] dick's countenance, until it hangs fully exposed before you";
	if scalevalue of player > 3:
		say ". [if dorroleint is 0]Entranced by the tool, you're inclined to immediately plunge it down your maw, rapidly[otherwise]Lips slowly enveloping the head, you descend upon its length, gradually building a motion until you're eagerly[end if] bobbing against";
	otherwise:
		say ". [if scalevalue of player < 3]Yourself much too small to easily fit that big thing into your mouth, you ultimately relegate yourself to letting your hands and tongue do all the hard work, pumping[otherwise]Lips enveloping the head, it can barely fit within your hold, relegating most of your work to your hands as they pump[end if]";
	say " the member with a wild fervour. Your senses are flooded with the taste and smell of the [gdragon]'s thick and salty sexual fluids as [if dorballmod > 0]you're forced to gulp down the stuff[otherwise]they drool[end if] from [ghis] organ[if dorroleint is 0], more than enough incentive to fuel your hunger further[end if].";
	say "     You [if scalevalue of player > 3]can feel [ghis] heaving body against you[otherwise]watch [ghis] heaving body[end if] as the [gdragon]'s breath becomes increasingly shallow, all the while your own, rising lust made very much apparent, [if cocks of player > 0][cock size desc of player] cock[smn] driven erect, aching[otherwise if cunts of player > 0]cunt[sfn] aching[end if] for attention";
	if scalevalue of player > 3:
		if dorroleint is 0:
			say ". Detecting your need, the [gdragon] exploits this opportunity to return the favour, head moving to offer [ghis] own tongue's affection in turn, slick appendage caressing [if cocks of player > 1]one of them[otherwise if cocks of player > 0]it[otherwise if cunts of player > 1]them[otherwise]it[end if]; however, [ghis] endeavours are somewhat reserved, more intended to tease you than anything else.";
		otherwise:
			say ". Detecting your need, the [gdragon] exploits this opportunity to return the favour, head moving to offer [ghis] own tongue's affection in turn, scaled [if cocks of player > 1]maw enveloping one of them[otherwise if cocks of player > 0]maw enveloping it[otherwise if cunts of player > 1]lips embracing one of them[otherwise]lips embracing it[end if].";
		say "     'M-[dorgr]...!' Doran[if dorroleint is not 0]'s remark muffled against your flesh as you[otherwise]mutters under [ghis] breath before your affections[end if] are richly rewarded, the creature suddenly going rigid as your maw's flooded with surge after successive, [if dorballmod > 0]torrential[otherwise]voluminous[end if] surge of the beast's carnal batter. [if dorroleint is 0 and dorballmod > 0]Quickly overwhelmed by the sheer volume, the [gdragon]'s persistent teasing is eventually enough[otherwise if dorroleint is 0]Driven by your overwhelming need to consume as much as you can, the [gdragon]'s persistent teasing is eventually enough[otherwise if dorballmod > 0]Quickly overwhelmed by the sheer volume, the [gdragon]'s reciprocation is more than enough[otherwise]The [gdragon]'s reciprocation is more than enough[end if] to drive you to bliss, [if dorroleint is 0]your own sexual fluids left as a puddle on the floor[otherwise]eagerly consuming your own flood of sexual fluids[end if].";
	otherwise:
		if dorroleint is 0:
			say "; however, the [gdragon] is intent on ensuring you remain painfully unattended, forced to focus entirely on sucking [ghim] off at the expense of your own, overwhelming need.";
		otherwise: 
			say ". Succumbing to your own, overwhelming need you relinquish one of your hands to desperately [if cocks of player > 0]jerk yourself off[otherwise]fondle yourself[end if], attention now split between your own need and continuing to pump the [gdragon]'s tool.";
		say "     'M-[dorgr]...!' Doran mutters under [ghis] breath before your affections are richly rewarded, the creature suddenly going rigid as you're painted with surge after successive, [if dorballmod > 0]torrential[otherwise]voluminous[end if] surge of the beast's carnal batter";
		if dorballmod > 0:
			say ". [if dorroleint is 0]Driven by your voracious need to consume as much as you can, you are made dizzy by the overwhelming amount of seed [ghe] offers you, quickly outpacing your ability, sputtering out of your mouth and down your [bodytype of player] frame[otherwise]This particularly lewd circumstance more than enough to drive you to bliss, though the excessive amount of seed [ghe] offers quickly overwhelms you, sputtering out of your mouth and down your [bodydesc of player] frame, mixing with your own sexual fluids[end if].";
		otherwise:
			say ". [if dorroleint is 0]Driven by your voracious need to consume as much as you can, you are made dizzy by the overwhelming amount of seed [ghe] offers you, quickly outpacing your ability, sputtering out of your mouth and down your [bodytype of player] frame[otherwise]This particularly lewd circumstance more than enough to drive you to bliss, though the excessive amount of seed [ghe] offers quickly overwhelms you, sputtering out of your mouth and down your [bodydesc of player] frame, mixing with your own sexual fluids[end if].";
	now dorvorpcf is true;
	if dorroleint is 0:
		say "     [if scalevalue of player > 3]It takes awhile for both of you to recover. You pull free of the softening tool, but the [gdragon] isn't done with you yet, prodding it[otherwise]Taking awhile for both of you to recover, the [gdragon] isn't done with you yet, prodding the softened tool[end if] against your face with a rather bold lack of reverence.";
		say "     '[one of]Oh[or]Hm[or]Now then[at random], my [dorgr], [one of]it'd be improper to not clean up after your mess[or]a good toy finishes the job[or]your [gdragon] won't let you go until you lick [ghim] clean[at random].' Still dazed by the prior experience, you need a second before your wanton submission compels you to oblige, tongue caressing along the length of the sated, [if dorballmod > 0]forever-[end if]dripping dick";
		if scalevalue of player > 3:
			if dorballmod > 0:
				say ". It quickly becomes apparent, however, that there's just too much to deal with, the cheeky little lizard just oozes more any time you clean part of [ghim] off, following up with condescending taunts for your slowness. So intent you become that you don't realize it when [ghe]'s gone hard a second time, your attempts at fastidiousness only driving [ghim] to another orgasm! Just as much a mess as the last, you're absolutely exhausted by this point; you can't do any more.";
				say "     '[one of]Tsk[or]Hmph[at random], [one of]my [dorgr] is such a pitiful slut that can't even clean their messes[or]I feel like I have to teach my [dorgr] how to properly clean a dick[or]I may need to think of a way to punish my [dorgr][at random]...' Chastise you though [ghe] may, it's very clear [ghe] got a lot out of your floundering, and does thankfully let you off, granting you the opportunity to clean yourself off and recover from the ordeal proper.";
			otherwise:
				say ". Thankfully, it doesn't take long polish the cheeky little lizard's pole, and it's soon positively spotless.";
				say "     '[one of]Ah[or]Yes[or]Excellent[at random], [one of]my [dorgr] makes such a good cum slut[or]my [dorgr] is so obedient[or]I don't think I'd ever be as good at sucking cock as my [dorgr][at random]!' Clearly satisfied, [ghe] returns to the campfire, allowing you a moment to clear your head before going off.";
		otherwise if (scalevalue of player < 3 and a random chance of 1 in 2 succeeds) or dorballmod > 0:
			say ". It quickly becomes apparent, however, that there's just too much to deal with, the cheeky lizard just oozes more any time you clean part of [ghim] off, following up with condescending taunts for your slowness. So intent you become that you don't realize it when [ghe]'s gone hard a second time, your attempts at fastidiousness only driving [ghim] to another orgasm! [if dorballmod > 0]Just as much a mess as the last,[otherwise]It might not be as much as the last, and you're sure [ghe]'s right spent now, but[end if] you're absolutely exhausted by this point; you can't do any more.";	
			if dorvorreg is 2 and scalevalue of player < 4:
				now dorvornpa is true;
				say "     '[one of]Tsk[or]Hmph[at random], [one of]It seems I'll have to punish my [dorgr][or]my [dorgr] will just have to satisfy their [gdragon] another way[or]My tiny, pitiful [dorgr] will just have to suffice as a meal for their [gdragon], then[at random]...' Chastising you, you're forced to the ground by [ghis] snout. Nipping and licking your cum-stained self firmly, Doran briefly teases you prior to [ghis] imminent punishment.";
				dorvore;
			otherwise:
				say "     '[one of]Tsk[or]Hmph[at random], [one of]my [dorgr] is such a pitiful, tiny slut that can't even clean their messes[or]I feel like I have to teach my [dorgr] how to properly clean a dick[or]I may need to think of a way to punish my [dorgr][at random]...' Chastise you though [ghe] may, it's very clear [ghe] got a lot out of your floundering, and does thankfully let you off, granting you the opportunity to clean yourself off and recover from the ordeal proper.";			
		otherwise:
			say ". It takes a fair while to properly clean [ghim], however, the cheeky little lizard occasionally oozing more from your continued affections, frequently setting you back before you finally finish, dick positively spotless... Though the same can't be said for you.";
			if dorvorreg is 2 and scalevalue of player < 4:
				say "     '[one of]Hmph[or]No[or]Tsk[at random], [one of]my [dorgr] is still too slow a little slut[or]obedient though they may be, my [dorgr] has yet to fully satisfy their [gdragon][or]I think my [dorgr] would be a poor little slut if they didn't feed their [gdragon] after pleasing them[at random]!' Doran moves around to force you firmly to the ground with [ghis] snout, tongue briefly tasting your cum-stained self as [ghe] prepares to satisfy [ghim]self another way.";
				dorvore;
			otherwise:
				say "     '[one of]Hm[or]Yes[or]Excellent[at random], [one of]my [dorgr] is a proper little slut[or]my [dorgr] is so obedient[or]I don't think I'd ever be as good at sucking cock as my [dorgr][at random]!' Clearly satisfied, [ghe] returns to the campfire, allowing you to clean yourself off and recover from the whole ordeal.";
	otherwise:
		say "     [if scalevalue of player > 3]Taking a moment for both of you to recover from the ordeal, the [gdragon] takes [ghis] time cleaning you of the mess you've made whilst attending to [ghim][otherwise]Taking a moment for both of you to recover from the ordeal, the [gdragon] eventually moves out from over you, quickly meeting you again with [ghis] tongue's affection, cleaning you of the mess you've made until you're slick only with that of the [gdragon]'s saliva[end if].";
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Ah[or]Yes[or]Mm[at random], [one of]my [dorgr] treats their [gdragon] well[or]I don't think a [gdragon] could be happier with any other [dorgr][or]my [dorgr] certainly knows how make a mess of things[at random]!' [gchis] regard jovial in the wake of your completed task, [ghe] however pushes you back down with [ghis] snout when you attempt to pull away. '[one of]Oh[or]Not so fast[or]Now, now[at random], [one of]isn't my [dorgr] forgetting something[or]my [dorgr] wouldn't leave their [gdragon] hungry, now would they[or]has my [dorgr] forgotten our arrangement[at random]?' Tongue caressing your cum-stained form, [ghe] affectionately prepares [ghis] meal-to-be.";
			dorvore;
		otherwise:
			say "     '[one of]Ah[or]Yes[or]Mm[at random], [one of]my [dorgr] treats their [gdragon] well[or]I don't think a [gdragon] could be happier with any other [dorgr][or]my [dorgr] certainly knows how make a mess of things[at random]!' [gchis] regard jovial in in the wake of your completed task, [ghe] sets back down next to the campfire, allowing you to recover and go about your business.";

to say dordom_4: [Cock-Focused Handjob] [BODY MODDED]
	if dorauto is true:
		say "     You're given little chance to react before Doran pounces you, your[if scalevalue of player < 4] smaller,[end if] [bodytype of player] form grabbed and dragged to [ghis] place of rest before [ghis] shameless talons expose you before [ghim]self.";
		say "     '[one of]Tsk[or]Hmpf[at random], [one of]I've been wanting to play with my [dorgr] for too long now[or]my [dorgr] has left me alone for too long without my toy[or]I was beginning to think my [dorgr] forgot they were their [gdragon]'s plaything[at random]!' No doubt agitated by your absence";
	otherwise:
		say "     Perceptive as Doran is, you're barely given the time to [if dorroleint is 0]offer yourself[otherwise]ask for sex[end if] before [ghe]'s on you, your[if scalevalue of player < 4] smaller,[end if] [bodytype of player] form grabbed and [if dorroleint is 0]pulled[otherwise]guided[end if] to [ghis] place of rest before [ghis] shameless talons expose yourself before [ghim].";
		if dorroleint is 0:
			say "     '[one of]Oh[or]Ah[or]Yes[at random], [one of]I've been wanting to play with my [dorgr][or]my [dorgr] makes quite the entertaining toy[or]I'm beginning to think my [dorgr] is rather fond of being their [gdragon]'s plaything[at random]!' Teasing you";
		otherwise:
			say "     '[one of]Mm[or]Hm[or]I see[at random], [one of]it's clear my [dorgr] is a quite pent up[or]my [dorgr] doubtlessly needs their [gdragon]'s affection[or]my [dorgr] need but only relax[at random]...' Soft remarking";
	say " for but a moment, the [gdragon]'s talons [if dorroleint is 0]firmly[otherwise]gently[end if] wrap around [if cocks of player > 1]one of your [cock size desc of player] cocks[otherwise]your [cock size desc of player] cock[end if], second talon holding you in place as [ghe] [if dorroleint is 0]roughly[otherwise]carefully[end if] caresses your exposed length, driving you hard before the beast's intent gaze.";
	say "     Satisfied with your offering, [ghis] scaled snout descends upon you, thick tongue's light, teasing caress enough to make the attended organ ooze pre, your[if cockname of player is listed in infections of knotlist] knotted[end if] tool[if cockname of player is not listed in infections of internallist] and [ball size][end if] quickly made slick with a mix of saliva and sexual fluids.";
	if dorroleint is 0:
		say "     'My[if scalevalue of player < 3] little[end if] [dorgr] [one of]is so very needy[or]squirms so amusingly under their [gdragon][or]can't resist their [gdragon]'s touch[at random]...' Tongue's";
	otherwise:
		say "     '[one of]I think my [dorgr] likes that[or]Mayhaps we kick this into high gear[or]One could say that my [dorgr]'s fun is just starting[at random], yes?' Tongue's";
	say " affection rising to slide against your[if scalevalue of player < 4] diminutive,[end if] [bodytype of player] torso[if breast size of player > 0] and along the curvature of your [short breast size desc of player] breasts[end if], ";
	let titfuck be 0;
	if dortitmod > 0 and a random chance of 4 in 5 succeeds:
		now titfuck is 1;
		say "[ghe] eventually stops to rear up and expose [ghis] ample, scaled breasts before you, [if dorroleint is 0]allowing[otherwise]inviting[end if] your touch as [ghis] other talon moves [if cocks of player > 2]to one of your other members, now attending two of them[otherwise if cocks of player is 2]to your other member, now attending both of them[otherwise if cunts of player > 1]to one of your cunts, briefly teasing its entrance as your member remains attended to in tandem[otherwise if cunts of player is 1]your cunt, briefly teasing its entrance as your member remains attended to in tandem[otherwise if anallevel is not 1]your anal ring, briefly teasing its entrance as your member remains attended to in tandem[otherwise]to offer its reassuring caress along the length of your legs[end if]. Eventually shifting to embrace [if cocks of player > 2]two of your oozing rods[otherwise if cocks of player is 2]both of your oozing rod[otherwise]your oozing rod[end if] between [ghis] firm but yielding clevage, ";
		if cocks of player > 1:
			say "[ghe] [if cock length of player > 17]frequently comments on how impressive your assets are[otherwise if cock length of player < 6 and dorroleint is 0]often teases you over how inadequate your assets are[otherwise]offering cooing approval of your assets[end if] as [ghe] proceeds to squeeze and pump against them, fuelled by a twisted determination.";
		otherwise if cunts of player > 0:
			say "[ghe] [if cock length of player > 17]frequently praises you for the size of your dick[otherwise]offers cooing approval to your assets[end if] as [ghe] proceeds to squeeze and pump against you, fuelled by a twisted determination.";
		otherwise:
			say "[ghe] [if cock length of player > 17]frequently comments on how impressive your asset is[otherwise if cock length of player < 6 and dorroleint is 0]often teases you over how inadequate your asset is[otherwise]offering cooing approval of your asset[end if] as [ghe] proceeds to squeeze and pump against you, fuelled by a twisted determination.";
	otherwise:
		say "[if dorroleint is 0][ghe] uses [ghis] snout to keep you pinned down[otherwise]slathering you with [ghis] saliva[end if] as [ghis] other talon moves [if cocks of player > 2]to one of your other members, now attending two of them[otherwise if cocks of player is 2]to your other member, now attending both of them[otherwise if cunts of player > 1]to one of your cunts, briefly teasing its entrance as your member remains attended to in tandem[otherwise if cunts of player is 1]your cunt, briefly teasing its entrance as your member remains attended to in tandem[otherwise if anallevel is not 1]your anal ring, briefly teasing its entrance as your member remains attended to in tandem[otherwise]to offer its reassuring caress along the length of your legs[end if]. [gchis] endeavours quickly rise in fervour, ";
		if cocks of player > 1:
			say "[if cock length of player > 17]frequently commenting on how impressive your assets are[otherwise if cock length of player < 6 and dorroleint is 0]often teasing you over how inadequate your assets are[otherwise]offering cooing approval of your assets[end if] as [ghe] proceeds to milk them, fuelled by a twisted determination.";
		otherwise if cunts of player > 0:
			say "[if cock length of player > 17]frequently praising you for the size of your dick[otherwise]offering cooing approval to your assets[end if] as [ghe] proceeds to support [ghis] endeavours by sinking [ghis] digit past the supple folds of your flesh, [if cunt length of player < 7]slight, strained grunts escaping [ghis] lips as [ghe] contends with your tight hole[otherwise]meeting only brief resistance as you envelope the irreverent intrusion[end if]";
		otherwise:
			say "[if cock length of player > 17]frequently commenting on how impressive your asset is[otherwise if cock length of player < 6 and dorroleint is 0]often teasing you over how inadequate your asset is[otherwise]offering cooing approval of your asset[end if] as";
			if anallevel is not 1:
				say "[ghe] proceeds to support [ghis] endeavours by sinking [ghis] digit into the depths of your yielding hole, [if scalevalue of player < 4 and player is not twistcapped]slight, strained grunts escaping [ghis] lips as [ghe] contends with its tightness[otherwise]meeting only brief resistance as you envelope the irreverent intrusion[end if].";
			otherwise:
				say "his grip tightens around your leg, no doubt to keep you from being tossed about in the wake of [ghis] fierce pumping.";
	if dorroleint is 0 and ((dorauto is true and a random chance of 1 in 2 succeeds) or (dorauto is false and a random chance of 1 in 5 succeeds)):
		say "     Just on the cusp of utter bliss, the [gdragon] suddenly relents, a sly grin emerging from [ghis] lips as [ghe] lets the fires of your wanton need die down. Instinctively, you move to pleasure yourself, but [ghis] [if titfuck is 1]large tits deliberately obstruct[otherwise]talons move to pevent[end if] you.";
		say "     '[one of]Tsk[or]Hmpf[at random], [one of]my [dorgr] is so desperate and needy, I think I shall save them for later[or]I enjoy watching my [dorgr] squirm with such desperation[or]my [dorgr]'s struggling amuses me[at random].' Teasing you in the wake of this torment, [ghe] further wounds your pride by [if titfuck is 1]bringing [ghis] breasts closer[otherwise]moving [ghis] talons[end if] to your face, made slick with saliva and precum. '[one of]Look at this mess my [dorgr] made, they better clean it up[or]My [dorgr] is such a messy slut, their [gdragon] won't let them leave until they make that right[at random].' Gradually, you oblige the [gdragon], tongue caressing the curvature of [ghis] scaled[if titfuck > 0 and dortitmod > 1], dripping melons[otherwise if titfuck > 0], heaving melons[otherwise] digits[end if], taste flooded with that of your own sexual fluids. Doubtlessly, this brief, twisted ritual worsens your already overwhelming need.";
		now dorbb is true;
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Very good[or]Well done[at random], my [dorgr]. [one of]I'm done having fun with them, though their [gdragon] still hungers[or]I'm sure they're just as eager to be their [gdragon]'s meal as they are for satisfaction[at random].' Smug look about [ghim], [ghe] teases you further with [ghis] tongue's affection, now very much different in its intent. Still exhausted and unspent, you can't help but writhe needily against [ghis] touch.";
			dorvore;
		otherwise:
			say "     '[one of]Very good[or]Well done[at random], my [dorgr]. [one of]Maybe, if they're good, I'll satisfy them the next time[or]I'm sure they'll be all the more eager for the next time[at random].' [gche] struts back to where [ghe] rested, by the fire, a smug look on [ghis] face. No doubt quite amused by the trick [ghe]'s played, you're forced to move on and contend with your lingering lust.";
	otherwise:
		say "     A grin emerging from [ghis] lips, [ghe] enjoys observing your increasingly desperate need for release, [ghis] endeavours persisting for a while longer before you finally moan out in bliss";
		if dorroleint is 0:
			say ". Deviously, [ghe] hikes up your lower torso, aiming your cock[smn] downwards upon you to douse you and your face and upper torso with your";
		otherwise:
			say ", dousing your torso with your";
		say " [cum load size of player] payload";
		if cocks of player is 1 and (cunts of player > 0 or anallevel is not 1) and titfuck is 0:
			say ", each gout of jizz strained and prolonged by [ghis] intrusive talon's expert milking of your [if cunts of player > 0]stuffed portal[otherwise]beleaguered prostate[end if].";
		otherwise if titfuck is 1:
			say ", along with [ghis] ample breasts.";
		otherwise:
			say ".";
		say "     Slowly pulling [ghis] talons free of you as things die down, you're given some opportunity to survey [if dorroleint is 0]the devastation[otherwise]what[end if] [ghe] has wrought, yourself a worn out and[if cock width of player > 24] massively[end if] cum-stained mess";
		if dorroleint is 0:
			say ". [gche] doesn't quite seem done with you just yet, however, as you're held down a second time, talons moving to caress along your sullied, [bodydesc of player] form before they[if titfuck is 1], along with [ghis] tits,[end if] are brought to your face, slick with your heady sexual fluids.";
			say "     '[if cock width of player > 24][one of]Such a messy [dorgr][or]My [dorgr], look at all this mess[at random][otherwise][one of]Tsk[or]Hmph[at random][end if], [one of]start licking[or]be good and clean this up[or]I won't let them leave until they take care of this[at random]!' Intent on having you attend to this matter, you're forced to lick clean the beast's talons of your own thick, virile cum, tongue caressing along the curvature of [ghis] scaled digits[if titfuck is 1] before moving to [ghis] scaled melons[end if]";
			if cock width of player < 7 or scalevalue of player > 3:
				say ". This ritual persists for only a brief moment before [ghe]'s satisfied, [if scalevalue of player > 3 and cock width of player > 24]your large scale granting you a fair measure of speed in spite your sizeable load[otherwise if scalevalue of player > 3]your large scale granting you a fair bit of speed[otherwise]the mess you've made of yourself not being that big[end if], finally freeing you from [ghis] grip.";
			otherwise if cock width of player < 25:
				say ". This ritual persists for some measure of time, Doran frequently [if titfuck is 1]pressing [ghis] seed-slicked bosom against your face to tease you[otherwise]taking a recently-cleaned talon to sully it again with your spent seed[end if], given the fairly substantive mess you've made, before finally freeing you from [ghis] grip.";
			otherwise:
				say ". So massive the mess you've created, it becomes increasingly clear that this ritual is insufficient in cleaning you in any timely manner. As such, the now-impatient Doran's head descends upon you once again, tongue licking clean the mess you've made before [ghe] forces [ghis] scaled lips against your own. Comparatively smaller frame barely able to handle [ghis] tongue's rough probing, [ghe] forces upon you an dizzying cocktail of [ghis] saliva and your spunk, doing this over and over again until [if titfuck is 1]both of you are[otherwise]you're[end if] finally clean -- and no doubt reeling a little from all the cum you've been rapidly forced to ingest. Now satisfied, [ghe] lets you go.";
		otherwise:
			say ".";
			say "     Giving you a moment to rest, [ghis] maw descends upon you a second time, meeting you with [ghis] thick tongue's caress as [ghe] endeavours to clean [if titfuck is 1]both you and [ghim]self[otherwise]you[end if] up in silence. [if cock width of player > 24]This ritual persists for a fair amount of time, considering the substantial mess you've made[otherwise]His work need only take a moment before [ghe]'s complete[end if], leaving you with only a thin veneer of saliva.";
		if dorvorreg is 2 and scalevalue of player < 4:
			if cock width of player > 20 and dorroleint is 0, now dorvorpcf is true;
			say "     '[one of]Mm[or]Hm[or]Heh[at random], [if dorroleint is 0][one of]I could learn a thing or two from my [dorgr] about being such a good[or][dorgr] certainly knows a thing or two about being an obedient[at random] little [one of]toy[or]plaything[or]slut[at random][otherwise][one of]I enjoy playing with my [dorgr][or]my [dorgr] is such fun[or]my [dorgr] should have seen the look on their face[at random][end if]!' Satisfied though [ghe] may be, [ghis] tongue continues to caress along your smaller, [bodydesc of player] frame, a hungry look in [ghis] eyes. '[one of]Ah[or]Oh[at random] [one of]But we're not done here yet[or]my [dorgr]'s fun is just starting[or]don't think I'll let them off that easy[at random]...'";
			dorvore;
		otherwise:
			say "     '[one of]Mm[or]Hm[or]Heh[at random], [if dorroleint is 0][one of]I could learn a thing or two from my [dorgr] about being such a good[or][dorgr] certainly knows a thing or two about being an obedient[at random] little [one of]toy[or]slut[or]plaything[at random][otherwise][one of]I enjoy playing with my [dorgr][or]my [dorgr] is such fun[or]my [dorgr] should have seen the look on their face[at random][end if]!' Satisfied, [ghe] lets you off before [ghe] struts back to [ghis] place of rest next to the fire, watching you with slight amusement as you get back up and go about your business.";

to say dordom_5: [Cunt-Focused Handjob] [BODY MODDED]
	if dorauto is true:
		say "     You're given little chance to react before Doran pounces you, your[if scalevalue of player < 4] smaller,[end if] [bodytype of player] form grabbed and dragged to [ghis] place of rest before [ghis] shameless talons expose you before [ghim]self.";
		say "     '[one of]Tsk[or]Hmpf[at random], [one of]I've been wanting to play with my [dorgr] for too long now[or]my [dorgr] has left me alone for too long without my toy[or]I was beginning to think my [dorgr] forgot they were their [gdragon]'s plaything[at random]!' No doubt agitated by your absence";
	otherwise:
		say "     Perceptive as Doran is, you're barely given the time to [if dorroleint is 0]offer yourself[otherwise]ask for sex[end if] before [ghe]'s on you, your [if scalevalue of player < 4] smaller,[end if] [bodytype of player] form grabbed and [if dorroleint is 0]pulled[otherwise]guided[end if] to [ghis] place of rest before [ghis] shameless talons expose yourself before [ghim].";
		if dorroleint is 0:
			say "     '[one of]Oh[or]Ah[or]Yes[at random], [one of]I've been wanting to play with my [dorgr][or]my [dorgr] makes quite the entertaining toy[or]I'm beginning to think my [dorgr] is rather fond of being their [gdragon]'s plaything[at random]!' Teasing you for but a moment";
		otherwise:
			say "     '[one of]Mm[or]Hm[or]I see[at random], [one of]it's clear my [dorgr] is a quite pent up[or]my [dorgr] doubtlessly needs their [gdragon]'s affection[or]my [dorgr] need but only relax[at random]...' Soft remark illustrative of [ghis] intent";
	say ", the [gdragon]'s talons [if dorroleint is 0]firmly[otherwise]gently[end if] descend upon [if cunts of player > 1]one of your [cunt size desc of player] cunts[otherwise]your [cunt size desc of player] cunt[end if], second talon holding you in place as [ghe] [if dorroleint is 0]firmly[otherwise]carefully[end if] caresses its supple lips, your subsequent arousal making you wet before the beast's piercing gaze.";
	say "     Satisfied with your response, [ghis] scaled snout descends upon you, thick tongue's light, teasing caress wracking you with further bliss, you're soon made very slick with a mix of saliva and sexual fluids.";
	if dorroleint is 0:
		say "     'My [dorgr] [one of]is so very needy[or]squirms so amusingly under their [gdragon][or]can't resist their [gdragon]'s touch[at random]...' Tongue's";
	otherwise:
		say "     '[one of]I think my [dorgr] likes that[or]Mayhaps we kick this into high gear[or]One could say that my [dorgr]'s fun is just starting[at random], yes?' Tongue's";
	say " affection rising to slide against your[if scalevalue of player < 4] diminutive,[end if] [bodytype of player] torso[if breast size of player > 0] and along the curvature of your [short breast size desc of player] breasts[end if], [if dorroleint is 0][ghe] uses [ghis] snout to keep you pinned down[otherwise]slathering you with [ghis] saliva[end if] as [ghis] other talon moves [if cocks of player > 1]to one of your dicks, claws now attending it in tandem[otherwise if cocks of player is 1]to you dick, now attending to it in tandem[otherwise if cunts of player > 2]to one of your other portals, now attending to the two of them in tandem[otherwise if cunts of player > 1]your other portal, now attending to both of them in tandem[otherwise if anallevel is not 1]your anal ring, briefly teasing its entrance as your feminine portal remains attended to in tandem[otherwise]to offer its reassuring caress along the length of your legs[end if]. [gchis] endeavours quickly rise in fervour, ";
	if cocks of player > 0:
		say "[if cunt length of player < 7]slight, strained grunts escaping [ghis] lips[otherwise]meeting only brief resistance[end if] as [ghe] forces [ghis] digit past the supple folds of your flesh, pumping your dick all the while in [ghis] endeavour to milk them, fuelled by a twisted determination.";
	otherwise:
		say "[if cunt length of player < 7]slight, strained grunts escaping [ghis] lips[otherwise]meeting only brief resistance[end if] as [ghe] forces [ghis] digit[if cunts of player > 1 or anallevel is not 1]s[end if] past the supple folds of your flesh";
		if cunts of player is 1 and anallevel is not 1:
			say ", [ghis] endeavours to penetrate your ass [if cunt length of player < 7 and scalevalue of player < 4 and player is not twistcapped]equally[otherwise if scalevalue of player < 4 and player is not twistcapped]noticably more[otherwise if cunt length of player > 5]not nearly as[otherwise]just as[end if] difficult";
	say ".";
	if dorroleint is 0 and ((dorauto is true and a random chance of 1 in 2 succeeds) or (dorauto is false and a random chance of 1 in 5 succeeds)):
		say "     Just on the cusp of blissful release, the [gdragon] suddenly relents, a sly grin emerging from [ghis] lips as [ghe] lets the fires of your wanton need quickly die down. Instinctively, you move to pleasure yourself, but [ghis] talons move to pevent you";
		say "     '[one of]Tsk[or]Hmpf[at random], [one of]my [dorgr] is so desperate and needy, I think I shall save them for later[or]I enjoy watching my [dorgr] squirm with such desperation[or]my [dorgr]'s struggling amuses me[at random].' Teasing you in the wake of this torment, [ghe] further wounds your pride by moving [ghis] talons to your face, made slick with saliva and sexual fluids. '[one of]Look at this mess my [dorgr] made, they better clean it up[or]my [dorgr] is such a messy one, their [gdragon] won't let them leave until they make that right[at random].' Gradually, you oblige the [gdragon], tongue caressing the curvature of [ghis] scaled digits, taste flooded with that of your own feminine honey. Doubtlessly, this brief, twisted ritual worsens your already overwhelming need.";
		now dorbb is true;
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Very good[or]Well done[at random], my [dorgr]. [one of]I'm done having fun with them, though their [gdragon] still hungers[or]I'm sure they're just as eager to be their [gdragon]'s meal as they are for satisfaction[at random].' Smug look about [ghim], [ghe] teases you further with [ghis] tongue's affection, now very much different in its intent. Still exhausted and unspent, you can't help but writhe wantonly against [ghis] touch.";
			dorvore;
		otherwise:
			say "     '[one of]Very good[or]Well done[at random], my [dorgr]. [one of]Maybe, if they're good, I'll satisfy them the next time[or]I'm sure they'll be all the more eager for the next time[at random].' [gche] struts back to where [ghe] rested, by the fire, a smug look on [ghis] face. No doubt quite amused by the trick [ghe]'s played, you're forced to move on and contend with your lingering lust.";
	otherwise:
		say "     A grin emerging from [ghis] lips, [ghe] enjoys observing your increasingly desperate need for release, [ghis] endeavours persisting for a while longer before you moan out in bliss";
		if dorroleint is 0 and cocks of player > 0:
			say ". Deviously, [ghe] hikes up your lower torso, aiming your cock[smn] downwards upon you to douse you and your face and upper torso with your";
		otherwise:
			say ", dousing your crotch[if cocks of player > 0] and torso[end if] with your";
		say " sexual fluids, [if cocks of player > 0]each gout of jizz strained and prolonged by [ghis] intrusive talon's expert milking of your stuffed portal[otherwise]your orgasm prolonged for as long as the [gdragon] can manage[end if]. Slowly pulling [ghis] talons free of you, you're given some opportunity to survey [if dorroleint is 0]the devastation[otherwise]what[end if] [ghe] has wrought, yourself a worn out";
		if cocks of player > 0:
			say " and[if cock width of player > 24] massively[end if] cum-stained";
		say " mess";
		if dorroleint is 0:
			say ". [gche] doesn't quite seem done with you just yet, however, as you're held down a second time, talons moving to caress along your sullied, [bodydesc of player] form before they are brought to your face, slick with your heady sexual fluids.";
			say "     '[if cock width of player > 24 and cocks of player > 0][one of]Such a messy [dorgr][or]My [dorgr], look at all this mess[at random][otherwise][one of]Tsk[or]Hmph[at random][end if], [one of]start licking[or]be good and clean this up[or]I won't let them leave until they take care of this[at random]!' Intent on having you attend to this matter, you're forced to lick clean the beast's talons of your own [if cocks of player > 0]thick, virile cum[otherwise]honey[end if], tongue caressing along the curvature of [ghis] scaled digits";
			if cocks of player > 0:
				if cock width of player < 7 or scalevalue of player > 3:
					say ". This ritual persists for only a brief moment before [ghe]'s satisfied, [if scalevalue of player > 3 and cock width of player > 24]your large scale granting you a fair measure of speed in spite your sizeable load[otherwise if scalevalue of player > 3]your large scale granting you a fair measure of speed[otherwise]the mess you've made of yourself not being particularly substantive[end if], finally freeing you from [ghis] grip.";
				otherwise if cock width of player < 25:
					say ". This ritual persists for some measure of time, Doran frequently taking a recently-cleaned talon to sully it again with your spent seed, given the fairly substantive mess you've made, before finally freeing you from [ghis] grip.";
				otherwise: 
					say ". So massive the mess you've created, it becomes increasingly clear that this ritual is insufficient in cleaning you in any timely manner. As such, the now-impatient Doran's head descends upon you once again, tongue licking clean the mess you've made before [ghe] would force [ghis] scaled lips upon your own. Comparatively smaller frame barely able to handle [ghis] tongue's rough probing, [ghe] forces upon you an dizzying cocktail of [ghis] saliva and your spunk, doing this over and over again until you're finally clean -- and no doubt reeling a little from all the cum you've been rapidly forced to ingest. Now satisfied, [ghe] lets you go.";
			otherwise:
				say ". This ritual persists for only a brief moment before [ghe]'s satisfied, [if scalevalue of player > 3]your large scale granting you a fair measure of expedience[otherwise]the mess you've made of yourself not being particularly substantive[end if].";
		otherwise:
			say ".";
			say "     Giving you a moment to rest, [ghis] maw descends upon you a second time, meeting you with [ghis] thick tongue's caress as [ghe] endeavours to clean you up in silence. [if cock width of player > 24]This ritual persists for a fair amount of time, considering the substantial mess you've made[otherwise][gchis] work need only take a moment before [ghe]'s complete[end if], leaving you with only a thin veneer of saliva.";
		if dorvorreg is 2 and scalevalue of player < 4:
			if cocks of player > 0 and cock width of player > 20 and dorroleint is 0, now dorvorpcf is true;
			say "     '[one of]Mm[or]Hm[or]Heh[at random], [if dorroleint is 0][one of]I could learn a thing or two from my [dorgr] about being such a good[or][dorgr] certainly knows a thing or two about being an obedient[at random] little [one of]toy[or]plaything[or]slut[at random][otherwise][one of]I enjoy playing with my [dorgr][or]my [dorgr] is such fun[or]my [dorgr] should have seen the look on their face[at random][end if]!' Satisfied though [ghe] may be, [ghis] tongue continues to caress along your smaller frame, a hungry look in [ghis] eyes. '[one of]Ah[or]Oh[at random] [one of]But we're not done here yet[or]my [dorgr]'s fun is just starting[or]don't think I'll let them off that easy[at random]...'";
			dorvore;
		otherwise:
			say "     '[one of]Mm[or]Hm[or]Heh[at random], [if dorroleint is 0][one of]I could learn a thing or two from my [dorgr] about being such a good[or][dorgr] certainly knows a thing or two about being an obedient[at random] little [one of]toy[or]plaything[or]slut[at random][otherwise][one of]I enjoy playing with my [dorgr][or]my [dorgr] is such fun[or]my [dorgr] should have seen the look on their face[at random][end if]!' Satisfied, [ghe] lets you off before [ghe] struts back to [ghis] place of rest next to the fire, watching you with slight amusement as you get back up and go about your business.";

to say dordom_6: [Rimjob] [BODY MODDED]
	if dorauto is true:
		say "     You find yourself suddenly pounced upon, [if scalevalue of player < 4]your smaller, [bodytype of player] form pinned to the ground with little effort[otherwise]pinning you to the ground with little effort[end if]. Agitated in demeanour, the otherwise silent Doran casually wheels around and gives you a rather telling view of [ghis] ass. [if scalevalue of player < 4]Large, s[otherwise]S[end if]hapely curves exposed before you, [ghe] shows no restraint in immediately pressing your face firmly between [ghis] cheeks.";
		say "     '[one of]Such a shameful[or]I'm disappointed in my[or]What a negligent[at random][if scalevalue of player < 4] little[end if] [dorgr], [one of]they're deserving of being under their [gdragon]'s ass[or]they're good for nothing but being a toy for their [gdragon]'s amusement[or]this is what they're deserving of, I'm certain[at random].' Bitter in [ghis] regard, [ghe] continues, '[one of]Be a good little slut and make up for their absence[or]Oh, it's so very hard to keep myself clean back there, I think this is suitable punishment for my slutty little [dorgr][at random]. Maybe I'll reward them for their good behaviour.' Illustrating this gesture, you feel [ghis] talons caress [if cocks of player > 1]one of your exposed, [cock size desc of player] dicks[otherwise if cocks of player is 1]your exposed, [cock size desc of player] dick[otherwise if cunts of player > 1]one of your exposed, [cunt size desc of player] cunts[otherwise]your exposed, [cunt size desc of player] cunt[end if], your subsequent moans muffled against the [gdragon]'s ample flesh.";
	otherwise:
		say "     Sly grin across Doran's face, [ghe] sees your approach. No doubt already aware of your need, [ghe] humours your plea before suddenly pouncing you, pinning [if scalevalue of player < 4]your smaller, [bodytype of player] form to the ground with little effort[otherwise]you to the ground with little effort[end if]. Smug in [ghis] demeanour, [ghe] casually wheels around and gives you a rather telling view of [ghis] ass. [if scalevalue of player < 4]Large, s[otherwise]S[end if]hapely curves exposed before you, [ghe] takes considerable pleasure in irreverently grinding your face between its cheeks.";
		say "     '[one of]Oh[or]Mm[or]Yes[at random], my[if scalevalue of player < 4] little[end if] [dorgr], [one of]they're barely worth being under their [gdragon]'s ass[or]they can't help but be a toy for their [gdragon]'s amusement[or]this is what they've been wanting, I'm certain[at random].' A laugh in [ghis] regard, [ghe] continues, '[one of]Be a good little slut and lick their [gdragon]'s hole[or]Oh, it's so very hard to keep myself clean back there, I think my slutty little [dorgr] is better suited for the task[at random]. I'll be certain to reward them for their good behaviour.' Illustrating this gesture, you feel [ghis] talons caress [if cocks of player > 1]one of your exposed, [cock size desc of player] dicks[otherwise if cocks of player is 1]your exposed, [cock size desc of player] dick[otherwise if cunts of player > 1]your exposed, [cunt size desc of player] cunts[otherwise]your exposed, [cunt size desc of player] cunt[end if], your subsequent moans immediately muffled by the beast when [ghe] firmly presses [ghis] anal ring against your maw.";
	say "     [if scalevalue of player < 4]Shrouded in utter darkness, with only the sensory input of Doran's scaled hindquarters pressed firmly against you and the [gdragon]'s talons[otherwise]Pressed firmly between Doran's scaled cheeks, [ghis] initial teasing compelling you onward[end if], you're inclined to oblige [ghis] demand, tongue briefly teasing [ghis] eager portal, firm scales giving way to supple, yielding flesh, obliging in your slick organ's initial intrusion, though playfully inclined to squeeze it within it's grip. Yourself fully aroused by this ritual, the [gdragon] reciprocates by continuing to slowly";
	if cocks of player > 0:
		say "stroke the [cock size desc of player] organ, spare talons moving to attend [if cocks of player > 2]one of it's brothers[otherwise if cocks of player is 2]it's brother[otherwise if cunts of player > 1]one of your exposed cunts[otherwise if cunts of player is 1]your exposed cunt[otherwise]your own, exposed tailpipe[end if] in tandem[if cocks of player is 1], talon making a deliberately slow effort in its descent within your flesh[end if].";
	otherwise:
		say "caress your [cunt size desc of player] portal, making a deliberately slow effort to descend a talon within its depths, along with [if cunts of player > 2]one of its sisters[otherwise if cunts of player is 2]its sister[otherwise]your own, exposed tailpipe[end if].";
	if scalevalue of player < 4:
		say "     '[one of][dorgr] is such an obedient little toy[or]That's a good little [dorgr][or]Keep going, little [dorgr][at random]...' The [gdragon]'s dick [if dorballmod > 0]already sputtering a copious amount of[otherwise]oozing[end if] pre upon your exposed, [bodytype of player] torso, [ghe]'s clearly enjoying your attendance, though your diminutive form can only do so much compared to the overwhelming influence of [ghis] touch. Deliberately, painstakingly drawn out in [ghis] pace, it compels a considerable rise in momentum from your tongue's reciprocation, your increasingly sore jaw numbed by your overwhelming, wanton need, [ghis] grinding hindquarters slicked by your sweat.";
		say "     Drawing you out for a long as possible, it's inevitable that you cry out, muffled by the beast's flesh, [if cocks of player > 0]thick spunk spurting all over yourself and the beast[otherwise if cunts of player > 0]gushing portal[sfn] staining the [gdragon]'s talons with your honey[end if]. This doesn't appear to satisfy [ghim], however, leaning back to subject you to [ghis] ass even further in attendance of [ghis] own pleasure, the weight [ghe] carefully forces you to abide exacerbated as [ghe] jerks [ghim]self off.";
		say "     You continue to service [ghis] anal ring in the hopes of finish [ghim] off, the sounds of [ghis] final groans muffled by your confines, [ghis] supple ring throbbing against your tongue, [bodydesc of player] form soon [if dorballmod > 1]hosed by[otherwise]flooded with[end if] the warmth of [ghis][if dorballmod > 1] torrential,[end if] virile cum as it [if dorballmod > 1]sputters[otherwise]oozes[end if] all over you. Satisfied though [ghe] may be, [ghe] seems intent to remain on top of you for but a moment longer, licking both [ghim] and yourself clean of the[if dorballmod > 1] massive[end if] mess [ghe]'s made before finally getting off.";
	otherwise:
		say "     '[one of]Nng[or]Mnnf[or]A-ah[at random], [one of]my [dorgr] is so very good at pleasing their [gdragon][or]keep going, my [dorgr][or]my [dorgr] really loves their [gdragon]'s ass[at random]...!' Your substantive, slick intrusion very effective at getting the [gdragon] off, you can feel the [gdragon]'s dick [if dorballmod > 0]sputtering[otherwise]oozing[end if] pre against your [bodytype of player] torso. In the wake of [ghis] rising need, [ghis] endeavours to pleasure you become increasingly erratic, as do your own.";
		say "     The wet sounds of your continued efforts fill the air for but a moment longer until both of you finally meet bliss, your own cries muffled by doran's hide. [if cocks of player > 0]Thick, [cum load size of player] spunk spurting all over yourself and the [gdragon], mixing with [ghis] own[otherwise if cunts of player > 0]Gushing portal[sfn] staining the [gdragon]'s talons with your honey, [ghis] spunk making a mess of the two of you[end if] as [ghis] hole throbs around your tongue. [gche] takes a considerable amount of time to recover and even longer to lick both [ghim] and yourself clean of the mess [ghe]'s made, forcing you to abide being under [ghis] ass for a fair while longer before finally getting off you.";
	if dorvorreg is 2 and scalevalue of player < 4:
		say "     '[one of]Oh, I don't know why my [dorgr] was under there, they should be in their [gdragon] instead[or]The way my [dorgr] attends me, I think they've earned a proper reward[or]As much as I enjoy my [dorgr] under their [gdragon], I'd much rather they be inside them[at random]!' [gchis] teasing persisting as [ghe] wheels around, your sore self soon receives [ghis] tongue's affection once more, this time as a clear illustration of what [ghe] has planned for you next.";
		if dorballmod > 0:
			now dorvornpcf is true;
		dorvore;
	otherwise:
		say "     '[one of]Oh, I nearly forgot my [dorgr] was under there, silly me[or]The way my [dorgr] attends me, I'd think they prefer being down there[or]If I could, I'd keep my [dorgr] under me like that[at random]!' [gche] teases you once you're free, no doubt finding yourself a fair bit sore from the whole ordeal. [gche]'s content to look you over a bit before finally moving back to where [ghe] was resting prior, no doubt satisfied with [ghim]self.";

to say dordom_7: [Riding Player] [BODY MODDED]
	if dorauto is true:
		say "     The [gdragon] capitalizes on the very instant [ghe]'s within your sights, glaring irritatedly as [ghe] approaches before forcing you onto your back. [if scalevalue of player < 4]Pulling your smaller, [bodytype of player] form closer[otherwise]Adjusting your [bodytype of player] form before [ghim][end if], [ghe] reveals your [cock size desc of player] dick[smn] before prying eyes.";
		say "     '[one of]Hmpf[or]Tsk[at random], [one of]my [dorgr] is much too negligent[or]for too long has my [dorgr] left me be[or]I've been waiting too long for my [dorgr][at random]...' Stern expression shifting to a grin, an increasingly greedy look about [ghim] as [ghis] talons move to stroke [if cocks of player > 2]two of your impressive tools[otherwise if cocks of player is 2]both of your impressive tools[otherwise]your impressive tool[end if], '[one of]They clearly need to be used by their [gdragon][or]Oh, and they so desperately need to be used[or]And they deserve to be exploited like the toy they are[at random]";
	otherwise:
		say "     The [gdragon] appears particularly generous in the wake of your countenance, grinning as [ghe] [if dorroleint is 0]pushes[otherwise]sets[end if] you on your back, [if scalevalue of player < 4]pulling your smaller, [bodytype of player] form closer[otherwise]adjusting your [bodytype of player] form before [ghim][end if], revealing your [cock size desc of player] dick[smn] before prying eyes.";
		say "     '[one of]Heh[or]Ooh[or]Yes[at random], [if scalevalue of player < 4][one of]my [dorgr] is so very big for someone so very small[or]thank goodness my [dorgr] is willing to overlook the inconvenience of being so well-endowed[or]my little [dorgr] is full of such big surprises[at random][otherwise][one of]my [dorgr] is so very big, in more ways than one[or]no doubt my [dorgr] is quite proud of their equipment[or]I never cease to be impressed by my [dorgr][at random][end if]...' [gche] continues to grin, a greedy look about [ghim] as [ghis] talons move to stroke [if cocks of player > 2]two of your impressive tools[otherwise if cocks of player is 2]both of your impressive tools[otherwise]your impressive tool[end if], '[if dorroleint is  0][one of]I think they'd like to be used by their [gdragon][or]Oh, and they're so eager to be used[or]And always eager to be exploited like the toy they are[at random][otherwise][one of]I'd be remiss not to make use of them[or]I'm certain they wouldn't mind if I take a ride[or]Just relax, I'll take it from here[at random][end if]";
	say ".' Tongue descending you caress your voluminous flesh, until your mighty organ[if cocks of player > 1]s are[otherwise] is[end if] rendered hard before [ghis] affection.";
	if dorroleint is 0 and ((dorauto is false and a random chance of 1 in 3 succeeds) or (dorauto is true and a random chance of 2 in 3 succeeds)):
		say "     Suddenly, [ghe] rises to [if scalevalue of player > 3]tower[otherwise]climb[end if] over you, aiming[if cocks of player > 1] one of[end if] your cock[smn] towards [ghis] scaled ass before descending on it, feeling particularly inclined to have a go with you sans any lubricant.";
		say "     Strained grunts escaping [ghis] lips, [ghe] shows almost no restraint in forcing it within [ghis] fleshy depths, eager to exploit you for [ghis] own personal pleasure. [if scalevalue of player < 4]You're forced to abide more and more of the [gdragon]'s ponderous weight, eager to push you to the limits of what you can take[otherwise]The [gdragon] keeps the full of [ghis] weight on you, pinning you firmly to the ground[end if] as [ghe] shares [ghis] tongue's firm affection across your [bodydesc of player] frame[if scalevalue of player < 4], a feat not particularly easy for someone of your size[end if].";
		say "     '[one of]Nfm[or]Mmf[or]Urgh[at random], [one of]my M-[dorgr] likes being used as a slutty[or]m-my [dorgr] is such a challenging[or]my [dorgr] m-makes for such a good[at random][if scalevalue of player < 4] little[end if] [one of]t-toy[or]p-plaything[at random].' [if cockname of player is listed in infections of knotlist]It takes the [gdragon] a fair bit of time to engulf your dick in its entirety, contending for a fair amount of time to deal with your knot[otherwise]Several prolonged minutes filled with the sound [ghis] grunting the [gdragon] eventually manages to engulf your dick in its entirety[end if]; however, shows little interest in trying to acclimate to your size before [ghe] begins bouncing against you, this rough treatment doubtlessly a bit of a strain on you.";
	otherwise:
		say "     [gchis] sleek appendage takes a fair bit of care to fondle along[if cocks of player > 1] one of[end if] your cock's length, this patient reverence easily pulling out a moan from your lips as your emergent precum mixes with [ghis] saliva. Eventually satisfied in [ghis] preparation, Doran rises to [if scalevalue of player > 3]tower[otherwise]climb[end if] over you, aiming the dripping member towards [ghis] scaled ass. The beast takes some time to tease you, grinding it between [ghis] substantive, scaled cheeks before [ghe] finally attempting to squeeze it through [ghis] tight ring.";
		say "     Brief, strained grunts illustrative of [ghis] endeavours, [ghe] shows [if dorroleint is 0]almost no[otherwise]some[end if] restraint in forcing the organ within [ghis] fleshy confines, [if dorroleint is 0]eager to exploit you for [ghis] own personal pleasure[otherwise]his prior lubrication diminishing some of the strain [ghis] work puts on you[end if]";
		if dorroleint is 0:
			say ". [if scalevalue of player < 4]You're forced to abide more and more of the [gdragon]'s ponderous weight, eager to push you to the limits of what you can take[otherwise]The [gdragon] keeps the full of [ghis] weight on you, pinning you firmly to the ground[end if]";
		otherwise:
			say ". [if scalevalue of player < 4]The [gdragon] takes some care not to crush you under [ghis] weight, an endeavour quickly becoming difficult for [ghim] to maintain[otherwise]The [gdragon] keeps you gently pinned under [ghis] weight[end if]";
		say " as [ghe] shares [ghis] tongue's[if dorroleint is 0] firm[end if] affection across your [bodydesc of player] frame[if scalevalue of player < 4], a feat not particularly easy for someone of your size[end if].";
		say "     '[one of]Mm[or]Ah[or]Oh[at random], ";
		if dorroleint is 0:
			say "my [dorgr] [one of]likes being used as a slutty[or] is such a challenging[or]makes for such a good[at random][if scalevalue of player < 4] little[end if] [one of]toy[or]plaything[at random]";
		otherwise:
			say "[one of]I can see my [dorgr] enjoying being ridden[or]my [dorgr] is so very challenging[or]don't worry, my [dorgr], their [gdragon] will be gentle[at random]";
		say ".' [if cockname of player is listed in infections of knotlist]It takes the [gdragon] a fair bit of time to engulf your dick in its entirety, contending for a fair amount of time to deal with your knot[otherwise]Several prolonged minutes filled with the sound [ghis] grunting the [gdragon] eventually manages to engulf your dick in its entirety[end if]. [if dorroleint is 0]Takes some time[otherwise]Shows little interest in trying to acclimate[end if] to your size before [ghe] begins bouncing against you, [ghis] prior lubrication [if dorroleint is 0]at least a slight balm to [ghis] rough treatment[otherwise]making the whole affair a lot easier on you[end if].";
	say "     [gchis] own dick[if dorinternal is false and dorballmod > 0]and massive balls[otherwise if dorinternal is false]and balls[end if] slapping against you with an audible lack of reverence, [if dorballmod > 0]large gouts[otherwise]strings[end if] of pre spurt from [ghim] to stain you[if scalevalue of player < 4] and your face[end if], [if dorroleint is 0]any affection you might be inclined to offer in turn prevented against by [ghis] hold, intent to let the rod bounce free before you[otherwise]inclined to return the affection by reaching out to stroke the rod as well, much to [ghis] approval[end if]. [gche] chooses to [if cocks of player > 2]move a free talon to one of your unengulfed dicks, offering a casual, passing affection to it in order to intensify[otherwise if cocks of player is 2]move a free talon to your unengulfed dick, offering a casual, passing affection to it in order to intensify[otherwise if cunts of player > 1]lean back, stroking one of your, previously neglected, [cunt size desc of player] cunts, offering a casual, passing affection to it in order to intensify[otherwise if cunts of player is 1]leans back to stroke your, previously neglected, [cunt size desc of player] cunt, offering a casual, passing affection to it in order to exacerbate[otherwise if anallevel is 3]lean back, forcing a digit past your, previously neglected, anal ring, that [ghe] might accelerate[otherwise]continue with [ghis] tongue's attention, body smeared with pre and saliva as you are awash in [ghis] heated, panting breath, clearly eager for[end if] your eventual bliss. Loudly panting, [ghis] pursuit is utterly relentless, compelled by an overwhelming, wanton need, [if dorroleint is 0]with little regard to the strain it puts[otherwise]putting an increasing strain[end if] on you.";
	say "     '[one of]A-ah[or]A-ang[or]N-nn[at random]... [one of]F-fuck[or]M-more[or]I'm g-gonna[at random]";
	if dorroleint is 0 and ((dorauto is false and a random chance of 1 in 5 succeeds) or (dorauto is true and a random chance of 2 in 3 succeeds)):
		say "...!' Just about to break, [ghe] pulls [ghim]self free of your [cock size desc of player] dick, frotting with it[if cocks of player > 2] and one of its brothers[otherwise if cocks of player is 2] and its brother[end if] until the both of you cry out, your [cum load size of player] load mixing with [ghis] own[if dorballmod > 0], massive release to utterly drench[otherwise] to stain[end if] your exhausted form, a weakened laugh escaping the [gdragon]'s lips as each[if dorballmod > 0] excessive[end if] gout paints you white with cum[if cock width of player > 24 or dorballmod > 0], making a massive mess of you[end if].";
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Tsk[or]Hmpf[or]Oh[at random], [one of]look at this mess, my [dorgr] will just have to go to their room[or]How very naughty, I'll have to punish my [dorgr] for this mess[or]my [dorgr] is such a messy cum slut, they need to be taught a lesson[at random]!' Grinning slightly as [ghe] chastises you for a mistake clearly not your own, you feel [ghis] tongue against you, though out of little desire to clean the mess [ghe]'s made so much as to taste [ghis] little, soon-to-be-disciplined meal.";
			now dorvornpa is true;
			dorvore;
		otherwise:
			say "     '[one of]Heh[or]Ha[or]Hm[at random], [one of]my [dorgr] looks good this way[or]I got my [dorgr] good[or]I think my [dorgr] prefers being a messy cum slut[at random]!' Grinning to you as [ghe] slowly recovers, [ghe] chooses to leave you to clean yourself up[if cock width of player > 24 or dorballmod > 0] -- an effort that will doubtlessly take you some time -- [otherwise] [end if]before departing once more to [ghis] place of rest.";
	otherwise:
		say "...!' With one final, firm descent upon your tool, this concluding [if dorroleint is 0]command[otherwise]endeavour[end if] is more than enough to make you both cry out, your [cum load size of player] load rapidly pumping into [ghis] depths, [ghis] own[if dorballmod > 0], torrential flood of[end if] cum [if dorroleint is 0]aimed to paint you with a lewd lack of restraint[otherwise]firing wildly into the open air[end if]. [if cock width of player > 24]Forcibly, [ghe] pulls your hands against [ghis] belly, making you feel [ghis] form as it visibly bloats to contain your massive load[otherwise if cockname of player is listed in infections of knotlist]Moaning loudly, [ghe] remains tied to you[otherwise]Moaning loudly, [ghe] keep your tool enveloped entirely within [ghis] depths[end if], eager to contain every last drop of your seed.";
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Whew[or]Heavens[or]Goodness[at random], [if dorroleint is 0][one of]That was a great appetizer, now I'm ready for the main course[or]now my [dorgr] gets their inevitable reward[or]my [dorgr] is such a slutty little toy, and soon to be a meal as well[at random][otherwise][one of]We're not finished here just yet, my [dorgr][or]I'm so blessed that my [dorgr] gives me a ride AND a meal[or]I must thank my [dorgr] for that opportunity, and the one that is to follow[at random][end if]!' Taking some time to rest, [ghe] eventually does free you of [ghis] cumbersome weight. [if cock width of player > 24]Groaning slightly as [ghis] overstuffed hole leaks some of your voluminous jizz when [ghe] pulls[otherwise]Pulling[end if] [ghim]self off your now-softening dick, you're soon met with [ghis] tongue's reassuring affection, eager to fill [ghim]self even further...";
			if cock width of player > 24, now dorvornpcf is true;
			dorvore;
		otherwise:
			say "     '[one of]Whew[or]Heavens[or]Goodness[at random], [if dorroleint is 0][one of]I'm rather fond of using my [dorgr] like that[or]no doubt my [dorgr] is happy to be so rewarded with this opportunity[or]my [dorgr] is such a slutty little toy[at random][otherwise][one of]I think my [dorgr] enjoyed that[or]I like taking my [dorgr] out for a ride[or]I must thank my [dorgr] for this opportunity[at random][end if]!' Taking some time to rest, [ghe] eventually does free you of [ghis][if scalevalue of player < 4] cumbersome[end if] weight, [if cock width of player > 24]groaning slightly as [ghis] overstuffed hole leaks some of your voluminous jizz when [ghe] pulls[otherwise]pulling[end if] [ghim]self of your now-softening dick before [if dorroleint is 0]slowly departing back to [ghis] place of rest, leaving you to clean yourself off[otherwise]taking a moment to clean you off, departing back to [ghis] place of rest once [ghe]'s satisfied[end if].";

Section 3.1.2 - NEW! Body Mod and Commissioned Sex

to say dordom_8: [Riding Behind]
	if dorauto is true:
		say "     Before you have a chance to react, Doran pounces on top of you[if scalevalue of player < 4] easily pinning your smaller self to the ground[otherwise]pinning you to the ground[end if]. Eagerly, the dragon nips at and licks your vulnerable, [bodytype of player] form, as if to playfully punish you.";
		say "     '[one of][dorgr] is late[or][dorgr] should pay more attention to their [gdragon][or]There's [dorgr][at random]! [one of]I'm not sure they're deserving of my little 'gift'[or]I shouldn't be rewarding their tardiness like I'm about to[or]And just in time for some special fun[at random]...' After removing any attire you might have [ghe] finally hops off you, pulling away and letting you climb to your feet";
	otherwise:
		say "     Offering yourself [if dorroleint is 0]as the [gdragon]'s plaything[otherwise]for a bit of fun with the [gdragon][end if], [ghe] happily hops to [ghis] feet, a playful grin on [ghim] as [ghe] moves in closely to feel you over, setting aside any attire you might have.";
		say "     '[if dorroleint is 0][one of]I think my [dorgr] deserves a little [']gift['] for their obedience[or]I'm feeling a little generous[or]I'm sure my little plaything will enjoy this[at random][otherwise][one of]I think [dorgr]'s [gdragon] is feeling a little needy right now[or]I have an itch only [dorgr] can scratch[or]This'll be fun[at random][end if]...' Once [ghe]'s satisfied, [ghe] pulls away";
	say " before exposing [ghis] ample ass in front of you, large tail hiked up to give you a clear view.";
	say "     [if dorroleint is 0]Commanding[otherwise]Inviting[end if] your touch, [ghe] gives you some free reign to fondle and grope [ghis] behind. [gchis] powerful hindquarters yielding slightly against your shameless caress, [ghe] firmly presses against your digits, encouraging you to continue feeling [ghim] up. [gchis] haunches are ample enough that you need to part them to get an unobstructed view of [ghis] [if dorinternal is true]smooth, scaled crotch[otherwise if dorballmod is 0]ample balls and sheath[otherwise]oversized balls and sheath[end if][if dorballmod > 0], strings of precum oozing from [ghis] barely-aroused dick[end if]. [gchis] hard scales barely hide the softer flesh of [ghis] anal ring.";
	if dorroleint is 0 and dorrjd is not 1:
		say "     You attendance is interrupted when Doran begins pushing insistently against you, backing you up until [ghe]'s got you against a wall and your wall is lodged firmly between [ghis] ample curves.";
		say "     '[one of]Tsk, tsk, I think [dorgr] loves their [gdragon]'s ass so much they should give it a kiss[or]Before we can begin, [dorgr] needs to show their [gdragon] how much they love [ghis] ass[or]Oh, it's so excited to see [dorgr], I think they should return the affection[at random]!' [gche] only eases up on you when your lips embrace [ghis] supple hole. Moaning softly, the [gdragon]'s soft, yielding passage squeezes approvingly against your tongue's inevitable intrusion, quickly slicked by your saliva. Bathing in the heat of the creature's rising need, [ghe] continues to smother you for a while longer until [ghe] finally seems satisfied, once more putting some space between you and [ghim].";
	otherwise:
		say "     Compelled to plunge a finger past that supple hole, a gentle moan is pushed from the lips of the ever-obliging Doran, the soft, yielding passage squeezing gently against the invader. [gche] continues to oblige your continued fingering, for a while, but [ghe] eventually pulls free of you, putting some space between the two of you once more.";
	say "     '[if dorroleint is 0][one of]My [dorgr] has their [gdragon]'s permission to ride them[or]I need to feel my [dorgr] inside me[or]Now it's time for my naughty little [dorgr] to get their reward[at random][otherwise][one of]Time for [dorgr] to take a ride on their [gdragon][or]Hop on[or][dorgr] should enjoy this[at random][end if]...!' Inviting your approach once more, this time [ghe] lowers [ghim]self to the ground for you, allowing you to [if scalevalue of player > 3]get a hold on [ghis] back[otherwise]wrap an arm around [ghis] tail[end if] as you line up[if cocks of player > 1] one of[end if] your [cock size desc of player] dick[smn] with [ghis] eager hole. Already quite aroused by the previous bit of foreplay, it doesn't take much for your organ's[if cockname of player is listed in infections of bluntlist] blunt[end if] head to plunge itself into [ghis] inviting depths.";
	if dorroleint is 0 and a random chance of 1 in 2 succeeds:
		say "     '...[run paragraph on][one of]Ah[or]Hm[or]Tsk[at random], [one of][dorgr] will only go as fast as I command[or]not so fast, [dorgr], I'm the one in charge here[or]take it slow, [dorgr], and show me how obedient they are to their [gdragon][at random].' It seems [ghe][']ll chastise you if you move at any speed that isn't painfully slow, seemingly eager to torment you as [ghis] powerful passage slowly massages along your length. [gche] seems to greatly enjoy it when you move in a single, complete motion, [ghis] body rocking slightly to exaggerate every time you [if cockname of player is listed in infections of knotlist]tie with[otherwise]hilt[end if] [ghim].";
		say "     It's becomes more of an ordeal with each passing minute for you to maintain your composure, desperate to pound the [gdragon]'s ass into oblivion. Doran doesn't seem to let up, however, and is absolutely insistent on you to maintain your slow, deliberate motions.";
		say "     '[one of]Now, I have no doubt that [dorgr] is so disciplined, that they'll only cum when their [gdragon] commands them[or][dorgr] is so obedient, I bet they'll only cum when [dorgr] asks them to[at random]. [one of]Oh, but when shall I make that command[or]Surely they'd never fail their [gdragon][at random]?' Grinning smugly back at you, it's hard for you to say if you're sensitive enough to oblige the creature's twisted whim, and you're forced to focus on getting the most out of what you can out of your continued, ponderous motion.";
		if libido of player > 40:
			say "     It looks like you'll manage to build yourself up enough for the [gdragon]... Should you fail [ghis] task anyways, and face [ghis] punishment? Otherwise, you'll prove your obedience.";
			if player consents:
				now tempnum is 1;
			otherwise:
				now tempnum is 2;
		otherwise:
			now tempnum is 1;
		say "     '...[run paragraph on] [one of]A-ah[or]O-oh[at random] -- [one of]Now, now[or]Right now[or]Do it[at random]";
		if tempnum is 1:
			say "!' You pick up the pace for a few seconds, but it just isn't enough, and the [gdragon] gives you a terse expression when you fail to deliver. You keep trying for a few seconds longer, but Doran simply pushes you off [ghim] with one of [ghis] hind legs, wheeling around to pin you against the ground with one of [ghis] foretalons.";
			say "     '[one of]Tsk[or]Hmpf[or]Well then[at random], [one of]it seems I've poorly trained my [dorgr][or]how shameful a display[or]I expected more[at random]. [one of]It seems I'll have to show them how it's done[or]This isn't difficult at all[or]They'll just need to be taught a lesson[at random]...!' After being chastised, the [gdragon] [if scalevalue of player > 3]climbs atop[otherwise]looms over[end if] you, [ghis] fully exposed and rigid dick aimed square for your face before [ghe] lets out a strained groan, seemingly able to orgasm from nothing -- perhaps aided by your previous attendance -- as [ghe] immediately paints you with successive, overwhelming gouts of [ghis] thick, white cum[if dorballmod > 0], which seems to go on for an eternity until you're utterly drenched[end if].";
			if dorvorreg is 2 and scalevalue of player < 4:
				say "     '[one of]I think I know a suitable punishment for my [dorgr][or]I'm sure [dorgr] will satisfy me one way, at least[or]At least [dorgr]'ll make a decent meal[at random]...' After [ghe] finishes desecrating you with [ghis] seed, you feel [ghis] tongue caress against you, no doubt tasting [ghis] meal-to-be...";
				now dorvornpa is true;
				dorvore;
			otherwise:
				say "     '[one of]I want to see [dorgr] clean themselves, like a good slut[or]I'm certain [dorgr] is at least good at drinking their [gdragon]'s cum[or]Get licking, [dorgr][at random].' Once [ghe]'s finished desecrating you with [ghis] seed, [ghe] orders you upright and forces you to lick yourself clean. You have to use your hands to gather what your tongue can't reach, but otherwise [ghe] insists on an almost cat-like display of personal hygiene. [gche] seems plenty amused by the display and eventually lets you free to go about your business once more.";
		otherwise:
			say "!' You pick up the pace for a couple seconds, more than enough to finally set yourself off, much to the [gdragon]'s cooing approval over the feel of your [cum load size of player] load filling [ghis] bowels. Once your bliss subsides, [ghe] lets you pull free of [ghim], wheeling around and having you lay down a moment to offer [ghis] tongue's affection, cleaning the mess you made of yourself.";
			if dorvorreg is 2 and scalevalue of player < 4:
				say "     '[one of]Oooh[or]Mmm[or]Aah[at random], [one of]I love the taste of my obedient little [dorgr][or]I think it's time for my [dorgr] to fill me another way[or]My [dorgr] certainly knows how to make their [gdragon] hungry[at random].' A wicked grin across [ghis] scaled lips, [ghis] attendance now doubt allowed [ghim] to get a taste of [ghis] meal-to-be...";
				if cock width of player > 24, now dorvornpcf is true;
				dorvore;
			otherwise:
				say "     '[dorgr] [one of]is so well disciplined and obedient[or]has more than satisfied their [gdragon][or]knows how to attend their [gdragon][at random]...' [gche] continues the task of licking you clean, letting you free once [ghe]'s satisfied before returning to the fire to attend to [ghis] own hygiene, a [if dorballmod > 0]substantial[otherwise]small[end if] trail of precum following in [ghis] wake.";
	otherwise: [Fast]
		say "     '[if dorroleint is 0][one of]Don't slow down for a second, [dorgr][or][dorgr] has my command to go all out[or]I won't accept anything but the hardest [dorgr] can do[at random][otherwise][one of]Don't stop for anything, [dorgr][or]Go crazy, [dorgr][or]Pound me into the ground, [dorgr], I'm practically begging[at random][end if]!' On cue, you start to pick up a pace of railing the large [gdragon], moaning softly in eager approval with each powerful thrust, gradually building up [ghis] own motion working in opposition of your own. [if scalevalue of player > 3]Give [ghis] size relative to you, it's hard for you to not be knocked back by the greedy creature's insistence[otherwise]The motion starts to become a little dizzying, and it's unclear to you which one of you is moving harder against the other[end if].";
		say "     As things persist, they seem to very quickly spiral out of your control, to the point where Doran has you pinned to a wall, practically trying to squeeze the cum out of your beleaguered dick. You're compelled to push [ghim] back, but [ghe] absolutely refuses to let you go, pounding you against the cave's interior.";
		say "     '[if dorroleint is 0][one of]Give me my [dorgr]'s cum, I need it all[or]I must have my [dorgr]'s seed inside me[or]I want what's mine, [dorgr][at random][otherwise][one of]I-I need [dorgr]'s cum[or]I want to feel [dorgr]'s seed inside me[or]P-please, I need it all[at random][end if]!' [gche]'s absolutely desperate for your bliss, and it doesn't take long before [ghe] finally gets what [ghe] wants, letting out a strained cry as you pump your [cum load size of player] load into the [gdragon]'s tight ass. This seems to set [ghim] off as well, painting the ground below you with [ghis][if dorballmod > 0] excessive[end if] cum.";
		say "     Once things eventually wind down, Doran frees you from your pinned position, gradually wheeling around and setting you down so [ghe] might lick you clean of the mess you've made of yourself.";
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Oooh[or]Mmm[or]Aah[at random], [if dorroleint is 0][one of]I love the taste of my useful little [dorgr][or]I think it's time for my [dorgr] to fill me another way[or]My [dorgr] certainly knows how to make their [gdragon] hungry[at random][otherwise][one of][dorgr] is so very tasty[or]I'm not quite full yet[or]it seems I've worked up quite an appetite[at random][end if]...' A wicked grin across [ghis] scaled lips, [ghis] attendance now doubt allowed [ghim] to get a taste of [ghis] meal-to-be...";
			if cock width of player > 24, now dorvornpcf is true;
			dorvore;
		otherwise:
			say "     '[if dorroleint is 0][dorgr] [one of]is so useful to their [gdragon][or]has more than satisfied their [gdragon][or]knows how to attend their [gdragon][at random][otherwise][one of]That was fun[or][dorgr] has my thanks[or]I should be satisfied for now[at random][end if]!' [gche] continues the task of licking you clean, letting you free once [ghe]'s satisfied before [ghe] goes to attending [ghis] own[if dorballmod > 0], considerable[end if] mess.";
	
to say dordom_9: [Ball Worship]
	if dorauto is true:
		say "     Just as you enter the alcove you're pulled over and forced to the ground. Doran, freeing you of any attire or equipment and tossing them out of harm's way, keeps you pinned with [ghis][if scalevalue of player < 5] larger,[end if] powerful body.";
		say "     '[one of]Hmpf[or]Tsk[or]Hm[at random], [one of]did[if scalevalue of player < 4] little[end if] [dorgr] forget about their [gdragon]?[run paragraph on][or]I have ill patience for tardiness![or][if scalevalue of player < 4]little [end if][dorgr], leaving their [gdragon] all pent up like this![run paragraph on][at random] [one of]I think I have suitable punishment for them[or]I suppose they'll have to pay a special tribute[at random]...' [gche] wheels [ghim]self around so [ghe] can leave [ghim]self hunched atop you, exposing is scaled, oversized balls over your face. Partially slick with [ghis] dribbling precum, occasionally dripping against you, [ghe] teases you with the prospect of smothering you with the massive sack, just tantalizingly out of reach.";
	otherwise:
		say "     You choose to offer yourself to Doran, who immediately forces you to the ground. Freeing you of any attire or equipment and tossing them out of harm's way, keeps you pinned with [ghis][if scalevalue of player < 5] larger,[end if] powerful body.";
		say "     '[one of]Ah[or]Oh[or]Hm[at random], [one of]obedient[if scalevalue of player < 4] little[end if] [dorgr] has returns to their [gdragon][or]just in time[or][if scalevalue of player < 4]little [end if][dorgr], their [gdragon] is all pent up[at random]! [one of]I know what they need[or]I have something special for them[at random]...' [gche] wheels [ghim]self around so [ghe] can leave [ghim]self hunched atop you, exposing is scaled, oversized balls over your face. Partially slick with [ghis] dribbling precum, occasionally dripping against you, [ghe] teases you with the prospect of smothering you with the massive sack, just tantalizingly out of reach.";
	say "     '[one of]I know [dorgr] wants a taste[or]If [dorgr] behaves maybe they'll get what they desperately want[or]I could tease my [dorgr] like this all day, but I am nothing if not merciful[at random]";
	if a random chance of 1 in 2 succeeds:
		say ". How about a kiss for the [gdragon]? Very gentle and lovingly...' [gche] loosens [ghis] hold on you and gradually lowers [ghim]self in range on your lips, inviting them to softly embrace one of the orbs. Soft and yielding to your touch, your lips are quickly slicked by [ghis] abundant sexual fluids before [ghe] pulls [ghim]self out of reach once more, only to repeat this ritual for several minutes.";
	otherwise:
		say ". I'm sure they'll want a taste of their [gdragon], just a little...'  [gche] loosens [ghis] hold on you and gradually lowers [ghim]self in range on your tongue, inviting it to slowly writhe and caress against the crevice between the two orbs. Soft and yielding to the touch, your taste is immediately flooded with [ghis] abundant sexual fluids before [ghe] pulls [ghim]self out of reach once more, only to repeat this ritual for several minutes.";
	say "     '...[run paragraph on][one of]Okay[or]Alright[or]Very well[at random], [one of]let's move onto the main course[or]let's start really having fun[or]I'm sufficiently amused to move on[at random]";
	if cocks of player > 0 and a random chance of 1 in 2 succeeds:
		say ".' Pulling away one last time to wheel back around, [ghe] frees you up enough to watch as [ghe] hooks you blatant arousal around [ghis] talons, exposing your now blatantly erect, [cock size desc of player] cock[smn] up in the open air. Sitting upright such that [ghe] can expose [ghis] own assets, [ghe] firmly presses [ghis] sack against your dick[smn] until they are pinned once more against you under [ghis] ball's weight.";
		say "     '[one of]How about a game[or]Perhaps a test of stamina[at random], [one of]hm[or]yes[at random]? A race to see who will cum first, [dorgr], or their [gdragon]? It would be truly pitiful if my [dorgr] lost...' Slicked by [ghis] precum, [ghe] begins grinding [ghis] taut orbs against you[if cock length of player < 11], dick[smn] practically hidden under them[end if]. It's only now that [ghe] starts getting aroused by this ordeal, tormenting you with how far behind [ghe] is compared to you. [gchis] increased arousal makes even more a mess of you with precum, quickly soaking your lower torso.";
		say "     You're very quickly brought to the cusp of bliss; however, the [gdragon] seems to know this and stops just short of ecstasy, instead raising [ghim]self up to your face and forcing you lick [ghis] precum-drenched sack, causing you to cool down slightly, before continuing once more. Your efforts to clean those slimy orbs become increasingly dire out of some primal hope that [ghe][']ll finally let you get off, only to edge you on longer.";
		say "     'Beg, beg to lose to their [gdragon]! Tell [ghim] how much of a pitiful slut [dorgr] is!' Absolutely ahaze in unsated need, you immediately oblige the creature's demands, even as [ghe] continues to assault you with demeaning commands. Finally satisfied, all it takes [ghim] it one hard push to set yourself off. Pressing you firm and upwards against [ghim], you [if cock width of player > 18]drench[otherwise]stain[end if] [ghis] torso and balls with your [cum load size of player] load, mixing with [ghis] own precum.";
		say "     '[one of]Hmpf[or]N-nn[or]Nng[at random], [one of]now for your punishment[or]I'll have to teach you a lesson[or]they'll pay for their failure[at random]!' Still grinding [ghis] slick package against you, it takes only about a second longer before [ghe] sets off as well, throbbing, impressive dick aimed squarely at your face before being hosed with a torrent of the [gdragon]'s massive load. [gche] specifically cups [ghis] foretalons around your jaw to ensure that the seed pools around your mouth, forcing you to swallow it down in large, dizzyingly heady gulps. Almost drowning what feels like a sea of the beast's ejaculate, you feel like you're at this for an eternity, until it finally subsides and you're given the chance to catch your breath.";
		say "     Looking over yourself, you're a completely painted white with [ghis] seed, made worse as [ghe] continues idly grind [ghis] orbs against your slick form. [gche] eventually raises the sack to be licked clean by you, but by this point you're so stuffed and numb that it can only ooze from your lips and make a brand new mess. In spite of this, perhaps to torment you further, [ghe] continues to force you into this pointless endeavour until [ghe]'s sufficiently amused, pulling away.";
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Alright[or]Well, now[or]Ah, yes[at random], [one of]I'm sure little [dorgr] will slide down like they're nothing[or]I think it's time to [']clean['] up our little mess-maker[or]that was only the first part of [dorgr]'s punishment[at random].' Grinning at you, [ghe] moves to finish you off as [ghis] meal.";
			now dorvorpcf is true;
			dorvore;
		otherwise:
			say "     '[one of]Ha[or]Hm[or]Right, then[at random], [one of][dorgr] is so very messy[or]'tis a shame [dorgr]'s too tired to clean up the rest[or]I'll just have to take care of [dorgr]'s messes[at random]...' Letting you rest, [ghe] grants you at least this moment of gentle care as [ghe] softly licks you clean of the whole mess, before attending to [ghim]self and the cave. Once you're fully recovered, you gather your things and prepare to go about your business once more.";
	otherwise:
		say ".' Almost without restraint [ghe] plunges downwards, sack firmly smothering you such that you're have to fight a little to still breathe, to say nothing of being forced to taste and swallow [ghis] precum. The [gdragon] doesn't seem to care that you're painfully aroused, but prevents you from touching yourself and only allows you to lavish affection on [ghis] pillow-like orbs";
		if scalevalue of player < 4 and a random chance of 2 in 3 succeeds:
			say ".";
			say "     The whole sensation is distracting enough that you barely notice the creature's efforts to tie your limbs with soft rope, which is only truly made apparent when [ghe] gets back up. Tethered to the [gdragon], the slack is enough that you're inched away from [ghis] assets, an issue [ghe] quickly resolves by readjusting bindings until you're even more firmly pinned against [ghim], having no longer to worry about harming you with [ghis] weight.";
			say "     '[one of]I always wondered what clothing would be like, I'm sure [dorgr] will suffice[or]Now, if you excuse me, I have my own matters to attend to[or]I'm sure this is what [dorgr] wants, being a slave to their [gdragon]'s sack[at random]! [one of]I don't want to see any dripping[or]Take care to keep me clean[at random]...' Taunting you, [ghe] struts around a bit to make sure you won't come loose, all the while rubbing [ghis] massive, precum-slick balls against your firmly pinned face. Once it's clear you're not coming off anytime soon, [ghe] happily goes about the business of tormenting you further.";
			say "     [gche] starts off by playing around with how you feel against [ghim], stretching and twisting as [ghe] takes pleasure in feeling your writhing form turn with [ghim]. Slick balls and dripping shaft rubbing against you, your whole upper torso is a drenched mess of sexual fluids, forced to continually lick along the crevice between them.";
			say "     Eventually, [ghe] begins to pretend you aren't even there, going about and attending to minor errands around the cave as you grind against [ghim]. At one point, [ghe] starts preening [ghim]self like a cat would, taking a particular pleasure in slathering your back with [ghis] tongue in a deliberately vain attempt to clean [ghis] crotch. For a while now, your need for release becomes painfully apparent, but [ghe] manages your lower torso such that you can't grind yourself against anything, your pleas for release muffled by [ghis] sack, the vibrations of which only inviting [ghim] to make a further mess of [ghim]self.";
			say "     Finally, [ghe] starts to taunt you.";
			say "     '[one of]Tsk[or]Hmpf[or]Hmm[at random], [one of]I think [dorgr] makes for better undergarments than anything else[or]I bet [dorgr] loves being humiliated like this[or][dorgr] is such a little slut that they would be happy licking their [gdragon]s balls[at random]. Maybe I keep them like this forever? They'd like that, wouldn't they? [one of]I bet they could subsist off the mess I make for them[or]It will surely [if wslevel is 3]make going to the bathroom harder[otherwise]get me odd looks by strangers[end if], but I don't think [dorgr][']ll mind[at random].' [gche] continues to taunt you like this, over and over again until you're so aroused by the prospect of being this creature's twisted attire that it ostensibly causes you to orgasm against the open air, staining the ground[if cocks of player > 0] and the dragon[end if] with your mess. This ends up making [ghim] snort in annoyance.";
			say "     '...[run paragraph on][one of]We can't be having [dorgr] make a bigger mess than without[or]Bad [dorgr], hmpf[or]You'll just be making it worse if you keep that up[at random]! Off you come.' Carefully, [ghe] unties you until you gently land on the ground under which you came. Addled by the cold air and vision bleary from no longer being obscured, the [gdragon] forces you, as you are recovering, to lick yourself clean for [ghim], until [ghe]'s satisfied.";
		otherwise:
			say ". At the very least, your hands are freed up just enough to join your face's attendance.";
			say "     '[one of]Hmpf[or]Well then[or]Yes[at random], [one of]I'll only let my[if scalevalue of player < 4] tiny[end if] [dorgr] go when they make their [gdragon] cum[or]if [dorgr] wants to be free then they'll have to make their [gdragon] cum, or else they're staying down there for quite a while[or]be a good[if scalevalue of player < 4] little[end if] slut and satisfy [dorgr]'s [gdragon][at random].' Rather strictly insistent that you don't touch [ghis] soon fully-erect dick, [ghe]'s dead set on expecting you to get [ghim] off by touch of [ghis] supple orbs alone.";
			say "     Gently kneading, the soft, taut sack, which yields to your tongue's attendance, it isn't long before your endeavours become increasingly slicked by [ghis] overabundant precum, the impish [gdragon] taking a particular joy in occasionally pressing [ghim]self more firmly against your and rubbing [ghim]self against your face, making even more a mess of yourself. A mix of [ghis] [gmasculine] odour and [ghis] sexual fluids utterly inundating your senses, you can't help but oblige but drink down the thick stuff from this wholly submissive position.";
			say "     '[one of]Absolutely pitiful[or]Such a shame[or]I shouldn't be surprised[at random], [one of][dorgr] will do anything their [gdragon] asks[or]there's nothing [dorgr] won't do for their [gdragon][or]there's no boundaries to [dorgr]'s depravity[at random]!' [gche] clearly enjoys chastising you as you continue to attend [ghim], [ghis] breath becoming heavier which each passing minute. '[one of]A-ah[or]O-oh[or]Y-yes[at random], [one of]show me how much they love their [gdragon]'s balls[or]don't they dare stop showing how absolutely depraved they are to their [gdragon][or]prove to me how much they love being their [gdragon]'s plaything[at random]...!'";
			say "     It becomes more and more difficult to keep your pace, [ghis] body's flow reaching a point where you're practically drowning in [ghis] precum, but your efforts soon, finally bear fruit. The creature presses [ghim]self firmly against you before crying out, utterly drenching your body with continuous gouts of [ghis] thick seed. Not so lost in the throes of [ghis] bliss that [ghe] won't [']reward['] your efforts, you feel [ghis] talons [if cocks of player > 0]stroke your aching, [cock size desc of player] dick[smn].[run paragraph on] It doesn't take much effort for [ghim] to set you off, your own, [cum load size of player] load mixing with [ghis][otherwise]fondle your aching cunt[sfn].[run paragraph on] It doesn't take much effort for [ghim] to set you off, your juices mixing with [ghis] seed[end if].";
			say "     Once the fervour subsides, [ghe] forces you to abide a faceful of [ghis] sack for a while longer before [ghe] finally pulls off you, strings of cum trailing from it across your exhausted visage. [gche] gives you a moment to catch your breath, against the cold, dry air.";
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Now for my favourite part[or]Now that [dorgr] is nicely glazed[or]Oh, [dorgr] looks so delicious now[at random]...!' Grinning slyly at you, you briefly feel [ghis] tongue's warm caress against you, eager to taste [ghis] soon-to-be meal...";
			dorvore;
		otherwise:
			say "     '[one of]Tsk[or]Hmpf[at random], [one of]look at all this mess[or]it seems I have to clean up all the messes here[or]it's difficult enough to keep this place clean enough as it is[at random]!' Briefly teasing you, you soon feel the warm caress of [ghis] tongue against you, carefully cleaning you up as you regain your strength. Once [ghe]'s satisfied with [ghis] work, [ghe] lets you off to go about your business once more, [ghim]self returning to [ghis] fire and attending to [ghis] own mess.";

to say dordom_10: [Cum Worship]
	if dorauto is true:
		say "     You're taken slightly off-guard when Doran's large, reptilian tail encircles around you, pulling you close to [gdragon]. [gche] has a particularly smug look about [ghis] face, grinning at you.";
		say "     '[one of]Tsk[or]Hmm[or]Well[at random], [one of]it's time for [dorgr] to attend to their [gdragon][or]I wasn't about to let [dorgr] slip by on me, now[or]I have quite the errand for my [dorgr][at random]";
	otherwise:
		say "     You barely need to offer yourself before Doran hooks [ghis] tail around you, pulling you closer, grinning smugly over what [ghe] has in store for you.";
		say "     '[one of][dorgr] will most certainly be attending their [gdragon][or]I see [dorgr] couldn't resist being used by their [gdragon] yet again[or]I'm certain I can come with an errand to amuse my [dorgr][at random]";
	say "... [one of]Oh, and I have just the thing[or]This will be amusing[at random]!' Pinning you to the ground, the large creature [if scalevalue of player > 3]crawls on top of[otherwise]moves over[end if] you, [ghis] hindquarters hovering above you. [if dorinternal is true]Smooth crotch featureless save for the tip of [ghis] dick peeking from [ghis] slit[otherwise]Oversized balls and bulging, unaroused sheath blatantly exposed[end if], the perpetually dripping organ making you fidget with each string hitting your face, much to [ghis] amusement.";
	if a random chance of 1 in 2 succeeds:
		say "     '[one of]Start sucking, [dorgr][or][dorgr] made this mess, they'll have to attend to it[or][dorgr] is such a massive cum slut[at random]. [one of]Their [gdragon] won't be satisfied until they're full to the brim[or]I bet they want nothing more than to feed off their [gdragon][at random]!' Briefly teasing you, [ghe] firmly presses [ghis] [if dorinternal is true]flush, leaking slit[otherwise]bulging, leaking sheath[end if] against your lips, taste immediately flooded with the heady, [gmasculine] flavour of the [gdragon]'s precum. It takes almost no effort to make the creature sputter with [ghis] sticky fluid, forcing you to swallow it down in stride.";
		say "     Strangely disciplined, Doran [one of]seems[or]remains all the[stopping] able to get off from your attendance without ever getting hard, your embarrassing, almost infant-like suckling causing [ghim] to moan and pant. As your efforts become more deliberate, so too does the flood of [ghis] thick ooze become more substantive. You at least have some power in preventing it from getting too out of hand, but this becomes harder with each passing second while the [gdragon] gets off from it.";
		say "     '[one of]I love seeing my slutty [dorgr] feed off their [gdragon][or]Oh, I just want to see how much my [dorgr] can hold in at once[or]I bet [dorgr] longs to taste their [gdragon] every day[at random]!' Overwhelmingly aroused by [ghis] task, Doran keeps your arms gently pinned to the ground by [ghis] hind legs, forcing you to writhe in an increasingly desperate need. As time goes on it becomes increasingly difficult to keep up, your stuffed, [bodytype of player] body begging more and more for relent with every passing second.";
		say "     '[one of]J-just a little more[or]M-[dorgr] needs it all[or]Keep s-sucking[at random]...' Slightly trembling against your touch, [ghe] seems finally overtaken by bliss, [ghis] still barely-present immediately overtaking you with a torrent of [ghis] bestial fluid. [if scalevalue of player > 4]After maybe three gulps[otherwise if scalevalue of player is 4]After maybe two gulps[otherwise]You get off maybe one gulp[end if] before it starts sputtering from your maw, forcing it free from your lip's embrace and causing each successive gout to drench your [bodytype of player] torso.";
		say "     There, covered in the [gdragon]'s voluminous jizz, you're able to free and arm and [if cocks of player > 0]jerk yourself off[otherwise]fondle yourself[end if], motion slicked by the abundant fluid. Made so sensitive by your endeavour, it doesn't take much effort to set yourself off, [if cocks of player > 0]your own, [cum load size of player] load mixing with [ghis]s[otherwise]your juices mixing with [ghis] own[end if]. Doran, no doubt amused by the display, allows you to revel in the throes of your ecstasy while laying drenched in [ghis] cum.";
	otherwise:
		say "     '[one of]I think [dorgr] needs a bath[or]Shame [dorgr] didn't bring a bathing suit[or]I'm going to make such a mess of [dorgr][at random]...' Musing over you, the [gdragon]'s impressive dick starts to slip free from its ill-fitting [if dorinternal is true]slit[otherwise]sheath[end if], hard and throbbing above you almost immediately. Gently pinned to the ground by [ghis] hind legs, you remain tantalizingly out of reach of [ghis] [if dorinternal is true]nethers[otherwise]rod[end if], Doran teasing you by its mere presence, eagerly drooling all over your [bodytype of player] body.";
		say "     The creature seems particularly skilled -- or perhaps just really sensitive. [gche] groans faintly, twitching cock rocking slightly against the open air, more than enough to get its flow of precum really going, each heady spurt staining you below. The flow gradually picks up, as if Doran could get off by humping the air alone, and forcing you to watch as you become increasingly drenched by [ghis] sticky fluid. Air filled with [ghis] overpowering, [gmasculine] scent, you can't help but revel in the thick warmth [ghis] precum bathes you in.";
		say "     '[one of]Such an obedient, sluttly little [dorgr][or]I bet [dorgr] is so depraved, they could get off simply by the feel of their [gdragon]'s cum[or]I think this look is appropriate for [dorgr], an embarrassing mess under their [gdragon][at random].' As if to [']reward['] you, [ghe] lowers [ghim]self just enough to lightly grind [ghis] terribly hot, throbbing dick against your slippery body, occasionally moving high up enough for it to reach your face where [ghe] can briefly force you to drink from the sputtering tip. You're so painfully aroused by this point, you can only moan impotently, your bound, slick writhing weakly against [ghim].";
		say "     [gche] pulls away from you once more, again subject to the seemingly hypnotic motion of [ghis] rigid, thrusting assets, now much more desperate for release. Practically drowning in [ghis] fluid, it becomes hard to not be lost in a haze of [ghis] overwhelming scent and taste, until [ghe] finally goes rigid and cries out in bliss. Immediately hit with a gout of [ghis] more potent cum, [ghe] spares no inch of you when it comes to drenching you with the stuff.";
		say "     '[one of]A-ah, cum for your [gdragon], [dorgr][or]I-I won't stop until you show me how much of a slut [dorgr] is[or]M-[dorgr] won't be able to resist their dragon[at random].' [gche] finishes [ghis] orgasm by aiming squarely at your crotch, the force of [ghis] sticky barrages more than enough to set your terribly sensitive form off, [if cocks of player > 0]your own cock[smn] mixing your [cum load size of player] load with [ghis] own[otherwise]your own cunt[sfn] aching painfully against the assault[end if]. Doran looks down at you with amusement as lets you revel in the throes of ecstasy, drenched in [ghis] cum.";
	say "     Once your need dies down, and you catch your breath a bit, [one of]you think you're done here, but Doran seems to think differently[or]Doran chuckles at you[stopping], a smug look across [ghis] face.";
	say "     '[one of]Now for part two[or]I'm going to enjoy this[or]This is going to be fun[at random]...!' [gche] releases [ghis] hold on you, only to press and grind your fluid-drenched body against [ghim]. The motion of [ghis] coarse plates slicked, [ghis] [if tempnum is 1]now-hardening[otherwise]still-hard[end if] dick presses firmly against you, making a worse mess for both of you now. Both your arms are free now, allowing you to smear your soaked digits against [ghis] underside and thighs. [if dorinternal is true][gche] seems to really enjoy lodging you between [ghis] legs deeply, until you're made lick and kiss along [ghis] perineum and the base of [ghis] rod[otherwise][gche]'s rather fond of smothering you with [ghis] oversized sack, inviting you to lavish your affection on them[end if].";
	say "     You're still quite exhausted[if tempnum is 2] and bloated[end if] from the ordeal, but Doran seems relentless, and [ghis] persistence is enough to arouse you a second time. [gche]'s at least very forgiving towards your somewhat slower pace. Vision now somewhat obscured, you're given a bit of a jolt when you feel the [gdragon]'s tongue caress along aching [if cocks of player > 0]cock[smn][otherwise]cunt[sfn][end if]. You can feel [ghis] dick throb powerfully against your [bodydesc of player] torso, a flood of fresh precum following with each one, to the point where it becomes increasingly difficult for your companion to keep you from slipping out from under [ghim].";
	say "     '[one of]I may be unending, but I'm going to wring [dorgr] completely dry[or]There's no stopping this [gdragon], [dorgr] may very well be under them for all time[or]I know my pitiful[if scalevalue of player < 5] little[end if] [dorgr] won't be able to hold back a second time[at random]!' Body starting to painfully ache against the constant strain, [ghe] finally manages to squeeze out a second orgasm from your utterly spent self. It's only after you're completely and utterly drained when the creature finally frees you from under [ghim].";
	if dorvorreg is 2 and scalevalue of player < 4:
		say "     '[one of]Oh[or]Mmm[or]Yes[at random], [one of]the ride never stops here[or]I think someone needs to take a nap in their room[or]you look doubly tasty, all glazed like that[at random]!' Grinning widely at you as [ghe] begins preparing you for what is to come, you know you won't be suffering this cold, dry air for very long...";
		now dorvorpcf is true;
		dorvore;
	otherwise:
		say "     '[one of]Mmm[or]Ah[or]Heavens[at random], [one of]Such a shameful mess[or]What terribly slippery fun[or]I should do that more often[at random]!' Chuckling at you, you're not left to lay their for very long, the cold dry air eventually replaced by the warmth of [ghis] tongue. [gche] takes great pains to clean up the overwhelming mess [ghe]'s made of you, allowing you the opportunity to regain your strength. Once you're taken care of, [ghe] leaves you to return to the fire and tend to [ghis] own mess.";
	
to say dorsub_8: [Self-milking]
	say "     You [if dorroleint is 4]order[otherwise]call[end if] Doran over, who happily trots up to you, a slight trail of precum following in [ghis] wake. Somewhat [if dorroleint is 4]imp[otherwise]sheep[end if]ishly, you order Doran to start sucking [ghim]self off and, Ever-obliging, the creature lifts a hind leg to expose [if dorinternal is true]his flush crotch[otherwise]his sheath and oversized sack[end if], partially aroused and oozing.";
	say "     '[one of]Mmm[or]Ah[or]Ooh[at random], [if dorroleint is 4][one of]I hope I can impress [dorgr][or]I'll try my best to entertain [dorgr][or]I see [dorgr] wants a show[at random][otherwise][one of]I hope [dorgr] likes what they see[or]This'll be entertaining[or][dorgr] plays all the funnest games[at random][end if]!' Tongue caressing along [ghis] [if dorinternal is true]slit[otherwise]sheath[end if], [ghe]'s already making a bit of a mess against [ghis] underside and snout, awash in spurts of [ghis] thick precum. [if dorroleint is 4]Not even having to order [ghim][otherwise]With a little suggestion[end if], [ghis] lips envelope [ghis] quickly exposed, pointed cockhead, filling the air with the wet sound of [ghis] exaggerated gulping.";
	say "     Even as [ghe] draws directly from the source some of the heady fluid dribbles down to soak [ghis] [if dorinternal is true]crotch[otherwise]oversized ballsack[end if], air full with the beast's [gmasculine] aroma. Perhaps you should go in and assist Doran? Otherwise, you'll watch from a distance.";
	if player consents:
		say "     [if scalevalue of player < 4]Kneeling down[otherwise]Lowering yourself[end if] next to the [gdragon], you hands first move in to feel around the base of [ghis] now-fully erect cock. Fully hilted within [ghis] maw, your hands are bathed in [ghis] hot breath, saliva and precum-slicked lips pressing against your digits. [gche] pulls back only as far as to allow your wandering touch free reign, the slick and throbbing organ coating your fingers in the stuff.";
		say "     Moaning faintly against your touch, your hands lower to feel [ghis] ";
		if dorinternal is true:
			say "flush crotch. Your prodding inspection, though slicked, really illustrates how tight the insides of [ghis] genital slit are. The creature must be very sensitive, as every prod sends a jolt down [ghis] spine, flinching a groaning every time";
		otherwise:
			say "ample, taut orbs. Soaked in precum, the scaled sack yields against your grip, causing the creature to softly moan with each lewd grope";
		say ". Shall you have a taste? Else you'll only go this far.";
		if player consents:
			say "     Lips moving in to meet [ghis] slick [if dorinternal is true]cockbase[otherwise]balls[end if], you're senses are quickly flooded with the dragon's [gmasculine] flavour, bathing you in [ghis] shallow breath. [gche] seems further aroused by your lewd actions, gouts of precum gushing from between [ghis] lips with each throb.";
			now tempnum is 1;
		otherwise:
			now tempnum is 0;
		if dorroleint is 4:
			say "     Continuing to attend to [ghim], [ghe] looks like [ghe] won't be able to hold back for much longer. Shall you deny [ghis] release?";
			if player consents:
				say "     Is your intent to torment the [gdragon], making [ghim] go on for as long as possible before climaxing? If not, then you'll simply blueball [ghim].";
				if player consents:
					say "     Before [ghe] can go on any longer, you push [ghis] head free of [ghis] cock, slick thing slipping from between [ghis] lips easily, ";
					if tempnum is 1:
						say "before pulling [ghim] into a kiss. Sharing in the swill of sexual fluids still in [ghis] mouth, you play around with [ghim] until [ghe] slowly swallows the remains down, [ghis] excessively sputtering cock making a mess of the two of you until it gradually subsides";
					otherwise:
						say "to grin at [ghim]. Deliberately prevented from touching [ghim]self, [ghe] groan as you tease [ghim] so, slowly swallowing down what sexual fluids remain in [ghis] maw. [gchis] excessively sputtering cock is making quite a mess, rather difficult for you to avoid this close, until it gradually subsides";
					say ". Once it dies down enough you force Doran back to [ghis] task, groaning softly as [ghis] muzzle returns firmly planted in [ghis] crotch, only to be pulled back again before [ghe] can orgasm.";
					say "     After repeating this ritual many times your[if scalevalue of player > 3] massive[end if] monster is trembling, barely lucid in a haze of dizzying need, stomach visibly bulging with seemingly never-ending feast. You decide now is the best time, lest the poor creature pass out from exhaustion, now pulling against [ghis] muzzle as if to coax the last bit of energy from [ghim] to finally finish it.";
					if dornpbb > 0:
						say "     Almost immediately, even the most depraved thread of you is beginning to have seconds thoughts about blueballing the [gdragon] before subjecting [ghim] to this... [gchis] weary eyes suddenly go wide, what meagre roar [ghe] might've mustered completely drowned out by the ensuing torrent. For a second, you think [ghe] might be able to handle it, the sound of [ghis] orgasm gushing loudly between [ghis] lips, but by the second or third barrage [ghis] head is shot clear from [ghis] cock by the sheer force of [ghis] ejaculation, sent reeling back in whiplash and exposing the outside world to a terror that simply could not be contained...";
						say "     ...There, is, cum, EVERYWHERE. You had blacked out for a second. Doran is just writhing under a blanket of white stuff, having utterly coated just about everything. [if daytimer is night]It's really hard to see because the fire is completely smothered.[run paragraph on].[run paragraph on][end if]. The mess is nearly indescribable, [if tempnum is 1]feeling particularly bawdy and sampling the stuff until it becomes apparent that you'll never have the time to finish[otherwise]trying to clean yourself off, but all you succeed in doing is spreading it around[end if].";
						say "     '[one of]Oh no[or]Ugh[or]Heavens[or]Goodness[at random], [one of]I think winter has come[or]I'm immediately regretting that[or]That might not've been the wisest thing we've done[at random]...' Groaning as [ghe] tries to get back up, the place is simply an embarrassing mess. Weakly [ghe] tries to clean [ghim]self off, but none of the conventional methods really work, ultimately forcing you to spend the next few hours to help fix this terrible mess. ['][dorgr]['] or no, you simply can't leave the [gdragon] like this. It's going to take longer for things to return to normal, but at least it's now only on par with the more depraved corners of the wastes...";
					otherwise:
						say "     The dragon's weary, exhausted eyes go wide, weak roar muffled by the sound of [ghis] orgasm loudly gushing between [ghis] lips. Wincing, [ghe] has to fight to keep up with each immensely powerful barrage, neck bulging with each load as it descends into [ghis] rapidly ballooning stomach. You're briefly concerned with [ghis] exact limits, but it does eventually subside, allowing [ghim] to finally pull [ghis] scaled maw from [ghis] cock, both leaking a fair amount of [ghis] cum, as [ghe] pants in complete exhaustion.";
						say "     Now that things have died down, it looks like Doran might have trouble getting around, stomach almost bulging past [ghis] limbs. [gche], basically, has to roll onto [ghis] front and inch [ghim]self near the campfire. [gche]'s still a bit of a mess, but by this point [ghe]'s pretty much done. Maybe you should help [ghim]?";
						if player consents:
							say "     You decide to move in and clean the dragon off. This seems like a rare occasion where [ghe]'s totally spent, so at least [ghe]'s not making any more of a mess. [gche]'s still catching [ghis] breath, but seems grateful nonetheless.";
							say "     'M-[dorgr] is... Thank you.' [gche] seems to be nodding off a bit, so you leave [ghim] at that. You imagine [ghe][']ll be back on [ghis] feet in no time. Worst case scenario, [ghe][']ll probably have to roll everywhere now.";
						otherwise:
							say "     You decide to leave [ghim] to [ghis] own devices, catching [ghis] breath next to the fire.";
							say "     '[one of]M-[dorgr] really tests their dragon's limits[or]I beg [dorgr] we don't do that often[or]I-I'm sure I'll be fine, [dorgr][at random]...' You imagine [ghe]'ll be back on [ghis] feet in no time. Worst case scenario, [ghe][']ll probably have to roll everywhere now.";
				otherwise: [blueball]
					say "     Before [ghe] can go on any longer, you push [ghis] head free of [ghis] cock, slick thing slipping from between [ghis] lips easily, ";
					if tempnum is 1:
						say "before pulling [ghim] into a kiss. Sharing in the swill of sexual fluids still in [ghis] mouth, you play around with [ghim] until [ghe] slowly swallows the remains down, [ghis] excessively sputtering cock making a mess of the two of you until it gradually subsides";
					otherwise:
						say "to grin at [ghim]. Deliberately prevented from touching [ghim]self, [ghe] groan as you tease [ghim] so, slowly swallowing down what sexual fluids remain in [ghis] maw. [gchis] excessively sputtering cock is making quite a mess, rather difficult for you to avoid this close, until it gradually subsides";
					say ". Once it dies down, your order the dragon to clean [ghim]self off and go about [ghis] business. Obliging you it's somewhat of a slow task, made worse by [ghis] constantly oozing dick, which seems intensified by the orgasm denial.";
					say "     '[one of]Oh[or]Mnn[or]Hm[at random], [one of]I hope I entertained [dorgr][or]I hope [dorgr] will let me come next time[or][dorgr] torments their dragon so[at random]...' Whining as [ghe] does, [ghe] still obliges your orders, cleaning you as well before laying next to the fire and trying to calm [ghim]self down.";
					now dornpbb is 2;
			otherwise: [Allow orgasm]
				say "     It doesn't take much longer before your [gdragon] lets out a loud groan, muffled by the the sound of [ghis] orgasm[if dornpbb > 0] loudly[end if] gushing between [ghis] lips";
				if dornpbb > 0:
					say ". Wincing slightly, it's a bit of a fight for [ghim] to keep up with each powerful barrage, neck bulging with each load as it descends into [ghis] slowly ballooning stomach. No doubt [ghe]'s been quite pent up from being denied orgasm before";
				otherwise:
					say ". Furrowing [ghis] brow, [ghe]'s clearly distracted with keeping up to each powerful barrage, each exaggerated gulp causing [ghis] stomach to gradually expand";
				say ". [gchis] seed begins to ooze out from between [ghis] lips, [if tempnum is 1]inviting you to taste[otherwise]staining your hands[end if].";
				say "     [gchis] flow eventually does subside, and as it does [ghe] starts to pull [ghim]self free and lick [ghim]self clean, [if tempnum is 1]meeting your continued attendance in a brief kiss[otherwise]attending to your mess afterwards[end if].";
				say "     '[one of]Ooh[or]Whew[or]Aah[at random], [if dorroleint is 4][one of]I hope [dorgr] was satisfied by the show[or]I hope I did [dorgr] proud[or]I must thank [dorgr] for that[at random][otherwise][one of]I'm sure that was quite a show[or]That was fun[or]That was certainly interesting[at random][end if]!' [if dornpbb > 0]Considerably[otherwise]Somewhat[end if] bloated from the whole ordeal, [ghe] slowly returns to the campfire once everything is taken care off, freeing you to go about your business once more.";
		otherwise: [not max dom -- allow orgasm]
			say "     It doesn't take much longer before your [gdragon] lets out a loud groan, muffled by the the sound of [ghis] orgasm[if dornpbb > 0] loudly[end if] gushing between [ghis] lips. Furrowing [ghis] brow, [ghe]'s clearly distracted with keeping up to each powerful barrage, each exaggerated gulp causing [ghis] stomach to gradually expand. [gchis] seed begins to ooze out from between [ghis] lips, [if tempnum is 1]inviting you to taste[otherwise]staining your hands[end if].";
			say "     [gchis] flow eventually does subside, and as it does [ghe] starts to pull [ghim]self free and lick [ghim]self clean, [if tempnum is 1]meeting your continued attendance in a brief kiss[otherwise]attending to your mess afterwards[end if].";
			say "     '[one of]Ooh[or]Whew[or]Aah[at random], [one of]I'm sure that was quite a show[or]That was fun[or]That was certainly interesting[at random]!'  [if dornpbb > 0]Considerably[otherwise]Somewhat[end if] bloated from the whole ordeal, [ghe] slowly returns to the campfire once everything is taken care off, freeing you to go about your business once more.";
	otherwise: [Watch from Afar]
		say "     You could give the dragon something to watch by touching yourself during [ghis] endeavour. Shall you? Else, you'll choose to stay aloof.";
		if player consents:
			say "     Doran's endeavours to suck [ghim]self off are briefly interrupted when [ghe] sees what you're doing, exposing your [bodytype of player] body before [ghis] lewd gaze. [gche] does quickly get back on track, though now [ghis] attention is split between attending [ghim]self and watching you.";
			if cocks of player > 0:
				say "     Cock[smn] quickly driven hard in front of the lizard, you slowly stroke along [if cocks of player > 1]their[otherwise]its[end if] [cock size desc of player] length";
			otherwise:
				say "     Cunt[sfn] quickly dripping wet in front of the lizard, you slowly fondle along [if cocks of player > 1]their[otherwise]its[end if] [cunt size desc of player] entrance";
			say ". The whole distraction makes it very difficult for the dragon to maintain a consistent pace.";
			say "     Continuing to attend [ghim]self";
			now tempnum is 1;
		otherwise:
			say "     Encouraging [ghim] on";
			now tempnum is 0;
		say ", it doesn't take the creature long before [ghe] looks like [ghe]'s going to climax. Shall you allow [ghim] to get off right away? Otherwise, you'll advise [ghim] to take it a bit slower.";
		if player consents:
			say "     Egging [ghim] on, [ghe] visibly trembles under the weight of [ghis] incoming bliss. With one final plunge, [ghe] lets out a muffled groan, slightly drowned out by the sound of [ghis] gushing dick, gullet bulging with each gout of [ghis] immense release";
			if dornpbb > 0:
				say ". [gche] looks like [ghe]'s being pushed to the very limit of what [ghe] can hold, stomach bulging obscenely to abide the torrential release.";
			otherwise:
				say ". [gche] seems able to handle all the cum, stomach bulging a fair bit to abide it.";
			if tempnum is 1:
				if cocks of player > 0 and dorroleint is 4:
					say "     The sheer display seems like more than enough to bring you close to bliss. Shall you shame [ghim] with your release?";
					if player consents:
						say "     Drawing closer to [ghim], you freely aim your dick[smn] for the [gdragon]'s stuffed snout, just before you cry out, staining [ghim] with your [cum load size of player] load, much to [ghis] embarrassed expression. Once the fervour dies down, [ghe] finally pulls [ghim]self free of [ghis] cum-painted cock before [ghe] starts licking [ghim]self clean of both [ghis] mess and yours.";
					otherwise:
						say "     You finally cry out, staining the floor in front of the [gdragon] with your [cum load size of the player] load. This seems to excite [ghim], prolonging [ghis] bliss for a few seconds longer. Once the fervour dies down, [ghe] pulls free of [ghis] cum-painted cock before [ghe] starts licking [ghim]self clean of the mess.";
				otherwise:
					say "     The display is enough to let you catch up with the [gdragon], finally crying out and staining the ground with your [if cocks of player > 0][cum load size of player] load[otherwise]juices[end if]. This seems to excite [ghim], prolonging [ghis] bliss for a few seconds longer. Once the fervour dies down, [ghe] pulls free of [ghis] cum-painted cock before [ghe] starts licking [ghim]self clean of the mess.";
			otherwise:
				say "     You can't help but be at least slightly aroused by the display, but you nonetheless retain your composure. Once [ghis] fervour finally dies down, [ghe] pulls free of [ghis] cum-painted cock before [ghe] starts licking [ghim]self clean of the mess.";
			say "     '[one of]Ooh[or]Whew[or]Aah[at random], [if dorroleint is 4][one of]I hope [dorgr] was satisfied by the show[or]I hope I did [dorgr] proud[or]I must thank [dorgr] for that[at random][otherwise][one of]I'm sure that was quite a show[or]That was fun[or]That was certainly interesting[at random][end if]!' [if dornpbb > 0]Considerably[otherwise]Somewhat[end if] bloated from the whole ordeal, [ghe] slowly returns to the campfire once everything is taken care of, freeing you to go about your business once more.";
		otherwise: [Prolong]
			say "     You insist that [ghe] dial it down a bit, the [gdragon] obliging your command, [ghis] motion becoming more exaggerated and audibly wet. [if tempnum is 1]The slower pace allows [ghim] to fixate on you, until [ghe]'s practically hypnotized by your display, such that [ghe]'ll go exactly the speed you're going[otherwise][gche] remains ever-mindful of your presence, searching your expressions for what motions and speeds please you the most[end if].";
			if dorroleint is 4:
				say "     Visibly trembling, it looks like Doran won't be able to hold back much longer. Perhaps you could make [ghim] stop?";
				if player consents:
					say "     Is your intent to torment [ghim] and prolong [ghis] road to bliss for as long as possible? Otherwise, you'll just blueball [ghim] outright.";
					if player consents:
						say "     You order [ghim] to pull free of [ghis] dick, to which [ghe] immediately obliges. Right as [ghe] pulls [ghim]self free, [ghe]'s embarrassed to find [ghim]self painted with a substantial gout of [ghis] precum, making a terrible mess of [ghis] face. You order the [gdragon] to lick [ghim]self clean for a bit, giving [ghim] the time to cool down, before having [ghim] return to sucking [ghim]self off.";
						say "     This seems to work for a couple rounds, but you eventually have no choice but to let [ghim] orgasm, given how [ghe] looks like [ghe]'s about to pass out from exhaustion[if tempnum is 1] -- to say nothing of your own, imminent bliss[end if].";
						say "     On cue[if tempnum is 1] with your own climax[end if] [ghe] finally lets out a weakened groan";
						if dornpbb > 0:
							say "... You're beginning to wonder if blueballing the [gdragon] prior and then doing this was the smartest move. [gche]'s able to down maybe the first few barrages until [ghis] maw is fired clean from the rod. Now free from anyone's control, it has a half-second to rest before the next gout, lowering itself to aim directly at you!";
							say "     ...There, is, cum, EVERYWHERE. You had blacked out for a second. Doran is just writhing under a blanket of white stuff, having utterly coated just about everything. [if daytimer is night]It's really hard to see because the fire is completely smothered.[run paragraph on][end if]. The mess is nearly indescribable, you try to clean yourself off but all you succeed in doing is spreading it around.";
							say "     '[one of]Oh no[or]Ugh[or]Heavens[or]Goodness[at random], [one of]I think winter has come[or]I'm immediately regretting that[or]That might not've been the wisest thing we've done[at random]...' Groaning as [ghe] tries to get back up, the place is simply an embarrassing mess. Weakly [ghe] tries to clean [ghim]self off, but none of the conventional methods really work, ultimately forcing you to spend the next few hours to help fix this terrible mess. '[dorgr]' or no, you simply can't leave the [gdragon] like this. It's going to take longer for things to return to normal, but at least it's now only on par with the more depraved corners of the wastes...";
						otherwise:
							say "     The dragon's weary eyes finally go wide, weak roar muffled by the sound of [ghis] orgasm loudly gushing between [ghis] lips. Wincing, [ghe] has to fight to keep up with each immensely powerful barrage, neck bulging with each load as it descends into [ghis] rapidly ballooning stomach. You're briefly concerned with [ghis] exact limits, but it does eventually subside, allowing [ghim] to finally pull [ghis] scaled maw from [ghis] cock, both leaking a fair amount of [ghis] cum, as [ghe] pants in complete exhaustion.";
							say "     Now that things have died down, it looks like Doran might have trouble getting around, stomach almost bulging past [ghis] limbs. [gche], basically, has to roll onto [ghis] front and inch [ghim]self near the campfire. [gche]'s still a bit of a mess, but by this point [ghe]'s pretty much done. Maybe you should help [ghim]?";
							if player consents:
								say "     You decide to move in and clean the dragon off. This seems like a rare occasion where [ghe]'s totally spent, so at least [ghe]'s not making any more of a mess. [gche]'s still catching [ghis] breath, but seems grateful nonetheless.";
								say "     'M-[dorgr] is... Thank you.' [gche] seems to be nodding off a bit, so you leave [ghim] at that. You imagine [ghe][']ll be back on [ghis] feet in no time. Worst case scenario, [ghe][']ll probably have to roll everywhere now.";
							otherwise:
								say "     You decide to leave [ghim] to [ghis] own devices, catching [ghis] breath next to the fire.";
								say "     '[one of]M-[dorgr] really tests their dragon's limits[or]I beg [dorgr] we don't do that often[or]I-I'm sure I'll be fine, [dorgr][at random]...' You imagine [ghe][']ll be back on [ghis] feet in no time. Worst case scenario, [ghe][']ll probably have to roll everywhere now.";
					otherwise: [blueball]
						if tempnum is 1 and cocks of player > 0:
							say "     You don't think you'll be able to hold back your own bliss, however. Shall you use it to shame [ghim]?";
							if player consents:
								now tempnum is 2;
							otherwise:
								now tempnum is 0;
						if tempnum is 2:
							say "     You order [ghim] to pull free of [ghis] dick, to which [ghe] immediately obliges, just as your orgasm. Right as [ghe] pulls [ghim]self free, [ghe]'s embarrassed to find [ghim]self painted with a substantial gout of [ghis] precum as well as your [cum load size of player] load, making a terrible mess of [ghis] face. You order the [gdragon] to lick both [ghim] and yourself clean for a bit, allowing [ghim] to gradually cool down from [ghis] near-climax. The task is somewhat slow, [ghis] dick's oozing intensified by the orgasm denial.";
						otherwise:
							say "     You order [ghim] to pull free of [ghis] dick, to which [ghe] immediately obliges. Right as [ghe] pulls [ghim]self free, [ghe]'s embarrassed to find [ghim]self painted with a substantial gout of [ghis] precum, making a mess of [ghis] face. You order the [gdragon] to lick [ghim]self clean for a bit, allowing [ghim] to gradually cool down from [ghis] near-climax. The task is somewhat slow, [ghis] dick's oozing intensified by the orgasm denial.";
						say "     '[one of]Oh[or]Mnn[or]Hm[at random], [one of]I hope I entertained [dorgr][or]I hope [dorgr] will let me come next time[or][dorgr] torments their dragon so[at random]...' Whining as [ghe] does, [ghe] still obliges your orders, cleaning you as well before laying next to the fire and trying to calm [ghim]self down.";
						now dornpbb is 2;
				otherwise: [let him orgasm]
					say "     It doesn't take much longer before your [gdragon] lets out a loud groan, muffled by the the sound of [ghis] orgasm[if dornpbb > 0] loudly[end if] gushing between [ghis] lips";
					if dornpbb > 0:
						say ". Wincing slightly, it's a bit of a fight for [ghim] to keep up with each powerful barrage, neck bulging with each load as it descends into [ghis] slowly ballooning stomach. No doubt [ghe]'s been quite pent up from being denied orgasm before";
					otherwise:
						say ". Furrowing [ghis] brow, [ghe]'s clearly distracted with keeping up to each powerful barrage, each exaggerated gulp causing [ghis] stomach to gradually expand";
					say ". Once [ghis] fervour finally dies down, [ghe] pulls free of [ghis] cum-painted cock before [ghe] starts licking [ghim]self clean of the mess.";
					say "     '[one of]Ooh[or]Whew[or]Aah[at random], [if dorroleint is 4][one of]I hope [dorgr] was satisfied by the show[or]I hope I did [dorgr] proud[or]I must thank [dorgr] for that[at random][otherwise][one of]I'm sure that was quite a show[or]That was fun[or]That was certainly interesting[at random][end if]!' [if dornpbb > 0]Considerably[otherwise]Somewhat[end if] bloated from the whole ordeal, [ghe] slowly returns to the campfire once everything is taken care of, freeing you to go about your business once more.";
			otherwise: [not dominant enough -- allow orgasm]
				say "     It doesn't take much longer before your [gdragon] lets out a loud groan, muffled by the the sound of [ghis] orgasm[if dornpbb > 0] loudly[end if] gushing between [ghis] lips";
				if dornpbb > 0:
					say ". Wincing slightly, it's a bit of a fight for [ghim] to keep up with each powerful barrage, neck bulging with each load as it descends into [ghis] slowly ballooning stomach. No doubt [ghe]'s been quite pent up from being denied orgasm before";
				otherwise:
					say ". Furrowing [ghis] brow, [ghe]'s clearly distracted with keeping up to each powerful barrage, each exaggerated gulp causing [ghis] stomach to gradually expand";
				say ". Once [ghis] fervour finally dies down, [ghe] pulls free of [ghis] cum-painted cock before [ghe] starts licking [ghim]self clean of the mess.";
				say "     '[one of]Ooh[or]Whew[or]Aah[at random], [one of]I'm sure that was quite a show[or]That was fun[or]That was certainly interesting[at random]!' [if dornpbb > 0]Considerably[otherwise]Somewhat[end if] bloated from the whole ordeal, [ghe] slowly returns to the campfire once everything is taken care of, freeing you to go about your business once more.";

Section 3.2 - Doran NPC Submissive Sex Pool

to say dorsub_1: [Anal Catching] [BODY MODDED]
	say "     You [if dorroleint is 4]order[otherwise]ask[end if] the [gdragon] to turn away and offer [ghim]self to you. Eager to please, [ghe] wheels around, [if scalevalue of player < 4]lowering [ghim]self to the ground before [end if]hiking [ghis] tail over to leave your entry exposed. Shapely ass revealed before you, [ghe]'s already quite aroused by the prospect of your imminent abuse, partially exposed tool staining the dirt with its[if dorballmod > 0] excessive[end if] pre.";
	say "     '[one of]Ah[or]Oh[or]Mm[or]Very well[at random], [dorgr], [if dorroleint is 4][one of]completely ruin me[or]please abuse me[or]I ache for them[at random][otherwise][one of]don't hold back[or]I'm ready for anything they've got[or]I'm all theirs[at random][end if].' You expose your [cock size desc of player] dick[smn] before the open air, [if cock length of player > 17 or dorroleint is 4]a very eager, needy look in [ghis] eyes at the prospect of getting[otherwise]clearly eager to be[end if] impaled by [if cocks of player > 1]one of those things[otherwise]the thing[end if].";
	say "     Approaching the [gdragon], you more rigorously make yourself hard by grinding[if cocks of player > 1] one of[end if] your hardening shaft[smn] between the cheeks of [ghis] well-toned rear, the immaculate and smooth caressing along your length. Slowly, you sink the[if cockname of player is listed in infections of bluntlist] blunt[end if] head of[if cocks of player > 1]one of [end if] your [if cock length of player > 17]impressive [end if]tool[smn] past [ghis] fleshy, yielding anal ring, each successive inch forcing out a series of approving moans from the beast.";
	if cock length of player > 17:
		say "     Very quickly, [ghis] supple hole becomes increasingly strained to abide your member, but this only this only seems to excite the [gdragon].";
		say "     '[one of]More, [dorgr].[run paragraph on] I need it all[or]Further, [dorgr], further[at random]!' [ghe] [if dorroleint is 4]beg[otherwise]ask[end if]s, and with a bit of work and pre's slick lubrication [ghis] tight tailpipe grows increasingly willing to take your sizeable tool[if cockname of player is listed in infections of knotlist], up to the knot[end if], allowing you the freedom to start fucking [ghim] proper.";
	otherwise:
		say "     [gche] shows absolutely no difficulty in taking your member[if cockname of player is listed in infections of knotlist], even tying with it almost immediately[end if]. [gche] doesn't seem to mind your ease, revelling in being [if dorroleint is 4]shamelessly used[otherwise]ridden by[end if] you, supple abyss almost overwhelming in how [if dorroleint is 4]obligingly[otherwise]assertively[end if] it milks the organ.";
		say "     '[one of]Fuck me, [dorgr][or]Harder, [dorgr], harder[at random]!' [gche] [if dorroleint is 4]plead[otherwise]demand[end if]s, the creature greedy for your throbbing meat as you're compelled to start fucking [ghim] proper.";
	say "     [If scalevalue of player > 3]Body visibly rocking against each successive thrust[otherwise]Larger body barely moved by[end if] each successive thrust, [if cockname of player is not listed in infections of internallist]your balls audibly slap against [ghim], a wordless remark on[otherwise]overtaken by[end if] your rising, wanton fervor. Your embrace on the reptile grows increasingly slick, coated by a thin veneer of sweat. [if dorballmod > 0]You hear wet sounds with each motion, as [ghe] seems to fire off a considerable gout of precum with each one.[end if]";
	say "     '[one of]P-please[or]M-more[or]A-ah[at random], [if dorroleint is 4][one of]use me like the s-slutty cum dumpster I am[or]fill me with M-[dorgr]'s cum[or]I n-need [dorgr]'s cum[at random][otherwise][one of]M-[dorgr][or]d-don't hold back, [dorgr][or]don't s-stop, [dorgr][at random][end if]...!' At the very cusp of your bliss, your mind is still clear enough to determine if you'd like to pull out at the last second, shall you? Else you will give the greedy [gdragon] what [ghe] wants.";
	if player consents:
		say "     Before you are completely overtaken, you wrench your [cock size desc of player] cock from the beast, quickly jacking it[if cocks of player > 2] and one of its brothers[otherwise if cocks of player is 2] and its brother[end if] off before you cry out, coating [ghis] ass[if scalevalue of player > 3] and back[end if] with [if cock width of player > 24]voluminous [end if]gouts of your thick, virile seed[if cock width of player > 24]; so substantial your payload that you render the beast a shameful, coated mess of cum[end if]. It takes you some time to recover, eventually [if scalevalue of player < 4]climbing[otherwise]pulling yourself[end if] off. The [gdragon] lays there for a bit, panting [ghim]self in the wake of being ravaged. [gche] eventually does crawl back to [ghis] feet, looking satisfied";
		if dorroleint is 4:
			say ". You, on the other hand, are a bit of a mess. Command your [gdragon] to clean you off?";
			if player consents:
				say "     You gesture to your oozing, cum-stained cock[smn], Doran immediately picking up on your command and moving up to you, slick tongue quick to slather [if cocks of player > 1]them[otherwise]it[end if] with attention.";
				say "     '[one of]Mmm[or]Ah[or]Yes[at random]... [if cock width of player > 24][one of][dorgr] made such a big mess, this pleases me[or][dorgr] offers me so much[or]Such a messy [dorgr][at random][otherwise][one of]I love the taste of [dorgr][or]it pleases me to clean [dorgr][or]I can't get enough of [dorgr][at random][end if].' Intermittent praise offered up between cleaning you off, the [gdragon] takes great pains to caress along your[if cock length of player > 17]substantial [end if] length, until you have naught to offer [ghim] to clean... Though [ghe] [ghim]self remains a sullied[if cock length of player > 17], sore[end if] mess.";
		otherwise:
			say ".";
	otherwise:
		say "     Succumbing to your overwhelming urges, [if cockname of player is listed in infections of knotlist and cock length of player > 17]you make one final push, tying yourself with the beast before you cry out[otherwise if cockname of player is listed in infections of knotlist]you soon cry out, tying your cock within [ghis] fleshy abyss one last time[otherwise]you soon cry out, hilting your cock within [ghis]  fleshy abyss[end if], gouts of your thick, [if cock width of player > 24]voluminous[otherwise]virile[end if] seed flooding [ghis] depths[if cocks of player > 2], its brothers staining [ghis] behind and crotch[otherwise if cocks of player is 2], its brother staining [ghis] behind and crotch[end if]";
		if cock width of player > 24:
			say ". So substantial your payload that the beast visibly bloats to abide it, much to [ghis] twisted approval";
		say ". It takes you some time to recover, eventually [if scalevalue of player < 4]climbing[otherwise]pulling yourself[end if] off. The [gdragon] lays there for a bit, panting [ghim]self in the wake of being ravaged. [gche] eventually does crawl back to [ghis] feet, looking satisfied";
		if dorroleint is 4:
			say ". You, on the other hand, are a bit of a mess. Command your [gdragon] to clean you off?";
			if player consents:
				say "     You gesture to your oozing, cum-stained cock[smn], Doran immediately picking up on your command and moving up to you. [gchis] slick tongue is quick to slather [if cocks of player > 1]them[otherwise]it[end if] with attention.";
				say "     '[one of]Mmm[or]Ah[or]Yes[at random]... [if cock width of player > 24][one of][dorgr] made such a big mess, this pleases me[or][dorgr] offers me so much[or]Such a messy [dorgr][at random][otherwise][one of]I love the taste of [dorgr][or]it pleases me to clean [dorgr][or]I can't get enough of [dorgr][at random][end if].' Intermittent praise offered up between cleaning you off, the [gdragon] takes great pains to caress along your[if cock length of player > 17]substantial [end if] length, until you have naught to offer [ghim] to clean... Though the same can't be quite be said for [ghim]self, a sweat-soaked[if cock length of player > 17], sore,[end if] and cum-leaking mess.";
		otherwise:
			say ".";
	if dornpbb is 1, now dornpbb is 2;
	say "     '[one of]My thanks[or]Many thanks[or]My appreciation[at random], [dorgr]. [if dorroleint is 4][one of]I long for their further abuse[or]Please don't be afraid to use their [gdragon] again[or]Their treatment brings me immense pleasure[at random][otherwise][one of]I hope they enjoyed themself[or]That was fun[or]I look forward to the next bout[at random][end if].' Yourself satisfied [ghe] goes back off on [ghis] own to clean up the devastation you've wrought.";

to say dorsub_2: [Cock Oral] [BODY MODDED]
	say "     [if dorroleint is 4]Without having to say a word[otherwise]A little awkwardly[end if] you set yourself down, exposing your [cock size desc of player], [cock of player] dick[smn] before the [gdragon]. [if dorroleint is 4]Immediately, [ghe]'s upon you, easily understanding what you need of [ghim],[otherwise]Gesturing [ghim] over [ghe] makes [ghis] way to you, clearly eager to please[end if] and looking rather excited by the offering.";
	say "     '[if dorroleint is 4][one of][dorgr], nothing would please their [gdragon] more[or][dorgr], their [gdragon] longs to taste them[or]I see [dorgr] is in need of me[at random][otherwise][one of]I'd be happy to oblige [dorgr][or][dorgr]'s very eager for my affection, I see[or]it certainly looks like [dorgr]'s excited to see me[at random][end if]...' The [gdragon] goes quiet for a moment, [ghis] scaled lips parting to engulf [if cocks of player > 2]the head of one of them, taloned hands moving to caress its brothers[otherwise if cocks of player is 2]the head of one of them, taloned hand moving to caress its brother[otherwise]its head[end if]. Humid breath washing over your lower torso, [if dorroleint is 4][ghe]'s rather gentle in this initial, oral embrace, clearly in love with the taste of your flesh[otherwise]you abide [ghis] thick tongue's initial, teasing query[end if].";
	If dortitmod > 0:
		say "     [gchis] ample breasts press gently against you, perhaps you could [if dorroleint is 4]command[otherwise]ask[end if] [ghim] to make use of them?";
		if player consents:
			now tempnum is 1;
			say "     Grinning slightly, [ghe] pulls free of your dick, now slicked by [ghis] saliva, before shifting to encompass [if cocks of player > 2]two of[otherwise if cocks of player is 2]both of[otherwise]one of[end if] your dick[smn] between [ghis] vast crevasse. [gchis] ample, scaled cleavage yielding around your rigid length[smn], [ghe] starts to build up a motion against [if cocks of player > 1]them[otherwise]it[end if], attending tongue slicking [ghis] efforts with a mix of [ghis] saliva and your[if cock width of player > 24] abundant[end if] precum.";
		otherwise:
			now tempnum is 0;
	otherwise:
		now tempnum is 0;
	say "     '[one of]Oh[or]Hm[or]Ah[at random], ";
	if dorroleint is 4:
		say "[if cock length of player > 17][dorgr] [one of]never ceases to impress me with their size[or]is so very big and intimidating[or]has such enviable assets[at random][otherwise][one of][dorgr] never ceases to impress me with their taste[or]I hope I can satisfy [dorgr][or]what [dorgr] offers me is such a treat[at random][end if]";
	otherwise:
		say "[if cock length of player > 17][dorgr] [one of]is quite the challenging prospect[or]certainly tests the limits of my ability[or]makes me quite jealous of their size[at random][otherwise][one of]I hope [dorgr] is comfortable[or][dorgr] is in for some fun now[or][dorgr] is going to love this[at random][end if]";
	say "!' Taking a moment to speak up, ";
	if dorroleint is not 4 or (dorroleint is 4 and a random chance of 1 in 3 succeeds) or dornpbb > 0:
		say "[ghe] continues on, '...Though, [if dorroleint is 4][one of]I must beg for the opportunity to satisfy myself[or]they make me ache with need[at random][otherwise][one of]my own need is overwhelming[or]this task leaves me quite aroused[at random][end if], might they be so obliging?' You imagine [ghe][']d not be as capable of pleasuring you with [ghis] attention split, shall you oblige [ghis] request? Otherwise you'll ensure [ghis] attention remains solely on you.";
		if player consents:
			say "     You decide to allow [ghim] this opportunity, to which [ghe] seems grateful, hand moving [if cocks of player > 2]away from your spare cocks to attend [ghis] own[otherwise if cocks of player > 1]away from your spare cock to attend [ghis] own[otherwise]over to attend [ghis] own cock[end if] before [if tempnum is 0][ghis] maw envelops your flesh a second time[otherwise][ghe] gets back to work[end if], [ghis] efforts becoming much more deliberate now. Dexterous, slick appendage eager to [if tempnum is 0]wrap around your [cock size desc of player] tool[otherwise]tease and caress along your [cock size desc of player] tool[smn][end if], [ghe] exhibits [if dorroleint is 4]an obsessive[otherwise]a clear[end if] desire to satisfy your need[if cock length of player > 15 and dorroleint is 4], more than eager to hilt your impressive dick within [ghis] supple confines, at expense to [ghis] own comfort[otherwise if cock length of player > 15], frequently pushing the limits of [ghis] endurance to better engulf your impressive dick[end if]. As [ghis] need for self-pleasure rises, so does the pace in which [ghe] [if tempnum is 0]bob[otherwise]grind[end if]s against you become erratic, though it's more than sufficient in bringing you closer to bliss.";
			say "     The wet sounds of [ghis] attendance filling the air, it doesn't take you long before you reach your limit! You can afford to free yourself to get off on the [gdragon]'s [if tempnum is 1]voluptuous tits and [end if]unsuspecting face, should you? Else you will give [ghim] what [ghe] clearly wants.";
			if player consents:
				say "     Right at the very last second you pull your dick[if tempnum is 1][smn][end if] free of the beast, which soon erupts upon [ghis] briefly dazed visage[if tempnum is 1] and abundant chest[end if]. Trapped in the throes of [ghis] own[if dorballmod > 0], excessively messy[end if] bliss[if dornpbb > 0], its intensity worsened by [ghis] prior neglect[end if], [ghe] can only regard in demeaning act with a wanton embrace, form a writhing and twitching mess as the [gdragon] lets you paint [ghim] with your [cum load size of player] load. When all is said is done [ghe]'s a shameful sight, wallowing in a [if dorballmod > 0]pool[otherwise]puddle[end if] of [ghis] own spunk[if dorroleint is 4 and tempnum is 0], tongue desperate to lick clean yours from [ghis] face[otherwise if dorroleint is 4], tongue desperate to lick clean yours from [ghis] face and body[end if].";
				say "     '[one of]Oh[or]Ah[at random], [if dorroleint is 4][one of]such is [dorgr]'s punishment for my weak will[or][dorgr]'s [gdragon] deserved that[at random][otherwise][one of][dorgr]'s a sneaky one[or]quite the trick there, [dorgr][or][dorgr] certainly got me there[at random][end if].' [gchis] comments following after [ghe] obediently licks you clean of your [if cock width of player > 24]substantial [end if]mess, [ghe] pull away and lets you free once [ghe]'s satisfied with [ghis] work, no doubt to attend to [ghis] own shameful state.";
			otherwise:
				say "     It takes only a few seconds longer before your dick[smn] erupt[smv], flooding the beast's [if tempnum is 1]open maw and staining [ghis] ample chest with your virile seed,[otherwise]maw and[end if] forcing [ghim] between swallowing down your [cum load size of player] payload and the throes of [ghis] own[if dorballmod > 0], excessively messy[end if] bliss[if dornpbb > 0], its intensity exacerbated by [ghis] prior neglect[end if], allowing you watch the [gdragon]'s writhing, twitching form as ";
				if tempnum is 1:
					say "[if cocks of player > 2]your other rods make a further mess of [ghim], dripping down to mix with[otherwise if cocks of player is 2]your other rod makes a further mess of [ghim], dripping down to mix with[otherwise if dorballmod > 0][ghe] wallows in a pool of[otherwise][ghe] wallows in a puddle of[end if] [ghis] own spunk.";
				otherwise:
					say "[if cocks of player > 2]your unattended organs stain the ground, mixing with[otherwise if cocks of player is 2]your unattended organ stains the ground, mixing with[otherwise if dorballmod > 0][ghe] wallows in a pool of[otherwise][ghe] wallows in a puddle of[end if] [ghis] own spunk.";
				say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you're quickly cleaned off before the [gdragon] pulls away and lets you go, no doubt so [ghe] can attend to [ghis] own shameful state.";
		otherwise:
			if dornpbb is 1, now dornpbb is 2;
			say "     You decide against it, ";
			if tempnum is 1:
				say "to which [ghe] [if dorroleint is 4]quickly nods in agreement, clearly trying to distance [ghim]self from making the request in the first place[otherwise]obliges with little further thought on the matter[end if] before returning [ghis] attention to your cock[smn]";
			otherwise:
				say "to which [ghe] [if dorroleint is 4]quickly nods in agreement, clearly trying to distance [ghim]self from making the request in the first place before [ghis] maw envelops[otherwise]obliges with little further thought on the matter, maw enveloping[end if] your cock a second time";
			say ", [ghis] efforts becoming much more deliberate now. Dexterous, slick appendage eager to [if tempnum is 0]wrap around[otherwise]tease and caress along[smn][end if] your [cock size desc of player] tool, [ghe] displays [if dorroleint is 4]an obsessive[otherwise]a clear[end if] desire to satisfy your need[if tempnum is 1][otherwise if cock length of player > 15 and dorroleint is 4], more than eager to hilt your impressive dick within [ghis] supple confines, at expense to [ghis] own comfort[otherwise if cock length of player > 15], frequently pushing the limits of [ghis] endurance to better engulf your impressive dick[end if]. [gche] retains a very methodical, calculated pace,[if cocks of player > 2] occasionally switching to the other dicks in [ghis] grip to keep you sensitive to [ghis] tongue's influence,[otherwise if cocks of player > 1] occasionally switching to the other dick in [ghis] grip to keep you sensitive to [ghis] tongue's influence,[end if] which proves effective at rapidly sending you ever-closer to bliss.";
			if dorroleint is 4:
				say "     The wet sounds of [ghis] attendance filling the air, it doesn't take you long before you reach your limit! You can command [ghim] to let go and free yourself to get off on the [gdragon]'s [if tempnum is 1]voluptuous tits and [end if]obedient face, should you? Else you will give [ghim] what [ghe] clearly wants.";
				if player consents:
					say "     Words strained under the weight of your passion, you order the beast to let go, doing as you command just before your dick[smn] erupt upon [ghis] obliging snout[if tempnum is 1] and abundant chest[end if]. Regarding in demeaning act with a wanton embrace, [ghe] patiently abides being so irreverently painted by your [cum load size of player] load. When all is said and done [ghe]'s naught but an embarrassing mess, eagerly licking your spunk off [ghim].";
					say "     '[one of]Oh[or]Ah[at random], [one of]I am unworthy of [dorgr]'s countenance[or][dorgr]'s [gdragon] deserves being shamed so[at random].' [gchis] comments following after [ghe] obediently licks you clean of your [if cock width of player > 24]substantial [end if]mess, [ghe] pulls away and lets you free once [ghe]'s satisfied with [ghis] work, no doubt to attend to [ghis] own shameful state.";
				otherwise:
					say "     You finally cry out, dick[smn] erupting against the beast's skilled tongue[if tempnum is 1] and chest[end if]. With a disciplined determination, [ghe] milks you dry of every last drop of your [cum load size of player] payload, ";
					if tempnum is 0:
						say "[if cocks of player > 2]talon bunching up at your other cock's head that [ghe] might lick it clean when [ghe] concludes with the first, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 2]talon bunching up at your other cock's head so [ghe] can lick it clean when [ghe] concludes with the first[otherwise]licking it clean once you might offer no more for [ghim][end if]";
					otherwise:
						say "[ghis] ample clevage considerably slicked by the whole mess";
					say "[if cock width of player > 24].[run paragraph on] [gche] doesn't seem even remotely phased by the volume you surrender to [ghim], revelling in the sheer excess[end if].";
					say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";
			otherwise:
				say "     You finally cry out, dick[smn] erupting against the beast's skilled tongue[if tempnum is 1] and chest[end if]. With a disciplined determination, [ghe] milks you dry of every last drop of your [cum load size of player] payload, ";
				if tempnum is 0:
					say "[if cocks of player > 2]talon bunching up at your other cock's head that [ghe] might lick it clean when [ghe] concludes with the first, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 2]talon bunching up at your other cock's head so [ghe] can lick it clean when [ghe] concludes with the first[otherwise]licking it clean once you might offer no more for [ghim][end if]";
				otherwise:
					say "[ghis] ample clevage considerably slicked by the whole mess";
				say "[if cock width of player > 24].[run paragraph on] [gche] doesn't seem even remotely phased by the volume you surrender to [ghim], revelling in the sheer excess[end if].";
				say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";    
	otherwise:
		say "[ghis] [if tempnum is 1]tongue caresses along you cock[smn] once more[otherwise]maw envelops your cock a second time[end if] as [ghe] returns to [ghis] work, [ghis] efforts now much more deliberate. Dexterous, slick appendage eager to [if tempnum is 0]wrap around[otherwise]tease and caress along[smn][end if] your [cock size desc of player] tool, [ghe] displays [if dorroleint is 4]an obsessive[otherwise]a clear[end if] desire to satisfy your need[if tempnum is 1][otherwise if cock length of player > 17 and dorroleint is 4], more than eager to hilt your impressive dick within [ghis] supple confines, at expense to [ghis] own comfort[otherwise if cock length of player > 17], frequently pushing the limits of [ghis] endurance to better engulf your impressive dick[end if]. [gche] retains a very methodical, calculated pace,[if cocks of player > 2] occasionally switching to the other dicks in [ghis] grip to keep you sensitive to [ghis] tongue's influence,[otherwise if cocks of player > 1] occasionally switching to the other dick in [ghis] grip to keep you sensitive to [ghis] tongue's influence,[end if] which proves effective at rapidly sending you ever-closer to bliss.";
		if dorroleint is 4:
			say "     The wet sounds of [ghis] attendance filling the air, it doesn't take you long before you reach your limit! You can command [ghim] to let go and free yourself to get off on the [gdragon]'s [if tempnum is 1]voluptuous tits and [end if]obedient face, should you? Else you will give [ghim] what [ghe] clearly wants.";
			if player consents:
				say "     Words strained under the weight of your passion, you order the beast to let go, doing as you command just before your dick[smn] erupt upon [ghis] obliging snout[if tempnum is 1] and abundant chest[end if]. Regarding in demeaning act with a wanton embrace, [ghe] patiently abides being so irreverently painted by your [cum load size of player] load. When all is said and done [ghe]'s naught but an embarrassing mess, eagerly licking your spunk off [ghim].";
				say "     '[one of]Oh[or]Ah[at random], [one of]I am unworthy of [dorgr]'s countenance[or][dorgr]'s [gdragon] obliges being shamed so[at random].' [gchis] comments following after [ghe] obediently licks you clean of your [if cock width of player > 24]substantial [end if]mess, [ghe] pull away and lets you free once [ghe]'s satisfied with [ghis] work, no doubt to attend to [ghis] own shameful state.";
			otherwise:
				say "     You finally cry out, dick[smn] erupting against the beast's skilled tongue[if tempnum is 1] and chest[end if]. With a disciplined determination, [ghe] milks you dry of every last drop of your [cum load size of player] payload, ";
				if tempnum is 0:
					say "[if cocks of player > 2]talon bunching up at your other cock's head that [ghe] might lick it clean when [ghe] concludes with the first, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 2]talon bunching up at your other cock's head so [ghe] can lick it clean when [ghe] concludes with the first[otherwise]licking it clean once you might offer no more for [ghim][end if]";
				otherwise:
					say "[ghis] ample clevage considerably slicked by the whole mess";
				say "[if cock width of player > 24].[run paragraph on] [gche] doesn't seem even remotely phased by the volume you surrender to [ghim], revelling in the sheer excess[end if].";
				say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or]It was a great pleasure to serve [dorgr][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";
		otherwise:
			say "     You finally cry out, dick[smn] erupting against the beast's skilled tongue[if tempnum is 1] and chest[end if]. With a disciplined determination, [ghe] milks you dry of every last drop of your [cum load size of player] payload, ";
			if tempnum is 0:
				say "[if cocks of player > 2]talon bunching up at your other cock's head that [ghe] might lick it clean when [ghe] concludes with the first, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 2]talon bunching up at your other cock's head so [ghe] can lick it clean when [ghe] concludes with the first[otherwise]licking it clean once you might offer no more for [ghim][end if]";
			otherwise:
				say "[ghis] ample clevage considerably slicked by the whole mess";
			say "[if cock width of player > 24].[run paragraph on] [gche] doesn't seem even remotely phased by the volume you surrender to [ghim], revelling in the sheer excess[end if].";
			say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or]It was a great pleasure to serve [dorgr][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";

to say dorsub_3: [Cunt Oral] [BODY MODDED]
	say "     [if dorroleint is 4]Without having to say a word[otherwise]A little awkwardly[end if] you set yourself down, exposing your [cunt size desc of player] cunt[sfn] before the [gdragon]. [if dorroleint is 4]Immediately, [ghe]'s upon you, easily understanding what you need of [ghim],[otherwise]Gesturing [ghim] over [ghe] makes [ghis] way to you, clearly eager to please[end if] and looking rather excited by the offering.";
	say "     '[if dorroleint is 4][one of][dorgr], nothing would please their [gdragon] more[or][dorgr], their [gdragon] longs to taste them[or]I see [dorgr] is in need of me[at random][otherwise][one of]I'd be happy to oblige [dorgr][or][dorgr]'s very eager for my affection, I see[or]it certainly looks like [dorgr]'s excited to see me[at random][end if]...'Briefly without any further discourse from the [gdragon], [ghis] scaled lips part to embrace [if cunts of player > 1]one of your supple, nether lips[otherwise]your supple, nether lips[end if][if cocks of player is 1], taloned hands moving to caress your exposed dick[smn][otherwise if cunts of player > 2], taloned hands moving to caress its sisters[otherwise if cunts of player is 2], taloned hand moving to caress its sister[end if]. Humid breath washing over your lower torso, [if dorroleint is 4][ghe]'s rather gentle in this initial, oral embrace, no doubt illustrating a particular reverence for your flesh[otherwise]you abide [ghis] thick tongue's initial, teasing query[end if].";
	say "     '[one of]Oh[or]hm[or]Ah[at random], ";
	if dorroleint is 4: 
		say "[if cunt length of player > 17][dorgr] [one of]has so much to offer their [gdragon][or]offers quite an intimidating feast of flesh[or]has such enviable assets[at random][otherwise][one of][dorgr] never ceases to impress me with their taste[or]I hope I can satisfy [dorgr][or]what [dorgr] offers me is such a treat[at random][end if]";
	otherwise:
		say "[if cunt length of player > 17][dorgr] [one of]is quite the challenging prospect[or]certainly isn't unwilling to test my ability[or]is quite the impressive offering[at random][otherwise][one of]I hope [dorgr] is comfortable[or][dorgr] is in for some fun now[or][dorgr] is going to love this[at random][end if]";
	say "!' Taking a moment to speak up, ";
	if dorroleint is not 4 or (dorroleint is 4 and a random chance of 1 in 3 succeeds) or dornpbb > 0:
		say "[ghe] continues on, '...Though, [if dorroleint is 4][one of]I must beg for the opportunity to satisfy myself[or]they make me ache with need[at random][otherwise][one of]my own need is overwhelming[or]this task leaves me quite aroused[at random][end if], might they be so generous?' You imagine [ghe][']d not be as capable of pleasuring you with [ghis] attention split, shall you oblige [ghis] request? Otherwise you'll ensure [ghis] attention remains solely on you.";
		if player consents: 
			say "     You decide to allow [ghim] this opportunity, to which [ghe] seems grateful, hand moving [if cocks of player > 0]away from your cock[smn] to attend [ghis] own[otherwise if cunts of player > 1]away from your spare portal to attend [ghis] previously neglected cock[otherwise]over to attend [ghis] previously neglected cock[end if] before [ghis] maw envelops your flesh a second time, [ghis] efforts becoming much more deliberate now. Dexterous, slick appendage eager to plunge into your depths, [ghe] exhibits [if dorroleint is 4]an obsessive[otherwise]a clear[end if] desire to satisfy your need[if cunt length of player > 17 and dorroleint is 4], more than eager to push the limits of how far [ghe] can thrust [ghis] tongue upon you, at expense to [ghis] own comfort[otherwise if cunt length of player > 17], frequently pushing the limits of [ghis] ability to thrust [ghis] tongue upon you[end if]. As [ghis] need for self-pleasure rises, so does the pace in which [ghe] tongues you become erratic, though it's more than sufficient in bringing you closer to bliss.";
			if cocks of player > 0: 
				say "     The wet sounds of [ghis] attendance filling the air, it doesn't take you long before you reach your limit! You can afford to free yourself to get off on the [gdragon]'s [if tempnum is 1]voluptuous tits and [end if]unsuspecting face, should you? Else you'll give [ghim] what [ghe] clearly wants.";
				if player consents:
					say "     Right at the very last second, you pull yourself of the beast, your dick[smn] soon erupting upon [ghis] briefly dazed face. Trapped in the throes of [ghis] own[if dorballmod > 0], excessively messy[end if] bliss[if dornpbb > 0], its intensity exacerbated by [ghis] prior neglect[end if], [ghe] can only regard in demeaning act with a wanton embrace, form a writhing and twitching mess as the [gdragon] lets you stain [ghim] with your [cum load size of player] load. When all is said is done [ghe]'s a shameful sight, wallowing in a [if dorballmod > 0]pool[otherwise]puddle[end if] of [ghis] own spunk[if dorroleint is 4], tongue desperate to lick clean yours from [ghis] face[end if].";
					say "     '[one of]Oh[or]Ah[at random], [if dorroleint is 4][one of]such is [dorgr]'s punishment for my weak will[or][dorgr]'s [gdragon] deserved that[at random][otherwise][one of][dorgr]'s a sneaky one[or]quite the trick there, [dorgr][or][dorgr] certainly got me there[at random][end if].' [gchis] comments following after [ghe] obediently licks you clean of your [if cock width of player > 24]substantial [end if]mess, [ghe] pull away and lets you free once [ghe]'s satisfied with [ghis] work, no doubt to attend to [ghis] own shameful state.";		
				otherwise:
					say "     It takes only a few seconds longer before you cry out, [if cocks of player > 1]unattended dicks erupting wildly into the open air as your stuffed pussy tightens[otherwise if cocks of player is 1]unattended dick erupting wildly into the open fair as your stuffed pussy tightens[otherwise]your stuffed pussy tightening[end if] against the beast's worming appendage, caught between feasting upon your juices and the throes of [ghis] own[if dorballmod > 0], excessively messy[end if] bliss[if dornpbb > 0], its intensity exacerbated by [ghis] prior neglect[end if], allowing you watch the [gdragon]'s writhing, twitching form as [ghe] wallows in a [if dorballmod > 0]pool[otherwise]puddle[end if] of [ghis] own spunk.";
					say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] regard punctuation to [ghis] work, you're quickly cleaned off before the [gdragon] pulls away and lets you off, no doubt so [ghe] can attend to [ghis] own shameful state.";
			otherwise:
				say "     It takes only a few seconds longer before you cry out, your stuffed pussy tightening against the beast's worming appendage, caught between feasting upon your juices and the throes of [ghis] own[if dorballmod > 0], excessively messy[end if] bliss[if dornpbb > 0], its intensity exacerbated by [ghis] prior neglect[end if], allowing you watch the [gdragon]'s writhing, twitching form as [ghe] wallows in a [if dorballmod > 0]pool[otherwise]puddle[end if] of [ghis] own spunk.";
				say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you're quickly cleaned off before the [gdragon] pulls away and lets you off, no doubt so [ghe] can attend to [ghis] own shameful state.";
		otherwise: 
			if dornpbb is 1, now dornpbb is 2;
			say "     You decide against it, to which [ghe] [if dorroleint is 4]quickly nods in agreement, clearly trying to distance [ghim]self from making the request in the first place before [ghis] maw envelops[otherwise]concedes to with little further thought on the matter, maw enveloping[end if] your flesh a second time, [ghis] endeavours now much more deliberate. Dexterous, slick appendage eager to plunge into your depths, [ghe] exhibits [if dorroleint is 4]an obsessive[otherwise]a clear[end if] desire to satisfy your need[if cunt length of player > 17 and dorroleint is 4], more than eager to push the limits of how far [ghe] can thrust [ghis] tongue upon you, at expense to [ghis] own comfort[otherwise if cunt length of player > 17], frequently pushing the limits of [ghis] ability to thrust [ghis] tongue upon you[end if]. [gche] retains a very methodical, calculated pace,[if cocks of player > 0] occasionally switching to your dick[smn] in [ghis] grip to keep you sensitive to [ghis] tongue's influence,[otherwise if cunts of player > 1] occasionally switching to your other cunt within [ghis] reach to keep you sensitive to [ghis] tongue's influence,[end if] which proves effective at rapidly sending you ever-closer to bliss.";
			if dorroleint is 4 and cocks of player > 0:
				say "     The wet sounds of [ghis] attendance filling the air, it doesn't take you long before you reach your limit! You can command [ghim] to let go and free yourself to get off on the [gdragon]'s [if tempnum is 1]voluptuous tits and [end if]obedient face, should you? Else you'll give [ghim] what [ghe] clearly wants.";
				if player consents:
					say "     Words strained under the weight of your passion, you order the beast to let go, doing as you command just before your dick[smn] erupt upon [ghis] obliging snout[if tempnum is 1] and abundant chest[end if]. Regarding in demeaning act with a wanton embrace, [ghe] patiently abides being so irreverently painted by your [cum load size of player] load. When all is said and done [ghe]'s naught but an embarrassing mess, eagerly licking [ghis] face of your spunk.";
					say "     '[one of]Oh[or]Ah[at random], [one of]I am unworthy of [dorgr]'s countenance[or][dorgr]'s [gdragon] deserves being shamed so[at random].' [gchis] comments following after [ghe] obediently licks you clean of your [if cock width of player > 24]substantial [end if]mess, [ghe] pulls away and lets you free once [ghe]'s satisfied with [ghis] work, no doubt to attend to [ghis] own shameful state.";
				otherwise:
					say "     You finally cry out, pussy tightening against the beast's skilled tongue[if cocks of player > 0 or cunts of player > 1] and talons[end if]. With a disciplined determination, [ghe] prolongs your bliss for as long as [ghe] can, [if cocks of player > 1]talons bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 1]talon bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal[otherwise]licking it clean once you conclude[end if].";
					say "     '[one of]Ah[or]Alright[or]Yes[at random], [one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or]It was a great pleasure to serve [dorgr][at random].' [gchis] regard punctuation to [ghis] work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";
 			otherwise:
				say "     You finally cry out, pussy tightening against the beast's skilled tongue[if cocks of player > 0 or cunts of player > 1] and talons[end if]. With a disciplined determination, [ghe] prolongs your bliss for as long as [ghe] can, [if cocks of player > 1]talons bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 1]talon bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal[otherwise]licking it clean once you conclude[end if].";
				say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or]It was a great pleasure to serve [dorgr][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";	
	otherwise:
		say "[ghis] maw envelops your flesh a second time, [ghis] efforts now much more deliberate. Dexterous, slick appendage eager to plunge into your depths, [ghe] exhibits [if dorroleint is 4]an obsessive[otherwise]a clear[end if] desire to satisfy your need[if cunt length of player > 17 and dorroleint is 4], more than eager to push the limits of how far [ghe] can thrust [ghis] tongue upon you, at expense to [ghis] own comfort[otherwise if cunt length of player > 17], frequently pushing the limits of [ghis] ability to thrust [ghis] tongue upon you[end if]. [gche] retains a very methodical, calculated pace,[if cocks of player > 0] occasionally switching to your dick[smn] in [ghis] grip to keep you sensitive to [ghis] tongue's influence,[otherwise if cunts of player > 1] occasionally switching to your other cunt within [ghis] reach to keep you sensitive to [ghis] tongue's influence,[end if] which proves effective at rapidly sending you ever-closer to bliss.";
		if dornpbb is 1, now dornpbb is 2;
		if dorroleint is 4 and cocks of player > 0:
			say "     The wet sounds of [ghis] attendance filling the air, it doesn't take you long before you reach your limit! You can command [ghim] to let go and free yourself to get off on the [gdragon]'s [if tempnum is 1]voluptuous tits and [end if]obedient face, should you? Else you will give [ghim] what [ghe] clearly wants.";
			if player consents:
				say "     Words strained under the weight of your passion, you order the beast to let go, doing as you command just before your dick[smn] erupt upon [ghis] obliging snout[if tempnum is 1] and abundant chest[end if]. Regarding in demeaning act with a wanton embrace, [ghe] patiently abides being so irreverently painted by your [cum load size of player] load. When all is said and done [ghe]'s naught but an embarrassing mess, eagerly licking [ghis] face of your spunk.";
				say "     '[one of]Oh[or]Ah[at random], [one of]I am unworthy of [dorgr]'s countenance[or][dorgr]'s [gdragon] deserves being shamed so[at random].' [gchis] comments following after [ghe] obediently licks you clean of your [if cock width of player > 24]substantial [end if]mess, [ghe] pulls away and lets you free once [ghe]'s satisfied with [ghis] work, no doubt to attend to [ghis] own shameful state.";
			otherwise:
				say "     You finally cry out, pussy tightening against the beast's skilled tongue[if cocks of player > 0 or cunts of player > 1] and talons[end if]. With a disciplined determination, [ghe] prolongs your bliss for as long as [ghe] can, [if cocks of player > 1]talons bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 1]talon bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal[otherwise]licking it clean once you conclude[end if].";
				say "     '[one of]Ah[or]Alright[or]Yes[at random], [one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or]It was a great pleasure to serve [dorgr][at random].' [gchis] regard punctuation to [ghis] work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";
		otherwise:
			say "     You finally cry out, pussy tightening against the beast's skilled tongue[if cocks of player > 0 or cunts of player > 1] and talons[end if]. With a disciplined determination, [ghe] prolongs your bliss for as long as [ghe] can, [if cocks of player > 1]talons bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal, though [ghe] is not so dexterous that [ghe] can stop some of it from spilling all over the ground[otherwise if cocks of player is 1]talon bunching up at your dick's head that [ghe] might lick it clean when [ghe] is concludes with the portal[otherwise]licking it clean once you conclude[end if].";
			say "     '[one of]Ah[or]Alright[or]Yes[at random], [if dorroleint is 4][one of][dorgr] offers me so much[or]I hope I did [dorgr] proud[or]It was a great pleasure to serve [dorgr][at random][otherwise][one of]I hope [dorgr] is satisfied[or]I hope [dorgr] enjoyed that as much as I did[or]I think [dorgr]'s [gdragon] is finished here[at random][end if].' [gchis] remark punctuating [ghis] finished work, you've been cleaned of your prior mess, the [gdragon] pulling away and letting you off, settling back down next to the fire.";	

to say dorsub_4: [Cunt Catching] [BODY MODDED]
	say "     You decide to take your [gdragon] for a ride, [if dorroleint is 4]command[otherwise]ask[end if]ing [ghim] to roll on [ghis] back and reveal [ghis] underside for you. [gche] [if dorroleint is 4]instinctively[otherwise]eagerly[end if] complies, laying on the ground once more before [ghis] legs are spread, exposing [ghim]self fully before you. The mere implication of your command is enough to arouse [ghim] slightly, flared cockhead peeking from its scaled [if dorinternal is true]slit[otherwise]sheath[end if].";
	say "     '[dorgr], [if dorroleint is 4][one of]I'm honoured by such a prospect[or]I long to be relegated as a mere toy for their pleasure[or]I am theirs to do with as they please[at random][otherwise][one of]don't hold back[or]I'm eager to be ridden[or]I'm excited by the prospect[at random][end if]";
	if dorroleint is 4:
		say ".' Feeling a little impish, however, you think you could command the [gdragon] to suck [ghim]self off in order to spare yourself the matter of preparing [ghim] yourself. Shall you? Lest you resolve this matter for [ghim].";
		if player consents:
			say "     Grinning, you order Doran to fellate [ghim]self before you. Without a second thought, [ghe] props [ghim]self up, twisting [ghim]self so that [ghis] head might meet [ghis] crotch before [ghis] scaled lips envelope [ghis] cockhead. [gche]'s certainly flexible, and you imagine [ghe][']d have to be to keep [ghim]self so clean for you. The air fills with the wet sound of [ghis] self-pleasure, the fervour of which rapidly reaching a fever pitch; however, you order [ghim] to stop before [ghe] can wholly get off on it, causing [ghim] to relent, [ghis] organ now fully erect before you, dripping with an aching need";
			if dorballmod > 0:
				say ".";
				say "     ...Giving you a weird look you can see that the [gdragon]'s cheeks are flared, full with [ghis] copious load of precum. Your lewd little lizard is being rather cheeky, and yet... You imagine [ghe] wants to share with you. Shall you indulge in [ghis] offering? Otherwise, you'll simply order [ghim] to swallow and get back on track.";
				if player consents:
					say "     Approaching [ghim], [ghe] struggles to grin without causing the spunk to ooze from [ghis] lips, no doubt giddy over this opportunity. [gchis] head meeting yours, your lips gently embrace the [gdragon]'s. Ever the tease, [ghe]'s on the cusp of delivering the goods, but holds back just enough to coax you into going the final distance. With a firm press the floodgates are open to you, delivered on the back of [ghis][if scalevalue of player < 3]massive, [otherwise if scalevalue of player is 3]large, [end if] powerful tongue, your taste is quickly awash in the strong, [gmasculine] flavour of [ghis] precum. Do you swallow? Else, you'll rebuke the offering back to the [gdragon].";
					if player consents:
						say "     As you begin to consume [ghis] thick sexual fluids your companion eagerly [']refills your plate['] with each gulp, though [if scalevalue of player < 4][ghe]'s still obedient enough to make sure [ghe] doesn't overwhelm you[otherwise]it's nothing someone of your size can't handle[end if]. This ritual continues for a brief while until [ghe] has naught left to offer! Satisfied[if scalevalue of player < 4], and a little full[end if], you pull away and return your attention to the task at hand, Doran still glaringly aroused as [ghe] lays back down.";
					otherwise:
						say "     The two of you engage in this little [']back and forth['] for a while before Doran finally concedes, gradually swallowing down [ghis] sexual fluids until all that remains is the lingering taste in [ghis] saliva. Satisfied, you pull away and return your attention to the task at hand, Doran still glaringly aroused as [ghe] lays back down.";
				otherwise:
					say "     You give [ghim] a stern look and [ghe] gets the picture. In a single, exaggerated gulp, [ghe] manages to swallow down the load with only brief difficulty before laying back down, still glaringly aroused.";
			otherwise:
				say " as [ghe] lays back down.";
		otherwise:
			say "     Leaning in between [ghis] twin, powerful legs, your hands move to ";
			if dorinternal is true:
				say "stroke is exposed, smooth portal. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress across [ghis] nether lips";
			otherwise:
				say "feel [ghis] [if dorballmod > 0]massive, othersized[otherwise]sizeable, full[end if] sack and bulging sheath. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress";
			say ", more that enough to bring [ghis] organ to its full size. Not feeling eager to subject yourself to the ride dry, you make some effort to slick the member beforehand, [if dorballmod > 0]not that it's difficult with the amount of precum [ghe]'s constantly oozing[otherwise if scalevalue of player > 3]finding little difficulty in achieving your goal[otherwise], though you're not quite big enough to get the job done, the [gdragon] bending in to help you with [ghis] own[end if]. It's not long before it's ready, dripping with an aching need.";
	otherwise:
		say "     Leaning in between [ghis] twin, powerful legs, your hands move to ";
		if dorinternal is true:
			say "stroke is exposed, smooth portal. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress across [ghis] nether lips";
		otherwise:
			say "feel [ghis] [if dorballmod > 0]massive, othersized[otherwise]sizeable, full[end if] sack and bulging sheath. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress";
		say ", more that enough to bring [ghis] organ to its full size. Not feeling eager to subject yourself to the ride dry, you make some effort to slick the member beforehand, [if dorballmod > 0]not that it's difficult with the amount of precum [ghe]'s constantly oozing[otherwise if scalevalue of player > 3]finding little difficulty in achieving your goal[otherwise], though you're not quite big enough to get the job done, the [gdragon] bending in to help you with [ghis] own[end if]. It's not long before it's ready, dripping with an aching need.";
	if scalevalue of player < 4: 
		say "     Now ready, you climb atop the [gdragon]'s scaled undercarriage, carefully aiming the dripping rod for [if cunts of player > 0]one of your exposed cunts[otherwise]your exposed cunt[end if].";
		say "     '--[one of]Ah[or]Oh[or]Um[at random], does [dorgr] [one of]need aid[or]require help[at random]? [if dorroleint is 4][one of]Not that I think they can't handle their [gdragon], of course[or]I wouldn't want my size to cause them too much trouble[at random][otherwise][one of]I wouldn't want to hurt them[or]I'll be as slow as is comfortable for them[at random][end if].' Clearly wanting to avoid possibly hurting you, shall your let [ghim]? Else you'll stick to your guns.";
		if player consents:
			say "     Easing back, your companion softly embraces your smaller form within [ghis] taloned forehands, ever-so-gently easing you down on [ghis] throbbing organ. Ever mindful of you, [ghe] sink [ghis] flesh into you, inch by inch, slowing as [ghe] contends its flared head. [if cunt length of player > 11]Your difficulty is only brief before you envelope it within your depths entirely, your subsequent ease much to the [gdragon]'s enjoyment[otherwise]After much work and strained grunts, the two of you manage to envelope the head within your depths[end if], the rest taking somewhat less work, up to the knot. Once you're ready to continue on your own the beast lets you go, allowing you to set your own pace from here on.";
		otherwise:
			say "     You cheekily reject [ghis] offer, dead set on taking care of this on your own terms as you begin to ease yourself down on [ghis] throbbing organ, slowing once you start to contend with its flared head. [if cunt length of player > 11]Your difficulty is only brief before you envelope the head within your depths entirely, your subsequent ease much to the [gdragon]'s enjoyment[otherwise]After some work and strained grunts, you manage to envelope the head within your depths[end if], the rest taking somewhat less work, up to the knot.";
	otherwise:
		say "     Now ready, you move over the [gdragon]'s scaled undercarriage, carefully aiming the dripping rod for [if cunts of player > 0]one of your exposed cunts[otherwise]your exposed cunt[end if]. Briefly teasing the tip against your slick lips, much to the groans of the [gdragon]'s approval, you slowly ease yourself down on [ghis] throbbing organ, flared head slowly sinking past your soft, yielding folds of flesh. [if cunt length of player < 12]After much work and strained grunts, you manage to envelop the head within your depths, the rest taking somewhat less work, up to the knot[otherwise if cunt length of player > 17]Struck by a rather impish urge, you abruptly plunge down on [ghis] tool in its entirety, so pliable that you envelop [ghis] knot with almost no difficulty.[run paragraph on] This shock is enough to cause [ghim] to briefly howl out, a gout of pre spurting from [ghis] suddenly engulfed tool[otherwise]Past [ghis] head your descent is a fair bit easier, up to [ghis] knot, which is large enough to make you avoid dealing with just yet[end if].";
	say "     '[one of]Oh[or]Nrgh[or]Nnf[at random], [one of]M-[dorgr] is so [if cunt length of player < 12]t-tight[otherwise if cunt length of player < 17]s-skilled[otherwise]f-firm[end if][or]I-I can't hold back, M-[dorgr][or]M-[dorgr][at random]...' [gchis] mutterings are mixed with deep moans, made all the more prevalent as you build a motion of riding the [gdragon]'s powerful dick, [if cocks of player > 1]your own bouncing against the open air, staining the [gdragon]'s scales with their slick fluids[otherwise if cocks of player is 1]your own bouncing against the open air, staining the [gdragon]'s scales with its slick fluids[otherwise if cunts of player > 2]unstuffed cunts aching against the open air, staining the [gdragon]'s scales with their honey[otherwise if cunts of player is 2]unstuffed cunt aching against the open air, staining the [gdragon]'s scales with its honey[otherwise]stuffed portal eagerly milking the beast for what [ghe]'s worth[end if][if scalevalue of player < 3 or cunt length of player < 12] while stretched to the limits of your ability to contain the organ[end if]. [if dorballmod > 0]Each descent causes yet another gout of precum to shoot from [ghim], causing you to flinch.[run paragraph on] [gchis] supply almost seems endless![end if]";
	say "     Writhing against the ground, completely lost in the pleasure you offer [ghim], it doesn't take long before [ghe] looks like [ghe]'s about to erupt! It might be ideal to pull out just before then. Shall you, lest you take the full brunt of [ghis] carnal fury?";
	if player consents:
		say "     Just as the beast is about to blow, you [if cunt length of player < 12]wrench[otherwise]pull[end if] yourself free of [ghis] cock, rapidly frotting your [if cocks of player > 0]own[otherwise]cunt[sfn][end if] against the throbbing, pre-slicked tool just before [ghe] cries out, gout after [if dorballmod > 0]overwhelming gout drowning[otherwise]successive gout painting[end if] the [gdragon]'s torso and face with [ghis] own jizz[if dornpbb > 0], the volume of which intensified by [ghis] prior neglect[end if]. Soon after, your desperate fervour is rewarded when you find your own bliss, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against [ghim][otherwise if cunts of player > 1]pussies staining [ghis] crotch with your juices[otherwise]pussy staining [ghis] crotch with your juices[end if], mixing with [ghis] own until the reptile is an embarrassing mess.";
		say "     [if dorroleint is 4]Insistently, [ghe] goes about licking you clean before [ghe] allows you to dismount [ghim] proper[otherwise]Eventually, you step off of the [gdragon], letting [ghim] clean [ghim]self off[end if].";
		say "     'Oh [dorgr], [if dorroleint is 4][one of]It pleases their [gdragon] to sully [ghim] so[or]their torment is all I desire[or]I beg that they mistreat me again[at random][otherwise][one of]how very naughty, making a mess of me like that[or]they're a mischievous one[or]and I had just cleaned myself[at random][end if].' [gche] [if dorroleint is 4]pleads[otherwise]feigns insult[end if], taking a moment to recover before getting back up and returning back to [ghis] spot in the cave. No doubt it'll take [ghim] a bit to clean [ghim]self of the[if dorballmod > 0] excessive[end if] mess that was made.";
	otherwise:
		say "     Submitting to your wanton hunger, [if cunt length of player < 12]you take considerable effort to finally tie yourself with the beast's knot[otherwise if cunt length of player > 17]making one, final descent, tying with the beast one last time[otherwise]you make one final effort to tie yourself with the beast's knot[end if]. It's more than enough to cause [ghim] to roar out, pumping you full with gout after successive gout of [ghis] voluminous jizz[if dornpbb > 0], the volume of which intensified by [ghis] prior neglect[end if]";
		if dorballmod > 0:
			say ". So massive [ghis] release that you [if scalevalue of player < 4]absurdly[otherwise]visibly[end if] bloat with the stuff, until it starts to sputter from both ends of you. Drowing in [ghis] seed, you can barely feel your own bliss in the haze, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against [ghis] torso[otherwise if cunts of player > 0]cunt[sfn] staining [ghis] torso with your juices[end if], strained by the throbbing, thick intrusion.";
		otherwise:
			say "[if scalevalue of player < 3], body visibly bulging to abide this release[end if]. Sparse remnants sputtering from your tied hole to stain the beast's crotch as you contend with your own bliss, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against [ghis] torso[otherwise if cunts of player > 0]cunt[sfn] staining [ghis] torso with your release[end if], strained by the throbbing, thick intrusion.";
		say "     [if dorroleint is 4]Insistently, [ghe] goes about licking you clean, even as you pull yourself free [ghe]'s quick to attend to your leaking hole until [ghe]'s satisfied with your appearance, finally letting you off[otherwise]Eventually, you pull yourself free of the [gdragon]'s now-softened organ, stepping off of [ghim][end if].";
		say "     'Oh [dorgr], [if dorroleint is 4][one of]I love seeing them full of their [gdragon]'s seed[or]they're so good at taking their [gdragon]'s load[or]I beg for the opportunity to fill them again[or]I love being inside them[at random][otherwise][one of]they always manage to impress me[or]I envy their skill[or]they know how to handle themself[at random][end if].' Offering [ghis] regards, [ghe] takes a moment to catch [ghis] breath before getting back up and returning to [ghis] spot in the cave. [gche] already goes through a ritual of cleaning [ghim]self of the[if dorballmod > 0] excessive[end if] mess that was doubtlessly made.";

to say dorsub_5: [Anal Catching] [BODY MODDED]
	say "     You decide to take your [gdragon] for a ride, [if dorroleint is 4]command[otherwise]ask[end if]ing [ghim] to roll on [ghis] back and reveal [ghis] underside for you. [gche] [if dorroleint is 4]instinctively[otherwise]eagerly[end if] complies, laying on the ground once more before [ghis] legs are spread, exposing [ghim]self fully before you. The mere implication of your command is enough to arouse [ghim] slightly, flared cockhead peeking from its scaled [if dorinternal is true]slit[otherwise]sheath[end if].";
	say "     '[dorgr], [if dorroleint is 4][one of]I'm honoured by such a prospect[or]I long to be relegated as a mere toy for their pleasure[or]I am theirs to do with as they please[at random][otherwise][one of]don't hold back[or]I'm eager to be ridden[or]I'm excited by the prospect[at random][end if]";
	if dorroleint is 4:
		say ".' Feeling a little impish, however, you think you could command the [gdragon] to suck [ghim]self off in order to spare yourself the matter of preparing [ghim] yourself. Shall you? Lest you resolve this matter for [ghim].";
		if player consents:
			say "     Grinning, you order Doran to fellate [ghim]self before you. Without a second thought, [ghe] props [ghim]self up, twisting [ghim]self so that [ghis] head might meet [ghis] crotch before [ghis] scaled lips envelope [ghis] cockhead. [gche]'s certainly flexible, and you imagine [ghe][']d have to be to keep [ghim]self so clean for you. The air fills with the wet sound of [ghis] self-pleasure, the fervour of which rapidly reaching a fever pitch; however, you order [ghim] to stop before [ghe] can wholly get off on it, causing [ghim] to relent, [ghis] organ now fully erect before you, dripping with an aching need";
			if dorballmod > 0:
				say ".";
				say "     ...Giving you a weird look you can see that the [gdragon]'s cheeks are flared, full with [ghis] copious load of precum. Your lewd little lizard is being rather cheeky, and yet... You imagine [ghe] wants to share with you. Shall you indulge in [ghis] offering? Otherwise, you'll simply order [ghim] to swallow and get back on track.";
				if player consents:
					say "     Approaching [ghim], [ghe] struggles to grin without causing the spunk to ooze from [ghis] lips, no doubt giddy over this opportunity. [gchis] head meeting yours, your lips gently embrace the [gdragon]'s. Ever the tease, [ghe]'s on the cusp of delivering the goods, but holds back just enough to coax you into going the final distance. With a firm press the floodgates are open to you, delivered on the back of [ghis][if scalevalue of player < 3]massive, [otherwise if scalevalue of player is 3]large, [end if] powerful tongue, your taste is quickly awash in the strong, [gmasculine] flavour of [ghis] precum. Do you swallow? Else, you'll rebuke the offering back to the [gdragon].";
					if player consents:
						say "     As you begin to consume [ghis] thick sexual fluids your companion eagerly [']refills your plate['] with each gulp, though [if scalevalue of player < 4][ghe]'s still obedient enough to make sure [ghe] doesn't overwhelm you[otherwise]it's nothing someone of your size can't handle[end if]. This ritual continues for a brief while until [ghe] has naught left to offer! Satisfied[if scalevalue of player < 4], and a little full[end if], you pull away and return your attention to the task at hand, Doran still glaringly aroused as [ghe] lays back down.";
					otherwise:
						say "     The two of you engage in this little [']back and forth['] for a while before Doran finally concedes, gradually swallowing down [ghis] sexual fluids until all that remains is the lingering taste in [ghis] saliva. Satisfied, you pull away and return your attention to the task at hand, Doran still glaringly aroused as [ghe] lays back down.";
				otherwise:
					say "     You give [ghim] a stern look and [ghe] gets the picture. In a single, exaggerated gulp, [ghe] manages to swallow down the load with only brief difficulty before laying back down, still glaringly aroused.";
			otherwise:
				say " as [ghe] lays back down.";
		otherwise:
			say "     Leaning in between [ghis] twin, powerful legs, your hands move to ";
			if dorinternal is true:
				say "stroke is exposed, smooth portal. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress across [ghis] nether lips";
			otherwise:
				say "feel [ghis] [if dorballmod > 0]massive, othersized[otherwise]sizeable, full[end if] sack and bulging sheath. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress";
			say ", more that enough to bring [ghis] organ to its full size. Not feeling eager to subject yourself to the ride dry, you make some effort to slick the member beforehand, [if dorballmod > 0]not that it's difficult with the amount of precum [ghe]'s constantly oozing[otherwise if scalevalue of player > 3]finding little difficulty in achieving your goal[otherwise], though you're not quite big enough to get the job done, the [gdragon] bending in to help you with [ghis] own[end if]. It's not long before it's ready, dripping with an aching need.";
	otherwise:
		say "     Leaning in between [ghis] twin, powerful legs, your hands move to ";
		if dorinternal is true:
			say "stroke is exposed, smooth portal. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress across [ghis] nether lips";
		otherwise:
			say "feel [ghis] [if dorballmod > 0]massive, othersized[otherwise]sizeable, full[end if] sack and bulging sheath. Moans pulled from the [gdragon] with your gentle touch, you lean in further and prepare [ghim] with your tongue's caress";
		say ", more that enough to bring [ghis] organ to its full size. Not feeling eager to subject yourself to the ride dry, you make some effort to slick the member beforehand, [if dorballmod > 0]not that it's difficult with the amount of precum [ghe]'s constantly oozing[otherwise if scalevalue of player > 3]finding little difficulty in achieving your goal[otherwise], though you're not quite big enough to get the job done, the [gdragon] bending in to help you with [ghis] own[end if]. It's not long before it's ready, dripping with an aching need.";
	if scalevalue of player < 4:
		say "     Now ready, you climb atop the [gdragon]'s scaled undercarriage, carefully aiming the dripping rod for your exposed ass.";
		say "     '--[one of]Ah[or]Oh[or]Um[at random], does [dorgr] [one of]need aid[or]require help[at random]? [if dorroleint is 4][one of]Not that I think they can't handle their [gdragon], of course[or]I wouldn't want my size to cause them too much trouble[at random][otherwise][one of]I wouldn't want to hurt them[or]I'll be as slow as is comfortable for them[at random][end if].' Clearly wanting to avoid possibly hurting you, shall your let [ghim]? Else you'll stick to your guns.";
		if player consents:
			say "     You agree to [ghis] aid, to which [ghe] responds by moving [ghis] taloned forepaws over you, ever-so-gently pressing you down upon this slicked, proudly jutting tool. Mindful of your regard, you're slowly made to descend upon [ghis] rod, quickly contending with its flared head. [if scalevalue of player is 3 and player is twistcapped]Your difficulty is only brief before you envelope it within your depths entirely, your subsequent ease much to the [gdragon]'s enjoyment[otherwise if scalevalue of player < 3]Much in spite your peculiar talent, it takes quite a bit of work for [ghim] to effectively envelope the head within your depths, though the [gdragon] is glad you can even take [ghim] in the first place[otherwise]After much work and strained grunts, the two of you manage to envelope the head within your depths[end if], the rest taking somewhat less work, up to the knot. Once you're ready to continue on your own the beast lets you go, allowing you to set your own pace from here on.";
		otherwise:
			say "     You cheekily reject [ghis] offer, dead set on taking care of this on your own terms as you begin to ease yourself down on [ghis] throbbing organ, slowing once you start to contend with its flared head. [if scalevalue of player is 3 and player is twistcapped]Your difficulty is only brief before you envelope the head within your depths entirely, your subsequent ease much to the [gdragon]'s enjoyment[otherwise if scalevalue of player < 3]Much in spite your peculiar talent, it takes quite a bit of work for you to effectively envelope the head within your depths, though the [gdragon] is glad you can even take [ghim] in the first place[otherwise]After much work and strained grunts, you manage to envelope the head within your depths[end if], the rest taking somewhat less work, up to the knot.";
	otherwise: 
		say "     Now ready, you move over the [gdragon]'s scaled undercarriage, carefully aiming the dripping rod for your ass. Briefly teasing the tip against your supple ring, much to the groans of the [gdragon]'s approval, you slowly ease yourself down on [ghis] throbbing organ, flared head slowly sinking past your soft, yielding flesh. [if player is twistcapped]Struck by a rather impish urge, you abruptly plunge down on [ghis] tool in its entirety, so pliable that you envelop [ghis] knot with almost no difficulty.[run paragraph on] This shock is enough to cause [ghim] to briefly howl out, a gout of pre spurting from [ghis] suddenly engulfed tool[otherwise]Past [ghis] head your descent is a fair bit easier, up to [ghis] knot, which is large enough to make you avoid dealing with just yet[end if].";
	say "     '[one of]Oh[or]Nrgh[or]Nnf[at random], [one of]M-[dorgr] is so [if scalevalue of player < 4]t-tight[otherwise if player is twistcapped]s-skilled[otherwise]f-firm[end if][or]I-I can't hold back, M-[dorgr][or]M-[dorgr][at random]...' [gchis] mutterings are mixed with deep moans, made all the more prevalent as you build a motion of riding the [gdragon]'s powerful dick, [if cocks of player > 1]your own bouncing against the open air, staining the [gdragon]'s scales with their slick fluids[otherwise if cocks of player is 1]your own bouncing against the open air, staining the [gdragon]'s scales with its slick fluids[otherwise]unstuffed cunt[sfn] aching against the open air, staining the [gdragon]'s scales with their honey[end if][if scalevalue of player < 3]while stretched to the limits of your ability to contain the organ[end if]. [if dorballmod > 0]Each descent causes yet another gout of precum to shoot from [ghim], causing you to flinch.[run paragraph on] [gchis] supply almost seems endless![end if]";
	say "     Writhing against the ground, completely lost in the pleasure you offer [ghim], it doesn't take long before [ghe] looks like [ghe]'s about to erupt! It might be ideal to pull out just before then. Shall you, lest you take the full brunt of [ghis] carnal fury?";
	if player consents: 
		say "     Just as the beast is about to blow, you [if scalevalue of player < 4]wrench[otherwise]pull[end if] yourself free of [ghis] cock, rapidly frotting your [if cocks of player > 0]own[otherwise]cunt[sfn][end if] against the throbbing, pre-slicked tool just before [ghe] cries out, gout after [if dorballmod > 0]overwhelming gout drowning[otherwise]successive gout painting[end if] the [gdragon]'s torso and face with [ghis] own jizz[if dornpbb > 0], the volume of which intensified by [ghis] prior neglect[end if]. Soon after, your desperate fervour is rewarded when you find your own bliss, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against [ghim][otherwise if cunts of player > 1]pussies staining [ghis] crotch with your juices[otherwise]pussy staining [ghis] crotch with your juices[end if], mixing with [ghis] own until the reptile is an embarrassing mess.";
		say "     [if dorroleint is 4]Insistently, [ghe] goes about licking you clean before [ghe] allows you to dismount [ghim] proper[otherwise]Eventually, you step off of the [gdragon], letting [ghim] clean [ghim]self off[end if].";
		say "     'Oh [dorgr], [if dorroleint is 4][one of]It pleases their [gdragon] to sully [ghim] so[or]their torment is all I desire[or]I beg that they mistreat me again[at random][otherwise][one of]how very naughty, making a mess of me like that[or]they're a mischievous one[or]and I had just cleaned myself[at random][end if].' [gche] [if dorroleint is 4]pleads[otherwise]feigns insult[end if], taking a moment to recover before getting back up and returning back to [ghis] spot in the cave. No doubt it'll take [ghim] a bit to clean [ghim]self of the[if dorballmod > 0] excessive[end if] mess that was made.";
	otherwise:
		say "     Submitting to your wanton hunger, [if scalevalue of player < 4]you take considerable effort to finally tie yourself with the beast's knot[otherwise if player is twistcapped]making one, final descent, tying with the beast one last time[otherwise]you make one final effort to tie yourself with the beast's knot[end if]. It's more than enough to cause [ghim] to roar out, pumping you full with gout after successive gout of [ghis] voluminous jizz[if dornpbb > 0], the volume of which intensified by [ghis] prior neglect[end if]";
		if dorballmod > 0:
			say ". So massive [ghis] release that you [if scalevalue of player < 4]absurdly[otherwise]visibly[end if] bloat with the stuff, until it starts to sputter from both ends of you. Drowing in [ghis] seed, you can barely feel your own bliss in the haze, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against [ghis] torso[otherwise if cunts of player > 0]cunt[sfn] staining [ghis] torso with your juices[end if], strained by the throbbing, thick intrusion.";
		otherwise:
			say "[if scalevalue of player < 3], body visibly bulging to abide this release[end if]. Sparse remnants sputtering from your tied hole to stain the beast's crotch as you contend with your own bliss, [if cocks of player > 0]dick[smn] unloading your [cum load size of player] payload against [ghis] torso[otherwise if cunts of player > 0]cunt[sfn] staining [ghis] torso with your release[end if], strained by the throbbing, thick intrusion.";
		say "     [if dorroleint is 4]Insistently, [ghe] goes about licking you clean, even as you pull yourself free [ghe]'s quick to attend to your leaking hole until [ghe]'s satisfied with your appearance, finally letting you off[otherwise]Eventually, you pull yourself free of the [gdragon]'s now-softened organ, stepping off of [ghim][end if].";
		say "     'Oh [dorgr], [if dorroleint is 4][one of]I love seeing them full of their [gdragon]'s seed[or]they're so good at taking their [gdragon]'s load[or]I beg for the opportunity to fill them again[or]I love being inside them[at random][otherwise][one of]they always manage to impress me[or]I envy their skill[or]they know how to handle themself[at random][end if].' Offering [ghis] regards, [ghe] takes a moment to catch [ghis] breath before getting back up and returning to [ghis] spot in the cave. [gche] already goes through a ritual of cleaning [ghim]self of the[if dorballmod > 0] excessive[end if] mess that was doubtlessly made.";

to say dorsub_6: [Rimjob] [BODY MODDED]
	say "     You, [if dorroleint is 4]rather bluntly, order[otherwise]somewhat sheepishly, ask[end if] Doran to have [ghim] attend your ass, to which [ghe] unquestioningly obliges. Moving close and rolling onto [ghis] back, the [gdragon] ";
	if dorroleint is 4:
		say "eagerly waits as you [if scalevalue of player < 4]climb on top[otherwise]move over[end if] [ghim] and offer";
	otherwise:
		say "[if scalevalue of player < 4 and dortitmod > 0]carefully picks you up and places you between [ghis] large, scaled breasts[otherwise if scalevalue of player < 4]carefully picks you up and places you on [ghis] scaled, powerful chest[otherwise]shuffles under your large, [bodydesc of player] form[end if] so that you might offer [ghim] ";
	say "a telling view of your exposed behind, much to the approval of [ghis] prying eyes.";
	say "     '[one of]Oh[or]Hm[or]Ah[or]Mm[at random], [dorgr], [if dorroleint is 4][one of]their [gdragon] is blessed with this opportunity[or]I long for their taste[or]they offer me such a treat[at random][otherwise][one of]they make such a lewd request of their [gdragon][or]I wonder what they might taste like[or]they make quite an offering to their [gdragon][at random][end if]!' [gche] punctuates [ghis] [if dorroleint is 4]praise[otherwise]remark[end if] with the warm, slick feel of [ghis] prehensile tongue along the curvature of your [bodytype of player] behind. [gchis] reverence remains fairly brief before you finally feel [ghis] tongue slowly invade your anal ring, [if scalevalue of player < 4]it's substantive girth very quickly made apparent to you as it worms[otherwise]worming its way[end if] through your bowels. [gche]'s obviously quite restrained and slow in [ghis] pace out of regard for you; however, you could command [ghim] to be rougher on you -- though you imagine things will quickly spiral out of control if you do. Shall you? Else [ghe]'ll likely maintain this current tempo.";
	if player consents: 
		say "     [if dorroleint is not 4]Perhaps a little meekly, you ask[otherwise]Pressing your rear more firmly against [ghis] snout, you tell[end if] [ghim] to pick up the pace. [if dorroleint is 4]Ever obedient, [ghe] almost immediately floods[otherwise]With slight caution, [ghe] begins to rapidly flood[end if] your bowels with the writhing organ, causing you to twist and tense in intense pleasure in the wake of its irreverent invasion. Quickly building up a pace of wrecking your fleshy abyss, [ghis] continued assault is almost dizzying, [if cocks of player > 0]cock[smn] standing in aching attention[otherwise]cunt[sfn] dripping with an aching need[end if] [if dorroleint is 4]before the [gdragon] frees a talon to idly fondle you[otherwise]and instinctively driving you to stroke yourself[end if] as [ghe] maintains [ghis] pace.";
		say "     The dizzying efficacy of [ghis] expedient work doesn't need long before you start crying out, [if cocks of player > 1]dicks spurting their [cum load size of player] load against the [gdragon]'s torso, their[otherwise if cocks of player is 1]dick spurting its [cum load size of player] load against the [gdragon]'s torso, its[otherwise if cunts of player > 1]pussies gushing against the open air, staining the [gdragon]'s neck, their[otherwise]pussy gushing against the open air, staining the [gdragon]'s neck, its[end if] release strained by [ghis] worming appendage. Once the fires of your need die down, the audibly wet sound of the [gdragon]'s tongue slithering from your hole fills the air, stopping for only a moment to clean you of any lingering mess[if cock width of player > 24], of which there is quite a lot[end if].";
		say "     '[one of]Hm[or]Mm[or]Ah[at random]! [if dorroleint is 4][one of]I hope [dorgr] is impressed with their [gdragon][or][dorgr] lets their [gdragon] have all sorts of fun[or]I'm glad to see [dorgr] enjoyed themselves[at random][otherwise][one of]I hope I wasn't too hard on [dorgr][or][dorgr] is quite the squirter[or]Hopefully, [dorgr] won't be too sore after all that[at random][end if].' [if scalevalue of player < 4]Putting you back down[otherwise]Pulling out from under you[end if], [ghe] takes a moment to clean [ghim]self off[if cock width of player > 24], a task requiring a fair bit, given your substantive load,[end if] before returning back to [ghis] place of rest, now that [ghe] is finished. No doubt this little exercise has left you a bit worn out, and it takes a moment for you to feel well enough to go about your business.";
		if dornpbb is 1, now dornpbb is 2;
	otherwise: 
		say "     You feel the writhing organ slowly flood your[if scalevalue of player < 4] tight[end if] bowels, inch by inch, your [if cocks of player > 0]cock[smn] gradually rising to full attention[otherwise]cunt[sfn] beginning to ache with need[end if] by its slick attendance. The painstaking pace gives you the opportunity you to see that the [gdragon] is also aroused from [ghis] task, draconic dick exposed to the open air, [if scalevalue of player < 4]partially[otherwise]easily[end if] within your reach. Perhaps you should return the favour? Else you'll ensure all the attention remains solely on you.";
		if player consents:
			say "     [if scalevalue of player < 4]Reaching out[otherwise]Moving a hand[end if] to touch [ghis] oozing rod, you begin to grip along its firm length as reward for the [gdragon]'s continued attendance. Soft moans vibrating against your attended flesh, your persisting affection intensifies the efforts of your companion, [ghis] talons soon moving your stroke [if cocks of player > 1]one of your unattended cocks[otherwise if cocks of player is 1]your unattended cock[otherwise if cunts of player > 1]one of your unattended portals[otherwise]your unattended portal[end if]. Both of you, in turn, pushing one to attend the other more, it doesn't take long before things start to reach a dizzying pace.";
			say "     With the [gdragon]'s continual, merciless assault on your ass, it's not long before a loud moan bursts from your lips, [if cocks of player > 1]dicks spurting their [cum load size of player] load against the [gdragon]'s torso, their[otherwise if cocks of player is 1]dick spurting its [cum load size of player] load against the beast's torso, its[otherwise if cunts of player > 1]pussies gushing against the open air, staining the beast, their[otherwise]pussy gushing against the open air, staining the beast, its[end if] release strained by [ghis] worming appendage";
			if dorroleint is 4:
				say ". Doran's own climax is quickly on its approach, shall you deny [ghim] of it?";
				if player consents: 
					say "     Immediately, your grip tightens around the base of [ghis] pre-slicked organ, stopping dead in your tracks. Too tied up right now to put up any real fight, the [gdragon] can only writhe and moan in disdain over being denied release. [gchis] lust eventually dies down, tongue slowly worming free of your hole before you let go of [ghim] and [if scalevalue of player < 4]climb[otherwise]get[end if] off. [gche]' visibly weakened by [ghis] unsated lust, of which you command [ghim] not to satisfy.";
					say "     '[one of]O-oh[or]A-ah[or]N-nng[at random], [one of][dorgr] torments their [gdragon] so[or]I will obey [dorgr]'s order[or]I pray [dorgr] will grant their [gdragon] release eventually[at random]...' Clearly strained and discomforted by the ordeal, [ghe] nonetheless makes an endeavour to clean you of the mess you've made, followed by [ghim]self when [ghe] returns to the fire.";
					now dornpbb is 2;
				otherwise:
					say "     You're staring down the [gdragon]'s pointed[if dorballmod > 0], sputtering[end if] barrel. When [ghe] does find release shall you aim [ghim] away from you? Else you'll take the full brunt of [ghis] blast.";
					if player consents:
						say "     Unable to hold back any longer, you feel the [gdragon]'s roar of bliss vibrating against your thighs, aiming [ghis] cock toward a nearby wall just before it's [if dorballmod > 0]uttery drenched with massive gouts[otherwise]doused with errant strings[end if] of [ghis] thick, white fluid[if dornpbb > 0], the magnitude of which intensified by [ghis] prior neglect[end if]. [if dorballmod > 0]Taking what seems like forever to subside[otherwise]Gradually subsiding[end if], your attendant pants audibly, bathing you in [ghis] warm breath while [ghe] recovers";
						now tempnum is 0;
					otherwise:
						say "     Unable to hold back any longer, you feel the [gdragon]'s roar of bliss vibrating against your thighs, you're immediately blasted with a[if dorballmod > 0]n overwhelmingly excessive[end if] barrage of the [gdragon]'s voluminous seed[if dornpbb > 0], the magnitude of which intensified by [ghis] prior neglect[end if], painting [if scalevalue of player < 4 or dorballmod > 0]you utterly[otherwise]your torso[end if] with strings of the thick, white fluid, until it [if dorballmod > 0]floods[otherwise]oozes[end if] down to meet your attendant's tongue, who -- though quite exhausted -- nonetheless remains very eager to [if dorballmod > 0]swallow down the excess[otherwise]lap it up[end if][if dorballmod > 0].[run paragraph on] By the time the flow subsides you're practically bathing in [ghis] cum, utterly drenched by the stuff[end if]";
						now tempnum is 1;
					say ". Eventually, ";
					if dorroleint is 4:
						say "you let [ghim] free, [if scalevalue of player < 4]climb[otherwise]gett[end if]ing off [ghim] before [ghe] cleans you of [if tempnum is 1 and dorballmod > 0]the excessive amounts of [ghis][otherwise if tempnum is 1]the remainder of [ghis][otherwise]any remaining[end if]";
					otherwise:
						say "[ghe] [if scalevalue of player < 4]puts you back down[otherwise]pulls out from under you[end if], cleaning you of [if tempnum is 1 and dorballmod > 0]the excessive amounts of [ghis][otherwise if tempnum is 1]the remainder of [ghis][otherwise]any remaining[end if]";	
					say " mess.";
					say "      '[if dorroleint is 4][one of]It pleases their [gdragon] that they could tend to them so[or]Oh, my [dorgr]'s ass is positively enviable[or]I could tend to [dorgr] like that for hours[at random][otherwise][one of]I hope I satisfied [dorgr][or]That was certainly a fun little digression[or]Oh, the things [dorgr] asks of me[at random][end if]!' Grinning slyly, [ghe] returns back to [ghis] place of rest once [ghe]'s satisfied with your present state, letting you gather your thoughts and go about your business once more.";
			otherwise:
				say ". Doran's own climax is quickly on its approach, shall you aim [ghim] away from you? Else you'll take the full brunt of [ghis] blast.";
				if player consents:
					say "     Unable to hold back any longer, you feel the [gdragon]'s roar of bliss vibrating against your thighs, aiming [ghis] cock toward a nearby wall just before it's [if dorballmod > 0]uttery drenched with massive gouts[otherwise]doused with errant strings[end if] of [ghis] thick, white fluid[if dornpbb > 0], the magnitude of which intensified by [ghis] prior neglect[end if]. [if dorballmod > 0]Taking what seems like forever to subside[otherwise]Gradually subsiding[end if], your attendant pants audibly, bathing you in [ghis] warm breath while [ghe] recovers";
					now tempnum is 0;
				otherwise:
					say "     Unable to hold back any longer, you feel the [gdragon]'s roar of bliss vibrating against your thighs, you're immediately blasted with a[if dorballmod > 0]n overwhelmingly excessive[end if] barrage of the [gdragon]'s voluminous seed[if dornpbb > 0], the magnitude of which intensified by [ghis] prior neglect[end if], painting [if scalevalue of player < 4 or dorballmod > 0]you utterly[otherwise]your torso[end if] with strings of the thick, white fluid, until it [if dorballmod > 0]floods[otherwise]oozes[end if] down to meet your attendant's tongue, who -- though quite exhausted -- nonetheless remains very eager to [if dorballmod > 0]swallow down the excess[otherwise]lap it up[end if][if dorballmod > 0].[run paragraph on] By the time the flow subsides you're practically bathing in [ghis] cum, utterly drenched by the stuff[end if]";
					now tempnum is 1;
				say ". Eventually, [ghe] [if scalevalue of player < 4]puts you back down[otherwise]pulls out from under you[end if], cleaning you of [if tempnum is 1 and dorballmod > 0]the excessive amounts of [ghis][otherwise if tempnum is 1]the remainder of [ghis][otherwise]any remaining[end if] mess.";
				say "     '[one of]I hope I satisfied [dorgr][or]That was certainly a fun little digression[or]Oh, the things [dorgr] asks of me[at random]!' Grinning slyly, [ghe] returns back to [ghis] place of rest once [ghe]'s satisfied with your present state, letting you gather your thoughts and go about your business once more.";
		otherwise:
			if dornpbb is 1, now dornpbb is 2;
			say "     Reveling in this lewd ritual, the [gdragon]'s oozing rod bobs unattended before you, though [ghe] is [if dorroleint is 4]obedient[otherwise]obliging[end if] enough to remain fixated on your ass, each irreverent twitch of [ghis] invading appendage expertly making you twist and writhe in pleasure. [gchis] talons soon move your stroke your previously unattended [if cocks of player > 1]cock[smn][otherwise]portal[sfn][end if] to supplement [ghis] work, intensifying your inevitable march closer to bliss.";
			say "     Wet sounds of [ghis] affection filling the air for only a brief moment longer, a loud moan slowly bursts from your lips, [if cocks of player > 1]dicks spurting their [cum load size of player] load against the [gdragon]'s torso, their[otherwise if cocks of player is 1]dick spurting its [cum load size of player] load against the [gdragon]'s torso, its[otherwise if cunts of player > 1]pussies gushing against the open air, staining the [gdragon]'s neck, their[otherwise]pussy gushing against the open air, staining the [gdragon]'s neck, its[end if] release strained by [ghis] worming appendage. Eventually, ";
			if dorroleint is 4:
				say "you let [ghim] free, [if scalevalue of player < 4]climb[otherwise]gett[end if]ing off [ghim] before [ghe] cleans you of any remaining";
			otherwise:
				say "[ghe] [if scalevalue of player < 4]puts you back down[otherwise]pulls out from under you[end if], cleaning you of any remaining";	
			say " mess.";
			say "     '[if dorroleint is 4][one of]It pleases their [gdragon] that they could tend to them so[or]Oh, my [dorgr]'s ass is positively enviable[or]I could tend to [dorgr] like that for hours[at random][otherwise][one of]I hope I satisfied [dorgr][or]That was certainly a fun little digression[or]Oh, the things [dorgr] asks of me[at random][end if]!' Grinning slyly, [ghe] returns back to [ghis] place of rest once [ghe]'s satisfied with your present state, letting you gather your thoughts and go about your business once more";

to say dorsub_7: [Oral Giving] [BODY MODDED]
	say "     Approaching [ghim], you [if dorroleint is 4]order[otherwise]ask[end if] the [gdragon] to lay on [ghis] back, who's more than eager to oblige. Once Doran is in position, [ghis] [if dorinternal is false and dorballmod > 0]sizeable genitalia is exposed before you, oversized sack and bulging sheath[otherwise if dorinternal is false]sizeable genitalia is exposed before you, ample sack and bulging sheath[otherwise]genital slit is exposed before you, cockhead peeking from its home and[end if] left to your mercy[if dorballmod > 0], already leaking precum[end if]. [if dorroleint is 4][gche][otherwise]It seems [ghe][end if][']ll let you do as you please, so perhaps you could obsess over this lewd offering? Otherwise, you'll keep your distance as you attend to [ghim].";
	if player consents:
		now tempnum is 1;
		if dorinternal is false:
			if dorballmod > 0:
				say "     Hands tracing up [ghis] crotch to meet [ghis] voluptuous, scaled balls, held taut against [ghim]. About the size of a basketball each each, the massive things [if scalevalue of player < 4]are too big to fit[otherwise if scalevalue of player is 4]barely fit[otherwise]still manage to fit[end if] within your grasp. Head lowering to revel in its scent, [ghis] hygiene can do little to subdue [ghis] virile, heady musk by this point, wafting up to meet your querying senses. Shall you taste them? Else you'll move on.";
			otherwise:
				say "     Hands tracing up [ghis] crotch to meet [ghis] voluptuous, scaled balls, held taut against [ghim]. About the size of a large grapefruit each, [if scalevalue of player < 3]they're too big to fit[otherwise if scalevalue of player is 3]they barely fit[otherwise]your large size allows you to fit them[end if] within your grasp. Head lowering to revel in its scent, [ghis] hygiene subdues [ghis] virile, heady musk, wafting up to meet your querying senses. Shall you taste them? Else you'll move on.";
		otherwise:
			say "     Hands tracing along [ghis] smooth, scaled crotch, the taut cleft yields slightly against your prying digits. It's a[if scalevalue of player > 3] considerable[otherwise if scalevalue of player < 3] slight[end if] challenge to force your fingers more than a couple inches in, the hole already quite crowded with [ghis] impressive rod, slowly emerging from its home. As it becomes more exposed, the air is filled with the creature's virile, heady scent. Shall you attend the hole with your tongue's affection? Else you'll move on.";
		if player consents:
			now tempnum is 2;
			say "     A faint moan is forced the [gdragon] in response to your slick appendage's curious inspection";
			if dorinternal is false:
				say ". Firmly though they are held in place, they nonetheless remain yielding enough against your lewd caress, taste awash in [ghis] [gmasculine] flavour. Continuing this for a few, long minutes, your attention eventually wanders upward. Sheath bulging further with this lewd attention, the head of the creature's dick partially exposed and dripping[if dorballmod > 0] considerably[end if] against [ghis] lean torso.";
				say "     Still lavishing your affection upon [ghis] package, your hands reach up to feel";
			otherwise:
				say ". Quite taut though the hole may be, it nonetheless yields somewhat against your probing organ after a bit of work, taste awash in [ghis] [gmasculine] flavour. Continuing to worm your way around [ghis] depths for a few, long minutes, your attention eventually wanders upward to the base of the creature's rapidly hardening dick, still only partially exposed and dripping[if dorballmod > 0] considerably[end if] against [ghis] lean torso.";
				say "     Still lavishing your affection upon [ghis] tight slit, your hands wander up to caress";
		otherwise:
			if dorinternal is false:
				say "     Slowly, your hands wander up to [ghis] sheath, dick's head exposed and drooling slightly from your attention as you feel";
			otherwise:
				say "     Slowly, your hands move to feel [ghis] partially exposed dick, head drooling [if dorballmod > 0]considerably[otherwise]slightly[end if] from your attention as you caress";
		if dorinternal is false:
			say " that taut housing. Barely able to contain [ghis] proud tool, it clearly wishes to be rid of its occupant, curvature of [ghis] sizeable knot felt hiding within these confines for the moment";
			say "     Your hand gently pumps along the sheath's length, graced with groans from the [gdragon] and the feel of [ghis] tool rising from [ghis] depths, until [ghis] cock is completely rigid and eager. Precum [if dorballmod > 0]sputtering all over[otherwise]staining[end if] [ghis] torso, it begs for attention.";
		otherwise:
			 say " [ghis] eager flesh. Your hand gently traces along its soft, precum-slicked length, causing the dragon to subtly writhe against the tease. The portal strains to squeeze [ghis] tool through its scaled lips, until [ghis] cock is completely rigid and eager. Precum [if dorballmod > 0]sputtering all over[otherwise]staining[end if] [ghis] torso, it begs for attention.";
	otherwise:
		now tempnum is 0;
		if dorinternal is false:
			say "     Impartially, your hand coils around [ghis] sheath, which is barely able to contain the [gdragon]'s dick, before [if dorroleint is 4]assertively[otherwise]gently[end if] pumping along its length, each successive motion exposing [ghis] tool further, inch by inch. Moans escaping the [gdragon]'s lips, you needn't do this for long until its completely rigid and eager before you, dripping with need.";
		otherwise:
			say "     Your digits firmly caress along the length of [ghis] taut, scaled lips, which seems barely able to contain the [gdragon]'s dick. Length growing more and more out from [ghis] bulging hole, your hand moves to [if dorroleint is 4]firmly[otherwise]gently[end if] pump along its length, each successive motion pulling inch after inch free from its ill-fitting home. Moans escaping the [gdragon]'s maw, you needn't do this for long until its completely rigid and eager before you, dripping[if dorballmod > 0] excessively[end if] with need.";
	say "     '[one of]Oh[or]Mm[or]Ah[or]Nng[at random], [dorgr], [if dorroleint is 4][one of]they're so very charitable to their [gdragon][or]I'm gifted with one so attentive[or]I hope everything is satisfactory[at random][otherwise][one of]it seems they're feeling very charitable[or]they're feeling very attentive, I see[or]I hope they like what they see[at random][end if].' [gchis] proud tool, slick a throbbing against the open air, it begs for your lip's embrace. Shall you heed its call? Else you'll [if tempnum > 1]continue to obsess over your present fixation[otherwise]maintain your distance[end if].";
	if player consents:
		if dorballmod > 0:
			say "     [gche]'s making quite a mess of [ghim]self. Is your plan to drink from the [gdragon]? Otherwise, you'll hold off on any such thing, for now.";
			if player consents:
				now dorrp_tv1 is 2;
			otherwise:
				now dorrp_tv1 is 1;
		otherwise:
			now dorrp_tv1 is 1;
		if dorinternal is false:
			say "     [if tempnum is 2]Pulling away from [ghis] balls[otherwise]Drawing closer[end if], ";
		otherwise:
			say "     [if tempnum is 2]Rising from [ghis] cockbase[otherwise]Drawing closer[end if], ";
		if dorrp_tv1 is 1:
			say "your tongue moves to caress along the [gdragon]'s precum-lubricated dick, overwhelming your senses with [ghis] heady, [gmasculine] flavour";
		otherwise:
			say "your lips move to embrace the tip of the [gdragon]'s precum-sputtering dick, flooding your maw with [ghis] heady, [gmasculine] fluid";
		if tempnum > 1, now tempnum is 1;
		if tempnum > 0:
			say ". Some eighteen inches in length, it's [if scalevalue of player < 4]an extremely intimidating tool[otherwise if scalevalue of player is 4]a fairly intimidating tool[otherwise]nothing someone of your size can't handle[end if], head tapered and flared, supported by a thick and slightly ribbed shaft, down to meet it's bulging knot. Pinkish in hue, it carries a bit of [ghis] turquoise colouration, becoming most intense at the base";
		say ".";
		if dorrp_tv1 is 2:
			say "     It's something of a challenge to keep up with [ghis] intense flow[if scalevalue of player > 3], though you're large enough to manage[otherwise], errant strings of [ghis] sexual fluids dripping from your mouth[end if]";
		otherwise:
			say "     Your attendance soon rewards you with errant spurts of [ghis] sexual fluids, staining [ghis] scaled torso further";
	otherwise:
		now dorrp_tv1 is 0;
		if dorinternal is false:
			say "     [if tempnum is 2]Heady scent of [ghis] attended orbs intensifying as your persistent work starts to make [ghim] sweat[otherwise]Observing from afar[end if], you continue to stroke the [gdragon]'s precum-lubricated dick, air quickly filling with [ghis] [gmasculine] smell, your efforts soon rewarded with errant spurts of [ghis] sexual fluids, staining [ghis] scaled torso further";
		otherwise:
			say "     [if tempnum is 2 and dorballmod > 0]Heady scent of [ghis] sex intensifying with your persistent work at [ghis] cockbase, the [gdragon]'s overabundant precum oozes downward to meet your attendance, overwhelming your taste with [ghis] [gmasculine] flavour[otherwise if tempnum is 2]Heady scent of [ghis] sex intensifying with your persistent work at [ghis] cockbase, the [gdragon]'s precum oozes downward to meet your attendance, flooding your taste with [ghis] [gmasculine] flavour[otherwise]Observing from afar, you continue to stroke the [gdragon]'s precum-lubricated dick, your efforts soon rewarded with errant spurts of [ghis] sexual fluids, staining [ghis] scaled torso further[end if]";	
	say ". You imagine you could get away with stimulating [ghim] anally as well, shall you?";
	if player consents:
		now dorrp_tv2 is 1;
		say "     Reaching a hand between [ghis] scaled thighs, [if scalevalue of player < 3]you're a bit strained to properly reach [ghim], attention split as you are, digits [otherwise]your digits[end if] soon push past [ghis] supple anal ring. [gchis] prostate is quite deep in there, [if scalevalue of player < 4] and you're ultimately forced to pushed the whole of your hand in to reach it[otherwise]but you manage to reach it with little difficulty[end if]. The [gdragon] clearly approves of all this, your lewd, internal caress causing [ghim] to tense with every motion.";
	say "     '[one of]A-ah[or]O-oh[or]N-nng[at random], [if dorroleint is 4][one of]Milk y-your [gdragon] dry, M-[dorgr][or]I beg f-for bliss, [dorgr][or]I can't c-control myself, M-[dorgr][at random][otherwise][one of]I-I can't hold of any longer, M-[dorgr][or][dorgr], I'm g-gonna blow[or]M-[dorgr][at random][end if]...!' Panting audibly in the wake of your continued affection, ";
	if dorroleint is 4:
		say "you can deny [ghim] orgasm, shall you? Else you'll sate the [gdragon]'s rising lust.";
		if player consents:
			say "     Just when [ghe] might find satisfaction, you immediately pull free of [ghim]. Lost in a haze of [ghis] terrible need, [ghe] instinctively tries to reach for [ghis] dick and take your place, only for you to pull [ghis] talons away and scold [ghim] until [ghe] obliges. Panting, and with [ghis] lust slowly dieing back down, [ghe] looks like a bit of an addled[if dorballmod > 0], precum-stained[end if] mess.";
			say "     '[one of]Oh[or]Tsk[or]Ah[at random], [one of]how [dorgr] teases me so[or]the things [dorgr] subjects me to[or]I hope I haven't upset [dorgr][at random]...' Still aching, you imagine [ghe]'s obedient enough that [ghe] won't satisfy [ghim]self the second you turn your back. Eventually, when you allow [ghim], [ghe] cleans [ghim]self off a bit and goes back to [ghis] place of rest, to recover. Denied orgasm though [ghe] might have been, there's no question that this little ritual has left you a little aroused, yourself...";
			now dornpbb is 2;
			now dorbb is true;
		otherwise:
			say "     Very well, shall you [if tempnum > 1]shift your attention to [ghis] dick and [otherwise if dorrp_tv1 is 2][otherwise if dorrp_tv1 is 0]move in and [end if]finish this by sucking [ghim] off? Else [ghe][']ll waste [ghis] load against [ghim]self.";
			if player consents:
				say "     Quickly, you [if tempnum > 1]move your way up to engulf [ghis] cockhead within your lips[otherwise if dorrp_tv1 is 2]plunge [ghis] cock as deep down your throat as you're comfortable with[otherwise]move in to engulf [ghis] cockhead within your lips[end if][if scalevalue of player < 4], your small body barely able to contain it[end if], madly [if dorrp_tv2 is 1]milking[otherwise]pumping[end if] the beast. This is more than enough to bring [ghim] over the edge, roaring out weakly as [ghis] dick[if dorrp_tv2 is 1] and anal ring[end if] throb against your touch, unloading gout after successive[if dorballmod > 0], overwhelming[end if] gout into your eager maw[if dornpbb > 0], its volume exacerbated from [ghis] prior neglect[end if]";
				if scalevalue of player < 4:
					say ". [if dorroleint is 4 and dorballmod is 0]Substantial though [ghis] load is, [ghe]'s trained enough restrained to not overwhelm you, allowing your diminutive form to down the thick, potent seed with little difficulty[otherwise if dorballmod > 0]Given how diminutive your form is, [ghis] excessive release is simply too much for you to handle, the potent seed almost immediately sputtering from your hole[otherwise]Given how diminutive your form is, you can barely keep up with all of it, [ghis] thick, potent seed quickly sputtering from your hole[end if].";
				otherwise if dorballmod > 0:
					say ". Even as large as you are, it's a challenge to keep up with [ghis] excessive load[if dorroleint is 4], though the obedient [gdragon] manages to muster enough restraint to let you savour [ghis] thick, potent seed[otherwise], the [gdragon]'s thick, potent seed soon sputtering from your lips[end if].";
				otherwise:
					say ". You gulp down [ghis] load with little difficulty[if dorroleint is 4], aided by the obedient [gdragon] managing some measure of restraint[end if], allowing you to savour [ghis] thick, potent seed";
			otherwise:
				if dorinternal is false:
					say "     [if tempnum is 2 and dorballmod > 0]Revelling in [ghis] massive orbs[otherwise if tempnum is 2]Revelling in [ghis] substantive orbs[otherwise if dorrp_tv1 is 2]Pulling out to caress your tongue along [ghis] oozing cock[otherwise if dorrp_tv1 is 1]Delighting in [ghis] oozing cock[otherwise]Continuing to watch from afar[end if]";
				otherwise:
					say "     [if tempnum is 2]Revelling in [ghis] precum-soaked cockbase[otherwise if dorrp_tv1 is 2]Pulling out to caress your tongue along [ghis] oozing cock[otherwise if dorrp_tv1 is 1]Delighting in [ghis] oozing cock[otherwise]Continuing to watch from afar[end if]";
				say ", it's not long before your continued [if dorrp_tv2 is 1]milking[otherwise]pumping[end if] makes the beast roar out weakly, [ghis] dick[if dorrp_tv2 is 1] and anal ring[end if] throbbing against your hands, spending gout after successive[if dorballmod > 0], overwhelming[end if] gout against [ghis] face and torso[if dornpbb > 0], its volume exacerbated from [ghis] prior neglect[end if]";
				say ". Eventually, you pull free of the [gdragon], now a spent and panting mess.";
			say "     '[if dorroleint is 4][one of][dorgr]'s [gdragon] immensely appreciates this gift[or]This [gdragon] is gifted with such a generous [dorgr][or]I'm glad [dorgr] appreciates their [gdragon][at random][otherwise][one of]Clearly [dorgr] was feeling a bit generous[or]No doubt [dorgr] likes what the see[or]I hope [dorgr] enjoyed attending to their [gdragon][at random][end if]!' Having very much enjoyed this little ritual, [ghe] eventually moves to clean both you and [ghim]self up, returning back to [ghis] place of rest[if dorroleint is 4] once you'll allow [ghim][end if]. Though [ghe] certainly got a kick out of it, there's no question that relieving [ghim] has left you a bit lust-addled...";
			now dorbb is true;
	otherwise:
		say "shall you [if tempnum > 1]shift your attention to [ghis] dick and[otherwise if dorrp_tv1 is 0]move in and[end if] finish this by sucking [ghim] off? Else [ghe]'ll waste [ghis] load against [ghim]self.";
		if player consents:
			say "     Quickly, you [if tempnum > 1]move your way up[otherwise]move in[end if] to engulf [ghis] cockhead within your lips[if scalevalue of player < 4], your small body barely able to contain it[end if], madly [if dorrp_tv2 is 1]milking[otherwise]pumping[end if] the beast. This is more than enough to bring [ghim] over the edge, roaring out weakly as [ghis] dick[if dorrp_tv2 is 1] and anal ring[end if] throb against your hands, unloading gout after successive[if dorballmod > 0], overwhelming[end if] gout into your eager maw[if dornpbb > 0], its volume exacerbated from [ghis] prior neglect[end if]";
			if scalevalue of player < 4:
				say ". [if dorroleint is 4 and dorballmod is 0]Substantial though [ghis] load is, [ghe]'s trained enough restrained to not overwhelm you, allowing your diminutive form to down the thick, potent seed with little difficulty[otherwise if dorballmod > 0]Given how diminutive your form is, [ghis] excessive release is simply too much for you to handle, the potent seed almost immediately sputtering from your hole[otherwise]Given how diminutive your form is, you can barely keep up with all of it, [ghis] thick, potent seed quickly sputtering from your hole[end if]";
			otherwise if dorballmod > 0:
				say ". Even as large as you are, it's a challenge to keep up with [ghis] excessive load[if dorroleint is 4], though the obedient [gdragon] manages to muster enough restraint to let you savour [ghis] thick, potent seed[otherwise], the [gdragon]'s thick, potent seed soon sputtering from your lips[end if].";
			   otherwise:
				   say ". You gulp down [ghis] load with little difficulty[if dorroleint is 4], aided by the obedient [gdragon] managing some measure of restraint[end if], allowing you to savour [ghis] thick, potent seed";
		otherwise:
			say "     [if tempnum is 2]Substantive balls churning against your touch[otherwise if dorrp_tv1 is 1]Delighting in [ghis] oozing cock[otherwise]Continuing to watch from a distance[end if], it's not long before your continued [if dorrp_tv2 is 1]milking[otherwise]pumping[end if] makes the beast roar out weakly, [ghis] dick[if dorrp_tv2 is 1] and anal ring[end if] throbbing against your hands, spending gout after successive[if dorballmod > 0], overwhelming[end if] gout against [ghis] face and torso[if dornpbb > 0], its volume exacerbated from [ghis] prior neglect[end if]";
		say ". Eventually, you pull free of the [gdragon], now a spent and panting mess.";
		say "      '[if dorroleint is 4][one of][dorgr]'s [gdragon] immensely appreciates this gift[or]This [gdragon] is gifted with such a generous [dorgr][or]I'm glad [dorgr] appreciates their [gdragon][at random][otherwise][one of]Clearly [dorgr] was feeling a bit generous[or]No doubt [dorgr] likes what they see[or]I hope [dorgr] enjoyed attending to their [gdragon][at random][end if]!' Having very much enjoyed this little ritual, [ghe] eventually moves to clean both you and [ghim]self up, returning back to [ghis] place of rest[if dorroleint is 4] once you'll allow [ghim][end if]. Though [ghe] certainly got a kick out of it, there's no question that relieving [ghim] has left you a bit lust-addled...";
		now dorbb is true;

to say dorsub_snub: [Sub Doran snubbed]
	say "'[dorgr].' [gche] turns and sits back down next to the fire.";
	now dorwassnub is true;

Section 3.3 - Neutal Doran Sex

to say dorneut_1: [BODY MODDED]
	say "     Making an offer to Doran, [ghe] briefly considers [ghis] choices. Eventually coming to a conclusion [ghe] eagerly grins[if scalevalue of player < 4] down[end if] at you.";
	say "     '[one of]Ah[or]Oh[or]Hm[at random], [one of]perhaps [dorgr] would prefer a bit of mutual fun?[run paragraph on]I think [dorgr]'s [gdragon] is feeling particularly adventurous right now.[run paragraph on][or]methinks [dorgr]'s [gdragon] would like to do something a little different.[run paragraph on][at random]' Moving closer [ghe] offers to remove any attire you might have on you, affectionately nosing you all the while.";
	say "     'Would [dorgr] prefer to be on top, or bottom?'";
	now tempnum is 0;
	now tempnum2 is 0;
	now calcnumber is -1;
	let tempnum3 be 0;
	let trixieexit be 0;
	while trixieexit is 0:
		say "[bold type](1)[roman type] [link]'Top.'[as]1[end link]";
		say "[bold type](2)[roman type] [link]'Bottom.'[as]2[end link]";
		say "[bold type](3)[roman type] [link]'You decide.'[as]3[end link]";
		while 1 is 1:
			say "Choice? (1-3)>[run paragraph on]";
			get a number;
			if calcnumber >= 1 and calcnumber <= 3:
				break;
			otherwise:
				say "'I'm sorry, could you repeat that?'";
		if calcnumber is 1:
			now tempnum is 1;
			say "     '[one of]Very well[or]Certainly[or]No problem[at random].' T";
			now trixieexit is 1;
		otherwise if calcnumber is 2:
			now tempnum is 2;
			say "     '[one of]Very well[or]Certainly[or]No problem[at random].' T";
			now trixieexit is 1;
		otherwise:
			now tempnum is a random number between 1 and 2;
			say "     'Oh, [one of]how generous[or]my thanks[or]a pleasure[at random]!' T";
			now trixieexit is 1;
		say "he [gdragon] [if tempnum is 1]rolls onto [ghis] back and invites you to climb on [ghim][otherwise if scalevalue of player < 4]sets you down on the ground before moving over you[otherwise]sets you down on the ground before climbing atop you[end if], such that you offer [ghim] unobstructed access to your exposed hindquarters. In turn, you're presented with [ghis] substantive, partially aroused assets [if tempnum is 1]before[otherwise]above[end if] you, the beast eager to tease by prodding you with its [if dorballmod > 0]perpetually sputtering[otherwise]already oozing[end if] tip.";
		if tempnum is 1:
			say "     Shall you go all in? Else you'll show some restraint.";
			if player consents:
				say "     Immediately, you thrust the dripping rod between your lips, [if scalevalue of player < 3]quickly overwhelmed by its size, further exacerbated[otherwise if scalevalue of player is 3]somewhat overwhelmed by its size, further exacerbated[otherwise]easily handling the impressive organ, even[end if] as it grows to full attention. [if dorballmod > 0]Already forced to swallow down [ghis] abundant, [gmasculine] precum[otherwise]Taste awash in [ghis] [gmasculine] flavour[end if], your shameless";
				now tempnum2 is 1;
			otherwise:
				say "     Slowly, you wrap your hand around the dripping rod, gradually pumping the impressive organ until it grows to full attention. Digits quickly [if dorballmod > 0]drowing in[otherwise]made slick with[end if] [ghis] thick, [gmasculine] precum, your";
				now tempnum2 is 2;
			say " attendance is quickly reciprocated, Doran";
			if cocks of player > 0 and (((cunts of player > 0 or anallevel is 3) and a random chance of 1 in 2 succeeds) or (cunts of player is 0 and anallevel is not 3)):
				say " wrapping [ghis] tongue around[if cocks of player > 1] one of[end if] your [cock size desc of player] dick[smn], [ghis] slick affection easily driving you hard and";
				now tempnum3 is 1;
				if cock width of player > 24 and dorvorreg is 2, now dorvornpcf is true;
			otherwise if cunts of player > 0 and ((anallevel is 3 and a random chance of 1 in 2 succeeds) or anallevel is not 3):
				say "'s tongue caressing along the entrance of[if cunts of player > 1] one of[end if] your cunt[sfn] before plunging the writhing appendage into your supple depths,";
				now tempnum3 is 2;
			otherwise:
				say "'s tongue caressing along the entrance of your anal ring before plunging the writhing appendage into your fleshy abyss,";
				now tempnum3 is 3;
			say " drawing out a[if tempnum2 is 1] muffled[end if] moan from your lips.";
		otherwise:
			now tempnum2 is 1;
			say "     Subject to the[if scalevalue of player < 4] substantive[end if] weight of the [gdragon], [ghe] eagerly exploits this more dominant position to thrust [ghis] dripping rod between your lips, [if scalevalue of player < 3]quickly overwhelmed by its size, further exacerbated[otherwise if scalevalue of player is 3]somewhat overwhelmed by its size, further exacerbated[otherwise]easily handling the impressive organ, even as it[end if] grows to full attention. [if dorballmod > 0]Already forced to swallow down [ghis] abundant, [gmasculine] precum[otherwise]Taste instantly awash in [ghis] [gmasculine] flavour[end if], Doran happily offers to reciprocate your attendance, ";
			if cocks of player > 0 and (((cunts of player > 0 or anallevel is 3) and a random chance of 1 in 2 succeeds) or (cunts of player is 0 and anallevel is not 3)):
				say "wrapping [ghis] tongue around[if cocks of player > 1] one of[end if] your [cock size desc of player] dick[smn], [ghis] slick affection easily driving you hard and";
				now tempnum3 is 1;
				if cock width of player > 24 and dorvorreg is 2, now dorvornpcf is true;
			otherwise if cunts of player > 0 and ((anallevel is 3 and a random chance of 1 in 2 succeeds) or anallevel is not 3):
				say "tongue caressing along the entrance of[if cunts of player > 1] one of[end if] your cunt[sfn] before plunging the writhing appendage into your supple depths,";
				now tempnum3 is 2;
			otherwise:
				now tempnum3 is 3;
				say "tongue caressing along the entrance of your anal ring before plunging the writhing appendage into your fleshy abyss,";
			say " forcing a muffled moan from your lips.";
		say "     As [ghis] affection picks up in pace, scaled lips soon [if tempnum3 is 1]enveloping your dick[otherwise if tempnum3 is 2]embracing your cunt[otherwise]embracing your ass[end if], you are, in turn, driven further to [if tempnum2 is 1]pump[otherwise]suck off[end if] [ghis] sputtering cock. Quickly [if tempnum is 2]bathed[otherwise]awash[end if] in heat and sweat from your[if scalevalue of player < 4] larger[end if] companion as this back-and-forth reaches a fever pitch, until [if tempnum is 2]his body begins to tremble, unable to restrain [ghim]self as [ghe] thrusts against your touch, yourself[otherwise]your body begins to treble unable to restrain yourself as you thrust against [ghis] touch, [ghim]self[end if] doing the same.";
		if libido of player > 40:
			say "     Too sensitive to hold back for very long, you're soon letting out a[if tempnum2 is 1] stifled[end if] cry, [if tempnum3 is 1 and cocks of player > 2]unloading your [cum load size of player] load into the beast's eager maw, its brothers staining the rest between your torsos[otherwise if tempnum3 is 1 and cocks of player is 2]unloading your [cum load size of player] load into the beast's eager maw, its brother staining the rest between your torsos[otherwise if tempnum3 is 1]unloading your [cum load size of player] load into the beast's eager maw[otherwise if tempnum3 is 2 and cocks of player > 0]supple lips squeezing around [ghis] invading appendage as your cock[smn] fires off your [cum load size of player] load between your torsos[otherwise if tempnum3 is 2]supple lips squeezing around [ghis] invading appendage[otherwise if tempnum3 is 3 and cunts of player > 0 and cocks of player is 0]supple ring squeezing around [ghis] invading appendage as your dripping cunt[sfn] ache[sfv] for attention[otherwise if tempnum is 3 and cocks of player > 0]supple ring squeezing around [ghis] invading appendage as your [cock size desc of player] cock[smn] fire[smv] off your [cum load size of player] load between your torsos[otherwise]supple ring squeezing around [ghis] invading appendage as your writhe in insatiable lust[end if]. You're dazed by your satisfied need, but you're not done yet, and Doran drives you on to continue your end of the bargain.";
		if tempnum is 1:
			say "     It's clear [ghe] can't hold back any longer! Shall you pull [if tempnum2 is 2]in and suck [ghim] off at the last second[otherwise]out just before [ghe] blows[end if]?";
			if tempnum2 is 2:
				if player consents:
					say "     Lips meeting to embrace [ghis] gushing, flared head, it's more than enough to[if libido of player > 40] finally[end if] set the [gdragon] off, [ghis] roar in bliss muffled against your [bodytype of player] form as your maw is quickly [if dorballmod < 0]overwhelmed[otherwise]flooded[end if] with wave after [if dorballmod > 0]excessive[otherwise]successive[end if] wave of [ghis] [if dorballmod > 0]seemingly endless[otherwise]substantial[end if] load, quickly [if scalevalue of player < 3 or dorballmod > 0]sputtering from your lips[otherwise]making your dizzy with how much you're driven to swallow[end if][if libido of player > 40].[run paragraph on] Eventually things begin to die down and you're given a moment to catch your breath[end if].";
					if dorvorreg is 2, now dorvorpcf is true;
				otherwise:
					if libido of player < 41, now tempnum2 is 2;
					say "     Shall you aim away from you? Else you'll get painted by the stuff.";
					if player consents:
						say "     Directing the rod away from you, it takes only a few more seconds before you [if libido of player > 40] finally[end if] set the [gdragon] off, [ghis] roar in bliss muffled against your [bodytype of player] form as the rocky wall is[if dorballmod > 0] utterly[end if] drenched with wave after [if dorballmod > 0]excessive[otherwise]successive[end if] wave of [ghis] [if dorballmod > 0]seemingly endless[otherwise]substantial[end if] load[if libido of player > 40].[run paragraph on] Eventually, things begin to die down, and you're given a moment to catch your breath[end if].";
					otherwise:
						say "     You only have to stare down [ghis] barrel for a few more seconds before you [if libido of player > 40] finally[end if] set the [gdragon] off, [ghis] roar in bliss muffled against your [bodytype of player] as you're immediately[if dorballmod > 0] and utterly[end if] drenched with wave after [if dorballmod > 0]excessive[otherwise]successive[end if] wave of [ghis] [if dorballmod > 0]seemingly endless[otherwise]substantial[end if] load[if dorballmod > 0].[run paragraph on] You're quickly dazed by the sheer volume, practically bathing in [ghis] seed[end if][if libido of player > 40].[run paragraph on] Eventually, things begin to die down, and you're given a moment to catch your breath[end if].";
			otherwise:
				if player consents:
					say "     Shall you aim away from you? Else you'll get painted by the stuff.";
					if player consents:
						say "     Pulling out directing the rod away from you, it takes only a few more seconds before you [if libido of player > 40] finally[end if] set the [gdragon] off, [ghis] roar in bliss muffled against your [bodytype of player] form as the rocky wall is[if dorballmod > 0] utterly[end if] drenched with wave after [if dorballmod > 0]excessive[otherwise]successive[end if] wave of [ghis] [if dorballmod > 0]seemingly endless[otherwise]substantial[end if] load[if libido of player > 40].[run paragraph on] Eventually, things begin to die down, and you're given a moment to catch your breath[end if].";
					Otherwise:
						say "     Pulling away, you only have to stare down [ghis] barrel for a few more seconds before you [if libido of player > 40] finally[end if] set the [gdragon] off, [ghis] roar in bliss muffled against your [bodytype of player] as you're immediately[if dorballmod > 0] and utterly[end if] drenched with wave after [if dorballmod > 0]excessive[otherwise]successive[end if] wave of [ghis] [if dorballmod > 0]seemingly endless[otherwise]substantial[end if] load[if dorballmod > 0].[run paragraph on] You're quickly dazed by the sheer volume, practically bathing in [ghis] seed[end if][if libido of player > 40].[run paragraph on] Eventually, things begin to die down, and you're given a moment to catch your breath[end if].";
				otherwise:
					if libido of player < 41, now tempnum2 is 1;
					say "     Plunging [ghis] gushing rod down your hole as far as you can muster, it's more than enough to[if libido of player > 40] finally[end if] set the [gdragon] off, [ghis] roar in bliss muffled against your [bodytype of player] form as your maw is quickly flooded with wave after successive wave of [ghis] substantial load, quickly [if scalevalue of player < 4]sputtering from your lips[otherwise]making your dizzy with how much you're driven to swallow[end if][if libido of player > 40].[run paragraph on] Eventually, things begin to die down, and you're given a moment to catch your breath[end if].";
					if dorvorreg is 2, now dorvorpcf is true;
		otherwise:
			say "     Unable to hold back any longer the [gdragon] plunges [ghis] gushing rod down your hole as far as you can take, more than enough to[if libido of player > 40] finally[end if] set [ghim] off, , [ghis] roar in bliss muffled against your [bodytype of player] form as your maw is quickly [if dorballmod < 0]overwhelmed[otherwise]flooded[end if] with wave after [if dorballmod > 0]excessive[otherwise]successive[end if] wave of [ghis] [if dorballmod > 0]seemingly endless[otherwise]substantial[end if] load, quickly [if scalevalue of player < 3 or dorballmod > 0]sputtering from your lips[otherwise]making your dizzy with how much you're driven to swallow[end if][if libido of player > 40].[run paragraph on] Eventually things begin to die down and you're given a moment to catch your breath[end if].";
			if dorvorreg is 2, now dorvorpcf is true;
		if libido of player < 41:
			say "     Your turn quickly following on the heels of [ghis] own, you let out a[if tempnum2 is 1] stifled[end if] cry, [if tempnum3 is 1 and cocks of player > 2]unloading your [cum load size of player] load into the beast's eager maw, its brothers staining the rest between your torsos[otherwise if tempnum3 is 1 and cocks of player is 2]unloading your [cum load size of player] load into the beast's eager maw, its brother staining the rest between your torsos[otherwise if tempnum3 is 1]unloading your [cum load size of player] load into the beast's eager maw[otherwise if tempnum3 is 2 and cocks of player > 0]supple lips squeezing around [ghis] invading appendage as your cock[smn] fires off your [cum load size of player] load between your torsos[otherwise if tempnum3 is 2]supple lips squeezing around [ghis] invading appendage[otherwise if tempnum3 is 3 and cunts of player > 0 and cocks of player is 0]supple ring squeezing around [ghis] invading appendage as your dripping cunt[sfn] ache[sfv] for attention[otherwise if tempnum is 3 and cocks of player > 0]supple ring squeezing around [ghis] invading appendage as your [cock size desc of player] cock[smn] fire[smv] off your [cum load size of player] load between your torsos[otherwise]supple ring squeezing around [ghis] invading appendage as your writhe in insatiable lust[end if]. Dazed by your satisfied need, you require quite a while to catch your breath.";
		if dorvorreg is 2 and scalevalue of player < 4:
			say "     '[one of]Oh[or]Ah[or]Yes[at random], [one of]but [dorgr]'s fun has just begun[or][dorgr]'s [gdragon] isn't done with them just yet[or]now comes my favourite part[at random]!' [if tempnum is 1]Grinning at you, Doran pulls you closer, grip firmly wrapped around your smaller form[otherwise]Still pinning you down, Doran grins at you, [ghis] tongue caressing your smaller form[end if], clearly eager to make a meal of you.";
			dorvore;
		otherwise:
			say "     '[one of]Oh[or]Hm[or]Yes[at random], [one of]I hope [dorgr] had plenty of fun[or]I hope [dorgr]'s [gdragon] didn't make too much of a mess[or][dorgr] is always fun to play with[at random]!' [if tempnum is 1]Helping you off[otherwise]Climbing off of you[end if], Doran goes about checking you over and cleaning you up before allowing you to gather your things and go about your business once more, the [gdragon] no doubt needing a bit of time to clean up the rest of the mess.";

Section 3.4 - Doran Vore Protocol

dorvorpcf is a truth state that varies. dorvorpcf is usually false. [Doran Vore Player Cum Filled, identifies player state for the vore pool]
dorvornpcf is a truth state that varies. dorvorpcf is usually false. [Doran Vore Non-Player Cum Filled, identifies Doran state for the vore pool]
dorvornpa is a truth state that varies. dorvornpa is usually false. [Doran Vore Non-Player Annoyed, idenfies Doran state for vore pool]

to dorvore: [Invocation of Doran Vore Protocol]
	if waiterhater is 0:
		wait for any key;
		say "[line break]";
	if a random chance of 1 in 2 succeeds: [Foot-first Variant]
		say "     Talons binding your legs between [ghis] scaled thumb and index, you're made to writhe against the feel of [ghis] slick organ teasing your exposed feet. The [gdragon] amused by your squirming, [ghis] digit's hold rises further up your form, its place taken by that same tongue, tugging you feet-first towards [ghis] open maw.";
		say "     [gche]'s particularly inclined to give you a telling view of your fate. Exploiting the [if daytimer is day]creeping day[otherwise]fire's [end if]light to let you clearly see [ghis] drooling, fleshy abyss. Lined with an intimidating set of teeth, [ghe] [if dorroleint is 0]occasionally teases you by rubbing them harmlessly against your legs[otherwise]nonetheless takes great care to not subject you to them[end if] as you're pulled further into [ghis] depths, talons holding you by your [bodydesc of player] torso as you're brought further within these slick confines.";
		say "     Eventually, [ghe] pulls the rest of you from the ground, rearing [ghis] head into the air and freeing you of [ghis] grip to let gravity do [ghis] job for [ghim]. Unbound though you now may be, the slippery pit nonetheless makes avoiding your descent impossible. [gchis] tongue's warm caress felt writhing against your vulnerable body, your feet are tightly embraced by the beast's gullet, your progressive descent is eventually emphasized by the closing of [ghis] teeth behind you, blocking out any remaining vestige of light.";
		say "     This supple ring pulls you deeper and deeper to your inevitable destination, deliberate, exaggerated gulping on the [gdragon]'s part drawing you further into [ghis] overwhelmingly heated confines, foot by foot, with a particular expedience. The fruit of [ghis] labours seems imminent when your feet might be granted the reprieve of [ghis] much roomier stomach";
		if dorbb is true:
			say ". As you're inevitably enveloped along your crotch, your previously unattended arousal is brought once more to the forefront, though your circumstance remains too confining to properly resolve it at this very second";
		say ", the remainder of you squeezed through in no time.";
	otherwise: [Head-first Variant]
		say "     Slick appendage's affection persisting, you repeatedly feel [ghis] heated breath washing over you, [ghis] maw is agape to give you a clear view of your inevitable descent. Generally fastidious though Doran may be, this primal gesture causes [ghim] to start drooling over you, no doubt eager for your taste.";
		say "     Intimidating teeth bordering [ghis] is wet, fleshy abyss from the outside world, the [gdragon][if dorroleint is 0]'s inclined to tease you, nipping [ghis] little companion before[otherwise] takes great care to spare you from them as[end if] that same tongue pulls you head-first into [ghis] voracious maw, using a talon to help guide your way. Supple, eager surface caressing your face and [bodydesc of player] torso, the beast revels in subjecting you to this touch in partial darkness.";
		say "     Gradually rearing [ghis] head up, you make your sliding descent along the slick organ before you're stopped by [ghis] oppressively tight gullet";
		if dorbb is true:
			say ". The feel of [ghis] wriggling, indignant appendage against your crotch brings the matter of your previously unattended arousal to the forefront once more, though the immediacy of your circumstance doesn't really grant you the opportunity to satisfy yourself";
		say ". The previous, meager light of [if daytimer is day]day[otherwise][ghis] fire[end if] giving way to utter blackness, you're slowly enveloped by it, [ghis] prior grip eventually relinquished when it is no longer needed.";
		say "     You're not subject to this ritual for very long, as gravity and [ghis] throat's muscles make quick work of you. Tight ring pulling you deeper and deeper into [ghis] heated tunnel before your head is finally granted the reprieve of [ghis] much more abiding stomach, and seconds later what remains of you follows suit.";
	say "     At the conclusion your descent into the Doran's slippery, fleshy prison,[if dorvornpcf is true] a cum-filled mess of your own make as[end if] [ghe] strokes [ghis]--[if scalevalue of player is 3]doubtlessly bugling[otherwise]somewhat bulging[end if]--belly in satisfaction. The supple, yielding confines embrace you in your fetal position, [if dorvornpcf is true]a dizzyingly heady swill of semen and[otherwise]slick with [ghis] heady[end if] saliva";
	if dorbb is true:
		now dorbb is false;
		say ". Finally overtaken by your overwhelming, unsated lust, and free to satisfy it you're driven to [if cocks of player > 0]jerk yourself off[otherwise]fondle yourself[end if] right there within these walls, certainly not needing much time before you set yourself off, ";
		if cocks of player > 1:
			if cock width of player > 24:
				say "voluminous load quickly flooding these pulsing holdings, exacerbating Doran's already[if scalevalue of player < 3] somewhat[end if] bloated state and forcing you to bathe in a pool of your own spent jizz";
				now dorvornpcf is true;
			otherwise:
				say "spending your [cum load size of player] against these pulsing holdings, further making it slick";
		otherwise:
			say "spending yourself against these pulsing holdings, further making it slick";
		if dorvordur is 0:
			say ". Finally satisfied, you black out from the whole affair.";
			say "[dorvorcdis]";
		otherwise:
			say ". Amused by your little digression, [ghe] gets up and struts around the cave with you in tow, doubtless [if dorvornpcf is true]sloshing[otherwise]jostling[end if] you about ever so slightly.";
			say "     '[one of]Hm[or]Tsk[or]Ha[at random]! [one of]My naughty little [dorgr] couldn't resist the chance to satisfy themselves[or]So sensitive is my little [dorgr][at random], [if cock width of player > 24][one of]they'll just have spend their stay with what they have wrought[or]I guess they'll just have to spend their time in there as a cummy little mess[at random][otherwise][one of]I should probably keep them in there for doing that[or]I'll just have to find a way to punish them further down the line[at random][end if]!' [gchis] teasing muffled by your enclosure, [ghe]'s no doubt amused by the circumstance [ghe] has subjected you to";
			If dorvordur is 1:
				if dorvordis is 0:
					say ". Overwhelmed by exhaustion, you soon pass out after that.";
					say "[dorvorcdis]";
				otherwise:
					say ".";
					say "[dorvorpdis]";
			otherwise if dorvordur is 2:
				say ". Eventually, [ghe] chooses to go about [ghis] business while you still remain inside [ghim].";
				say "[dorvorlpa]";
				if waiterhater is 0:
					wait for any key;
					say "[line break]";
				if dorvordis is 0:
					say ". Overwhelmed by exhaustion, you lose consciousness soon after that.";
					say "[dorvorcdis]";
				otherwise:
					say ".";
					say "[dorvorpdis]";
			otherwise if dorvordur is 3:
				say ". Eventually, [ghe] chooses to go about [ghis] business while you still remain inside [ghim].";
				say "[dorvorlpa]";
				say "[dorvorlpb]";	
	otherwise if dorvordur is not 0:
		say ". Eventually, Doran climbs back to [ghis] feet, clearly feeling somewhat amused as [ghe] struts around the cave, [if dorvornpcf is true]sloshing[otherwise]jostling[end if] you about ever so slightly.";
		say "     '[one of]Oh[or]Yes[or]Heh[at random], ";
		if dorroleint is 0:
			say "[if dorvornpa is true][one of]maybe next time my [dorgr] will perform better[or]at the very least my [dorgr] makes for a good meal, in spite of themselves[or]I have half a mind to keep my [dorgr] in there, for their failures[at random][otherwise][one of]my slutty little [dorgr] is just as good a meal as they are at servicing their [gdragon][or]I have half a mind to keep my [dorgr] in there if it means I can keep them with me[or]my [dorgr] is just as good a toy as they are a snack[at random]";
		otherwise:
			say "[one of]I must thank my [dorgr] for this opportunity[or]I enjoy being close to my [dorgr] like this[or]it feels so nice to be full with my [dorgr][at random]";
		say ", and [if dorvornpcf is true][one of]I'm certain they rather enjoy swimming in their own seed[or]I'm so full, with all they've filled me with[at random][otherwise if dorvorpcf is true][one of]they taste all the better filled with their [gdragon]'s cum[or]I bet they'd like to take a moment to digest their [gdragon]'s load[at random][otherwise][one of]I bet they like it in there[or]I'm certain they enjoy keeping me company like this[at random][end if].' [gchis] brief musing significantly muffled by your enclosure, it's clear [ghe] enjoys subjecting you to this circumstance";
		If dorvordur is 1:
			if dorvordis is 0:
				say ". Overwhelmed by exhaustion, you soon pass out after that.";
				say "[dorvorcdis]";
			otherwise:
				say ".";
				say "[dorvorpdis]";
		otherwise if dorvordur is 2:
			say ". Eventually, [ghe] chooses to go about [ghis] business while you still remain inside [ghim].";
			say "[dorvorlpa]";
			if waiterhater is 0:
				wait for any key;
				say "[line break]";
			if dorvordis is 0:
				say ". Overwhelmed by exhaustion, you lose consciousness soon after that.";
				say "[dorvorcdis]";
			otherwise:
				say ".";
				say "[dorvorpdis]";
		otherwise if dorvordur is 3:
			say ". Eventually, [ghe] chooses to go about [ghis] business while you still remain inside [ghim].";
			say "[dorvorlpa]";
			say "[dorvorlpb]";
	otherwise:
		say ". It is soon after this that you black out, trapped within these pulsing holdings.";
		if waiterhater is 0:
			wait for any key;
			say "[line break]";
		say "[dorvorcdis]";

to say dorvorlpa: [Doran Vore Linger Pool A]
	if waiterhater is 0:
		wait for any key;
		say "[line break]";
	if daytimer is day and a random chance of 1 in 4 succeeds:
		say "     The [gdragon] decides to wander off outside to gather--what can you guess by the eventual sound of cracking and being slightly tossed about as a result of [ghis] exertion--wood for [ghis] fire. [gche] seems to have little difficulty going about [ghis] business with you in tow, and it'd no doubt be quite a peculiar sight for anyone who saw it. [one of][gche] encounters little conflict from this errand[or][gche] encounters slight conflict from this errand, but appears to ward them off with little effort[or]One of the trees isn't particularly fond with this arrangement, but [ghe] manages to pull away from it and look elsewhere[at random]. You imagine [ghe] eventually returns to [ghis] cave with the supplies [ghe] has obtained, as it seems that [ghe] takes the time to pile [ghis] harvest in a corner";
	otherwise if a random chance of 1 in 3 succeeds:
		say "     The [gdragon] decides to go on a [if daytimer is day]day[otherwise]night[end if]time stroll. Happily strutting along the plains to enjoy the scenery and perhaps scavenge little bit. Admittedly, it is perhaps a bit embarrassing that [ghe] carry you around in public view so casually, wasteland though it may be. [gche] occasionally stops to gently stroke you, offering you some passing attention whilst [ghe] likely observes [ghis] surroundings.";
		if a random chance of 1 in 3 succeeds:
			say "     [gche] appears to encounter some conflict, but after a brief tussle it seems like [ghe] comes out on top, implicitly leaving the assailant to be bothered by someone else";
		otherwise if a random chance of 1 in 2 succeeds:
			say "     [gche] goes about [ghis] business with little issue, no doubt taking [ghis] time to bask in the [if daytimer is day]sunlight[otherwise]moonlight[end if]";
		otherwise:
			say "     It's soon made apparent that [ghe]'s come toe to toe with something quite large, but it seems that [ghe] eventually managed to ward the creature off with only slight difficulty";
		say ". Eventually, you can sense that [ghe] returns back to [ghis] cave, satisfied with [ghis] little adventure";
	otherwise if a random chance of 1 in 2 succeeds:
		say "     It's apparent that the [gdragon] is taking this moment to clean [ghim]self, as you soon feel [ghis] tongue pressing against you through your fleshy confines. [gche]'s very thorough, and quite flexible, as [ghe] takes a considerable amount of time attending to [ghim]self. You suspect [ghe] exacerbates some of [ghis] cleaning, simply to affectionately tease [ghis] willing occupant. [gche] does eventually appear satisfied with [ghim]self, and gets back up to strut around, no doubt to check [ghim]self out";
	otherwise:
		say "     For some time it's a bit unclear what the [gdragon] is doing. [gche] appears to have relegated [ghim]self to laying about, mumbling to [ghim]self too faintly for you to pick up what [ghe]'s saying, occasionally moving a talon to gently rub you from over [ghis] scaled belly. [if dorcusprog > 1]From what you can guess, you're fairly certain [ghe]'s playing with [ghis] toys again[otherwise]Whatever it is, [ghe] seems to be enjoying [ghim]self, at the very least[end if]. After a while, [ghe] finishes this peculiar ritual and yawns a bit, getting back up and stretching [ghim]self out after being stationary for so long";

to say dorvorlpb: [Doran Vore Linger Pool B -- NOTE: Nested discharge protocol]
	say ". [gche] soon takes a seat once more, perhaps pondering what [ghe] should do next.";
	if waiterhater is 0:
		wait for any key;
		say "[line break]";
	if a random chance of 1 in 3 succeeds:
		say "     Eventually, Doran decides to take [if daytimer is day]a nap[otherwise]some rest[end if], stretching out next to [ghis][if daytimer is night] roaring[end if] campfire before [ghe] gets [ghim]self comfortable. It's not long before you [ghe] calms considerable, the sound of [ghis] heartbeat slowing. You feel [ghim] casually stroke you through [ghis] scaled undercarriage, but eventually that too dies down, descending into sleep entirely";
		if dorvordis is 0:
			say ". You too soon fall to rest, no doubt quite exhausted from this whole ordeal.";
			if waiterhater is 0:
				wait for any key;
				say "[line break]";
			say "[dorvorcdis]";
		otherwise:
			say ". [gche] does eventually wake up, crawling back to [ghis] feet and stretching for a moment to offer up a prolonged yawn before dealing with [ghis] little captive.";
			if waiterhater is 0:
				wait for any key;
				say "[line break]";
			say "[dorvorpdis]";
	otherwise if a random chance of 1 in 2 succeeds:
		say "     After some time, you find yourself to tussled about in a somewhat abrupt and erratic fashion. From what you can guess, Doran appears to practicing [ghis] posturing and movement. [gche] spends a good amount of time doing this, though you occasionally feel [ghis] touch against your slick prison in idle reassurance. The very meticulous way [ghe] goes about practicing like this clearly illustrates an almost obsessive interest in how [ghe] presents [ghim]self";
		if dorvordis is 0:
			say ". Finally overwhelmed by exhaustion, the whole ordeal is enough to make you pass out.";
			if waiterhater is 0:
				wait for any key;
				say "[line break]";
			say "[dorvorcdis]";
		otherwise:
			say ". After this goes on for a while [ghe] finishes scrutinizing [ghis] posture, no doubt eager to deal with [ghis] little captive.";
			if waiterhater is 0:
				wait for any key;
				say "[line break]";
			say "[dorvorpdis]";
	otherwise:
		say "     After a brief calm, [ghe] makes a weird whining noise and rolls onto [ghis] back. It's a somewhat peculiar act, though it's soon made clear that [ghe]'s found [ghim]self in a playful mood, as [ghe] begins to prod [ghis] little captive. The feel of [ghis] talon poking you, imprisoned and vulnerable as you are, forces you to squirm about, much to the [gdragon]'s chuckling amusement, clearly enjoying the sensation of you wiggling around in there";
		if dorvordis is 0:
			say ". Finally overwhelmed by exhaustion, the whole ordeal is enough to make you pass out.";
			if waiterhater is 0:
				wait for any key;
				say "[line break]";
			say "[dorvorcdis]";
		otherwise:
			say ". After having some fun with you for a fair stretch of time [ghe] spares you of any further teasing, climbing back to [ghis] feet.";
			if waiterhater is 0:
				wait for any key;
				say "[line break]";
			say "[dorvorpdis]";

to say dorvorpdis: [Doran Vore Protocolled Discharge]
	if dorvordis is 2 or (dorvordis is 3 and a random chance of 1 in 2 succeeds):
		say "     Soon enough, you feel the [gdragon]'s body groan and churn, illustrative of [ghis] desire to free you in a less than dignified manner. Hunkered down in an attempt to appeal to gravity's aid, the once-abiding confines tighten around you to push you through a previously unobliging sphincter, forcing you head-first into the depths of this narrow labyrinth of flesh.";
		say "     Squeezed along [ghis] slick bowels, inch by inch, the [gdragon] [if dorroleint is 0]is clearly inclined to take [ghis] sweet time with disposing of you, subjecting you to this ritual for as long as [ghe] might get away with[otherwise]takes considerable pains to try and free you as quickly as possible, flushing you through [ghis] fleshy labyrinth with a deliberate rapidity[end if]. In due time, you find yourself exposed to the light and cold air of the outside world once more";
		if dorroleint is 0: 
			say "; however, [ghe]'s not quite inclined to free you just yet, inching you in and out for a second--as though illustrative of a certain indecision to let you free--before [ghe] finally relinquishes you onto the ground with an audibly wet splat.";
		otherwise:
			say ". Carefully, [ghe] relinquishes you onto the ground below, mindful of your clearly vulnerable state.";
		say "     Dizzily in disarray as you are, you pull yourself up from the puddle of saliva[if dorvornpcf is true] and spunk[end if] left in your wake. Doran [if dorroleint is 0]can't help but chuckle at your present state, looking you over to see if everything is where it belongs before giving you a final nip of approval, leaving you a complete[otherwise]wheels around, tongue gently caressing along you as [ghe] takes the time to clean you of your embarrassing[end if] mess.";
		say "     '[one of]Hm[or]Oh[or]Mm[at random], [if dorroleint is 0][one of]I bet my [dorgr] likes being discarded like a used meal[or]I think my [dorgr] looks appropriate like this, as a messy little slut[or]what a mess, I should put my [dorgr] back in after making all this[at random][otherwise][one of]my [dorgr] is so very weird, to ask of me this[or]I hope my [dorgr] had a nice trip[or]I'm certain my [dorgr] would like to go on another ride like that, eventually[at random][end if]!' Teasing you for a moment, [ghe]'s no doubt a bit worn out from the whole ordeal, and returns to [ghis] campfire to rest whilst you too take a moment to recover[if dorroleint is 0], using this opportunity to clean yourself off[end if] before eventually going about your business.";
	otherwise:
		say "     In due time, you feel the [gdragon] go rigid, a somewhat audible hacking sound coming from [ghim] in clear illustration of [ghis] intent to free you from your slick prison. On cue, you feel [ghis] previously looser confines tighten around you, forcing you back out the tight ring from whence you came.";
		say "     The endeavour is fairly brief and unflattering, as you're unceremoniously hacked back up through [ghis] gullet and into the beast's waiting maw";
		if dorroleint is 0:
			say ". Tongue writhing against you briefly, [ghis] refrain seems to tease the notion of swallowing you back down once more, before [ghe] inevitably chooses to place";
		otherwise:
			say ". [gchis] tongue's caress carefully inspecting you, [ghe] doesn't subject you to [ghis] maw's familiar confines long before gently placing";
		say "you back down onto the ground, exposed once more to the harsh light and dry air of the outside world.";
		say "     Laying in a puddle of saliva[if dorvornpcf is true] and some spunk[end if], Doran[if dorroleint is 0] grins at you, looking you over to see if everything is in order before giving you a final nip of approval, leaving you a complete, dizzy[otherwise]'s snout descends upon you, tongue gently caressing along your disoriented form as [ghe] takes the time to clean you of your embarrassing[end if] mess.";
		say "     '[one of]Heh[or]Ah[or]Hey[at random], [if dorroleint is 0][one of]my [dorgr] should probably be glad I chose to let them go[or]I think my [dorgr] looks appropriate like this, as a messy little slut[or]what a mess, I should put my [dorgr] back in after making all this[at random][otherwise][one of]so that's where my [dorgr] was all along[or]I hope my [dorgr] had a nice trip[or]I'm certain my [dorgr] would like to go on another ride like that, eventually[at random][end if]!' Teasing you for a moment, [ghe]'s no doubt a bit worn out from the whole ordeal, and returns to [ghis] campfire to rest whilst you[if dorroleint is 0] clean yourself off and[end if] recover as well, before eventually going about your business.";

to say dorvorcdis: [Doran Vore Clean Discharge]
	say "     When you come to, you find yourself spread across the earthy floor, free of the [gdragon]'s confines once more, as [ghe] lays next to you. [if dorroleint is 0]You're still quite a sticky mess, no doubt left that way for Doran's amusement[otherwise]At the very least it appears Doran cleaned you off while you were out cold[end if].";
	say "     '[one of]I see my [dorgr] has awoken[or]Rise and shine, my [dorgr][or]Ah, welcome back, my [dorgr][at random]!' Grinning, [ghe] gives you a playful [if dorroleint is 0]nip[otherwise]lick[end if]. '[one of]That was fun[or]I enjoyed that[at random], [if dorroleint is 0][one of]I look forward to making a meal of them again, when I get the chance[or]I'm certain they're eager to be abused by their [dorgr] again, when they feel up to it[at random][otherwise][one of]I'm honoured that my [dorgr] would let their [gdragon] make a meal of them[or]I hope my [dorgr] enjoyed that as much as their [gdragon] did[at random][end if]!' Nudging you off, [ghe] lets you go to attend your own matters[if dorroleint is 0], the first of which probably being to clean yourself off[end if].";
		
Section 3.5 - Doran Request Tree

understand "request doran" as dorreq.
understand "request of doran" as dorreq.
understand "request from doran" as dorreq.

check dorreq:
	if Doran is not visible, say "That's not a verb I recognise." instead;
	
carry out dorreq:
	dorangendercheck;
	if dorfirsttalk is false:
		say "     You'll probably want to talk to the [gdragon] before you ask anything of [ghim].";
	otherwise:
		now calcnumber is -1;
		say "     '[one of]How may I help [dorgr][or]Yes[or]Is there something [dorgr] needs[or]What would [dorgr] ask of me[at random]?' [line break]";
		let trixieexit be 0;
		while trixieexit is 0:
			dorangendercheck;
			say "[bold type]Options:[roman type][line break]";
			say "(1) [link]Sexual Position[as]1[end link] - [bold type][if dorrolereg is 0]Dominant[otherwise if dorrolereg is 2]Submissive[otherwise]Neutral[end if][roman type][line break]";
			say "(2) [link]Your Regarded Gender[as]2[end link] - [bold type][if dorgenreg is true]Female[otherwise]Male[end if][roman type][line break]";
			say "(3) [link]Doran's Regarded Gender[as]3[end link] - [bold type][if doransgender is true]Female[otherwise]Male[end if][roman type][line break]";
			say "(4) [if dorroleint is not 0]Interaction Locked - Requires Max Domination[otherwise][link]Sex Auto-fire[as]4[end link] - [end if][bold type][if dorautint is 1 and dorroleint is 0]Strict[otherwise if dorautint is 2 and dorroleint is 0]Loose[otherwise if dorroleint is 0]Off[end if][roman type][line break]";
			say "[line break]";
			say "[bold type]Requests:[roman type][line break]";
			if dortitmod > 1:
				say "(5) [link]Breastfeed[as]5[end link] - Feed off Doran[line break]";
			otherwise:
				say "(5) [link]Scavenge[as]5[end link] - Request Doran's aid[line break]";
			say "(6) [if dorcusprog < 2]Interaction Locked - Try Discussing with Doran[otherwise][link]Roleplay Session[as]6[end link][end if][bold type][if dorrpis > 0] - Roleplay Queued[end if][roman type][line break]";
			say "(7) [link]Body Modification[as]7[end link][if dortitmod > 0 or dorballmod > 0] - [end if][if dortitmod > 0][bold type]+Breasts [roman type][end if][if dorballmod > 0 and dorinternal is false][bold type]+Balls[roman type][otherwise if dorballmod > 0 and dorinternal is true][bold type]+Cum[roman type][end if][line break]";
			say "(8) [link]Vore Extension[as]8[end link] - [bold type][if dorvorreg is 0]Uninquired[otherwise if dorvorreg is 2]Active[otherwise]Inactive[end if][roman type] [italic type][if dorvorreg is 2 and scalevalue of player > 3]Player too large![otherwise if dorvorreg is 2 and dorrolereg is 2]Doran is Submissive![end if][roman type][line break]";
			say "[line break]";
			say "(0) [link]Exit[as]0[end link][line break]";
			while 1 is 1:
				say "Choice? (0-8)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 8:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				say "[doropt_1]"; [Demeanour Option]
			otherwise if calcnumber is 2:
				say "[doropt_2]"; [Player Gender Option]
			otherwise if calcnumber is 3:
				say "[doropt_5]"; [NEW! Doran's Gender Option]
			otherwise if calcnumber is 4:
				if dorrolereg is 0 and dorroleint is 0:
					say "[doropt_3]"; [Sex Auto-fire]
				otherwise:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
			otherwise if calcnumber is 5:
				say "[dorreq_1]"; [Food Requisition/NEW! Breastfeeding]
			otherwise if calcnumber is 6:
				if dorcusprog < 2:
					say "[bracket]Invalid interaction: You don't meet the criteria[close bracket][line break]";
				otherwise:
					say "[dorrp]"; [Roleplay Session]
			otherwise if calcnumber is 7:
				say "[doropt_6]"; [New! Body Modification]
			otherwise if calcnumber is 8:
				say "[doropt_4]"; [Vore Implementation]
			otherwise:
				say "[doropt_0]"; [End]
				now trixieexit is 1;

to say doropt_6: [NEW! Body Modification]
	say "     Considering the way the world is right now, you ponder the possibility of altering Doran's physical attributes. You presume you'll need some sort of infected item to cause the desired change. Doran looks at you quizzically.";
	let trixieexit be 0;
	while trixieexit is 0:
		say "[bold type]Body Modifications:[roman type][line break]";
		if dorballmod > 0:
			say "(1) Augment [if dorinternal is false]Balls[otherwise]Cum Production[end if] - [bold type]MODDED![roman type][line break]";
		otherwise:
			say "(1) [link]Augment [if dorinternal is false]Balls[otherwise]Cum Production[end if][as]1[end link][line break]";
		if dortitmod > 0:
			say "(2) Add Breasts - [bold type]MODDED [bracket]FULL[close bracket]![roman type][line break]";
		otherwise:
			say "(2) [link]Add Breasts[as]2[end link][line break]";
		say "[line break]";
		say "(0) [link]Exit[as]0[end link][line break]";
		while 1 is 1:
			say "Choice? (0-2)>[run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 2:
				break;
			otherwise:
				say "Invalid Choice.";
		if calcnumber is 1:
			if dorballmod > 0:
				say "[bracket]Invalid interaction: You've already modded this attribute[close bracket][line break]";
			otherwise:
				if earthen seed is owned:
					say "[dormod_1]"; [Modify Balls/Cum]
					now trixieexit is 1;
				otherwise:
					say "[bracket]Invalid interaction: [bold type]Earthen Seed[roman type] required[close bracket][line break]";
		otherwise if calcnumber is 2:
			if dortitmod > 0:
				say "[bracket]Invalid interaction: You've already modded this attribute[close bracket][line break]";
			otherwise:
				if distilled milk is owned:
					say "[dormod_2]"; [Modify Tits]
					now trixieexit is 1;
				otherwise:
					say "[bracket]Invalid interaction: [bold type]Distilled Milk[roman type] required[close bracket][line break]";
		otherwise:
			now trixieexit is 1;

to say dormod_1: [Modify Balls/Cum]
	if dorballmod is -1:
		say "     You offer some tainted seed to Doran, who responds with a slightly puzzled expression.";
		say "     'Oh? Somehow I doubt that's [dorgr][']s. I wonder... Are they dissatisfied with their [gdragon]'s appearance? Thinking they're better off as the other horror out there? I'm afraid my form is too powerful to be so easily shifted.' You suggest that it might have another effect entirely, which invites the [gdragon] to ponder the matter briefly.";
		say "     'Hmm... I suppose a particularly virile strain of seed would augment my own... It'd certainly take a lot longer to clean up the messes afterwards! [if dorinternal is false]I'm guessing it would also alter the size of certain [']assets['], as an additional side effect.[run paragraph on][end if] Does this prospect excite [dorgr]?'";
		now dorballmod is 0;
	otherwise:
		say "     You consider offering some tainted seed to Doran again, who grins at the display.";
		say "     'Ah, [dorgr] has reconsidered, by the looks of it! As I said before, I suppose a particularly virile strain of seed would augment my own. I imagine it'd take a lot longer to clean up the messes afterwards! [if dorinternal is false]I'm guessing it would also alter the size of certain 'assets', as an additional side effect.[run paragraph on][end if] Does this prospect excite [dorgr]?'";
	if player consents:
		remove "Earthen Seed" from invent of player;
		now dorballmod is 1;
		if dorinternal is true:
			say "     Taking the container, [ghe] briefly inspects it before consuming its entire contents. Groaning softly, there doesn't appear to be any immediate visual differences...";
			if dorrolereg is not 0:
				say "     'Oh, [dorgr]...' Getting up, [ghe] circles around to let you observe the effects. [gchis] cockhead, peeking from its genital slit, its oozing an inordinate amount of precum, even for being wholly unaroused! Perhaps you should go in for a closer look? Else, you'll watch from a distance and let Doran respond to these changes.";
				if player consents:
					say "     You draw in closer, [if scalevalue of player > 3]lowering yourself under the [gdragon][otherwise]the [gdragon] lifting a leg as you move under [ghim][end if], you have a clear view of is copiously oozing, barely aroused cock. Perhaps you could go in for a taste?";
					if player consents:
						say "     Eagerly, you wrap your lips around [ghis] exposed flesh, taste immediately awash with [ghis] salty flavour. Moaning faintly, it takes almost no effort before [ghe]'s sputtering enough precum where you're forced to swallow just to keep up. Even as you [']milk['] [ghim], [ghe] doesn't seem to become all that aroused, perhaps out of a desire to have your lips so firmly pressed against [ghis] scaled nethers.";
						say "     ...[run paragraph on][gche] never seems to run out! You eventually need to pull free, a gout of heady precum painting your face as it departs. Once you're out from under [ghim], Doran wheels back around to fuss over you, cleaning up the mess [ghe]'s made.";
					otherwise:
						say "     The [gdragon] lowers [ghis] head to [ghis] underside, giving you a close-up view as [ghe] licks [ghis] dripping nethers. Even the gentlest caress is more than enough to send a gout of heady precum spurting from [ghis] unaroused cockhead, staining [ghis] face and the ground."; 
						say "     The whole endeavour seems futile, as any effort [ghe] makes to clean up only makes things worse. Regardless, [ghe] puts on a bit of a show as [ghe] briefly revels in being so shameless sullied by [ghis] sexual fluids. Once [ghe]'s satisfied, Doran lets you out from under [ghim] as [ghe] cleans [ghis] snout off, turning back to you.";
				otherwise:
					say "     The [gdragon] lowers [ghis] head to [ghis] underside, lifting a leg to give you a clear view as [ghe] licks [ghis] dripping nethers. Even the gentlest caress is more than enough to send a gout of heady precum spurting from [ghis] unaroused cockhead, staining [ghis] face and the ground.";
					say "     The whole endeavour seems futile, as any effort [ghe] makes to clean up only makes things worse. Regardless, [ghe] puts on a bit of a show as [ghe] briefly revels in being so shameless sullied by [ghis] sexual fluids. Once [ghe]'s satisfied, Doran cleans [ghis] snout off before turning back to you.";
				say "     '...I imagine any more of the stuff will have no effect, or otherwise become exceedingly inconvenient. I certainly hope I'm much more pleasing to [dorgr]'s tastes!' Slowly sitting back down, you wonder how much more time [ghe]'s going to have to spend to keep this place clean...";
			otherwise:
				say "     'Tsk, such a naughty [dorgr]...!' As if to 'punish' your actions, the [gdragon] gets up and forces you onto your back, [if scalevalue of player > 3]climbing on top of[otherwise]moving over[end if] you before forcing [ghis] smooth and already precum-slick nethers against your face. '...Taste what they have done.'";
				say "     Lips compelled to embrace [ghis] scaled crotch, enveloping the slightly exposed tip [ghis] oozing cockhead, your taste is immediately awash in the salty flavour of [ghis] sexual fluids. Once you're in place, Doran firmly pins your head against [ghis] crotch, dead set on making sure you can't escape your appointed task.";
				say "     Even the slightest affection seems to cause [ghim] to spurt gouts of [ghis] thick fluid, forced to practically gulp down the stuff as it floods your maw. This whole ritual doesn't seem to arouse [ghim], perhaps enjoying the feel of [ghis] genital slit being so directly sucked off.
				It never seems to end!";
				say "     You quickly approach a point where you simply can't drink any more, starting to sputter from between your lips and stain the rest of your face. Doran seems nothing but amused by your struggles, rubbing [ghis] oozing crotch against you and making a further mess of you. Eventually [ghe] tires of tormenting you, getting up and letting you pant against the dry, open air, face and upper torso a complete mess.";
				say "     '...I imagine any more of the stuff will have no effect, or otherwise become exceedingly inconvenient. [dorgr] is such a slut, I imagine they're happy simply to enjoy more of their [gdragon]'s seed!' Slowly sitting back down, [ghe] watches as you go about cleaning yourself off.";
		otherwise:
			say "     Taking the container, [ghe] briefly inspects it before downing its entire contents. Groaning softly, it seems to take near-immediate effect.";
			if dorrolereg is not 0:
				say "     'Oh, [dorgr]...' Getting up, [ghe] circles around to let you observe the effects, you can already see [ghis] scaled ballsack begin to grow! Shall you touch [ghim] during the change? Else, you'll watch from a distance.";
				if player consents:
					say "     Hands moving to caress the growing orbs, they tighten around your grip as they expand. Already substantive in size, the thick sack weighs even heavier than it once did. Moaning softly against your touch, you see that [ghis] sheath begins to ooze a substantive string of precum, even though [ghe] doesn't express any significant arousal. Perhaps you should go in for a taste?";
					if player consents:
						say "     Moving further under Doran to wrap your lips around the tip of [ghis] sheath, you taste is flooded with the heady flavour of [ghis] thick precum. [gche] produces it in such excess now that you're quickly forced to swallow the stuff down, but it never seems to abate, even after a good solid minute of milking the thing. Eventually forced to pull free, the thing is still dripping, in spite of all your efforts.";
						say "     Finally pulling back, it appears the growth has subsided. Though [ghis] sheath seems about the same it's always been, [ghis] balls are now double their original size. Bulging, taut against [ghim] in spite their excessive scale. [gchis] thick tail can only just barely obfuscate the substantial display, causing [ghim] to blush in slight embarrassment.";
					otherwise:
						say "     Eventually, it appears that the growth subsides. Though [ghis] sheath seems about the same it's always been, [ghis] balls are now double their original size. Bulging, taut against [ghim] in spite their excessive scale. [gchis] thick tail can only just barely obfuscate the substantial display, causing [ghim] to blush in slight embarrassment.";
				otherwise:
					say "     The taut orbs gradually expand from their already-impressive size, causing Doran to moan as the effect is such that causes [ghis] presently-unaroused sheath to perpetually ooze precum. Eventually, the growth does appear to subside. Though [ghis] sheath seems about the same it's always been, [ghis] balls are now double their original size.";
					say "     Bulging, taut against [ghim] in spite their excessive scale. [gchis] thick tail can only just barely obfuscate the substantial display, causing [ghim] to blush in slight embarrassment.";
				say "     '...I imagine any more of the stuff will have no effect, or otherwise become exceedingly inconvenient. I certainly hope I'm much more pleasing to [dorgr]'s tastes!' Slowly sitting back down, it clearly takes [ghim] a while to adjust [ghis] seating to best handle the alteration.";
			otherwise:
				say "     'Tsk, such a naughty [dorgr]...!' As if to punish your actions, the [gdragon] gets up and forces you onto your back, [if scalevalue of player > 3]climbing on top of[otherwise]moving over[end if] you before forcing [ghis] already-growing ballsack against your face. '...Taste what they have done.'";
				say "     Driven to oblige, your tongue caresses the expanding orbs. As the become increasingly heavy against your [bodytype of player] form, so too does the heady taste of [ghis] [gmasculine] flavour increase. You continue this attendance for a while until your torso starts to get wet. Lifting [ghim]self up, you're made to see that [ghis] otherwise entirely unaroused sheath is making a terrible mess of you, no doubt a result of this change.";
				say "     Before you have a chance to respond, [ghe] wheels around to thrust [ghis] cock tip against your lips, forcing you to gulp down [ghis] thick, powerful sexual fluids. Made to [']Milk['] the [gdragon] of the precum, there seems to be no end to the stuff! Eventually, [ghe] relents before you can't take any more of the stuff, but chooses to use [ghis] now-freed sheath to humiliate you further, rubbing and smearing the fountain of sticky liquid against your face and upper torso.";
				say "     After a full minute of humiliating you, [ghe] finally spares you, pulling off you and exposing you to the cool air just to feel how much of a mess [ghe][']s made, without even trying. Looking at the [gdragon], you can see that [ghis] sack has grown to twice it's original size, the thing barely able to be hidden from behind [ghis] thick tail, though [ghe] certainly shows no restraint in teasing you with them now.";
				say "     '...I imagine any more of the stuff will have no effect, or otherwise become exceedingly inconvenient. [dorgr] is such a slut, I imagine they're happy simply to enjoy more of their [gdragon]'s seed!' Slowly sitting back down, [ghe] briefly adjusts [ghim]self to handle the alteration.";
	otherwise:
		say "     'Very well, [dorgr]. Don't be afraid to ask me about it again if you change your mind.'";

to say dormod_2: [Modify Tits]
	if dortitmod is -1:
		say "     You offer the milk to Doran, who looks slightly puzzled at you.";
		say "     'Hm, [dorgr]? I don't need to be fed, unless... You expect this to alter me in some way?' Explaining how the item might have an effect on [ghim], [ghe] chuckles slightly. 'So, your intent is to make me female, then? Or perhaps a hermaphrodite? Through all I've gone through, I've pretty much consistently stayed male, possibly against the intent of others. I suppose one could say that my gender identity is too strong to be affected in such a way... However...' [gche] stops to contemplate the matter.";
		say "     '...I think we can go as far as gaining breasts. This is, perhaps, as far as my gender will bend[if doransgender is false] -- though there's nothing saying you can't refer to me as female in either case[end if]. Is this to their liking?'";
		now dortitmod is 0;
	otherwise:
		say "     You consider offering the milk to Doran again.";
		say "     'Hm? ...Oh! This again. Yes, I'm certain these will give me breasts, if that's what [dorgr] wishes.'";
	if player consents:
		say "     You hand the container to the [gdragon], who briefly considers drinking it before returning [ghis] attention to you.";
		say "     '...Er, slight question... Do you think a reptile should be able to lactate?'";
		remove "distilled milk" from invent of player;
		if player consents:
			say "     'Well, I suppose it makes sense, given the way things are";
			now dortitmod is 2;
		otherwise:
			say "     'Right. Silly idea";
			now dortitmod is 1;
		say "...' And with that, [ghe] drinks down the tainted fluid in its entirety. [gche] grimaces slightly, eyes shut tight, before you see twin mounds emerge from [ghis] chest. Insistently, the [gdragon] grabs you by your hands and presses them against [ghis] inflating bosom, palms quickly becoming full with [ghis] rapidly-growing breasts. Made firm by [ghis] scaled frame, they nonetheless yield invitingly to your touch, especially when they're fully grown.";
		if dorrolereg is not 0:
			say "     [gche] continues to insist on you fondling [ghim] up[if dortitmod > 1], some of [ghis] milk leaking against your digits[end if], until [ghe]'s finally satisfied with your inspection. You could use this moment be a little more affection with [ghim], shall you? Otherwise, you'll let [ghim] off.";
			if player consents:
				say "     Moving forward, you press yourself firmly against the [gdragon], feeling up [ghis] scaled tits a second time. You feel [ghis] snout's caress against you, obliging your affection. [gche] draws you into your bosom, the feel of [ghis] slick tongue along your [bodytype of player] form";
				if dortitmod > 1:
					say ". Shall you drink from the leaking [gdragon]?";
					if player consents:
						say "     You pull away only far enough that your lips can embrace [ghis] firm mound. The nipple yielding slightly more than the rest, It doesn't take much effort on your part for your taste to be flooded the [gdragon]'s warm, sweet milk, as [ghe] coos softly in gentle approval.";
						say "     It seems that, this early on, it doesn't take long before you suck [ghim] dry, leaving you to return to the [gdragon]'s full embrace. After some time, you decide it's best to let Doran off.";
					otherwise:
						say "     You remain within Doran's full embrace for some while, tenderly caressing you, until you feel it's best to let Doran off.";
				otherwise:
					say ".";
					say "     You remain within Doran's full embrace for some while, tenderly caressing you, until you feel it's best to let Doran off.";
				say "     'Thanks, [dorgr]. I enjoyed that...' [gche] proceeds to fondle [ghis] ample pair with a slightly odd expression, ";
				if dortitmod > 1:
					say "'...It's very likely it'll be more taxing on my free time to maintain these for [dorgr], so I won't be able to [bold type]scavenge[roman type] for them anymore. However, I'm sure I can find another way to make up for that.' [gche] gives you a sly wink before [ghe] sits down next to the fire.";
				otherwise:
					say "eventually choosing to sit back down next to the fire before [ghe] continues [ghis] curious inspection.";
			otherwise:
				say "     'These'll take a bit of getting used to...' [gche] fondles the ample pair with a bit of a puzzled expression, ";
				if dortitmod > 1:
					say "'...It's very likely it'll be more taxing on my free time to maintain these for [dorgr], so I won't be able to [bold type]scavenge[roman type] for them anymore. However, I'm sure I can find another way to make up for that.' [gche] gives you a sly wink before [ghe] sits down next to the fire.";
				otherwise:
					say "eventually choosing to sit back down next to the fire before [ghe] continues [ghis] curious inspection.";
		otherwise: [Player Submissive]
			say "     [gche] continues to insist on you fondling [ghim] up[if dortitmod > 1], some of [ghis] milk leaking against your digits[end if], until [ghe]'s proves dissatisfied with simply that, pulling you between [ghis] scaled tits in a tight embrace.";
			say "     'Oh, [if dortitmod > 1][dorgr], their [gdragon] is better-equipped to care for their little plaything[otherwise]my plaything certainly gives me all sorts of fun new toys[end if]";
			if dortitmod > 1:
				say "!' Briefly fussing over you as a parent might, [ghe] moves you back, only to thrust your lips on one of [ghis] slightly more yielding nipples, absolutely insistent on having you drink from [ghim]. It doesn't take much effort on your part for your taste to be flooded the [gdragon]'s warm, sweet milk, as [ghe] coos softly in gentle approval.";
				say "     It seems that, this early on, it doesn't take long before you suck [ghim] dry, leaving you to return to the [gdragon]'s full embrace once's [ghe]'s satisfied. [gche] continues to fuss over you for a bit longer before [ghe] finally lets you free from [ghis] grasp.";
			otherwise:
				say "!' [gche] eagerly insists that you continue fondling [ghis] firm curves, [ghis] tongue's soft caress reciprocating your persistent attendance. [gche] continues [ghis] affection for a while long before [ghe] finally lets you free from [ghis] grasp.";
			say "     'These'll take a bit of getting used to...' [gche] fondles the ample pair with a devious expression, ";
			if dortitmod > 1:
				say "'...It's very likely it'll be more taxing on my free time to maintain these for [dorgr], so I won't be able to [bold type]scavenge[roman type] for them anymore. However, I'm sure I can find another way to make up for that.' [gche] gives you a sly wink before [ghe] sits down next to the fire.";
			otherwise:
				say "eventually choosing to sit back down next to the fire before [ghe] continues [ghis] curious inspection.";
	otherwise:
		say "     'Very well, [dorgr]. Don't be afraid to ask me about it again if you change your mind.'";

to say dorspec_1: [Breastfeeding scene]
	if dorroleint is 0:
		say "     You practically don't have to say anything before Doran grabs a hold of you and buries your face between [ghis] ample, scaled cleavage.";
		say "     '[one of]Tsk[or]Hmpf[or]Well[at random], [one of]Drink[or][dorgr] needs their [gdragon]'s milk[or]I shouldn't let [dorgr] leave the cave if they're just going to go hungry[at random]!' Scolding you, likely for the mere joy of being able to, [ghe] eventually lets you pull back just enough so [ghe] can press your face firmly against one of [ghis] breasts. Quite firm, the dripping nipple yields well enough against your lip's embrace.";
		say "     It takes almost no effort before your taste is flooded with [ghis] warm milk, the [gdragon] moaning softly while you suckle from [ghim]. It's inviting flavour compels you to feast upon the seemingly endless supply, until you can't take another drop.";
		say "     '[one of]Not so fast[or]I don't think so[or]Nice try[at random].' When you try to pull away, Doran seems absolutely insistent on you continuing, not letting you go until you drink to [ghis] satisfaction. Weakly obliging [ghim], you make an effort to keep feeding, each successive gulp increasingly strained by your limits, until it just starts dripping from your lips.";
		say "      [gche] doesn't seem to regard this for a while, no doubt eager to torment you over your request, until [ghe] finally appears satisfied and lets go of you.";
		say "     '[one of]Now don't run off too far[or]Come again soon[at random], [dorgr][one of] needs their [gdragon]'s milk[or], I don't do deliveries[or], or I might be forced to come fetch them[at random].' Grinning at you, [ghe] lets you off to recover and go about your business once more.";
	otherwise:
		say "     Doran happy obliges you when you ask for a drink, the [gdragon] gently bringing you in close and inviting your touch.";
		say "     '[one of]Take as much as is needed[or]It pleases me to satisfy [dorgr][or]I'm theirs to sate their thirst[at random].' Breasts quite firm against your touch, the dripping nipples yield well enough when your lips embrace one.";
		say "     It takes almost no effort before your taste is flooded with [ghis] warm milk, the [gdragon] moaning softly while you're driven to suckle from [ghim]. It's inviting flavour compels you to feast upon the seemingly endless supply, all the while the attendant creature gently caressing and encouraging you on.";
		say "     This persists for some length of time, until you're so full you can't take another drop.";
		say "     '[one of]I'll have more for [dorgr] in a while[or]I hope that was enough[at random], [one of]take care[or]be careful out there[at random].' Fussing over you briefly, [ghe] eventually lets you go to go about your business once more.";
	decrease hunger of player by 6;
	if hunger of player < 0, now hunger of player is 0;
	decrease thirst of player by 12;
	if thirst of player < 0, now thirst of player is 0;
					
Section 3.6 - Doran Request Pool

to say doropt_1: [Demeanour Option]
	if dordomtop < 2: [Explanation for non-submissive players who didn't get that intro in his first talk]
		say "     You bring up the matter of [ghis] overt submissiveness to the [gdragon].";
		say "     'Oh, [dorgr], is that not to their liking? I have no problem with being on top, if they are so inclined.'";
		let trixieexit be 0;
		while trixieexit is 0:
			say "[bold type]Sexual Position:[roman type][line break]";
			say "(1) [link]'Go on top.'[as]1[end link][line break]";
			say "(2) [link]'Stay on bottom.'[as]2[end link][line break]";
			say "(3) [link]'I'd rather we not have domineering or submissive positions.'[as]3[end link][line break]";	
			say "[line break]";
			say "(0) [link]Nevermind[as]0[end link][line break]";	
			while 1 is 1:
				say "Choice? (0-3)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 3:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				say "     'Certainly, my [dorgr]";
				if dordomtop is 1:
					say ". I shouldn't be surprised, as I recall they tried to offer themself when I challenged them--Not that I didn't find the prospect tempting there as I do now";
				say ". When next they ask for sex, they'll find my regard to be quite different.' [gche] grins mischievously at you.";
				now dorrolereg is 0;
				now trixieexit is 1;
				increase dordomtop by 2;
			otherwise if calcnumber is 2:
				say "     'My mistake, but don't be afraid to ask if they change their mind.'";
				now dorrolereg is 2;
				now trixieexit is 1;
				increase dordomtop by 2;
			otherwise if calcnumber is 3:
				if dorneutroll is 0, now dorneutroll is a random number between 1 and 2;
				say "     'Oh? Hmm, well, [dorgr] commands it... I'm rather disinclined to alter the established roles, but I can switch between them on whatever whim fancies me at the moment. I hope that better suits them.'";
				now dorrolereg is 1;
				now trixieexit is 1;
				increase dordomtop by 2;
			otherwise:
				say "     'My mistake, but don't be afraid to ask if they change their mind.'";
				now trixieexit is 1;
				increase dordomtop by 2;
	otherwise: [Explanation for non-submissive players who didn't get that intro in his first talk]
		say "     'In a different mood? Would [if dorrolereg is 0]my [end if][dorgr] prefer to [if dorrolereg is 0]be on top again[otherwise if dorrolereg is 2]be on bottom[otherwise]alter our arrangement[end if]?'";
		let trixieexit be 0;
		while trixieexit is 0:
			say "[bold type]Sexual Position:[roman type][line break]";
			say "(1) [link]'[if dorrolereg is 0]Stay[otherwise]Go[end if] on top.'[as]1[end link]";
			say "(2) [link]'[if dorrolereg is 2]Stay[otherwise]Go[end if] on bottom.'[as]2[end link]";
			say "(3) [link]'Let's [if dorrolereg is 1]keep[otherwise]make[end if] things random.'[as]3[end link]";	
			say "[line break]";
			say "(0) [link]'Nevermind.'[as]0[end link][line break]";	
			while 1 is 1:
				say "Choice? (0-3)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 3:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				say "     '[one of]Very well[or]No problem[or]Okay[or]Certainly[or]Of course[at random], my [dorgr] will [if dorrolereg is 0]be kept[otherwise]now be put[end if] in their place.'";
				now dorrolereg is 0;
				now trixieexit is 1;
			otherwise if calcnumber is 2:
				say "     '[one of]Very well[or]No problem[or]Okay[or]Certainly[or]Of course[at random], [dorgr]'s [gdragon] will [if dorrolereg is 2]keep[otherwise]learn[end if] [ghis] place.'";
				now dorrolereg is 2;
				now trixieexit is 1;
			otherwise if calcnumber is 3:
				if dorneutroll is 0, now dorneutroll is a random number between 1 and 2;
				say "     '[one of]Very well[or]No problem[or]Okay[or]Certainly[or]Of course[at random], [dorgr]'s [gdragon] will [if dorrolereg is 1]keep surprising[otherwise]surprise[end if] them.'";
				now dorrolereg is 1;
				now trixieexit is 1;
			otherwise:
				say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[or]Think no more on it[or]Very well[or]Understood[at random].";
				now trixieexit is 1;

to say doropt_2: [Gender Option]
	if dorgenreg is false:
		say "     'Has something come up? Would [dorgr] prefer to be regarded as a female?'";
		if player consents:
			now dorgenreg is true;
			now dorgr is "Mistress";
			say "     '[one of]Very well[or]No problem[or]Okay[or]Certainly[or]Of course[at random], I will now regard Master as [dorgr].'";
		otherwise:
			say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[or]Think no more on it[or]Very well[or]Understood[at random].'";
	otherwise:
		say "     'Has something come up? Would [dorgr] prefer to be regarded as a male?'";
		if player consents:
			now dorgenreg is false;
			now dorgr is "Master";
			say "     '[one of]Very well[or]No problem[or]Okay[or]Certainly[or]Of course[at random], I will now regard Mistress as [dorgr].'";
		otherwise:
			say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[or]Think no more on it[or]Very well[or]Understood[at random].'";

to say dorreq_1: [Food requisition/NEW! Breastfeeding]
	if dorlastfed - turns >= 16:
		if dortitmod > 1:
			say "[dorspec_1]"; [Breastfeeding scene]
		otherwise:
			if dorfedtype is 1:
				say "     'Ah, yes! I found some water, maybe it will help [dorgr]?' [gche] hands it over to you.";
				add "water bottle" to invent of player;
			otherwise:
				say "     'Ah, yes! I found some food, maybe it will help [dorgr]?' [gche] hands it over to you.";
				add "food" to invent of player;
			now dorfedtype is a random number between 1 and 2;
		now dorlastfed is turns;
	otherwise:
		say "     'My sincerest apologies, [dorgr], [if dortitmod > 1]I haven't recovered[otherwise]I haven't come across anything[end if] yet! But please, do check again later.'";

to say doropt_3: [Doran Auto-Fire]	
	if dorautr is false:
		now calcnumber is -1;
		say "     Approaching Doran, you suggest that [ghe] have [ghis] way with you at [ghis] behest. This seems to amuse [ghim] a fair bit.";
		say "     'Oh, my [dorgr], I'm beginning to worry that they're more submissive than even me!' A grin across [ghis] face, [ghe] gives you a wink. 'I have no issue with this request. I must inquire, however, as to how strict my [dorgr] wishes this to be. I can be extremely strict, which means I'll pounce them the second I see them and I'm feeling up to it, or I can be a bit more casual, where I'll wait for their cue for a little bit before deciding by myself.'[line break]";
		now dorautr is true;
		let trixieexit be 0;
		while trixieexit is 0:
			say "[bold type]Auto-Fire:[roman type][line break]";
			say "(1) [link]Strict[as]1[end link] - Immediate.";
			say "(2) [link]Loose[as]2[end link] - Two day wait after last sex before becoming active.";	
			say "[line break]";
			say "(0) [link]Nevermind[as]0[end link][line break]";	
			while 1 is 1:
				say "Choice? (0-2)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 2:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				say "     'Got it, strict it is. Also, keep in mind that if [dorgr] decides they want to be on top again, the conditions will obviously be inappropriate for such a thing as this and I won't do it anymore.'";
				now dorautint is 1;
			otherwise if calcnumber is 2:
				say "     'Got it, loose it is. Also, keep in mind that if [dorgr] decides they want to be on top again, the conditions will obviously be inappropriate for such a thing as this and I won't do it anymore.'";
				now dorautint is 2;
			otherwise:
				say "     'No problem, don't be afraid to ask if one changes their mind. Also, keep in mind that if [dorgr] decides they want to be on top again, the conditions will obviously be inappropriate for such a thing as this and I won't do it anymore.'";
			now trixieexit is 1;
	otherwise:
		now calcnumber is -1;
		say "     'Ah, yes, would my [dorgr] like to alter this arrangement?'[line break]";
		let trixieexit be 0;
		while trixieexit is 0:
			say "[bold type]Auto-Fire:[roman type][line break]";
			say "(1) [link]Strict[as]1[end link] - Immediate[bold type][if dorautint is 1]-Set[end if][roman type].";
			say "(2) [link]Loose[as]2[end link] - Two day wait after last sex before becoming active[bold type][if dorautint is 2]-Set[end if][roman type].";
			say "(3) [link]Off[as]3[end link] [bold type][if dorautint is 0]Currently Inactive[otherwise]Deactivate[end if][roman type].";
			say "[line break]";
			say "(0) [link]Nevermind[as]0[end link][line break]";	
			while 1 is 1:
				say "Choice? (0-3)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 3:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				say "     '[one of]Got it[or]Certainly[or]No problem[or]Alright[at random], strict it is.'";
				now dorautint is 1;
			otherwise if calcnumber is 2:
				say "     '[one of]Got it[or]Certainly[or]No problem[or]Alright[at random], loose it is.'"; 
				now dorautint is 2;
			otherwise if calcnumber is 3:
				say "     '[one of]Got it[or]Certainly[or]No problem[or]Alright[at random], I'll cut it out.'"; 
				now dorautint is 0;		
			otherwise:
				say "     '[one of]Enough on that[or]Moving on[at random].'";
				now trixieexit is 1;

to say doropt_5: [NEW! Doran's regarded gender]
	if dorgentop is 0:
		say "     Given the dragon's eager willingness to accommodate your specific gender, you ask if he'd be willing to do the same for himself.";
		say "     'Hmm? But I... Oh! Impish little [dorgr]! They want to [italic type]call[roman type] me female?' [gche] grins slyly[if scalevalue of player < 4] down[end if] at you, 'Sure! I see no problem... If they want me to go about in a dress, though, I'm afraid the stores have nothing in my size.' Shall you regard Doran as female?";
		if player consents:
			now doransgender is true;
			say "     'Very well!' [bold type]She[roman type] remarks, 'I'm now [dorgr]'s dragoness!' Obviously, this entire exchange has been purely cosmetic, but you expect her to roll along with it, in spite the evidence to the contrary.";
		otherwise:
			say "     'Not an issue! Don't be afraid to ask again if [dorgr]'s feeling a little cheeky.' Still grinning, [ghe] drops the topic at that.";
		now dorgentop is 1;
	otherwise:
		if doransgender is false:
			say "     'Would [dorgr] ask me to pretend I'm female?'";
			if player consents:
				say "     'Done! I'm now [dorgr]'s [bold type]Dragoness[roman type].'";
				now doransgender is true;
			otherwise:
				say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[or]Think no more on it[or]Very well[or]Understood[at random].'";
		otherwise:
			say "     'Would [dorgr] like me to be regarded as male again?'";
			if player consents:
				say "     'Done! I'm now [dorgr]'s [bold type]Dragon[roman type], once more.'";
				now doransgender is false;
			otherwise:
				say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[or]Think no more on it[or]Very well[or]Understood[at random].'";
				
to say doropt_0: [End]
	say "     '[one of]Don't be afraid to ask of me anything[or]I'll be here[or]Come again[at random], [dorgr].'";
	
Chapter 3.6.1 - Vore Option Extension

dorvorreg is a number that varies. dorvorreg is usually 0. [Doran Vore Regard. 0 = Not revealed, 1 = Inactive, 2 = Active]
dorvordur is a number that varies. dorvordur is usually 0. [Doran Vore Duration. 0 = Very Short, 1 = Short, 2 = Medium, 3 = Long] 
dorvordis is a number that varies. dorvordis is usually 0. [Doran Vore Discharge. 0 = None/Implicit, 1 = Oral, 2 = Anal, 3 = Random] 

to say doropt_4: [Doran Vore Extension]
	if dorvorreg is 0:
		if dorrolereg is 2:
			say "     You get the impression that such a request would only be ideal if Doran was in a dominant position. You may want to ask [ghim] to be in such a position first, if you're interested in this particular thing.";
		otherwise:
			now dorvorreg is 2;
			say "     You are compelled by a particular interest to query Doran on the subject of having [ghim] consume you. It's an inherently awkward topic to ask and the [gdragon] grins as you try to make some effort to present it reasonably. Once it's clear what you're asking, [ghis] initial response is one of slight confusion.";
			say "     'Huh... [dorgr], what they ask of me... Well, first off, I must ask if they understand how serious a request they're making of their [gdragon]. Who knows how many lives are lost out there to beasts of such a deviant hunger. Do they understand this?'";
			if player consents:
				now tempnum is 1;
				say "     'Good! Then";
			otherwise:
				now tempnum is 0;
				say "     'Then they are lucky to have avoided it! As for me,";
			say " my [dorgr] should take comfort in knowing that there is no negative drawback to being consumed by their [gdragon] -- assuming they have the free time!' [gche] grins, no doubt amused with [ghis] little [']bait and switch[']. Should you pressure [ghim] to explain [ghim]self?";
			if player consents:
				say "     'Oh, it's not important.' [gche] seems frustratingly inclined to dismiss your query altogether, 'The fact that my [dorgr] came to me with such a request[if tempnum is 1], knowing well of the potential harm it might bring them,[end if] shows a great measure of trust from them. I ask that they trust me this far as well";
			otherwise:
				say "     'The fact that my [dorgr] came to me with such a request[if tempnum is 1], knowing well of the potential harm it might bring them,[end if] shows a great measure of trust from them. I'm extremely honoured";
			say ".' [gche] gets up, strutting around to eye you over for a moment.";
			say "     '";
			if scalevalue of player > 3:
				say "Immediately, I must warn my [dorgr] that they're too big to fit. They'll have to find a way to bring themselves down to around normal human size or smaller -- we can still discuss this, but when the time comes they won't see my doing the deed ";
			otherwise:
				say "Everything seems in order here, I can handle them";
			say ".' [gche] sits back down once more, before continuing. 'I'll go ahead and eat my [dorgr] at the conclusion of every time we have sex, assuming everything remains in order. Obviously, if they decide to be on top again, I'll stop.'";
			say "     'That's all I need to tell you beforehand, now we can get into the more granular details -- I've assumed, since they brought the topic up, that they're interested and as such I've already put myself in an [bold type]Active[roman type] stance for them.'";
	otherwise:
		say "Certainly, [dorgr], is there anything regarding this arrangement they want to change?";
	if dorvorreg is not 0:
		now calcnumber is -1;
		let trixieexit be 0;
		while trixieexit is 0:
			say "[bold type]Vore Extensions:[roman type][line break]";
			say "(1) [link]State[as]1[end link] - [bold type][if dorvorreg is 2]Active[otherwise]Inactive[end if][roman type][line break]";
			say "(2) [link]Duration[as]2[end link] - [bold type][if dorvordur is 0]Very Short[otherwise if dorvordur is 1]Short[otherwise if dorvordur is 2]Medium[otherwise if Dorvordur is 3]Long[end if][roman type][line break]";	
			say "(3) [link]Discharge[as]3[end link] - [bold type][if dorvordur is 0]None/Implicit [bracket]Locked via duration[close bracket][otherwise if dorvordis is 0]None/Implicit[otherwise if dorvordis is 1]Oral[otherwise if dorvordis is 2]Anal[otherwise if dorvordis is 3]Random[end if][roman type][line break]";
			say "[line break]";
			say "(0) [link]Back to Main Menu[as]0[end link][line break]";	
			while 1 is 1:
				say "Choice? (0-3)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 3:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				if dorvorreg is 1:
					say "     'Want me to start making a meal of my [dorgr]?'";
					if player consents:
						now dorvorreg is 2;
						say "     'Then delight I shall on my [dorgr].'";
					otherwise:
						say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[at random].'";
				otherwise:
					say "     'Want me to cease making a meal of my [dorgr]?'";
					if player consents:
						now dorvorreg is 1;
						say "     'Then no longer I shall delight on my [dorgr].'";
					otherwise:
						say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[at random].'";
			otherwise if calcnumber is 2:
				say "'Right then, how much do you want to experience post-consumption?'";
				now calcnumber is -1;	
				let dorcusexit be 0;
				while dorcusexit is 0:
					say "(1) [link]Very Short (Implicit discharge-locked)[as]1[end link][bold type][if dorvordur is 0]- Set[end if][roman type][line break]";
					say "(2) [link]Short[as]2[end link][bold type][if dorvordur is 1]- Set[end if][roman type][line break]";	
					say "(3) [link]Medium[as]3[end link][bold type][if dorvordur is 2]- Set[end if][roman type][line break]";
					say "(4) [link]Long[as]4[end link][bold type][if dorvordur is 3]- Set[end if][roman type][line break]";
					say "[line break]";
					say "(0) [link]Nevermind[as]0[end link][line break]";	
					while 1 is 1:
						say "Choice? (0-4)>[run paragraph on]";
						get a number;
						if calcnumber >= 0 and calcnumber <= 4:
							break;
						otherwise:
							say "'I'm sorry, could [dorgr] repeat that?'";
					if calcnumber is 1:
						say "     'Very well, my [dorgr] will experience nothing following the deed and regain consciousness to find themselves free of me once more.'";
						now dorvordur is 0;
						now calcnumber is -1;	
						now dorcusexit is 1;
					otherwise if calcnumber is 2:
						say "     'Alright, my [dorgr] will have some experience inside their [gdragon] before I let them go.'";
						now dorvordur is 1;
						now calcnumber is -1;	
						now dorcusexit is 1;
					otherwise if calcnumber is 3:
						say "     'Very well, my [dorgr]'s [gdragon] will go about their business for a while before finally freeing them.'";
						now dorvordur is 2;
						now calcnumber is -1;	
						now dorcusexit is 1;
					otherwise if calcnumber is 4:
						say "     'Certainly, my [dorgr] will find themselves trapped within their [gdragon] for a considerably prolonged period before they are finally let free.'";
						now dorvordur is 3;
						now calcnumber is -1;	
						now dorcusexit is 1;
					otherwise if calcnumber is 0:
						now calcnumber is -1;	
						now dorcusexit is 1;
			otherwise if calcnumber is 3:
				if dorvordur is 0:
					say "[bracket]Unavailable At the shortest duration[close bracket][line break]";
				otherwise:
					say "     'My [dorgr] has to come back out at some point. In what way would they prefer?'";
					now calcnumber is -1;	
					let dorcusexit be 0;
					while dorcusexit is 0:
						say "(1) [link]None/Implicit[as]1[end link][bold type][if dorvordis is 0]- Set[end if][roman type][line break]";
						say "(2) [link]Oral[as]2[end link][bold type][if dorvordis is 1]- Set[end if][roman type][line break]";	
						say "(3) [link]Anal[as]3[end link][bold type][if dorvordis is 2]- Set[end if][roman type][line break]";
						say "(4) [link]Random[as]4[end link][bold type][if dorvordis is 3]- Set[end if][roman type][line break]";
						say "[line break]";
						say "(0) [link]Nevermind[as]0[end link][line break]";	
						while 1 is 1:
							say "Choice? (0-4)>[run paragraph on]";
							get a number;
							if calcnumber >= 0 and calcnumber <= 4:
								break;
							otherwise:
								say "'I'm sorry, could [dorgr] repeat that?'";
						if calcnumber is 1:
							say "     'Got it, my [dorgr] will black out and simply find themselves free of me afterwards.'";
							now dorvordis is 0;
							now calcnumber is -1;	
							now dorcusexit is 1;
						otherwise if calcnumber is 2:
							say "     'No problem, my [dorgr] will be regurgitated back out from whence they came.'";
							now dorvordis is 1;
							now calcnumber is -1;	
							now dorcusexit is 1;
						otherwise if calcnumber is 3:
							say "     'Done. My [dorgr] will be taking the 'full tour' of their [gdragon], as it were.'";
							now dorvordis is 2;
							now calcnumber is -1;	
							now dorcusexit is 1;
						otherwise if calcnumber is 4:
							say "     'Okay. My [dorgr] will be discharged through either one of the two explicit options, at my behest.'";
							now dorvordis is 3;
							now calcnumber is -1;	
							now dorcusexit is 1;
						otherwise if calcnumber is 0:
							now calcnumber is -1;	
							now dorcusexit is 1;	
			otherwise:
				say "     'No problem. Feel free to raise this topic with me any time. Even if I can't fulfil their need for whatever reason, there's no harm in discussing it.'";
				now trixieexit is 1;
				
Chapter 3.6.2 - Body Modification Tree

to dorangendercheck:
	if doransgender is true:
		femalepronouns;
	otherwise:
		malepronouns;

to doranmodifytits:
	say "     You make an offering of milk to Doran, who looks slightly puzzled at you.";
	say "     'Hm, [dorgr]? I don't need to be fed... Unless... You expect this to alter me in some way?' Explaining what effect the item might have on [ghim], [ghe] chuckles slightly";
	if dormodtop is 1:
		say ". 'I've already clarified that I'm not particularly keen on being female... However...' [gche] stops to contemplate the matter.";
	otherwise:
		say ". 'So, your intent is to make me female, then? Or perhaps a hermaphrodite? After all I've gone through, I've pretty much consistently stayed male, possibly against the intent of others. I suppose you could say that my gender identity is too strong to be effected in such a way... However...' [gche] stops to contemplate the matter.";
	say "     '...I think I'm willing to compromise for [dorgr] as fair as gaining breasts. This is, unquestionably, the limit of how I'd alter my gender[if doransgender is false] -- though there's nothing saying you can't refer to me as female in either case[end if]. Is this to their liking?'";
	if player consents:
		say "     Agreeing, you hand the milk over to the [gdragon], who reluctantly inspects the container and its contents before consuming the fluid in its entirety. [gche] shifts around uncomfortably, but there seems to be no effect.";
		say "     'I imagine this will take a while, come back to me in a bit...' It's peculiar that the milk doesn't seem to immediately impact [ghim] like most infectious materials. '...Perhaps I could ask you some questions? Namely, what is your desire out of this alteration? The immediate answer is practicality, but I doubt everyone is into breastfeeding. Is [dorgr]? Else, I assume they're simply for show.'";
		if player consents:
			say "     'Understood. I imagine it's inescapable, in any case";
			now dortitmod is 2;
		otherwise:
			say "     'Alright. Probably be a bit weird for a reptile to lactate, anyways";
			now dortitmod is 1;
		say ". That's all I needed to know.' You decide to leave [ghim] to [ghis] business and raise the matter with [ghim] again, later.";
	otherwise:
		say "     'No problem. I'll admit, this is a little out of my area of expertise, but there's no harm in asking, anyways! Makes for an interesting conversation, at least.'";

			
to doranmodifyballs:
	say "     You offer some ejaculate to Doran, who grins a little at the display.";
	say "    'Oh? Somehow I doubt some random horror's jizz will be good for my diet!' Grinning still, [ghe] prods and teases you a little bit before continuing.";
	say "     'Hmm... I suppose a particularly virile strain of seed would augment my own. It'd certainly take a lot longer to clean up the messes afterwards";
	if dorinternal is false:
		say "! I imagine it would slightly alter the size of relevant 'assets', as an additional side effect. D";
	otherwise:
		say "! D";
	say "oes this prospect excite [dorgr]?'";
	if player consents:
		now dorballmod is 1;
		say "     Taking the container,[ghe] briefly inspects it before downing its entire contents. Groaning softly, it seems to take near-immediate effect.";
		if dorrolereg is not 0:
			say "     'Oh, [dorgr]...' Getting up and inviting you to circle around and observe the effects, ";
			if dorinternal is true:
				say "there is admittedly little to observe, given [ghis] internal anatomy. S";
			otherwise:
				say ", you can already see that [ghis] substantive ballsack begin to grow! S";
			say "hall you touch [ghim] during the change? Else, you'll keep your distance.";
			if player consents:
				if dorinternal is true:
					say "     Hands moving to caress the lips of [ghis] genital slit, the peeking tip of [ghis] dick is already oozing a substantive amount of precum, even though [ghe] doesn't express any significant arousal";
				otherwise:
					say "     Hands moving to caress the growing orbs, they tighten around your grip as they expand. Already substantive in size, the thick sack weighs even heavier than it once did. Moaning softly against your touch, you see that [ghis] sheath begins to ooze a substantive string of precum, even though [ghe] doesn't express any significant arousal";
				say ". Perhaps you should go in for a taste?";
				if player consents:
					if dorinternal is true:
						say "     Moving further under Doran to embrace your lips around [ghis] nethers, your taste is immediately flooded with the heady flavour of [ghis] thick precum. [gche] produces it in such substance now that you're quickly forced to swallow the stuff down, but it never seems to abate, even after a good solid minute of milking the thing. Eventually forced to pull free, the thing is still dripping, even after your efforts.";
						say "     Finally pulling back, it appears the flow is no longer increasing, at least. Not even aroused from the momentary attendance, it's apparent that you've doubled [ghis] production. Tight lips now perpetually oozing, [ghe] shifts uncomfortably in some effort to try and stop it, to little effect and much to [ghis] embarassment.";
					otherwise:	
						say "     Moving further under Doran to wrap your lips around the tip of [ghis] sheath, your taste is flooded with the heady flavour of [ghis] thick precum. [gche] produces it in such substance now that you're quickly forced to swallow the stuff down, but it never seems to abate, even after a good solid minute of milking the thing. Eventually forced to pull free, the thing is still dripping, even after your efforts.";
						say "     Finally pulling back, it appears the growth has subsided. Though [ghis] sheath seems about the same size it's always been, [ghis] balls are no double their original size. Bulging, taut against [ghim] in spite their excessive scale, [ghis] thick tail can only just barely obfuscate the substantial display, causing [ghim] to blush in slight embarrassment.";
				otherwise:
					if dorinternal is true:
						say "     Eventually, it appears that the growth subsides. [gchis]nether lips now appear to be perpetually leaking a substantive amount of precum, even though [ghe]'s not outwardly aroused in the slightest. [gche] shifts uncomfortably in some effort to try and stop it, to little effect and much to [ghis] embarassment.";
					otherwise:
						say "     Eventually, it appears that the growth subsides. Though [ghis] sheath seems about the same size it's always been, [ghis] balls are no double their original size. Bulging, taut against [ghim] in spite their excessive scale. [gchis]thick tail can only just barely obfuscate the substantial display, causing [ghim] to blush in slight embarrassment.";
			otherwise:
				if dorinternal is true:
					say "     Bodly subtly groaning, it's enough to cause Doran to moan as the excess is apparently such that seems to cause [ghis] presently-unaroused slit to perpetually ooze precum. Eventually, the flow reaches a point where it's at least not increasing. Though [ghe]'s outwardly the same [ghe]'s always been, [ghe]'s now constant mess of the ground below [ghim]. Bulging, taut against [ghim] in spite their excessive scale. [gche] shifts uncomfortably in some effort to try and stop it, to little effect and much to [ghis] embarassment.";
				otherwise:
					say "     The taut orbs gradually expand from their already-impressive size, causing Doran to moan as the excess is such that seems to cause [ghis] presently-unaroused sheath to perpetually ooze precum. Eventually, the growth does appear to subside. Though [ghis] sheath seems about the same size it's always been, [ghis] balls are no double their original size. Bulging, taut against [ghim] in spite their excessive scale. [gchis]thick tail can only just barely obfuscate the substantial display, causing [ghim] to blush in slight embarrassment.";
			say "     '...I imagine any additional consumption would have no more effect, or otherwise become exceedingly inconvenient. I certainly hope I'm much more pleasing to [dorgr]'s tastes!' Slowly sitting back down, it clearly takes [ghim] a while to adjust [if dorinternal is true][ghim]self[otherwise][ghis] seating[end if] to best handle the alteration. Future engagements should be... Interesting...";
		otherwise:
			say "     'Tsk, such a naughty [dorgr]...' As if to 'punish' your actions, the [gdragon] gets up and forces you onto your back, [if scalevalue of player > 3]climbing on top of[otherwise]moving over[end if] you before forcing [ghis] ";
			if dorinternal is true:
				say "scaled, flush crotch against your face. '...Taste what they have done!'";
				say "     Tongue compelled to caress the yielding lips of [ghis] genital slit, body subtly vibrating and groaning against your [bodytype of player] form as you're forced to bask in [ghis] growing, [gmasculine] flavour. Obliging this, your face quickly begins to get wet. Lifting [ghim]self up, you're made to see that [ghis] otherwise entirely unaroused slit ooze precum, no doubt a result of this change.";
			otherwise:
				say "already-growing ballsack against your face. '...Taste what they have done!'";
				say "     Tongue compelled to caress the expanding orbs, they becoming increasingly heavy against your [bodytype of player] form, their heady taste of [ghis] [gmasculine] flavour increasing as well. You're forced to oblige this until you your torso start to get wet. Lifting [ghim]self up, you're made to see that [ghis] otherwise entirely unaroused sheath ooze precum, no doubt a result of this change.";
			say "     Before you have much chance to respond, [ghe] shifts and thrusts the slightly-exposed tip of [ghis] cock against your lips, forcing you to drink in [ghis] thick, powerful sexual fluids. Forced to 'Milk' the [gdragon] of the precum, there seems to be no end to the stuff! Eventually, [ghe] relents before you're completely stuffed by the fluid, but chooses to use [ghis] now-freed [if dorinternal is true]crotch[otherwise]sheath[end if] to humiliate you further, rubbing and smearing the fountain of sticky liquid against your face and upper torso.";
			say "     [gche] finally spares you of this, pulling off you and exposing you to the cool air just to feel how much of a mess [ghe] made you, without even trying! Looking at the [gdragon], ";
			if dorinternal is true:
				say "[ghe] outwardly appears the same, save for the perpetual oozing that [ghe] seems wholly incapable of hiding. [gche] seems inclined to use this as an excuse for being cross with you.";
			otherwise:
				say "you can see that [ghis] sack has grown to twice it's original size, the thing barely able to be hidden from behind [ghis] thick tail, though [ghe] certainly shows no restraint in teasing you with them now.";
			say "     '...I imagine any additional consumption would have no more effect, or otherwise become exceedingly inconvenient. [dorgr] is such a slut, I imagine they're happy simply to enjoy more of their [gdragon]'s seed!' Slowly sitting back down, [ghe] briefly adjusts to handle the alteration. Future engagements should be... Interesting...";
	otherwise:
		say "     'Oh, [one of]alright[or]okay[or]my mistake[or]certainly[at random].'";

Chapter 3.7 - Doran Discussion Tree

dorlastcuss is a number that varies. dorlastcuss is usually 555. [Doran Last Discussion]
dorcusprog is a number that varies. dorcusprog is usually 0. [Doran Discussion Progression]
dorcusexit is a number that varies. dorcusexit is usually 0. [Additional exit value for nested multiple-choice]
dorcusexit2 is a number that varies. dorcusexit2 is usually 0. [Additional exit value for nested multiple-choice]
dorcustv_1 is a number that varies. dorcustv_1 is usually 0. [Doran Discussion Temporary Number 1]
[dorcustv_2 is a number that varies. dorcustv_2 is usually 0. [Doran Discussion Temporary Number 2]]
[dorcustv_3 is a number that varies. dorcustv_3 is usually 0. [Doran Discussion Temporary Number 3]]
dorcus is an action applying to nothing.
dorrprr is a number that varies. dorrprr is usually 0. [Doran RP Reveal Regard. Affected by player interaction in discussion]

understand "discuss doran" as dorcus.
understand "discuss with doran" as dorcus.

check dorcus:
	if Doran is not visible, say "That's not a verb I recognise." instead;
	
carry out dorcus:
	now dorcustv_1 is 0;
	if dorfirsttalk is false:
		say "     You should probably go through introductions before you move onto any larger discourse.";
	otherwise if dorlastcuss - turns <= 4:
		say "     'I'm sorry, [dorgr], I'd love to chat but there are some things I need attending to. Perhaps in a few hours?'";
	otherwise if dorcusprog is 0: 	
		say "[dorcus_1]"; [Of One's Past]
		now dorlastcuss is turns;
		now dorcusprog is 1;
	otherwise if dorcusprog is 1: 
		say "[dorcus_2]"; [Of Hobbies and Imagination]
		now dorlastcuss is turns;
		now dorcusprog is 2;
	otherwise:
		say "     'I'd like to talk more, but there's nothing I can think of off the top of my head that would be interesting to discuss. My apologies.'";

Chapter 3.7.1 - Doran Dicussion Pool
		
to say dorcus_1: [Of One's Past]
	say "     You decide to strike up a more substantive conversation with Doran. Sitting down next to [if daytimer is night]roaring[otherwise]spent[end if] campfire. You decide to keep things fairly basic and inquire of [ghis] past and how [ghe] got the way [ghe] did. Raising this topic forces [ghim] to ponder for a moment.";
	say "     '...Such as is the way with this blight, I believe most people one'll find will have little memory of their past. Of course, I say this as assurance to [dorgr] that this is not the case for me. I recall perfectly where I came from; however, I'm afraid that is something I'm not willing to share";
	if "Curious" is listed in feats of player:
		say ".' Ever-curious as you are";
	otherwise:
		say ".' Instinctively";
	say ", you ask [ghim] why.";
	say "     'My past is entirely unimportant, and one wouldn't benefit from its knowledge; quite the contrary, it'd be more of a hindrance--[dorgr], do they know of context";
	if intelligence of player > 14:
		say "?' Though you're smart enough to be familiar with the term itself, you're not exactly sure as to [ghis] usage of it. It's clear the question is rhetorical for the purpose of a digression, so";
	otherwise:
		say "?' You're not quite sure what [ghe]'s getting at, but";
	say " you humour [ghim] by saying no.";
	say "     'Of all the things I could be, they are not what I am now to [dorgr]. I could have been an individual of great fame or fortune, or perhaps I was a helpless cog in some corporate machine. Perhaps I am but a wandering spirit. Perhaps I am the cause of this blight--or perhaps I am but a figment of [dorgr]'s increasingly deranged mind.' [gche] grins, somewhat amused by the notion, before continuing.";
	say "     'What matters is that any one of these changes your perception of me, and I don't want such a perception to be anything beyond being [dorgr]'s [gdragon].'";
	now calcnumber is -1;	
	let trixieexit be 0;
	while trixieexit is 0:
		say "[bold type][link]1) 'You don't trust me?'[as]1[end link][roman type]";
		say "[bold type][link]2) 'Why does this matter?'[as]2[end link][roman type]";
		say "[bold type][link]3) 'As your [dorgr] I could order you to tell me.'[as]3[end link][roman type][line break]";
		if dorcustv_1 is 0:
			say "[bold type][link]4) 'Very well, I'll honour your insistence on this subject.' (Exit)[as]4[end link][roman type][line break]";
		otherwise:
			say "[bold type][link]4) 'Alright, I won't argue with you about it any further.' (Exit)[as]4[end link][roman type][line break]";
		while 1 is 1:
			say "Choice? (1-4)>[run paragraph on]";
			get a number;
			if calcnumber >= 1 and calcnumber <= 4:
				break;
			otherwise:
				say "'I'm sorry, could [dorgr] repeat that?'";
		if calcnumber is 1:
			now dorcustv_1 is 1;
			say "     'Ah... Trust. There isn't a thing I find more valuable...' [gche] seems to reminisce over this notion for a moment before returning to the topic at hand, '[dorgr], be assured that, if I was lacking for care in trust, I would have lied. I feel blatant obfuscation is a kinder disservice than true deception, and better that I wound one's pride than plant any seed of distrust.'";
			now calcnumber is -1;	
			let dorcusexit be 0;
			while dorcusexit is 0:
				say "[bold type][link]1) 'Trust works both ways; why should I trust you if you won't trust me with this?'[as]1[end link]";	
				if charisma of player > 14:
					say "[bold type][link]2) (Charisma: [charisma of player]/15) 'And yet, you could argue that this blatant obfuscation inspires less trust than a good deception.'[as]2[end link]";
				otherwise:
					say "2) (Charisma: [charisma of player]/15) (Insufficient charisma!)[line break]";
				say "[bold type][link]3) (Return to the main topic)[as]3[end link][roman type][line break]";
				while 1 is 1:
					say "Choice? (1-3)>[run paragraph on]";
					get a number;
					if calcnumber >= 1 and calcnumber <= 3:
						break;
					otherwise:
						say "'I'm sorry, could [dorgr] repeat that?'";
				if calcnumber is 1:
					say "     'My decision to not explain my past isn't a trust issue. If I didn't trust [dorgr] then I wouldn't be so inclined to make them so";
					if charisma of player > 14:
						say ".' [gche]'s clearly trying to misdirect you. You imagine that [ghe] only makes this claim because the arrangement remains convenient for [ghim]; you're not the one making [ghim] your property here. You could press [ghim] on this, but you doubt you'll get anywhere with it, so you leave it at that for now.";
					otherwise:
						say ".' You're not exactly sure about this claim, but you decide to leave it at that.";
				otherwise if calcnumber is 2:
					if charisma of player < 15:
						say "     (Invalid interaction: You don't have enough Charisma.)[line break]";
					otherwise:
						say "     'Such a deception that I would have to live with--assuming it even worked...' [gche] grimaces slightly in illustration of the notion before continuing.";
						say "     '[dorgr] is quick-tongued. Let's skip theatrics and get to the point: Though I claim assurance that this secret isn't important, I will make no effort to offer any compensation if said assurance is insufficient. This is the price of admission I have imposed, the only price I have put up since their claim over me, but I will hold no ill-will towards [dorgr] if they find that price too expensive for their tastes.' [gche] is exceedingly straightforward in this expression when explaining this to you, which makes [ghim] very difficult to read.";
					now calcnumber is -1;	
				otherwise if calcnumber is 3:
					now calcnumber is -1;	
					now dorcusexit is 1;
		otherwise if calcnumber is 2:
			now dorcustv_1 is 1;
			say "     'The answer to that question is fairly straightforward: We benefit from a simplistic relationship. You use me[if dorrolereg is 0]--On top though I may be--[otherwise] [end if]and that brings me a joy. Anything else would get in the way of that.'";
			now calcnumber is -1;	
			let dorcusexit be 0;
			while dorcusexit is 0:
				say "[bold type][link]1) 'Perhaps I wish for our relationship to be deeper?'[as]1[end link][roman type]";
				say "[bold type][link]2) (Return to the main topic)[as]2[end link][roman type][line break]";
				while 1 is 1:
					say "Choice? (1-2)>[run paragraph on]";
					get a number;
					if calcnumber >= 1 and calcnumber <= 2:
						break;
					otherwise:
						say "'I'm sorry, could [dorgr] repeat that?'";
				if calcnumber is 1:
					say "     'And [dorgr] flatters me with such a proposal, but I'm not the [gdragon] one takes home to their parents... Also, I'm certain being called [dorgr] day in and day out, in the context of a closer relationship, would grate considerably.'";
					now calcnumber is -1;
					let dorcusexit2 be 0;
					while dorcusexit2 is 0:
						say "[bold type][link]1) 'Then don't call me [dorgr].'[as]1[end link][roman type]";
						say "[bold type][link]2) (Return to the main topic)[as]2[end link][roman type][line break]";
						while 1 is 1:
							say "Choice? (1-2)>[run paragraph on]";
							get a number;
							if calcnumber >= 1 and calcnumber <= 2:
								break;
							otherwise:
								say "'I'm sorry, could [dorgr] repeat that?'";
						if calcnumber is 1:
							say "     '--Oh, but why wouldn't I call my [dorgr] by their proper title? That's unfitting of my station!' Grinning a little, it's clear [ghe] won't budge on the matter.";
							now calcnumber is -1;	
						otherwise if calcnumber is 2:
							now calcnumber is -1;	
							now dorcusexit2 is 1;
							now dorcusexit is 1;
		otherwise if calcnumber is 3:
			now dorcustv_1 is 1;
			say "     'Oh, [dorgr], such disdain pains me greatly. Every ounce of my will for life leave me, were I to suffer such disappointment. But alas, naught shall escape these twisted lips.' [gche] chuckles a bit, no doubt amused by this bout of melodramatics."; 
			now calcnumber is -1;	
			let dorcusexit be 0;
			while dorcusexit is 0:
				say "[bold type][link]1) 'I'm getting the impression you don't take my role seriously.'[as]1[end link][roman type]";
				say "[bold type][link]2) (Return to the main topic)[as]2[end link][roman type][line break]";
				while 1 is 1:
					say "Choice? (1-2)>[run paragraph on]";
					get a number;
					if calcnumber >= 1 and calcnumber <= 2:
						break;
					otherwise:
						say "'I'm sorry, could [dorgr] repeat that?'";
				if calcnumber is 1:
					say "     'That isn't necessarily my intent, but there are limits to my ability--Ah, one wouldn't, say, aggres a mere toaster for its inability to tell the time.'";
					now calcnumber is -1;
					let dorcusexit2 be 0;
					while dorcusexit2 is 0:
						if intelligence of player > 14:
							say "[bold type][link]1) (Intelligence: [intelligence of player]/15) 'A toaster's limitation is intrinsic, this is self-imposed.'[as]1[end link][roman type]";
						otherwise:
							say "1) (Intelligence: [intelligence of player]/15) (Insufficient intelligence!)[line break]";
						say "[bold type][link]2) (Return to the main topic)[as]2[end link][roman type][line break]";
						while 1 is 1:
							say "Choice? (1-2)>[run paragraph on]";
							get a number;
							if calcnumber >= 1 and calcnumber <= 2:
								break;
							otherwise:
								say "'I'm sorry, could [dorgr] repeat that?'";
						if calcnumber is 1:
							if intelligence of player < 15:
								say "     (Invalid interaction: You don't have enough Intelligence)[line break]";
							otherwise:
								say "     'Hm, [dorgr] is quite the relentless one... This falls back into the subject of context. If I didn't want my [dorgr] as such then I wouldn't have brought it up. I guess that is an admission that said context is the one thing I serve above them.'";
							now calcnumber is -1;	
						otherwise if calcnumber is 2:
							now calcnumber is -1;	
							now dorcusexit2 is 1;
							now dorcusexit is 1;
		otherwise if calcnumber is 4:
			say "     'Understand that I garner no joy from keeping secrets, but I do ask that [dorgr] gain some solace in the assurance that I will never lie to them, and that my past is not of some significance that their lack of knowledge would harm them down the line.' [gche] decides to conclude the topic at that, leaving you to go about your business[if charisma of player > 14], though you remain a fair bit unsure as to [ghis] assurance of honesty[end if].";
			now trixieexit is 1;

to say dorcus_2: [Of Hobbies and Imagination]
	say "     You approach Doran, who--oddly enough--seems to be huddled in one of the cave's corners, facing away from you, all the while distracted with something. Quietly, you approach the [gdragon], who appears to be muttering something to [ghim]self, before tapping [ghim] on the side. [gche]'s set off with a right jolt and you see what [ghe]'s been doing.";
	say "     'A-ah, [dorgr], I didn't hear them come in. Um, er...' Apparently [ghe] managed to find a number of children's toys and [ghe]'s been playing with them. Embarrassment streaks [ghis] face, red hot with the reveal of this peculiar pastime.";
	say "     'I should, well, uh...' [gche] scuttles about to clean up the toys, no doubt a fair bit shamed by their presence, '...They never say how boring the post-apocalyptic scene can be, and I'm never short on free time.'";
	now calcnumber is -1;	
	let trixieexit be 0;
	while trixieexit is 0:
		say "[bold type][link]1) 'Shouldn't you be out scavenging, or something?' I assume something of your size would have to eat a lot.[as]1[end link][roman type]";
		say "[bold type][link]2) 'Alright, but why dolls?'[as]2[end link][roman type]";
		say "[bold type][link]3) 'You worry too much about what I think of your pastime.'[as]3[end link][roman type]";
		say "[bold type][link]4) 'Perhaps you could move over and have me join you?'[as]4[end link][roman type][line break]";
		if dorcustv_1 is 0:
			say "[bold type][link]5) 'Well, alright then... I'll be over here.' (Exit)[as]5[end link][roman type][line break]";
		otherwise:
			say "[bold type][link]5) 'I'm certain you'd like some time alone, then?' (Exit)[as]5[end link][roman type][line break]";
		while 1 is 1:
			say "Choice? (1-5)>[run paragraph on]";
			get a number;
			if calcnumber >= 1 and calcnumber <= 5:
				break;
			otherwise:
				say "'I'm sorry, could [dorgr] repeat that?'";
		if calcnumber is 1:
			say "     'Collecting food and water to feed myself is quite easy, actually. And I'm not finding any shortage of wood.' You invite [ghim] to elaborate, to which [ghe]'s somewhat reluctant to do, 'I'm not really influenced by the infectious nature of the surroundings, which takes a lot of the risk out of getting what I need.'";
			now calcnumber is -1;	
			let dorcusexit be 0;
			while dorcusexit is 0:
				if "Curious" is listed in feats of player:
					say "[bold type][link]1) (Curious:) 'How?'[as]1[end link]";
				otherwise:
					say "1) (Unavailable: Requires Curious Feat)[line break]";
				if intelligence of player > 15:
					say "[bold type][link]2) (Intelligence: [intelligence of player]/16) 'That's extremely unlikely save for something exceedingly powerful.'[as]2[end link]";
				otherwise:
					say "2) (Intelligence: [intelligence of player]/16) (Insufficient intelligence!)[line break]";
				say "[bold type][link]3) (Return to the main topic)[as]3[end link][roman type][line break]";
				while 1 is 1:
					say "Choice? (1-3)>[run paragraph on]";
					get a number;
					if calcnumber >= 1 and calcnumber <= 3:
						break;
					otherwise:
						say "'I'm sorry, could [dorgr] repeat that?'";
				if calcnumber is 1:
					if "Curious" is not listed in feats of player:
						say "     (Invalid interaction: You don't have that feat.)[line break]";
					otherwise:
						say "     [gche] seems ill-inclined to explain further, but with some prodding [ghe] manages to budge.";
						say "     'Does [dorgr] remember our discussion on context? Talking about this particular matter would alter that.' That seems to be all you can squeeze out of [ghim].";
					now calcnumber is -1;	
				otherwise if calcnumber is 2:
					if intelligence of player < 16:
						say "     (Invalid interaction: You don't have enough Intelligence.)[line break]";
					otherwise:
						say "     'That might be one angle, but if I was so powerful, how could [dorgr] defeat me? And I'm certain weaker creatures can find a way to deal with it.' [gche] grimaces slightly following this remark, [if perception of player > 15]an obvious tell, no doubt [ghe]'s trying to misdirect you in this moment of weakness[otherwise]perhaps dissatisfied with this answer[end if].'";
						now calcnumber is -1;
						let dorcusexit2 be 0;
						while dorcusexit2 is 0:
							if perception of player > 15:
								say "[bold type][link]1) (Perception: [perception of player]/16) 'I got the impression you were holding back by a fair amount when we fought.'[as]1[end link][roman type]";
							otherwise:
								say "1) (Perception: [perception of player]/16) (Insufficient perception!)[line break]";
							say "[bold type][link]2) 'That doesn't really explain your immunity.'[as]2[end link][roman type]"; 
							say "[bold type][link]3) (Return to the main topic)[as]3[end link][roman type][line break]";
							while 1 is 1:
								say "Choice? (1-3)>[run paragraph on]";
								get a number;
								if calcnumber >= 1 and calcnumber <= 3:
									break;
								otherwise:
									say "'I'm sorry, could [dorgr] repeat that?'";
							if calcnumber is 1:
								if perception of player < 15:
									say "     (Invalid interaction: You don't have enough Perception.)[line break]";
								otherwise:
									say "     [gche] appears caught in a corner here, taking a prolonged length of time to determine an answer, seems to eventually make an appeal to emotion.";
									say "     'I beg of them, [dorgr], their [gdragon] is being crushed under the weight of this excessive scrutiny.' [gche] does seem genuinely distressed, and you get the impression that [ghe] might flee outright rather than continue, so you leave it at that.";
								now calcnumber is -1;	
							otherwise if calcnumber is 2:
								say "     'I like to think I'm a bit smarter than what's out there. I could easily circumnavigate anything I couldn't handle.' [gche] grimaces a bit at this answer, as well.";
								now calcnumber is -1;	
							otherwise if calcnumber is 3:
								now calcnumber is -1;	
								now dorcusexit2 is 1;
								now dorcusexit is 1;
					now calcnumber is -1;	
				otherwise if calcnumber is 3:
					now calcnumber is -1;	
					now dorcusexit is 1;		
		otherwise if calcnumber is 2:
			say "     'Oh, [dorgr], they sting me when they call them dolls... Grant me a measure of patience to wax sentimental, I think one's imagination is perhaps the greatest ability anyone has. There's a certain freedom in one's mind that is without comparison in the world as a whole, though I find that it can still be a bit restrictive in a vacuum... However, that's another topic altogether.' [gche] begins to ponder a bit in the wake of [ghis] digression. [gche] seems rather fond of this subject.";
			now calcnumber is -1;	
			let dorcusexit be 0;
			while dorcusexit is 0:
				say "[bold type][link]1) 'How often do you spend playing like this?'[as]1[end link]";
				say "[bold type][link]2) 'Where did you get them?'[as]2[end link]";
				say "[bold type][link]3) (Return to the main topic)[as]3[end link][roman type][line break]";
				while 1 is 1:
					say "Choice? (1-3)>[run paragraph on]";
					get a number;
					if calcnumber >= 1 and calcnumber <= 3:
						break;
					otherwise:
						say "'I'm sorry, could [dorgr] repeat that?'";
				if calcnumber is 1:
					say "     'Uh... Whenever I have some free time and [dorgr] isn't around, I suppose.' [gche] blushes a visible measure more in response to this particular query.";
					now calcnumber is -1;	
				otherwise if calcnumber is 2:
					say "     'I manage to recover some, on occasion. Apparently, certain strains of this blight are receptive to this kind of stuff, so they're quite difficult to find these days.'";
					now calcnumber is -1;	
				otherwise if calcnumber is 3:
					now calcnumber is -1;	
					now dorcusexit is 1;	
		otherwise if calcnumber is 3:
			now dorcustv_1 is 1;
			say "     'My thanks, I perhaps worry too much over my image. What is the right way for something like me to act? Me playing with toys doesn't quite give the impression of a big, strong [gdragon]. I worry most of all that this harms the image I provide to you.' [gche] still seems a bit morose, though your regard has cheered [ghim] up a little bit, at least.";
			now calcnumber is -1;	
			let dorcusexit be 0;
			while dorcusexit is 0:
				say "[bold type][link]1) 'I don't care about how you present yourself to me.'[as]1[end link]";
				say "[bold type][link]2) (Return to the main topic)[as]2[end link][roman type][line break]";
				while 1 is 1:
					say "Choice? (1-2)>[run paragraph on]";
					get a number;
					if calcnumber >= 1 and calcnumber <= 2:
						break;
					otherwise:
						say "'I'm sorry, could [dorgr] repeat that?'";
				if calcnumber is 1:
					say "     'Again, I thank [dorgr] for trying to calm me, but I do care a lot on how I present myself. The fact that they are here now shows that I've done something right with you, I can only assume it's that image.'";
					now calcnumber is -1;	
				otherwise if calcnumber is 2:
					now calcnumber is -1;	
					now dorcusexit is 1;	
		otherwise if calcnumber is 4:
			now dorcustv_1 is 1;
			say "     'Oh, [dorgr], I'm flattered by the attempt to make me feel better, but this isn't quite something I think they'd be all that into.' [gchis] mood does appear to have brightened up, at least. '...Though, give me some time, I might think of something more appropriate for them.'";
			now calcnumber is -1;	
			let dorcusexit be 0;
			while dorcusexit is 0:
				say "[bold type][link]1) 'What did you have in mind?'[as]1[end link]";
				say "[bold type][link]2) 'But I assure you, I would enjoy joining you!'[as]2[end link]";
				say "[bold type][link]3) (Return to the main topic)[as]3[end link][roman type][line break]";
				while 1 is 1:
					say "Choice? (1-3)>[run paragraph on]";
					get a number;
					if calcnumber >= 1 and calcnumber <= 3:
						break;
					otherwise:
						say "'I'm sorry, could [dorgr] repeat that?'";
				if calcnumber is 1:
					say "     'Well, I'm certain we can find a way to 'play' with each other that might be more in line with your interests. Get back to me on it.'";
					now calcnumber is -1;	
				otherwise if calcnumber is 2:
					say "     'Oh, [dorgr]...' [gche] grins a little, chuckling at your remark. 'I think we can all say here that playing with toys isn't the reason they hang around my little abode. You're very sweet, though.'";
					now calcnumber is -1;		
				otherwise if calcnumber is 3:
					now calcnumber is -1;	
					now dorcusexit is 1;
		otherwise if calcnumber is 5:
			if dorcustv_1 is 1:
				say "     'Yeah... And thanks. I revel in play; the assertion of roles and facsimiles for the sake of imagination, it offers a certain... Freedom, that I can't be without. I hope [dorgr] understands.' [gche] lets you off, returning to [ghis] toys to stow them away once more.";
				now dorrprr is 1;
			otherwise:
				say "     'Yeah... Please forgive me, I never intended to harm your impression of me. I would ask that you try to overlook this irregularity.' [gche] lets you off, quickly scurrying back to stow away [ghis] toys.";
			say "[line break][bold type][bracket]Interaction Unlocked: Request Roleplay[close bracket][roman type]";
			now trixieexit is 1;
			
Chapter 4 - Doran Roleplay Protocol

to say dorrp:
	if dorrprr < 2:
		say "     You approach the Doran with the subject of roleplay, in the wake of the reveal regarding [ghis] particular interests.";
		if dorrprr is 1:
			say "     'Oh, [dorgr], they would like to play a game, then? It reassures me that they've taken my odd hobbies so well";
		otherwise:
			say "     'Really, [dorgr]? I got the impression that they were a bit off-put by my odd hobby, though I'll happily oblige them. Maybe I'll find something more in line with their 'interests'";
		increase dorrprr by 2;
		say ".' [gche] ponders briefly, for a moment, before continuing.";
		say "    'Alright, I might have an idea or two that might be of interest. Here's what I got--though forgive me if there what I got to offer right now is a bit limited; give me some time and I figure my imagination will come with other possible scenarios, I'm certain.'";
	otherwise:
		say "     Certainly, [dorgr], what game would they like to play?";
	if dorrprr is not 0:
		now calcnumber is -1;
		let trixieexit be 0;
		while trixieexit is 0:
			say "[bold type]Main Roleplay Categories:[roman type][line break]";
			say "(1) [link]Matters of a Feral Nature[as]1[end link][line break]";
			say "(2) [link]Dragons and Similar Fantasy Fare[as]2[end link][line break]";
			say "(-) ----[line break]";
			say "(-) ----[line break]";
			say "[line break]";
			say "(3) [link]Suspend Current Session[as]3[end link] -[bold type][if dorrpis is 0] No[end if] RP in Session[line break][roman type]";
			say "(0) [link]Return to Main Menu[as]0[end link][line break]";
			while 1 is 1:
				say "Choice? (0-3)>[run paragraph on]";
				get a number;
				if calcnumber >= 0 and calcnumber <= 3:
					break;
				otherwise:
					say "'I'm sorry, could [dorgr] repeat that?'";
			if calcnumber is 1:
				say "[dorrpmfn]"; [Doran RP: Matters of a Feral Nature Submenu]
			otherwise if calcnumber is 3:
				if dorrpis > 0:
					say "     'Right, [dorgr], want to cancel what we've currently have planned?'";
					if player consents:
						now dorrpis is 0;
						now dorrp_tv1 is 0;
						now dorrp_tv2 is 0;
						now dorrp_tv3 is 0;
						now dorrp_tv4 is 0;
						say "     'Then think no more of it.'";
					otherwise:
						say "     '[one of]Alright[or]Okay[or]My mistake[or]Certainly[at random].'";
				otherwise:
					say "     'Ah, I'm sorry [dorgr], I don't believe any roleplay is in session right now.";
			otherwise if calcnumber is 2:
				say "[dorrpdsff]"; [Doran RP: Dragons and Similar Fantasy Fare Submenu]
			otherwise:
				say "     'It's no issue, [dorgr], don't be shy if you're feeling creative.'";
				now trixieexit is 1;
				
Section 4.1 - Doran Roleplay Submenu Protocols

to say dorrpmfn: [Doran RP: Matters of a Feral Nature Submenu]
	say "     'This fare generally entails me asserting a more 'bestial' role, so this might be worth their time if that's their interest--or maybe they'd just prefer I not talk nearly as much.' [gche] grins slightly in relation to [ghis] musing.";
	now calcnumber is -1;
	let trixieexit be 0;
	while trixieexit is 0:
		say "[bold type]Matters of a Feral Nature:[roman type][line break]";
		say "(1) [link]The Virile Beast[as]1[end link][line break]";
		say "(-) ----[line break]";
		say "(-) ----[line break]";
		say "(-) ----[line break]";
		say "[line break]";
		say "(0) [link]Return to Main Categories[as]0[end link][line break]";
		while 1 is 1:
			say "Choice? (0-1)>[run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 1:
				break;
			otherwise:
				say "'I'm sorry, could [dorgr] repeat that?'";
		if calcnumber is 1:
			say "[dorrpovb]"; [Doran RP: The Virile Beast Query]
		otherwise:
			say "     '[one of]Alright[or]Moving on[or]Very well[or]Got it[at random].'";
			now trixieexit is 1;
			
to say dorrpdsff: [Doran RP: Dragons and Similar Fantasy Fare Submenu]
	say "     'Ah, yes, [dorgr]. Since I'm very much a [gdragon], this topic explores that in a more 'Traditional' sense, you could say.'";
	now calcnumber is -1;
	let trixieexit be 0;
	while trixieexit is 0:
		say "[bold type]Dragons and Similar Fantasy Fare:[roman type][line break]";
		say "(1) [link]The Knight[as]1[end link][line break]";
		say "(-) ----[line break]";
		say "(-) ----[line break]";
		say "(-) ----[line break]";
		say "[line break]";
		say "(0) [link]Return to Main Categories[as]0[end link][line break]";
		while 1 is 1:
			say "Choice? (0-1)>[run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 1:
				break;
			otherwise:
				say "'I'm sorry, could [dorgr] repeat that?'";
		if calcnumber is 1:
			say "[dorrptk]"; [Doran RP: The Knight Query]
		otherwise:
			say "     '[one of]Alright[or]Moving on[or]Very well[or]Got it[at random].'";
			now trixieexit is 1;

Section 4.2 - Doran Roleplay Queries

dorrpis is a number that varies. dorrpis is usually 0. [Doran Roleplay In Session. 0 = None, 1 to X = Identifies which roleplay is active]
dorrp_tv1 is a number that varies. dorrp_tv1 is usually 0. [Doran Roleplay Temp Value 1. Use is contextual to the scene]
dorrp_tv2 is a number that varies. dorrp_tv2 is usually 0. [Doran Roleplay Temp Value 2. Use is contextual to the scene]
dorrp_tv3 is a number that varies. dorrp_tv3 is usually 0. [Doran Roleplay Temp Value 3. Use is contextual to the scene]
dorrp_tv4 is a number that varies. dorrp_tv4 is usually 0. [Doran Roleplay Temp Value 4. Use is contextual to the scene]

to say dorrpovb: [Doran RP: The Virile Beast Query]
	say "     '[if dorrolereg > 0]Ah, [dorgr], I must caution that this puts them in a considerably submissive position, which might not be their thing[end if]";
	if dorrolereg > 0 and anallevel is 1 and ((cunts of player > 0 and cunt length of player < 5) or cunts of player is 0):
		say ", additionally,";
	otherwise if anallevel is 1 and ((cunts of player > 0 and cunt length of player < 5) or cunts of player is 0):
		say "I must caution [dorgr],";
	if anallevel is 1 and cunts of player > 0 and cunt length of player < 5:
		say "because they're too small for me to fit in their proper hole, I really have no choice but to take their back door, but I get the impression that's not something they would enjoy";
	otherwise if anallevel is 1:
		say "this role isn't particularly bright, so It'll make little sense for me to, say, go the oral route, and I'm of the impression that they're not fond of taking it from the back door";
	if dorrolereg > 0:
		say ".'[line break]";
		say "     '";
	otherwise if anallevel is 1 and ((cunts of player > 0 and cunt length of player < 5) or cunts of player is 0):
		say ".'[line break]";
		say "     '";
	say "This session entails my taking the role of a libido-crazy beast who's captured [dorgr] for the purpose of 'breeding'--for reasons which are complicated I can't actually reproduce, but for the session we can assume that this is [ghis] motivation. It's a very simple session, entailing lots of bestial sex. Does this pique their interest?'";
	if player consents:
		now dorrpis is 1;
		say "     'Alright! Let's get into the finer details. We can open this session two ways. Either with [dorgr] trespassing into my 'territory', or me having implicitly captured [dorgr] and our fun begins just as I'm dragging them back. Yes for trespassing? Else I will assume the latter is true.'";
		if player consents:
			say "     'Got it, trespassing it is.'";
			 now dorrp_tv1 is 0;
		otherwise:
			now dorrp_tv1 is 1;
			say "     'Got it, trophy it is.'";
		say "     'Moving on, how long should this be? One might be fond of a long run, but it's easy to forget how boring being tethered to a wall for a fair while can be; I can assure them that it might end up too repetitive for their tastes. We'll do a number from zero to three, zero being short and three being very long.'";
		now calcnumber is -1;
		while 1 is 1:
			say "Choice? (0-3)>[run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 3:
				break;
			otherwise:
				say "'I'm sorry, could [dorgr] repeat that?'";
		if calcnumber >= 0 and calcnumber <= 3:
			now dorrp_tv2 is calcnumber;
			say "'Alright, I see your [dorrp_tv2].'"; 
		if cunts of player > 0 and cunt length of player > 6 and anallevel is not 1 and (scalevalue of player > 1 or player is twistcapped):
			say "     'One final matter. Obviously the pretense of this affair is procreation, but I can easily have myself go through the back door. We can handwave it as stupidity. Yes or no?'";
			if player consents:
				now dorrp_tv3 is 1;
				say "     'Okay, no problem.";
		if wslevel is 3:
			say "     Instinctively, you're inclined to bring up the subject of the [gdragon] marking you during the scene, which briefly confuses Doran.";
			say "     'Oh, you're into that sort of thing? Ah, hm... That... Really isn't my area of expertise... I mean... The smell would take ages to get out of this place! Hm... I guess I can make a concession for [dorgr], is that their desire?'";
			if player consents:
				say "     'Got it, I'm sure I'll be ready when [dorgr] is.'";
				now dorrp_tv4 is 1;
			otherwise:
				say "     'Ah, very well. I fear [dorgr] worries too much for my feelings on this matter, but we'll speak no more on it.'";
		say "     'That's all I need to know for this session, next time I'm asked for sex we'll have a little fun[if dorautint > 0]--oh, and [dorgr], I won't automatically have my way with them while a bit of roleplay is scheduled, it's more conducive this way[end if].' A grin on [ghis] face, [ghe] lets you off to prepare.";
	otherwise:
		say "     'Not an issue, I'm sure I can come up with something else.'";
		
to say dorrptk: [Doran RP: The Knight Query]
	say "     'Very well. This scene explores the notion of a [gdragon] and a knight in battle, with the victor having their way with the other. Shall [dorgr] be the victor? Else I'll assume they'll want me to win.'";
	if player consents:
		say "     'Got it. I will lose to [dorgr], leaving them at their mercy";
		if cocks of player is 0:
			say ". I must caution them, this session entails me taking it from behind, which they cannot naturally provide. I should be able to provision them with a strap-on that should fit their size and shape, in its place";
		say ". Is this desirable?'";
		if player consents:
			now dorrpis is 2;
			say "     'Good to know. There's very little I need to ask about this session, since [dorgr] will be in control. How would you like me to respond to my loss, shall I be aggressive throughout? Otherwise, I will succumb to a submissive state by the end.'";
			if player consents:
				now dorrp_tv1 is 1;
				say "     'Done, aggressive it is.'";
			otherwise:
				now dorrp_tv1 is 0;
				say "     'Done, submissive it is.'";
			say "     'And that's all I need to ask! I'll have everything in order for when [dorgr] is ready.'";
		otherwise:
			say "     'My mistake, I'm certain I have something else they'd prefer.'";
	otherwise:
		say "     'Very well. My [dorgr] will lose to me, and thusly they will succumb to the fate of this [gdragon]'s toy";
		if anallevel is 1 and ((cunts of player > 0 and cunt length of player < 5) or cunts of player is 0):
			say ". I must caution [dorgr], though, [if cunts of player > 0 and cunt length of player < 5]because they're too small for me to fit in their proper hole I really have no choice but to take their back door, but I get the impression that's not something they would enjoy[otherwise]for simplicity's sake I'll be sticking to the anal sex, and I'm of the impression that they're not fond of taking it from the back door[end if]";
		say ". Is that in line with their desire?'";
		if player consents:
			now dorrpis is 3;
			say "     'Moving on, would you prefer my demeanour be smug, or aggressive? Yes for smug.'";
			if player consents:
				now dorrp_tv1 is 1;
				say "     'Alright, smug it is.'";
			otherwise:
				now dorrp_tv1 is 0;
				say "     'Alright, Aggressive it is.'";
			if dorvorreg > 1 and scalevalue of player < 4:
				say "     'Ah, do you want this scene to conclude with me eating [dorgr], as well?'";
				if player consents:
					say "     'Got it. What is my motivation for this act? Would you say that I'm doing this to imprison [dorgr]? Else I will assume the intent is to end them.'";
					if player consents:
						say "     'Alright, a captive [dorgr] will become.'";
						now dorrp_tv2 is 2;
					otherwise:
						now dorrp_tv2 is 1;
						say "      'Alright, we will play as though this is my [dorgr]'s demise.'";
				otherwise:
					now dorrp_tv2 is 0;
					say "     'My mistake. Moving on, then...'";
			otherwise:
				now dorrp_tv2 is 0;
			if cunts of player > 0 and cunt length of player > 4 and anallevel is not 1:
				say "     '--Oh, would you prefer I take [dorgr] up the behind instead of the proper hole? Easy thing for me to do in this circumstance, so it's a choice I can freely provide.'";
				if player consents:
					now dorrp_tv3 is 1;
					say "     'Got it.'";
				otherwise:
					now dorrp_tv3 is 0;
					say "     'Very well, disregard my mentioning of it, in this case.'";
			otherwise:
				now dorrp_tv3 is 0;
			say "     'That's all I need from them. I'll roll this session out when everyone is ready.'";
		otherwise:
			say "      'My mistake, I'm certain I have something else they'd prefer.'";

Section 4.3 - Doran Roleplay Sex Protocol

to say dorrpsp:
	if dorrpis is 1:
		say "[dorrpovbs]"; [Doran RP of the Virile Beast Scene]
	otherwise if dorrpis is 2 or dorrpis is 3:
		say "[dorrptks]"; [Doran RP The Knight Scene]

Section 4.4 - Doran Roleplay Sex Pool

to say dorrpovbs:
	if cunts of player is 0 or cunt length of player < 5 or dorrp_tv3 is 1:
		now dorrp_tv3 is 2;
	if dorrp_tv1 is 0: [Variant Trespasser]
		say "     Cautiously, you move to search the cave for anything of value. Finding little of any use to you, your scavenging is interrupted when your peripheral vision is flooded with the sight of [if scalevalue of player < 4]a looming shadow[otherwise]another[end if]. You're not given a chance to turn around before you're pounced, pinned to the ground. The feel of drool dripping against your skin, you're forced to watch on as the [gdragon] sniffs and exposes your[if scalevalue of player < 4] smaller,[end if] [bodytype of player] form before [ghis] feral gaze.";
		say "     You're not completely helpless; you could struggle against the beast's grip, shall you? Else you will choose to succumb to the [gdragon]'s primal will.";
	otherwise: [Variant Trophy]
		say "     [if scalevalue of player < 4]Carried[otherwise]Heaved[end if] towards the cave, the [gdragon] casually [if scalevalue of player < 4]tosses[otherwise]forces[end if] you into a corner. After your embarrassing defeat at [ghis] hand, the creature spared you of any immediately abuse and instead chose to keep you for [ghim]self. The huffing of [ghis] quizzical sniffing quite audible as [ghe] inspects your[if scalevalue of player < 4] smaller,[end if] [bodytype of player] form.";
		say "     Though the beast has defeated you once before, you could struggle against [ghim] still, shall you? Else, you will choose to succumb to the [gdragon]'s primal will.";
	if player consents:
		say "     Immediately, you try to force yourself free of the creature's hold; however, all this succeeds in doing is irritating the creature further, pinning you to the ground more firmly and nipping you as retribution for your impudence.";
		now tempnum is 1;
	otherwise:
		say "     Resigning yourself to your fate, you calm down and allow you to be shamelessly inspected by the creature. Though [ghe] refrains from any harsher treatment at this moment, this doesn't reduce how bluntly [ghe] handles you.";
		now tempnum is 0;
	if dorrp_tv4 is 1:
		say "     Before [ghe] makes any effort to have [ghis] way with you, however, [ghe] seems intent on a bit of bestial formality, pinning you with a fore-talon whilst lifting a hind. Any meager ambiguity of the gesture is washed by the feel [ghis] hot piss hosed against your [bodydesc of player] form, the acrid, overpowering stench wafting up to assault your senses. [gche] seems to have quite a fair amount, and exploits this to mark you thoroughly[if tempnum is 1], much in spite your protests[end if], christening you as [ghis][if scalevalue of player < 4] little[end if] bitch. Eventually the flow recedes, and the [gdragon] returns to the more immediate matter on [ghis] mind.";
	say "     Moving to properly position [ghim]self [if scalevalue of player < 4]over[otherwise]on top of[end if] [ghis] new victim, you quickly feel the hot, firm tip of [gdragon]'s bestial tool repeatedly prodding ";
	if dorrp_tv3 is 2:
		say "your exposed anal ring";
	otherwise:
		say "[if cunts of player > 1]one of [end if]your exposed cunt[sfn]";
	say ". It takes [ghim] a few tries to properly hit [ghis] mark, but when [ghe] does, it's immediately clear that [ghe]'s not going to ease you into it. [if tempnum is 0]Resigning yourself to your fate though you may have, you can't help but[otherwise]You[end if] immediately cry out in pain as a result of this immediate and harsh penetration, ";
	if dorrp_tv3 is 2:
		say "[if scalevalue of player < 4]each progressive inch[otherwise]its entirety abruptly[end if]";
	otherwise:
		say "[if cunt length of player < 12]each progressive inch[otherwise]its entirety abruptly[end if]";
	say " forced into your [if dorrp_tv3 is 2]depths[otherwise]supple folds[end if], up to [ghis] knot, with a complete disregard for your well-being.";
	say "     Fucking you like a wild beast[if dorrp_tv4 is 1], [ghis] body's motion slicked by your urine-soaked frame[end if], you feel [ghis] claws and teeth firmly against you, [ghis] aggressive dominion inflicting further discomfort and harm to your already rough experience[if tempnum is 0], regardless of your submission[end if]. In spite of [if tempnum is 1]your better judgment[otherwise]his harsh treatment[end if], you can't but become increasingly aroused by [ghis] bestial fury, [if cocks of player > 0]erect, [cock size desc of player] dick[smn] grinding unattended against the hard ground[otherwise if cunts of player > 0 and dorrp_tv3 is 0]oozing, [cunt size desc of player] cunt squeezing against its harsh invader[otherwise]dripping, [cunt size desc of player] cunt[sfn] grinding unattended against the hard ground[end if].";
	say "     Each successive jism of pre sending tremors through your[if scalevalue of player < 4] painfully stuffed[end if] body, the lubrication is eventually enough that [ghe] manages to force [ghis] knot all the way into you[if scalevalue of player < 4], causing your body to bulge visibly in order to abide it[end if]. This is enough to set [ghim] off, gout after thick, musky gout of cum flooding your[if scalevalue of player < 4] ill-prepared[end if] [if dorrp_tv3 is 2]bowels[otherwise]womb[end if]";
	if scalevalue of player < 4:
		say ". You would doubtlessly balloon outwards as a result of such a substantial load, but the portion of the [gdragon]'s weight you're made to bear only forces it back out from whence it came--tied tightly though your hole may be[if dorrp_tv3 is 2]--and causes you to cough up a bit of [ghis] overwhelming jizz, a twisted means of subjecting you its heady flavour[end if]";
	otherwise:
		say ". Though you're large enough to abide [ghis] release, the sheer volume remains dizzying, some eventually oozing from your tied hole";
	say ". Whatever meager orgasm you can muster from the wake of this devastation is largely strained by the creature's[if scalevalue of player < 4] intense[end if] intrusion.";
	say "     The [gdragon] takes this moment to catch [ghis] breath, laying loosely on top of you, and you briefly assume that [ghe]'s[if tempnum is 1] thankfully[end if] finished; however, this quickly proves to not be the case, as [ghe] gets back up and starts up once again. In mere seconds, [ghe]'s back to the pace [ghe] was at once before. The beast's stamina seems limitless, and as the hours pass [ghe] continues pumping you full of seed again and again. Your endurance, however, is not nearly so resilient, and you eventually pass out from exhaustion, through you assume that this isn't about to stop [ghim]...";
	if waiterhater is 0:
		wait for any key;
		say "[line break]";
	if dorrp_tv2 > 0:
		say "[dorrpovobss]"; 
	if dorrp_tv2 > 1:
		say "[dorrpovobss]"; 
	if dorrp_tv2 > 2:
		say "[dorrpovobss]"; 
	say "     After being subjected to this constant abuse for what seems like weeks, you [if tempnum is 1]eventually give in to your carnal desires, learning[otherwise]learn[end if] to love being [ghis][if scalevalue of player < 4] little[end if] fucktoy, and fully succumbing to a fate of being constantly pumped full of [ghis] cum, day in and day out. [if dorrp_tv1 is 0]Such is the price of trespassing where you don't belong[otherwise]You, at the very least, ended up making an excellent trophy for the beast[end if]...";
	if waiterhater is 0:
		wait for any key;
		say "[line break]";
	say "     '...[run paragraph on][one of]Oh[or]Ah[or]Hm[at random], [dorgr], are they [one of]alright[or]OK[at random]? [one of]I hope they enjoyed this little exercise[or]I hope I wasn't too rough on them[or]I made such a mess[at random]...' Still a bit dizzy from the whole ordeal, Doran fusses over cleaning you up, eventually satisfied and setting you off once more. Funny, it feels like no time has passed at all...";

to say dorrpovobss:
	if dorrp_tv4 is 1 and (a random chance of 1 in 6 succeeds or ("Kinky" is listed in feats of player and a random chance of 1 in 4 succeeds)): [WS Opener]
		say "     You are awoken from your prior lapse in consciousness to feel of a hot liquid rushing against your face. It only takes a second for the acrid stench and taste to inform you that you're being marked again by the [gdragon], [if tempnum is 0]meekly obliging such harsh treatment, much to [ghis] approval[otherwise]instinctively spitting it out and struggling once more to free yourself of [ghis] hold, to little avail[end if]. Satisfied with [ghis] little wake-up call, the beast continues going about the business [ghe] had planned for [ghis] little toy.";
		now dorcustv_1 is 0;
		now dorrp_tv4 is 2;
	otherwise if a random chance of 1 in 3 succeeds:  [Wake to being fucked]
		say "     Gradually, you stir awake once more, but it's soon made clear that your bestial captor is fucking you regardless of your lack of consciousness. Still sore and swollen with [ghis] seed, [ghe]'s already tied to you, and in the few seconds that follow the [gdragon] roars out once more, flooding your [if dorrp_tv3 is 2]bowels[otherwise]womb[end if] with [ghis] seed yet again, [if tempnum is 0]soon compelled to orgasm as well, you're unable to resist moaning out in approval for such wanton abuse[otherwise]groaning and struggling to try and free you once more, not that it ever seems to do much good[end if]. The [gdragon] takes this moment to rest for a bit.";
		now dorcustv_1 is 1;
	otherwise if a random chance of 1 in 2 succeeds: [Attempting Escape]
		say "     When you awake once more. The [gdragon] appears nowhere to be found, and it looks like you have a free shot to the exit";
		if tempnum is 0:
			say ". You choose not to exploit this opportunity, however, as even if you hadn't resigned yourself to your fate, the beast would likely find you. You're weakened groans eventually draw the beast's attention once more, and you see [ghim] return, softly nipping [ghis] captive in carnal greetings";
		otherwise:
			say "! Immediately, you pull yourself to your feet, considerably sore and swollen with cum. Nonetheless, you make a B-line for the outside... Only for the beast to immediately turn around the corner and pounce you before you can make any real distance. A low growling [ghis] regard, you're dragged back to where you were prior, nipping you as chastisement for your attempt to escape";
		say ". Now that [ghe] has returned, [ghe] takes a moment to decide what to [if tempnum is 0]do[otherwise]subject [ghis] failed escapee to[end if].";
		now dorcustv_1 is 0;
	otherwise: [Sleeping Dragon]
		say "     Roused once more from unconsciousness, you can feel the [gdragon] on top of you, though the limp manner in which [ghe] is splayed against you and the loud snoring [ghe] makes, it's clear [ghe]'s fallen asleep. It takes a second of shifting to realise that, in spite [ghis] state of rest, [ghe]'s still very much aroused and impaling you through your doubtlessly very worn hole. [if tempnum is 1]Weakly, you attempt to free yourself from under [ghim], but the activity[otherwise]Beleaguered groans and protests in being forced to abide [ghis] weight[end if] seems to stir [ghim] partially awake once more, renewed thrusts against you--initially idle and half-hearted--grow increasingly deliberate, until a groggy roar from the sordid beast punctuates another gout of [ghis] heady seed. It looks to be a sufficient wake-up call for [ghim], anyways, and nips [ghis][if scalevalue of player < 4] little[end if] [if dorrp_tv1 is 0]trespasser[otherwise]trophy[end if] in cheeky approval.";
		now dorcustv_1 is 1;
	if dorrp_tv4 is 1 and (a random chance of 1 in 4 succeeds or ("Kinky" is listed in feats of player and a random chance of 1 in 3 succeeds)): [WS "Feeding"]
		if dorcustv_1 is 1:
			say "     Pulling free from you, [ghe] moves around to aim [ghis] softened and cum-dripping";
		otherwise:
			say "     [gche] moves around to aim [ghis] partially unsheathed and perpetually-oozing";
		say " dick at your face, inching closer until [ghe] can prod your mouth with the tip. Dazed as you are, it's briefly unclear what the [gdragon] has planned, but this is quickly clarified as, when you[if tempnum is 1] are eventually forced to[end if] oblige, you're assaulted with a stream of [ghis] painfully bitter piss. [if tempnum is 1]Immediately, you try to pull yourself free, but [ghe] keeps [ghis] cockhead firmly within your mouth, forcing you[otherwise]The taste is overwhelming, making it difficult[end if] to swallow down this continued stream. It's clear [ghe] intends to satiate any thirst you might've had prior this way, though it does little in the way of aiding that. This persists for much too long, as the continued assault and odour is enough to make you eventually black out.";
	otherwise if a random chance of 1 in 2 succeeds: [Additional Fucking]        
		if dorcustv_1 is 1:
			say "     Immediately, [ghe] starts right back up; [ghe] just won't stop! Already stretched out as you are, the [gdragon] has no difficulty in the motion [ghe] builds once again";
		otherwise:
			say "     [gche] chooses to take the most predictable option and climbs on top of you, mounting you once more. Already stretched out as you are, the [gdragon] has no difficulty in hilting you";
		say ", the wet sound of [ghis] harsh, reckless thrusts filling the air. [if tempnum is 0]Moaning along with each impaling[otherwise]Weakly trying to muster up some manner of protest[end if], you're eventually struck with another flood of the creature's seed, adding a fresh coating of cum all over your behind. [gche] continues this ritual, wracking you with orgasm after orgasm, until you pass out from exhaustion once more.";
	otherwise :["Feeding"]
		if dorcustv_1 is 1:
			say "     Pulling free from you, y";
		otherwise:
			say "     Y";
		say "ou feel [ghis] tongue caress along your significantly cum[if dorrp_tv4 is 1] and piss[end if]-stained mess of a body. Though this tongue bath might bring you a moment of some reprieve, it's clear that the creature isn't swallowing the [if dorrp_tv4 is 1]noxious cocktail[otherwise]seed[end if], and your soon met with [ghis] muzzle against your face, forcing your mouth open. Instinctively, [if tempnum is 0]you[otherwise]you refuse [ghim], to which [ghe] lowly growls and pins [ghis] snout firmly against you until you can't help but[end if] oblige, the [gdragon]'s overpowering [if dorrp_tv4 is 1]fluids[otherwise]cum[end if] flooding your maw. It's clear [ghe]'s attempting to feed you, but the smell and taste is so intense[if scalevalue of player < 4], and you're so small compared to [ghim][end if], that this continued, prolongued ritual eventually overwhelms you, causing you to black out.";
	if waiterhater is 0:
		wait for any key;
		say "[line break]";
	if dorrp_tv4 is 2, now dorrp_tv4 is 1;
	now dorcustv_1 is 0;

to say dorrptks:
	say "     You've been called upon to deal with a [gdragon] that's been causing trouble for the area, a charge you've eagerly set out to complete. It took a little work, but you finally track the creature to [ghis] lair, offering a low growl when [ghe] sees you approach. Cornered now, [ghe] has no choice but to face you.";
	say "     '[one of]Hmpf[or]Huf[or]Ha[at random], [one of]many have fell to me before, what makes you think you'll be any different[or]you dare challenge me in my own home[or]you think you stand a chance against me[at random]!?' A puff of smoke escaping [ghis] scaled lips in punctuation to [ghis] belligerent remark, you don't bother with a response before charging on the beast!";
	if waiterhater is 0:
		wait for any key;
		say "[line break]";
	if dorrpis is 2:
		if cocks of player is 0:
			now dorrp_tv3 is 1;
		otherwise:
			now dorrp_tv3 is 0;
		say "     After a considerable struggle, the [gdragon] crumples into a panting heap, unable to contest your will any further. Not quite satisfied with merely defeating [ghim], you figure it's only appropriate to subject to [ghim] who's really in charge here.";
		say "     '[one of]Don't think you've won this[or]This isn't over[or]I'm not so easily defeated[at random]! [one of]I just need a moment to catch my second wind[or]Just give me a second here[at random]...' [gche]'s clearly going to put up some protest if you try to have your way with [ghim]. Perhaps you should tie [ghim] up?";
		if player consents:
			now dorrp_tv2 is 1;
			say "     Gathering up some rope, the [gdragon]'s impotent discontent only manages to mildly inconvenience you as you bind [ghis] legs and wings together, tieing [ghis] tail with those wings in such a way that it's forcibly raised to expose [ghis] shapely ass to anyone who might see it.";
			say "     '[one of]What's this?[run paragraph on][or]Ha![run paragraph on][at random] [one of]You think some paltry rope is goin-mnffn, mmnffn[or]I won't be so easily tied do-hfnm, rfng[at random]!' [gchis] continued protests eventually subdued when you tie is maw shit, [ghe] can only pout and puff smoke in protest, otherwise leaving the [gdragon] completely at your mercy";
		otherwise:
			now dorrp_tv2 is 0;
			say "     Getting straight to the point, you hike up [ghis] tail, exposing [ghis] shapely ass to your prying eyes";
		say ". Briefly testing [ghis] anal ring with [if scalevalue of player < 4]your hand[otherwise]a digit[end if], this is certainly a very effective means of getting [ghim] to write and twist in sharp disapproval, not that [ghe]'s in any position to stop you. Once you're satisfied, you move to expose your [if dorrp_tv3 is 0][cock size desc of player] dick[smn][otherwise]'mighty lance'[end if] before querying view, making [ghis] eyes go wide.";
		say "     '[if dorrp_tv2 is 1][one of]Nmm, nmm[or]Hn hvhns nn[or]whn fhhn hnn[at random][otherwise][one of]Oh, no, no no no[or]I-I can pay you, we don't have to do this[or]Let's not get hasty here, I'm certain we can find a better solution than this[at random][end if]!' [if dorrp_tv2 is 1]Incomprehensible p[otherwise]P[end if]rotests in the wake of this twisted revelation, [ghe]'s clearly not fond of what you have in store for [ghim], further highlighted when you force the tip of [if cocks of player > 1]one of your rods[otherwise if dorrp_tv3 is 0]your rod[otherwise]the rod[end if] past [ghis] fleshy portal[if cock length of player > 17], its substantive girth causing [ghim] to groan out loudly[otherwise if scalevalue of player > 3 and dorrp_tv3 is 1], its substantive girth causing [ghim] to groan out loudly[end if]. [if cock length of player < 13]Fairly tight even for someone of your size[otherwise if scalevalue of player < 4 and dorrp_tv3 is 1]Fairly tight even for someone of your size[otherwise]Quite the tight one[end if], the [gdragon] is clearly a total virgin to this sort of practice, making it all the more enjoyable to break [ghim].";
		say "     [if dorrp_tv2 is 1][gchis] struggles inhibited by the bondage[otherwise]Too exhausted to offer much to dissuade you[end if], you sink [if dorrp_tv3 is 0]your[otherwise]the[end if] tool deeper and deeper into [ghis] supple depths, until you hilt it entirely. Not inclined to offer much in the way of restraint, you don't give the beast any time to acclimate before you quickly build a motion of pounding [ghis] scaled ass, tensing with each harsh thrust.";
		say "     '[if dorrp_tv2 is 1][one of]Nff, hffn[or]Hhf, mnn[or]Hvhns sfft[at random][otherwise if dorrp_tv1 is 0][one of]A-ah, p-please stop[or]I-I'll offer you whatever you want, j-just[or]Nng, I can't take t-this[at random][otherwise][one of]Y-you won't get away with this[or]I-I'll have my vengeance[or]You'll pay for t-this indignity[at random][end if]...!' Whine though [ghe] may, [ghe] glaring, oozing arousal tells another story altogether, whether the [gdragon] likes it or not. Further shaming and teasing [ghim] for it, your discourse quickly becomes strained by the fervour of your rising need[if scalevalue of player > 3], each successive thrust like a tremor across the whole of your captive's body as you pant[otherwise], panting[end if] audibly";
		if dorrp_tv3 is 0:
			say ". Shall you pull out just before climax?";
			if player consents:
				say "     Right at the very height of ecstasy, you free your throbbing dick from the [gdragon]'s rump, grinding against [ghis] inviting curvature to push you past the last inch. Loudly groaning, you paint the [gdragon]'s ass[if cock width of player > 12] and back[end if] with your [cum load size of player], virile fluids,[if cock width of player > 24] positively drenching the reptile with your seed and[end if] leaving [ghim] an embarrassed mess.";
			otherwise:
				say "     With one final effort, you hilt your throbbing dick into the [gdragon]'s abyssal depths,[if cockname of player is listed in infections of knotlist] tying with [ghim] and[end if] firing surge after subsequent surge of your [cum load size of player], virile fluids[if cock width of player > 24] visibly bloating the reptile with your seed[end if][if cocks of player > 2]its brothers staining the creature's crotch[otherwise if cocks of player is 2]its brother staining the creature's crotch[end if]";
				if dorrp_tv1 is 0:
					say ". The force is strong enough to set the beast off, [ghis] own load spurting impotently against the ground[if cock length of player > 17], strained by such a substantive intrusion[end if]";
				say ". It takes you a moment, but eventually you wrench yourself free of [ghis] now-leaking hole";
		otherwise:
			say ".";
			say "     With one final effort, you hilt your lewd, latex tool into the [gdragon]'s abyssal depths,[if cunts of player > 1]throbbing pussies oozing down to stain the creature's crotch[otherwise]throbbing pussy oozing down to stain the creature's crotch[end if]";
			if dorrp_tv1 is 0:
				say ". The force is strong enough to set the beast off, [ghis] load spurting impotently against the ground[if scalevalue of player > 3], strained by such a substantive intrusion[end if]";
			say ". It takes you a moment, but eventually you wrench yourself free of [ghis] now-gaping hole";
		if dorrp_tv1 is 0:
			say ". [gche] appears marginally compliant in [ghis] presently violated state, shall you reinforce your dominion by forcing [ghim] to clean you off?";
			if player consents:
				say "     [if dorrp_tv2 is 1]Removing the bindings from [ghis] maw, y[otherwise]Y[end if]ou pull [ghis] head forward to grind it against your [if dorrp_tv3 is 0]spent cock[smn][otherwise]worn tool[end if]. [gche] is, of course, reluctant to attend such a demand, but after a bit of prodding (And additional threats of punishment), [ghe] eventually obliges. Large tongue enveloping your crotch, you bathe in [ghis] heated breath as [ghe]'s forced to deal with the mess you've made of yourself, cringing at the unfamiliar taste of your sexual fluids. Eventually, [ghe] leaves you positively spotless[if dorrp_tv2 is 1], which you reward by tieing [ghim] back up[end if]";
		say ".";
		say "     '[if dorrp_tv2 is 1][one of]Hfn, mnn[or]bfln, hff[or]Mnfn, nng[at random][otherwise if dorrp_tv1 is 0][one of]P-please don't hurt me further[or]I-I promise I won't cause anymore trouble[or]I'll be good, just let me go[at random][otherwise][one of]T-this changes nothing[or]I w-won't buckle so easily[or]I w-won't stand for your twisted abuse[at random][end if]...' [if dorrp_tv1 is 1]Barely threatening p[otherwise if dorrp_tv2 is 1]Barely audible p[otherwise]P[end if]rotests offered against you, there's no doubt that [ghe] won't be causing anybody any trouble. [gche]'s certainly learned [ghis] lesson, but [ghe]'s quite the intriguing prospect. Shall you claim [ghim] as yours? Else you'll leave the [gdragon] be.";
		if player consents:
			say "     Grinning, you grab the [gdragon] and [if scalevalue of player > 3]haul [ghim] off[otherwise]pull [ghim] along[end if], [if dorrp_tv1 is 0]to which [ghe] meekly obliges[otherwise]much to what paltry protests [ghe] might muster up against you[end if]. When you return to your place of rest, you go through the matter of properly training the [gdragon] as your new little slave, [if dorrp_tv1 is 0]a feat which is not all that difficult[otherwise]stubborn though [ghe] might be[end if]. Eventually, [ghe] proves to be [if dorrp_tv1 is 0]an eager, slutty[otherwise]a sufficient[end if] little 'mount' for you, and [ghe] [if dorrp_tv1 is 0]enjoys[otherwise]learns to enjoy[end if] being paraded around as a trophy of past conquests...";
		otherwise:
			say "     Deciding to let the [gdragon] off this time, you give [ghis] rear nice firm smack before departing[if dorrp_tv2 is 1], surely it will be a while before [ghe] can free [ghim]self[end if]. As time passes, things settle down and you don't hear about the beast causing any more trouble[if dorrp_tv1 is 0], though you -do- occasionally hear the weird story here or there.[run paragraph on] Apparently, your bit of fun as had quite an effect on [ghim], as you hear all sorts of tales about the [gdragon] subjecting itself to all manner of lewd circumstance[end if]. All in all, a mission accomplished for you, and you look forward to the next time one of [ghis] lot causes trouble in your neighbourhood...";
		if waiterhater is 0:
			wait for any key;
			say "[line break]";
		say "     '...[run paragraph on][one of]Heh[or]Ha[or]Hm[at random], [one of]I hope [dorgr] enjoyed having their way with their [gdragon][or]methinks [dorgr]'s [gdragon] had more fun than they should've, that time[or]Always a thrill to play with [dorgr][at random]!' Grinning happily to you, [ghe] goes about to clean up before letting you off, clearly satisfied with the session.";
	otherwise:
		if cunts of player is 0 or cunt length of player < 5 or dorrp_tv3 is 1:
			now dorrp_tv3 is 2;
		say "     It very quickly becomes apparent that you bit off more than you could chew this time, and the [gdragon] eventually overpowers you, forcing you to the ground, where you're too exhausted to fight any further. As you slowly try to get to your feet, the [gdragon] [if dorrp_tv1 is 1]can't help but laugh at your pitiful state, nudging you about to tease and torment[otherwise]firmly lashes you back to the ground with [ghis] tail, lowly growling at[end if] [ghis] failed assailant.";
		say "     '";
		if dorrp_tv1 is 1:
			say "[one of]Oh[or]Hm[or]Ah[at random], what's this? [one of]I think my new toy needs to be taught a lesson in manners[or]I was expecting more a fight than that, I barely broke a sweat[or]What an utter waste of my time[at random]...";
		otherwise:
			say "[one of]You trespass on my territory[or]You attack me[or]You waste my time[at random]... [one of]You are now my property, and[or]I should end you, but[or]You're barely worth my time, but[at random]";
		say " I think I can make a better use for you.' A grim grin emerging from [ghis] draconic visage, [ghe] pins your[if scalevalue of player < 4] smaller,[end if] [bodytype of player] form to the ground, exposing your behind before [ghis] prying eyes";
		if dorrp_tv1 is 1:
			say ". Talon briefly testing [if dorrp_tv3 is not 2 and cunts of player > 1]one of your [cunt size desc of player] cunts[otherwise if dorrp_tv3 is not 2]your [cunt size desc of player] cunt[otherwise]supple anal ring[end if], [ghe] chuckles to [ghim]self as [ghe] enjoys watching you squirm and protest against [ghis] imminent abuse. Soon enough, however, [ghe] forces it into its depths more deliberately, the [gdragon] preparing";
		otherwise:
			say ". Immediately, you feel one of [ghis] talons force its way into [if dorrp_tv3 is not 2 and cunts of player > 1]one of your [cunt size desc of player] cunts[otherwise if dorrp_tv3 is not 2]your [cunt size desc of player] cunt[otherwise]supple anal ring[end if], causing you to cry out. [gche] only growls in response, showing no restraint in subjecting you to this harsh treatment as the [gdragon] prepares";
		say " [ghis] new victim.";
		say "     '[if dorrp_tv1 is 1][one of]Ha[or]Hm[or]Heh[at random], [one of]it's as I've figured[or]I should've guessed[or]it seems obvious now[at random], [one of]you're just one little slut[or]you're much better suited as a mere toy[or]you just saw to make yourself my property[at random][otherwise][one of]Hmpf[or]Tsk[at random], [one of]I suppose you'll suffice[or]this is the price for your trespass[or]you'll learn your place[at random][end if]!' Satisfied in [ghis] [if dorrp_tv1 is 1]brief[otherwise]harsh[end if] foreplay, [ghe] frees your [if dorrp_tv3 is not 2]pussy[otherwise]tailpipe[end if] of [ghis] scaled digit's influence, its slick departure echoing through the open air. You're given little time to recover before the beast [if scalevalue of player < 4]looms over[otherwise]climbs on top of[end if] you, [if dorrp_tv1 is 1]irreverent[otherwise]shameless[end if] prodding from [ghis] oozing dick. Much to you're embarrassment, you can't help but be aroused by [ghis][if dorrp_tv1 is 0] harsh[end if] abuse, [if cocks of player > 0]unattended cock[smn] grinding against the ground[otherwise if dorrp_tv3 is not 2]portal aching to be stuffed[otherwise]unattended cunt[sfn] left exposed in the open air[end if], which [if dorrp_tv1 is 1]compels [ghim] to grin in amusement[otherwise]only compels [ghim] to snort in mind disdain[end if].";
		say "     The [gdragon] shows [if dorrp_tv1 is 1]little[otherwise]no[end if] restrain in shoving [ghis] impressive tool into your hole, ";
		if dorrp_tv3 is not 2:
			if cunt length of player < 13:
				say "it's overwhelming size forcing you to moan in a twisted mix of pleasure and pain";
			otherwise:
				say "forcing a moan to escape your lips in twisted pleasure";
		otherwise:
			if scalevalue of player < 4:
				say "it's overwhelming size forcing you to moan in a twisted mix of pleasure and pain";
			otherwise:
				say "forcing a moan to escape your lips in twisted pleasure";
		say " as it's shoved in deeper, inch by inch, until naught remains unexposed save for [ghis] intimidating knot. Your [bodydesc of player] body rocks with every thrust as [ghe] quickly builds up a pace of rocking against your beleaguered form, [if dorrp_tv1 is 1]taunting and chastising[otherwise]nipping[end if] [ghis] new mount.";
		say "     Heated breath washing over you, the [gdragon] begins to audibly pant in the wake of [ghis] persisting, carnal fervour, sweat-slicked motion reaching a fever pitch. Hole stretched and worn from its persisting abuse, you're suddenly assaulted by the intense sensation of the infernal beast burying it's knot into your [if dorrp_tv3 is not 2]depths[otherwise]bowels[end if], an act which strains you ";
		if dorrp_tv3 is not 2:
			if cunt length of player < 13:
				say "to your absolute limits";
			otherwise:
				say "considerably in spite your ability";
		otherwise:
			if scalevalue of player < 4:
				say "to your absolute limits";
			otherwise:
				say "considerably in spite of your scale";
		say ", [ghis] inevitable success punctuated by an ear-splitting roar of bestial ecstasy.";
		say "     [if cocks of player > 1]Unattended dicks spending their [cum load size of player] load impotently against the ground[otherwise if cocks of player > 0]Unattended dick spending it [cum load size of player] load impotently against the ground[otherwise if dorrp_tv3 is not 2]Stuffed portal squeezing against its invader[otherwise]Unattended cunt[sfn] oozing impotently to stain the ground[end if] in your own climax, it's greatly eclipsed by the [gdragon]'s, [if dorrp_tv3 is not 2]womb[otherwise]fleshy abyss[end if] flooded with wave after successive wave of the beast's seed, until what you can't contain spurts free of your tied hole. Taking a moment to catch [ghis] breath, the beast pulls [ghis] softening dick[if dorrp_tv1 is 0] harshly[end if] from you, a stream of [ghis] sexual fluids following in its wake. Satisfied though [ghe] may be, [ghe] regards you with a [if dorrp_tv1 is 1]devious grin[otherwise]low growl[end if].";
		if waiterhater is 0:
			wait for any key;
			say "[line break]";
		if dorrp_tv2 is 0:
			say "     '[if dorrp_tv1 is 1][one of]I think there's no better punishment to keep you as my toy[or]Oh, I'm certain you'll love being a toy for my amusement[or]You should have just offered yourself, being a little slut suits you better[at random][otherwise][one of]I suppose you will suffice as my toy[or]For your impudence, you will remain my property[or][at random].' From there on you're forced to spend the rest of your life as a mere hole for the [gdragon] to fill every night, eventually growing wont to the [gdragon]'s endless exploitation. Others come to try and challenge the beast, though they too succumb to a similar fate as you, at least they offer you some company...";
		otherwise:
			say "     '[if dorrp_tv1 is 1][one of]Oh, all this work has left me very hungry[or]I think I can make some better use of my guest[or]I'm certain my new friend would like to stay for dinner[at random][otherwise][one of]Now to end this ordeal[or]Time to finish this[or]This will only end one way[at random][end if]...' Licking [ghis] lips, [ghe] lunges forward, jaws[if dorrp_tv1 is 0] firmly[end if] pulling your smaller form into the air, relinquishing you only to let gravity drop you into [ghis] slick, eager maw. Foot by foot, your body is engulfed within the [gdragon]'s supple confines, those same confines squeezing around you as [ghis] muscles plunge you deeper into [ghis] dark depths, [if dorrp_tv1 is 1]taking [ghis] time, clearly to torment you over[otherwise]showing little restraint or care in subjecting you to[end if] your ultimate fate. You're eventually given the paltry reprieve of [ghis] more abiding stomach, loudly groaning with its new and struggling occupant.";
			if dorrp_tv2 is 1:
				say "     [if dorrp_tv1 is 1][gchis] muffled laughter the last thing you hear before[otherwise]Regarding [ghis] meal with only a partially content snort,[end if] you eventually succumb to exhaustion, blacking out entirely as your quest ends with you as a mere meal for the beast you set out to defeat, and after being so thoroughly ravaged. No doubt others will try and fail as you have, concluding in a similar, dark fate...";
			otherwise:
				say "     '[if dorrp_tv1 is 1][one of]I think I'll save you for later[or]Rest well, you'll be needing it[or]I think this is a fitting prison for my new consort[at random][otherwise][one of]Consider yourself lucky, that I let you live, for now[or]I will abide no further protests from my new consort[or]It will be better for you if accept your new home[at random][end if].' [if dorrp_tv1 is 1]Laughing with perverse pleasure[otherwise]Lowly growling in perverse satisfaction[end if], muffled from within these dark and damp, churning confines, [ghe] goes off to rest from the whole ordeal, [ghis] captive in tow. In the time that follows, you are occasionally relinquished from your confines, only to be ravaged by the [gdragon] time and time again, stowed toy for the twisted beast. Others come to try and challenge [ghim], failing as you do, and though they are abused all the same, you remain separated from the [gdragon]'s other victims, given 'special' treatment, and over time you eventually succumb to total obedience to [ghis] will...";
		if waiterhater is 0:
			wait for any key;
			say "[line break]";
		say "     '...[run paragraph on][one of]Wake up[or]Rise and shine[or]Up, up[at random], [dorgr]! [one of]I hope they found our little adventure satisfactory[or]I hope I didn't wear them out too much[or]I'm certain they enjoyed themselves[at random]!' Taking a moment to look you over after the session had concluded, Doran eventually lets you off once [ghe]'s certain that you appear fine, allowing you to go about your business once more.";
		

Chapter 5 - Miscellaneous

[blued is an action applying to nothing.  [Developer Cheat]
understand "blue dawn" as blued.
carry out blued: 
	say "It is done.";
	now Rocky Outcropping is known;]
	
to say doranmusing: [Requires first talking to Doran]
	say "     You decide to summon Velos before a slightly confused Doran. It takes a moment for the serpent to oblige this request, and when [ghe] pulls out and sees the [gdragon], [ghe] immediately cries out in abject terror. Doran [ghim]self looks equally terrified at the sight of the serpent.";
	say "     'Oh--m-my eyes...! What have you subjected me t-to!' Just as quickly as [ghe] came, [ghe] retreated back once more inside you. Doran calms down, and [ghis] demeanour changes to something a bit more concerned and assertive.";
	say "     '[dorgr], I beg of them, if they have other friends, don't bring them to me.' Instinctively, you ask why, to which [ghe] reels back slightly, 'I beg once more, [dorgr], what we share must between us only.' [gche] won't budge any further on the subject, and you're ultimately forced to leave it at that.";
	add 24 to velospostmusings;

when play ends:
	if dorfirsttalk is true and humanity of player > 10:
		say "     Oddly enough, after you were rescued, the [gdragon] named Doran was nowhere to be found; none of the soldiers who were a part of the rescue operation saw such a creature or heard of anyone with that particular name. To this day, you wonder if [ghe] was ever even real to begin with...";

Doran ends here.
