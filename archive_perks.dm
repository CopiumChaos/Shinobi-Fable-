

/archive
	name = "Perk Archive"
	parent_type = /mob

mob/proc/debug_database()
	var/category = input("What sort of perks would you like to purchase?", "Pick a category!") in list("Core", "Profession", "Clan", "Will", "Misc", "Cancel")
	if(category == "Cancel")
		return
	else
		var/list/L = new/list()
		for(var/obj/Perk/p in archive)
			if(p.sorting == category)
				L.Add(p)
		var/obj/Perk/choice = input("Which perk would you like to purchase?","Pick a perk!") in L
		var/p = ""
		for(var/req in choice.prereq)
			p += "[req]"
			if(req != choice.prereq[choice.prereq.len])
				p += ", "
		if(p == "") p = "None"
		switch(alert("[choice.description] \nA Tier [choice.tier] perk. \n\nPerk Cost: [get_perk_cost(choice)] RPP\nPrerequisites: [p]", "[choice.name]", "Purchase", "Cancel"))
			if("Purchase")
				if(locate(choice) in usr.contents)
					usr << "You already own this perk."
					return
				for(var/perk in choice.prereq)
					var/pathing = text2path("/obj/Perk/[getCodeName(resolveTierName(perk))]")
					var/obj/Perk/x = new pathing
					if(!locate(x) in usr.contents)
						usr << "You don't have the prerequisites for this perk!"
						return
					else
						var/obj/Perk/copyPerk = locate(x) in usr.contents
						if(copyPerk.tier < findTier(perk))
							usr << "You don't have the prerequisites for this perk!"
							return
				if(usr.RPP - get_perk_cost(choice) < 0)
					usr << "You don't have enough RPP for this perk!"
					return
				var/choiceCopy = choice
				usr.contents += choiceCopy
				usr.RPP -= get_perk_cost(choice)
				generate_perk_database()
				usr << "You just bought [choice.name]!"
				return
			if("Cancel")
				return

proc/resolveTierName(var/msg as text)
	switch(msg)
		if("Ninjutsu Defense", "Novice Ninjutsu Defense", "Veteran Ninjutsu Defense", "Master Ninjutsu Defense")
			return "NinjutsuDefense"
		if("Enhanced Strength", "Super Strength", "Monstrous Strength", "Master Strength")
			return "Strength"
		if("Heightened Reflex", "Lightning Reflex", "Lock-on Jammer", "Master Reflex")
			return "Reflex"
		if("Chakra Enhanced Strength 2", "Chakra Enhanced Strength 3", "Chakra Enhanced Strength 4")
			return "Chakra Enhanced Strength"
		if("Novice Karateka", "Yudansha Karateka", "Kodansha Karateka")
			return "Karate"
		if("Novice Smith", "Seasoned Smith", "Master Smith")
			return "Black Smith"
		if("Judo Practitioner", "Yudansha Judoka", "Master Judo")
			return "Judo"
		if("Novice Baguazhang", "Baguazhang Expert", "Like the River")
			return "Baguazhang"
		if("Attack Speed 2", "Attack Speed 3", "Attack Speed 4", "Master Attack Speed")
			return "Attack Speed"
		if("Chakra Control Novice", "Chakra Control Adept", "Chakra Control Veteran", "Chakra Control Master")
			return "Chakra Control"
		if("Hand Seal Speed 2", "Hand Seal Speed 3", "Hand Seal Speed 4", "Lightning Seals", "Master Seals")
			return "Hand Seal Speed"
		if("Novice Manipulator", "Expert Manipulator", "Master Manipulator")
			return "Fledgeling Manipulator"
		if("Blade Dancer", "Death Lotus","Blades Master")
			return "Rogue"
		if("Enhanced Speed", "Super Speed", "Mach Speed", "Master Speed")
			return "Speed"
		if("Enhanced Body", "Super Body", "Monstrous Body", "Master Body")
			return "Body"
		if("Enhanced Stamina", "Massive Stamina", "Monstrous Stamina", "Master Stamina")
			return "Stamina"
		if("Adrenaline Focus 2", "Adrenaline Focus 3")
			return "Adrenaline Focus"
		if("Enhanced Sight", "Eagle Vision")
			return "Sight"
		if("Primal Sensing", "Sixth Sense")
			return "Innate Sensing"
		if("Mind 2", "Mind 3", "Mind 4")
			return "Mind"
		if("Studious 2", "Studious 3", "Studious 4")
			return "Studious 1"
		if("Massive Chakra", "Monstrous Chakra", "Tailed - Beast Chakra")
			return "Chakra"
		if("Fluent Boxer", "Trained Boxer", "Experienced Boxer", "Boxer Master")
			return "Boxer"
		if("Fluent Kickboxer", "Trained Kickboxer", "Experienced Kickboxer", "Kickboxer Master")
			return "KickBoxer"
		if("Extraordinary Hearing")
			return "Hearing"
		if("Enhanced Smell", "Bloodhound's Nose")
			return "Smell"
		if("BFSW Adept", "BFSW Veteran", "BFSW Master")
			return "BFSW"
		if("Alpha Wolf", "Prancing Tiger", "Claws Master")
			return "Claws Beginner"
		if("Speedster", "Speed Demon")
			return "Speed Freak"
		if("Midair Combat 2", "Midair Combat Master")
			return "Midair Combat"
		if("Pharmaceutical Practitioner", "Pharmaceutical Specialist", "Pharmaceutical Expert", "Pharmaceutical Prodigy")
			return "Pharmacist"
		if("Poison Amateur", "Poison Specialist", "Poison Expert", "Poison Guru")
			return "Poison Proficiency"
		if("Machete/Scimitar Proficiency 1", "Machete/Scimitar Proficiency 2", "Machete/Scimitar Proficiency 3", "Machete/Scimitar Proficiency 4")
			return "Machete Proficiency"
		if("Bowman", "Bowman 2", "Bowman 3", "Bowman 4", "Bow Mastery")
			return "Bow Proficiency"
		if("Basic Weight Training", "Intermediate Weight Training", "Advanced Weight Training", "Herculean Weight Training")
			return "Weight Training"
		if("Expert Marksman", "Veteran Marksman", "Master Marksman")
			return "Marksman"
		if("Rookie Flicker Fighter", "Novice Flicker Fighter", "Veteran Flicker Fighter", "Master Flicker Fighter")
			return "Flicker_Fighter"
		if("Amateur Reaper", "Professional Reaper", "Dancing Reaper", "Grim Reaper")
			return "Reaper"
		if("Axe Swinger", "Axe Lover", "Reaver", "Executioner")
			return "Axe"
		if("Shield Bearer", "Knight of the Shield", "The Wall", "The Immovable Object")
			return "Shield Prof"
		if("Ninja Wire Specialist", "Ninja Wire Afficionado", "Ninja Wire Veteran", "Angel of Death")
			return "Wire Prof"
		if("Amateur Lasher", "Skilled Lasher", "Whiplash", "Bringer of Pain")
			return "Lasher Prof"
		if("Crossbow Dabbler", "Crossbow Machinis", "Arbalestier")
			return "Crossbow Prof"
		if("Hammer Bearer", "Hammer Time", "Hammer Lord", "Unstoppable Force")
			return "Hammer Prof"
		if("Bludgeoning Fan", "Blunt Trauma", "Blunt Force", "Brutal Bludgeoner")
			return "Bludge Prof"
		if("Spearman", "Lancer", "Spear Twirler", "Lance Master")
			return "Spear Prof"
		if("Sai Specialist", "Sai Lover", "Disarmament Genius", "All in the Wrist")
			return "Sai Prof"
		if("Katana Proficiency 2", "Katana Proficiency 3", "Katana Proficiency 4")
			return "Katana Proficiency"
		if("Puppeteer Tier 2", "Puppeteer Tier 3", "Master Puppeteer")
			return "Puppeteer Tier 1"
		if("Five Element Sealing")
			return "Containment Sealing"
		if("Lotus Sealing", "ROOT Sealing", "Masterful Sealing")
			return "Basic Sealing"
		if("Elemental Training Fire 2", "Elemental Training Fire 3", "Elemental Training Fire 4", "Elemental Mastery Fire")
			return "Elemental Training Fire"
		if("Elemental Training Water 2", "Elemental Training Water 3", "Elemental Training Water 4", "Elemental Mastery Water")
			return "Elemental Training Water"
		if("Elemental Training Earth 2", "Elemental Training Earth 3", "Elemental Training Earth 4", "Elemental Mastery Earth")
			return "Elemental Training Earth"
		if("Elemental Training Wind 2", "Elemental Training Wind 3", "Elemental Training Wind 4", "Elemental Mastery Wind")
			return "Elemental Training Wind"
		if("Elemental Training Lightning 2", "Elemental Training Lightning 3", "Elemental Training Lightning 4", "Elemental Mastery Lightning")
			return "Elemental Training Lightning"
		if("Elemental Training Ice 2", "Elemental Training Ice 3", "Elemental Training Ice 4", "Elemental Mastery Ice")
			return "Elemental Training Ice"
		if("Elemental Training Boil 2", "Elemental Training Boil 3", "Elemental Training Boil 4", "Elemental Mastery Boil")
			return "Elemental Training Boil"
		if("Elemental Training Storm 2", "Elemental Training Storm 3", "Elemental Training Storm 4", "Elemental Mastery Storm")
			return "Elemental Training Storm"
		if("Elemental Training Wood 2", "Elemental Training Wood 3", "Elemental Training Wood 4", "Elemental Mastery Wood")
			return "Elemental Training Wood"
		if("Elemental Training Lava 2", "Elemental Training Lava 3", "Elemental Training Lava 4", "Elemental Mastery Lava")
			return "Elemental Training Lava"
		if("Elemental Training Crystal 2", "Elemental Training Crystal 3", "Elemental Training Crystal 4", "Elemental Mastery Crystal")
			return "Elemental Training Crystal"
		if("Elemental Training Magnetism 2", "Elemental Training Magnetism 3", "Elemental Training Magnetism 4", "Elemental Mastery Magnetism")
			return "Elemental Training Magnetism"
		if("Elemental Training Dust 2", "Elemental Training Dust 3", "Elemental Training Dust 4", "Elemental Mastery Dust")
			return "Elemental Training Dust"
		if("Elemental Training Blaze 2", "Elemental Training Blaze 3", "Elemental Training Blaze 4", "Elemental Mastery Blaze")
			return "Elemental Training Blaze"
		if("Elemental Training Dark 2", "Elemental Training Dark 3", "Elemental Training Dark 4", "Elemental Mastery Dark")
			return "Elemental Training Dark"
		if("Elemental Training Steel 2", "Elemental Training Steel 3", "Elemental Training Steel 4", "Elemental Mastery Steel")
			return "Elemental Training Steel"
		if("Elemental Training Explosion 2", "Elemental Training Explosion 3", "Elemental Training Explosion 4", "Elemental Mastery Explosion")
			return "Elemental Training Explosion"
		if("Elemental Training Swift 2", "Elemental Training Swift 3", "Elemental Training Swift 4", "Elemental Mastery Swift")
			return "Elemental Training Swift"
		if("Elemental Training Scorch 2", "Elemental Training Scorch 3", "Elemental Training Scorch 4", "Elemental Mastery Scorch")
			return "Elemental Training Scorch"
		else
			return msg

proc/findTier(var/msg as text)
	switch(msg)
		if("Elemental Training Fire 2", "Elemental Training Water 2", "Elemental Training Earth 2", "Elemental Training Wind 2", "Elemental Training Lightning 2", "Elemental Training Ice 2", "Elemental Training Boil 2", "Elemental Training Storm 2", "Elemental Training Wood 2", "Elemental Training Lava 2", "Elemental Training Crystal 2", "Elemental Training Mmagnetism 2", "Elemental Training Dust 2", "Elemental Training Blaze 2", "Elemental Training Dark 2", "Elemental Training Steel 2", "Elemental Training Explosion 2", "Elemental Training Swift 2", "Elemental Training Scorch 2", "Novice Ninjutsu Defense", "Enhanced Strength", "Heightened Reflex", "Chakra Enhanced Strength 2", "Novice Karateka", "Novice Smith", "Judo Practitioner", "Novice Baguagzhang", "Attack Speed 2", "Chakra Control Novice", "Hand Seal Speed 2", "Novice Manipulator", "Blade Dancer", "Enhanced Speed", "Enhanced Body", "Enhanced Stamina", "Adrenaline Focus 2", "Enhanced Sight", "Primal Sensing", "Mind 2", "Studious 2", "Massive Chakra", "Trained Boxer", "Trained Kickboxer", "Extraordinary Hearing", "Enhanced Smell", "BFSW Adept", "Alpha Wolf", "Speedster", "Midair Combat 2", "Pharmaceutical Specialist", "Poison Specialist", "Machete Proficiency 2", "Bowman 2", "Intermediate Weight Training", "Expert Marksman", "Novice Flicker Fighter", "Professional Reaper", "Axe Lover", "Knight of the Shield", "Ninja Wire Afficionado", "Skilled Lasher", "Crossbow Dabbler", "Hammer Time", "Blunt Trauma", "Lancer", "Sai Lover", "Katana Proficiency 2", "Puppeteer Tier 2", "Lotus Sealing")
			return 2
		if("Elemental Training Fire 3", "Elemental Training Water 3", "Elemental Training Earth 3", "Elemental Training Wind 3", "Elemental Training Lightning 3", "Elemental Training Ice 3", "Elemental Training Boil 3", "Elemental Training Storm 3", "Elemental Training Wood 3", "Elemental Training Lava 3", "Elemental Training Crystal 3", "Elemental Training Mmagnetism 3", "Elemental Training Dust 3", "Elemental Training Blaze 3", "Elemental Training Dark 3", "Elemental Training Steel 3", "Elemental Training Explosion 3", "Elemental Training Swift 3", "Elemental Training Scorch 3", "Containment Sealing", "Veteran Ninjutsu Defense", "Super Strength", "Lightning Reflex", "Chakra Enhanced Strength 3", "Yudansha Karateka", "Seasoned Smith", "Yudansha Judoka", "Baguagzhang Expert", "Attack Speed 3", "Chakra Control Adept", "Hand Seal Speed 3", "Expert Manipulator", "Death Lotus", "Super Speed", "Super Body", "Massive Stamina", "Adrenaline Focus 3", "Eagle Vision", "Sixth Sense", "Mind 3", "Studious 3", "Monstrous Chakra", "Experienced Boxer", "Experienced Kickboxer",  "Bloodhound's Nose", "BFSW Veteran", "Prancing Tiger", "Speed Demon", "Midair Combat Master", "Pharmecutical Expert", "Poison Expert", "Machete Proficiency 3", "Bowman 3", "Avanced Weight Training", "Veteran Marksman", "Veteran Flicker Fighter", "Dancing Reaper", "Reaver", "The Wall", "Ninja Wire Veteran", "Whiplash", "Crossbow Machinis", "Hammer Lord", "Blunt Force", "Spear Twirler", "Disarmament Genius", "Katana Proficiency 3", "Puppeteer Tier 3", "Containment Sealing", "ROOT Sealing")
			return 3
		if("Elemental Training Fire 4", "Elemental Training Water 4", "Elemental Training Earth 4", "Elemental Training Wind 4", "Elemental Training Lightning 4", "Elemental Training Ice 4", "Elemental Training Boil 4", "Elemental Training Storm 4", "Elemental Training Wood 4", "Elemental Training Lava 4", "Elemental Training Crystal 4", "Elemental Training Mmagnetism 4", "Elemental Training Dust 4", "Elemental Training Blaze 4", "Elemental Training Dark 4", "Elemental Training Steel 4", "Elemental Training Explosion 4", "Elemental Training Swift 4", "Elemental Training Scorch 4", "Five Element Sealing", "Master Ninjutsu Defense", "Monstrous Strength", "Lock-on Jammer", "Chakra Enhanced Strength 4", "Kodansha Karateka", "Master Smith", "Master Judo", "Like the River", "Attack Speed 4", "Chakra Control Veteran", "Hand Seal Speed 4", "Master Manipulator", "Mach Speed", "Monstrous Body", "Monstrous Stamina", "Mind 4", "Studious 4", "Tailed - Beast Chakra", "Boxer Master", "Kickboxer Master", "BFSW Master", "Claws Master", "Pharmeceutical Prodigy", "Poison Guru", "Machete Proficiency 4", "Bowman 4", "Herculean Weight Training", "Master Marksman", "Master Flicker Fighter", "Grim Reaper", "Executioner", "The Immovable Object", "Angel of Death", "Bringer of Pain", "Arbalestier", "Unstoppable Force", "Brutal Bludgeoner", "Lance Master", "All in the Wrist", "Katana Proficiency 4", "Master Puppeteer", "Five Element Sealing", "Masterful Sealing")
			return 4
		if("Elemental Mastery Fire", "Elemental Mastery Water", "Elemental Mastery Earth", "Elemental Mastery Wind", "Elemental Mastery Lightning", "Elemental Mastery Ice", "Elemental Mastery Boil", "Elemental Mastery Storm", "Elemental Mastery Wood", "Elemental Mastery Lava", "Elemental Mastery Crystal", "Elemental Mastery Mmagnetism", "Elemental Mastery Dust", "Elemental Mastery Blaze", "Elemental Mastery Dark", "Elemental Mastery Steel", "Elemental Mastery Explosion", "Elemental Mastery Swift", "Elemental Mastery Scorch", "Master Strength", "Master Reflex", "Master Attack Speed", "Lightning Seals", "Master Speed", "Master Body", "Master Stamina", "Bow Mastery" )
			return 5
		if("Master Seals")
			return 6
		else
			return 1


proc/getCodeName(var/x as text)
	var/idx = 1, elen, rep, rlen
	var/char = " "
	if(findtext(x, " "))
		idx = findtext(x, char)
		rep = null
		while(idx)
			if(isnull(rep))
				elen = length(char)
				rep = "_"
				rlen = length(rep)
			x = copytext(x, 1, idx) + rep + copytext(x, idx + elen)
			idx += rlen
			idx = findtext(x, char, idx)
		return x
	else return x


proc/generate_perk_database()
	save_archive()
	load_archive()

proc/save_archive()
	var/savefile/a = new("archive/archive_perks")
	var/list/l_a = new/list()
	for(var/x in typesof(/obj/Perk))
		var/p = x
		l_a += new p
	a["archive_list_storage"] << l_a

proc/load_archive()
	if(fexists("archive/archive_perks"))
		var/savefile/a = new("archive/archive_perks")
		var/list/l_a = new/list()
		a["archive_list_storage"] >> l_a
		archive.contents += l_a
	else
		generate_perk_database()

proc/get_perk_cost(obj/Perk/a)
	var/pTier = a.tier
	switch(pTier)
		if(1) return 1000
		if(2) return 2000
		if(3) return 5000
		if(4) return 10000
		if(5) return 20000
		else return 25000
