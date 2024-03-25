obj/Perk/var
	giChakra = 0
	giStamina = 0
	giNin = 0
	giTai = 0
	giKen = 0
	giGen = 0
	giInt = 0
	giRef = 0
	giSpd = 0
	giCon = 0
	giStr = 0
	giDef = 0
	giHss = 0
	giAtkspd = 0
	giDur = 0
	giConst = 0
	giGenres = 0
	giSenserange = 0


mob/var
	Schakra = 0
	Sstam = 0
	Snin = 0
	Stai = 0
	Sken = 0
	Sgen = 0
	Sint = 0
	Sref = 0
	Sspd = 0
	Scon = 0
	Sstr = 0
	Shss = 0
	Sdef = 0
	Satkspd = 0
	Sdur = 0
	SConst = 0
	Sgenres = 0
	Ssenserange = 0
	BaseStat = 0
	HandsealSpeed = 0
	HasWeaponOn = 0

mob/verb/Stat_Set()
	set category = "Combat"
	var/s=input("Would you like to get your stats set?")in list("Yes","No")
	if(s=="No"||usr.Buffed||usr.weighted||usr.HasWeaponOn)
		usr<<output("You've either declined, currently have an active buff, or are currently wearing weights. You must turn this buff off or remove your weights in order to continue. Goood bye.","World.OOC")
		return
	if(s=="Yes"&&!usr.Buffed)
		usr<<output("<font color=#5D1000>Alright, this process make take a few moments please wait...","World.OOC")
		sleep(10)
		usr<<output("<font color=#00873D>Your Skillgrade is being calculated currently and expressed as numerical values.","World.OOC")
		if(findtext(usr.srank,"E"))
			usr.BaseStat=1
			usr.HandsealSpeed=3
			usr.Schakra=175
			usr.Sstam=175
			usr.SConst = 100
		if(findtext(usr.srank,"D"))
			usr.BaseStat=3
			usr.HandsealSpeed=3
			usr.Schakra=550
			usr.Sstam=550
			usr.SConst = 100
		if(findtext(usr.srank,"C"))
			usr.BaseStat=7
			usr.HandsealSpeed=3
			usr.Schakra=1500
			usr.Sstam=1500
			usr.SConst = 100
		if(findtext(usr.srank,"B"))
			usr.BaseStat=12
			usr.HandsealSpeed=3
			usr.Schakra=3000
			usr.Sstam=3000
			usr.SConst = 100
		if(findtext(usr.srank,"A"))
			usr.HandsealSpeed=3
			usr.BaseStat=18
			usr.Schakra=6000
			usr.Sstam=6000
			usr.SConst = 100
		if(findtext(usr.srank,"S"))
			usr.HandsealSpeed=3
			usr.BaseStat=24
			usr.Schakra=12000
			usr.Sstam=12000
			usr.SConst = 100
		sleep(15)
		usr<<output("<font color=#00873D>We will now take into consideration any + or - to your skillgrade.","World.OOC")
		if(findtext(usr.srank,"+"))
			usr.BaseStat+=0.5
			usr.Schakra += 200
		if(findtext(usr.srank,"-"))
			usr.BaseStat-=0.5
			usr.Schakra -= 200
		sleep(15)
		usr<<"<font color=#00873D>Your perks will now be tallied~."
		var/obj/strength = locate(/obj/Perk/Strength/) in usr.contents
		if(strength)
			usr.Sstr += 1
			usr.Stai += 0.7
			usr.Sdef += 0.5


			for(var/obj/Perk/Strength/S in usr.contents)
				if(S.tier=="Master")
					usr.Sstr += 9
		//			usr.Sdur += 5.0
				if(S.tier==1)
					usr.Sstr += 4.5
		//			usr.Sdur += 1.5
				if(S.tier==2)
					usr.Sstr += 13.5
		//			usr.Sdur += 2.5
				if(S.tier==3)
					usr.Sstr += 20.5
		//			usr.Sdur += 3.5
				if(S.tier==4)
					usr.Sstr += 31.5
		//			usr.Sdur += 4.5




		var/obj/chakracon = locate(/obj/Perk/Chakra_Control/) in usr.contents
		if(chakracon)
			usr.Scon += 1
			for(var/obj/Perk/Chakra_Control/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 5.5
				if(S.tier==1)
					usr.Scon += 5
					usr.Snin += 1
				if(S.tier==2)
					usr.Scon += 13.5
					usr.Snin += 2.5
				if(S.tier==3)
					usr.Scon += 19
					usr.Snin += 5
				if(S.tier==4)
					usr.Scon += 30
					usr.Snin += 6
		var/obj/hsp = locate(/obj/Perk/Hand_Seal_Speed) in usr.contents
		if(hsp)
			usr.Scon += 1.6
			usr.Snin += 1.7

			for(var/obj/Perk/Hand_Seal_Speed/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10.2
					usr.Snin += 10.4
				if(S.tier==1)
					usr.Satkspd += 1
					usr.Scon += 2
					usr.Snin += 2
					usr.Shss += 6
				if(S.tier==2)
					usr.Satkspd += 3
					usr.Scon += 4
					usr.Snin += 4.5
					usr.Shss += 10
				if(S.tier==3)
					usr.Satkspd += 6
					usr.Scon += 6.5
					usr.Snin += 9.5
					usr.Shss += 16
				if(S.tier==4)
					usr.Satkspd += 16
					usr.Scon += 16.5
					usr.Snin += 19.5
					usr.Shss += 26
		var/obj/puppet = locate(/obj/Perk/Puppeteer_Tier_1) in usr.contents
		if(puppet)
			usr.Sint += 0.5
			usr.Scon += 1
			for(var/obj/Perk/Puppeteer_Tier_1/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 20
					usr.Sint += 20
				if(S.tier==1)
					usr.Scon += 1.5
					usr.Sint += 4.5
					usr.Snin +=1.5
				if(S.tier==2)
					usr.Scon += 4.5
					usr.Sint += 8
					usr.Snin += 3.5
					usr.Satkspd += 4.5
				if(S.tier==3)
					usr.Scon += 7.5
					usr.Sint += 8
					usr.Snin += 7.5
					usr.Satkspd += 8.5
				if(S.tier==4)
					usr.Scon += 11.5
					usr.Sint += 13
					usr.Snin += 7.5
					usr.Satkspd += 11.5
		var/obj/reflex = locate(/obj/Perk/Reflex) in usr.contents
		if(reflex)
			usr.Sspd += 0.2
			usr.Sref += 1.5
			for(var/obj/Perk/Reflex/S in usr.contents)
				if(S.tier=="Master")
					usr.Sref += 8.5
					usr.Stai += 4.7
				if(S.tier==1)
					usr.Sref += 6
				if(S.tier==2)
					usr.Sref += 13.5
					usr.Stai += 2.5
				if(S.tier==3)
					usr.Sref += 19.5
					usr.Stai += 4.5
				if(S.tier==4)
					usr.Sref += 31
					usr.Stai += 5
		var/obj/speed = locate(/obj/Perk/Speed) in usr.contents
		if(speed)
			usr.Sspd += 1
			usr.Sdef += 0.4
			usr.Sref += 1.0
			for(var/obj/Perk/Speed/S in usr.contents)
				if(S.tier=="Master")
					usr.Sspd+=9
					usr.Stai += 4.7
				if(S.tier==1)
					usr.Sspd += 6
				if(S.tier==2)
					usr.Sspd += 13.5
					usr.Satkspd+= 2.5
				if(S.tier==3)
					usr.Sspd += 20
					usr.Satkspd+= 4
				if(S.tier==4)
					usr.Sspd += 30
					usr.Satkspd+= 6


		var/obj/Body = locate(/obj/Perk/Body) in usr.contents
		if(Body)
			usr.Sdef += 2.0
			usr.Sstam += 150
			usr.Sdur += 2.0
			for(var/obj/Perk/Body/S in usr.contents)
				if(S.tier=="Master")
					usr.Sdef+=5
					usr.Sstam += 750
					usr.Stai += 5.7
					usr.Sdur+= 9.9
				if(S.tier==1)
					usr.Sdur += 6
				if(S.tier==2)
					usr.Sdur += 16
				if(S.tier==3)
					usr.Sdur += 24
				if(S.tier==4)
					usr.Sdur += 36

		var/obj/Midair_Combat = locate(/obj/Perk/Midair_Combat) in usr.contents
		if(Midair_Combat)
			usr.Sref += 2.5
			usr.Sspd += 1.5
			for(var/obj/Perk/Midair_Combat/S in usr.contents)
				if(S.tier=="Master")
					usr.Sref += 25
					usr.Sspd += 25
				if(S.tier==1)
					usr.Sref += 3.5
					usr.Sspd += 2.5
				if(S.tier==2)
					usr.Sref += 9.5
					usr.Sspd += 6.5
				if(S.tier==3)
					usr.Sref += 14.5
					usr.Sspd += 9.5




//Wynn look @ this




		var/obj/nindef = locate(/obj/Perk/NinjutsuDefense) in usr.contents
		if(nindef)
			usr.Sdef += 3
			usr.Sstam += 150
			for(var/obj/Perk/NinjutsuDefense/S in usr.contents)
				if(S.tier==1)
					usr.Sdef += 6
				if(S.tier==2)
					usr.Sdef += 16
				if(S.tier==3)
					usr.Sdef += 22
				if(S.tier==4)
					usr.Sdef += 30




		var/obj/Stamina = locate(/obj/Perk/Stamina) in usr.contents
		if(Stamina)
			usr.Sdef += 0.4
			usr.Sstam += 500
			for(var/obj/Perk/Stamina/S in usr.contents)
				if(S.tier=="Master")
					usr.Sstam += 23000
					usr.Stai += 0.7
					usr.Sdur += 5.0
				if(S.tier==1)
					usr.Sstam += 3000
					usr.Stai += 1.5
					usr.Sdur += 1.5
				if(S.tier==2)
					usr.Sstam += 6000
					usr.Stai += 2.0
					usr.Sdur += 2.0
				if(S.tier==3)
					usr.Sstam += 9500
					usr.Stai += 4.5
					usr.Sdur += 3.5
				if(S.tier==4)
					usr.Sstam += 17000
					usr.Stai += 7.5
					usr.Sdur += 5.0
		var/obj/AD = locate(/obj/Perk/Adrenaline_Focus) in usr.contents
		if(AD)
			usr.Sdef += 0.4
			usr.Sint += 0.25
			for(var/obj/Perk/Adrenaline_Focus/S in usr.contents)
				if(S.tier=="Master")
					usr.Sref += 0.7
					usr.Sint += 0.6
				if(S.tier==1)
					usr.Sref += 1.5
					usr.Satkspd += 2.5
				if(S.tier==2)
					usr.Sref += 4.5
					usr.Satkspd += 7.5
				if(S.tier==3)
					usr.Sref += 8.5
					usr.Satkspd += 12.5
				if(S.tier==4)
					usr.Sref += 14.5
					usr.Satkspd += 21.5

		var/obj/Sense = locate(/obj/Perk/Innate_Sensing) in usr.contents
		if(Sense)
			usr.Sdef += 0.8
			usr.Sref += 1.5
			usr.Sstr += 0.63
			for(var/obj/Perk/Innate_Sensing/S in usr.contents)
				if(S.tier=="Master")
					usr.Ssenserange += 25
					usr.Sref += 2.5
				if(S.tier==1)
					usr.Ssenserange += 5
					usr.Sref += 3.5
				if(S.tier==2)
					usr.Ssenserange += 10
					usr.Sref += 7.5
				if(S.tier==3)
					usr.Ssenserange += 15
					usr.Sref += 14.5
				if(S.tier==4)
					usr.Ssenserange += 20
					usr.Sref += 23.5

		var/obj/Mind = locate(/obj/Perk/Mind) in usr.contents
		if(Mind)
			usr.Sgen += 1
			usr.Sint += 1.5
			usr.Snin += 0.54
			usr.Sgenres += 1.05
			for(var/obj/Perk/Mind/S in usr.contents)
				if(S.tier=="Master")
					usr.Sgen += 5
					usr.Sint += 5.5
					usr.Snin += 4.54
					usr.Sgenres += 4.5
				if(S.tier==1)
					usr.Sgen += 4.5
					usr.Sint += 1.5
					usr.Sgenres += 1.5

				if(S.tier==2)
					usr.Sgen += 11.5
					usr.Sint += 2.5
					usr.Sgenres += 3.5

				if(S.tier==3)
					usr.Sgen += 15.5
					usr.Sint += 4
					usr.Sgenres += 5.5

				if(S.tier==4)
					usr.Sgen += 22.5
					usr.Sint += 5.5
					usr.Sgenres += 6.5

		var/obj/Sight = locate(/obj/Perk/Sight) in usr.contents
		if(Sight)
			usr.Sdef += 0.8
			usr.Sref += 1.0
			for(var/obj/Perk/Sight/S in usr.contents)
				if(S.tier=="Master")
					usr.Sdef += 5.65
					usr.Sref += 1.0
				if(S.tier==1)
					usr.Sref += 2.0
					usr.Satkspd += 4.5
				if(S.tier==2)
					usr.Sref += 5.5
					usr.Satkspd += 10.5
				if(S.tier==3)
					usr.Sref += 9.0
					usr.Satkspd += 15.5
				if(S.tier==4)
					usr.Sref += 16.0
					usr.Satkspd += 20.5

		var/obj/Study = locate(/obj/Perk/Studious_1) in usr.contents
		if(Study)
			usr.Sint += 1.5
			usr.Snin += 0.46
			usr.Sgenres += 0.75
			for(var/obj/Perk/Studious_1/S in usr.contents)
				if(S.tier=="Master")
					usr.Sint += 9.5
					usr.Snin += 5.46
					usr.Sgenres += 9.75
				if(S.tier==1)
					usr.Sint += 4.25
					usr.Sgenres += 2.75
				if(S.tier==2)
					usr.Sint += 6.25
					usr.Sgenres += 10.75
				if(S.tier==3)
					usr.Sint += 8.5
					usr.Sgenres += 15.75
				if(S.tier==4)
					usr.Sint += 13.75
					usr.Sgenres += 23.75

		var/obj/Chakra = locate(/obj/Perk/Chakra) in usr.contents
		if(Chakra)
			usr.Schakra += 500
			for(var/obj/Perk/Chakra/S in usr.contents)
				if(S.tier=="Master")
					usr.Schakra += 20000
				if(S.tier==1)
					usr.Schakra += 3000
					usr.Sdef += 1
				if(S.tier==2)
					usr.Schakra += 6000
					usr.Sdef += 2
				if(S.tier==3)
					usr.Schakra += 9500
					usr.Sdef += 3
				if(S.tier==4)
					usr.Schakra += 17000
					usr.Sdef += 4
		var/obj/Hear = locate(/obj/Perk/Hearing) in usr.contents
		if(Hear)
			usr.Sdef += 0.8
			usr.Sref += 2.5
			for(var/obj/Perk/Hearing/S in usr.contents)
				if(S.tier=="Master")
					usr.Sref += 20
				if(S.tier==1)
					usr.Sref += 3.5
				if(S.tier==2)
					usr.Sref += 10.5
				if(S.tier==3)
					usr.Sref += 19
		var/obj/Manip = locate(/obj/Perk/Fledgeling_Manipulator) in usr.contents
		if(Manip)
			usr.Scon += 1.5
			usr.Snin += 1.5
			for(var/obj/Perk/Fledgeling_Manipulator/S in usr.contents)
				if(S.tier==1)
					usr.Scon += 5.5
				if(S.tier==2)
					usr.Scon += 10.5
				if(S.tier==3)
					usr.Scon += 18.5
				if(S.tier==4)
					usr.Scon += 30.5
				if(S.tier=="Master")
					usr.Scon += 9.5
					usr.Snin += 9.5
		var/obj/CES = locate(/obj/Perk/Chakra_Enhanced_Strength) in usr.contents
		if(CES)
			usr.Scon += 1.5
			usr.Snin += 1.5
			for(var/obj/Perk/Chakra_Enhanced_Strength/S in usr.contents)
				if(S.tier==1)
					usr.Scon += 3
					usr.Sstr += 3
				if(S.tier==2)
					usr.Scon += 8
					usr.Sstr += 8
				if(S.tier==3)
					usr.Scon += 12
					usr.Sstr += 12
				if(S.tier==4)
					usr.Scon += 16
					usr.Sstr += 16
				if(S.tier=="Master")
					usr.Scon += 5.5
					usr.Sstr += 10

		var/obj/Aspd = locate(/obj/Perk/Attack_Speed) in usr.contents
		if(Aspd)
			usr.Sstr += 1.45
			usr.Sdef += 1.5
			usr.Stai += 1.23
			usr.Satkspd += 1.5
			for(var/obj/Perk/Attack_Speed/S in usr.contents)
				if(S.tier=="Master")
					usr.Sstr += 4.45
					usr.Sref += 5.0
					usr.Stai += 5.23
					usr.Satkspd += 9.5
				if(S.tier==1)
					usr.Satkspd += 8
				if(S.tier==2)
					usr.Satkspd += 18
				if(S.tier==3)
					usr.Satkspd += 26
				if(S.tier==4)
					usr.Satkspd += 38


		var/obj/KPro = locate(/obj/Perk/Katana_Proficiency) in usr.contents
		if(KPro)
			usr.Sstr += 1.45
			usr.Sdef += 1.32
			usr.Stai += 1.23
			usr.Satkspd += 1.5
			for(var/obj/Perk/Katana_Proficiency/S in usr.contents)
				if(S.tier=="Master")
					usr.Sstr += 9.45
		//			usr.Sdef += 5.32
					usr.Stai += 9.23
					usr.Satkspd += 10.5
				if(S.tier==1)
					usr.Sstr += 1.5
					usr.Sken += 6
					usr.Satkspd += 4.5
				if(S.tier==2)
					usr.Sstr += 5
					usr.Sken+= 10
					usr.Satkspd += 7.5
				if(S.tier==3)
					usr.Sken += 16.45
					usr.Sstr += 9.23
					usr.Satkspd += 13.5
				if(S.tier==4)
					usr.Sken += 27.45
		//			usr.Sdef += 4.32
					usr.Sstr += 10.23
					usr.Satkspd += 20.5

		var/obj/Claws_Beginner = locate(/obj/Perk/Claws_Beginner) in usr.contents
		if(Claws_Beginner)
			for(var/obj/Perk/Claws_Beginner/S in usr.contents)
				if(S.tier==1)
					usr.Satkspd += 5
					usr.Sken += 4
					usr.Sref += 2
				if(S.tier==2)
					usr.Satkspd += 10
					usr.Sref += 5
					usr.Sken += 6.5
				if(S.tier==3)
					usr.Satkspd += 15.5
					usr.Sref += 5.5
					usr.Sken += 11.5
				if(S.tier==4)
					usr.Satkspd += 26.5
					usr.Sref += 9.5
					usr.Sken += 18

		var/obj/Shiel = locate(/obj/Perk/Shield_Prof) in usr.contents
		if(Claws_Beginner)
			for(var/obj/Perk/Shield_Prof/S in usr.contents)
				if(S.tier==1)
					usr.Satkspd += 3.5
					usr.Stai += 3.5
					usr.Sdur += 1.5
				if(S.tier==2)
					usr.Satkspd += 6.5
					usr.Stai += 6.5
					usr.Sdur += 4.5
				if(S.tier==3)
					usr.Satkspd += 11.5
					usr.Sdur += 10.5
					usr.Stai += 13.5
				if(S.tier==4)
					usr.Satkspd += 16.5
					usr.Sdur += 16
					usr.Stai += 21


/*		var/obj/Reap = locate(/obj/Perk/Reaper) in usr.contents
		if(Reap)
			for(var/obj/Perk/Reaper/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 3
					usr.Satkspd += 5
					usr.Sken += 6
				if(S.tier==2)
					usr.Sstr += 7
					usr.Satkspd += 10
					usr.Sken += 14
				if(S.tier==3)
					usr.Sstr += 11
					usr.Satkspd += 15
					usr.Sken += 20
				if(S.tier==4)
					usr.Sstr += 16
					usr.Satkspd += 20.5
					usr.Sken += 26

*/

		var/obj/Axe = locate(/obj/Perk/Axe) in usr.contents
		if(Axe)
			for(var/obj/Perk/Axe/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 3
					usr.Satkspd += 5
				if(S.tier==2)
					usr.Sstr += 9
				//	usr.Sken += 7
					usr.Satkspd += 9.5
				if(S.tier==3)
					usr.Sstr += 14.5
					usr.Sken += 12.5
					usr.Satkspd += 10.5
				if(S.tier==4)
					usr.Sstr += 25.5
					usr.Sken += 17.5
					usr.Satkspd += 19.5

		var/obj/Bow_Proficiency = locate(/obj/Perk/Bow_Proficiency) in usr.contents
		if(Bow_Proficiency)
			for(var/obj/Perk/Bow_Proficiency/S in usr.contents)
				if(S.tier==1)
					usr.Sken += 2
					usr.Satkspd += 5
					usr.Sstr += 3
				if(S.tier==2)
					usr.Sken += 6
					usr.Satkspd += 9.75
					usr.Sstr += 7
				if(S.tier==3)
					usr.Sken += 17.5
					usr.Satkspd += 12.75
					usr.Sstr += 9.25
				if(S.tier==4)
					usr.Sken += 27.5
					usr.Satkspd += 16.5

		var/obj/BFSW = locate(/obj/Perk/BFSW) in usr.contents
		if(BFSW)
			for(var/obj/Perk/BFSW/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 4.5
					usr.Sken += 4
					usr.Satkspd += 3.5
				if(S.tier==2)
					usr.Sstr += 9.5
					usr.Sken += 6.5
					usr.Satkspd += 6.5
				if(S.tier==3)
					usr.Sstr += 14.5
					usr.Sken += 13
					usr.Satkspd += 11.5
				if(S.tier==4)
					usr.Sstr += 27.5
					usr.Sken += 18
					usr.Satkspd += 15.5




		var/obj/Judo = locate(/obj/Perk/Judo) in usr.contents
		if(Judo)
			for(var/obj/Perk/Judo/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 4
					usr.Stai += 7
					usr.Satkspd += 3
				if(S.tier==2)
					usr.Sstr += 8
					usr.Stai += 12
					usr.Satkspd += 5
				if(S.tier==3)
					usr.Sstr += 16
					usr.Stai += 19
					usr.Satkspd += 9
				if(S.tier==4)
					usr.Sstr += 23
					usr.Stai += 28
					usr.Satkspd += 15.5

		var/obj/Pharmacist = locate(/obj/Perk/Pharmacist) in usr.contents
		if(Judo)
			for(var/obj/Perk/Pharmacist/S in usr.contents)
				if(S.tier==1)
					usr.Sint += 7.5
				if(S.tier==2)
					usr.Sint += 17
				if(S.tier==3)
					usr.Sint += 26.5
				if(S.tier==4)
					usr.Sint += 40






		var/obj/Baguazhang = locate(/obj/Perk/Baguazhang) in usr.contents
		if(Baguazhang)
			for(var/obj/Perk/Baguazhang/S in usr.contents)
				if(S.tier==1)
					usr.Sref += 2
					usr.Satkspd += 5
					usr.Stai += 5
				if(S.tier==2)
					usr.Sref += 5
					usr.Satkspd += 10
					usr.Stai += 9
				if(S.tier==3)
					usr.Sref += 12.5
					usr.Satkspd += 16
					usr.Stai += 17
				if(S.tier==4)
					usr.Sref += 16
					usr.Satkspd += 21
					usr.Stai += 25.5

		var/obj/Karate = locate(/obj/Perk/Karate) in usr.contents
		if(Karate)
			for(var/obj/Perk/Karate/S in usr.contents)
				if(S.tier==1)
					usr.Stai += 6
					usr.Sstr += 3
					usr.Satkspd +=4
				if(S.tier==2)
					usr.Stai += 10
					usr.Sstr +=7
					usr.Satkspd +=8
				if(S.tier==3)
					usr.Stai += 19
					usr.Sstr +=12
					usr.Satkspd +=13
				if(S.tier==4)
					usr.Stai += 24.5
					usr.Sstr += 21.5
					usr.Satkspd += 19

		var/obj/ShP = locate(/obj/Perk/Shield_Prof) in usr.contents
		if(ShP)
			for(var/obj/Perk/Shield_Prof/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 2.5
					usr.Stai += 4
					usr.Sdur += 4
				if(S.tier==2)
					usr.Sstr += 7
					usr.Stai += 8
					usr.Sdur += 9
				if(S.tier==3)
					usr.Sstr += 10
					usr.Stai +=13
					usr.Sdur += 15.5
				if(S.tier==4)
					usr.Sstr += 14.5
					usr.Stai += 19
					usr.Sdur += 22

		var/obj/WiP = locate(/obj/Perk/Wire_Prof) in usr.contents
		if(WiP)
			for(var/obj/Perk/Wire_Prof/S in usr.contents)
				if(S.tier==1)
					usr.Sref += 2.5
					usr.Sstr += 3
					usr.Satkspd += 4.5
				if(S.tier==2)
					usr.Sref += 5
					usr.Sstr += 6
					usr.Satkspd += 11
				if(S.tier==3)
					usr.Sstr += 11
					usr.Sref += 9
					usr.Satkspd += 14
				if(S.tier==4)
					usr.Sstr += 16
					usr.Sref += 12
					usr.Satkspd += 23

		var/obj/Blacksmith = locate(/obj/Perk/Black_Smith) in usr.contents
		if(Blacksmith)
			for(var/obj/Perk/Black_Smith/S in usr.contents)
				if(S.tier==1)
					usr.Sint += 6
				if(S.tier==2)
					usr.Sint += 12
				if(S.tier==3)
					usr.Sint += 20
				if(S.tier==4)
					usr.Sint += 34

		var/obj/LaP = locate(/obj/Perk/Lasher_Prof) in usr.contents
		if(LaP)
			for(var/obj/Perk/Lasher_Prof/S in usr.contents)
				if(S.tier==1)
					usr.Sken += 6
					usr.Satkspd += 5
					usr.Sstr += 2
				if(S.tier==2)
					usr.Sken+= 10
					usr.Satkspd += 10
					usr.Sstr += 5
				if(S.tier==3)
					usr.Sstr += 9
					usr.Sken += 17
					usr.Satkspd += 15
				if(S.tier==4)
					usr.Sstr += 16
					usr.Sken += 26
					usr.Satkspd += 22
		/*
		var/obj/CrP = locate(/obj/Perk/Crossbow_Prof) in usr.contents
		if(CrP)
			for(var/obj/Perk/Crossbow_Prof/S in usr.contents)
			/*	if(S.tier==1)
					usr.Sref += 3
					usr.Satkspd += 4
*/				if(S.tier==2)
					usr.Sref += 7
					usr.Satkspd += 8
			//		usr.Sstr += 2
				if(S.tier==3)
			//		usr.Sstr += 4
					usr.Sref += 12
					usr.Satkspd += 13
				if(S.tier==4)
			//		usr.Sstr += 16
					usr.Sref += 8
					usr.Satkspd += 16
*/
		var/obj/SF = locate(/obj/Perk/Speed_Freak) in usr.contents
		if(SF)
			for(var/obj/Perk/Speed_Freak/S in usr.contents)
				if(S.tier==1)
					usr.Sspd += 2
					usr.Satkspd += 2.5
					usr.Stai += 1.5
					usr.Sref += 1.5
				if(S.tier==2)
					usr.Sspd += 7.5
					usr.Satkspd += 5
					usr.Stai += 3
					usr.Sref += 2.5
				if(S.tier==3)
					usr.Sspd += 11
					usr.Satkspd += 8
					usr.Stai += 6
					usr.Sref += 5
/*
		var/obj/HaP = locate(/obj/Perk/Hammer_Prof) in usr.contents
		if(HaP)
			for(var/obj/Perk/Hammer_Prof/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 5
					usr.Stai += 5
				if(S.tier==2)
					usr.Sstr += 10
					usr.Satkspd += 7
					usr.stai += 8
				if(S.tier==3)
					usr.Sstr += 17
					usr.Satkspd += 11
					usr.stai += 13
				if(S.tier==4)
					usr.Sstr += 21
					usr.Satkspd += 16
					usr.stai += 19
*/

		var/obj/BlP = locate(/obj/Perk/Bludge_Prof) in usr.contents
		if(BlP)
			for(var/obj/Perk/Bludge_Prof/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 3
			//		usr.Sref += 3
					usr.Sken += 7
				if(S.tier==2)
			//		usr.Sref += 5
					usr.Sken += 12
					usr.Sstr += 7
					usr.Satkspd += 4
				if(S.tier==3)
					usr.Sstr += 11.5
			//		usr.Sref += 6
					usr.Sken += 16
					usr.Satkspd += 8
				if(S.tier==4)
					usr.Sstr += 15.5
			//		usr.Sref += 9.5
					usr.Sken += 21
					usr.Satkspd += 12

		var/obj/SpP = locate(/obj/Perk/Spear_Prof) in usr.contents
		if(SpP)
			for(var/obj/Perk/Spear_Prof/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 1.5
					usr.Sref += 2
					usr.Sken += 5.5
					usr.Satkspd +=3.5
				if(S.tier==2)
					usr.Sref += 5.5
					usr.Sken += 9
					usr.Sstr += 4.5
					usr.Satkspd +=7
				if(S.tier==3)
					usr.Sstr += 8
					usr.Sref += 9.5
					usr.Sken += 13
					usr.Satkspd += 11.5
				if(S.tier==4)
					usr.Sstr += 12
					usr.Sref += 13.5
					usr.Sken += 22
					usr.Satkspd += 15

		var/obj/Claw = locate(/obj/Perk/Claws_Beginner) in usr.contents
		if(Claw)
			for(var/obj/Perk/Claws_Beginner/S in usr.contents)
				if(S.tier==1)
					usr.Satkspd += 5.5
					usr.Stai += 4
					usr.Sspd += 1.5
				if(S.tier==2)
					usr.Satkspd += 10.5
					usr.Sspd += 4
					usr.Stai += 7
				if(S.tier==3)
					usr.Satkspd += 16
					usr.Sspd += 8.5
					usr.Stai += 12.5
				if(S.tier==4)
					usr.Satkspd += 24.5
					usr.Sspd += 12.5
					usr.Stai += 17.5

		var/obj/Rogue= locate(/obj/Perk/Rogue) in usr.contents
		if(Rogue)
			for(var/obj/Perk/Rogue/S in usr.contents)
				if(S.tier==1)
					usr.Sken += 1
					usr.Sref += 2.5
					usr.Satkspd += 2.5
				if(S.tier==2)
					usr.Sken += 7
					usr.Sref += 6
					usr.Satkspd += 10
				if(S.tier==3)
					usr.Sken += 14
					usr.Sref += 9.5
					usr.Satkspd += 13.5
				if(S.tier==4)
					usr.Sken +=19.8
					usr.Sref += 16
					usr.Satkspd += 20.5


		var/obj/SaP = locate(/obj/Perk/Sai_Prof) in usr.contents
		if(SaP)
			for(var/obj/Perk/Sai_Prof/S in usr.contents)
				if(S.tier==1)
			//		usr.Sstr += 2
					usr.Sref += 2
					usr.Satkspd += 2
			//		usr.Sken += 6
				if(S.tier==2)
					usr.Sref += 5
					usr.Sken += 10
			//		usr.Sstr += 5.5
					usr.Satkspd += 5.5
				if(S.tier==3)
			//		usr.Sstr += 8.5
					usr.Sref += 8
					usr.Sken += 14
					usr.Satkspd += 8.5
				if(S.tier==4)
			//		usr.Sstr += 13
					usr.Sref += 11
					usr.Sken += 20
					usr.Satkspd += 12

		var/obj/Box = locate(/obj/Perk/Boxer) in usr.contents
		if(Box)
			for(var/obj/Perk/Boxer/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 2
					usr.Sref += 2
					usr.Satkspd += 3
					usr.Stai += 5
				if(S.tier==2)
					usr.Stai += 10
					usr.Sstr += 5
					usr.Sref += 5.5
					usr.Satkspd += 6.5
				if(S.tier==3)
					usr.Sstr += 8.5
					usr.Stai += 15.5
					usr.Sref += 9.5
					usr.Satkspd += 12.5
				if(S.tier==4)
					usr.Sstr += 14
					usr.Stai += 20
					usr.Sref += 13
					usr.Satkspd += 14.5

		var/obj/KBox = locate(/obj/Perk/KickBoxer) in usr.contents
		if(KBox)
			for(var/obj/Perk/KickBoxer/S in usr.contents)
				if(S.tier==1)
					usr.Sstr += 2.5
					usr.Satkspd += 3.5
					usr.Sref += 1
					usr.Stai += 3
				if(S.tier==2)
					usr.Stai += 8
					usr.Sstr += 6.5
					usr.Sref += 4
					usr.Satkspd += 7.5
				if(S.tier==3)
					usr.Sstr += 9.5
					usr.Stai += 11.5
					usr.Sref += 5.5
					usr.Satkspd += 9.5
				if(S.tier==4)
					usr.Sstr += 20.5
					usr.Stai += 18
					usr.Sref += 8
					usr.Satkspd += 17.5

		var/obj/EleEarth = locate(/obj/Perk/Elemental_Training_Earth) in usr.contents
		if(EleEarth)
			for(var/obj/Perk/Elemental_Training_Earth/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5.5
				if(S.tier==2)
					usr.Scon += 12
					usr.Sstr += 2
					usr.Sdur += 2
					usr.Snin += 9.5
				if(S.tier==3)
					usr.Scon += 17
					usr.Sstr += 3.5
					usr.Sdur += 3.5
					usr.Snin += 13.5
				if(S.tier==4)
					usr.Scon += 24
					usr.Sstr += 6
					usr.Sdur += 6
					usr.Snin += 20.5

		var/obj/EleLightning = locate(/obj/Perk/Elemental_Training_Lightning) in usr.contents
		if(EleLightning)
			for(var/obj/Perk/Elemental_Training_Lightning/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 6
				if(S.tier==2)
					usr.Scon += 12
					usr.Sref += 2
					usr.Sspd += 2
					usr.Snin += 10
				if(S.tier==3)
					usr.Scon += 17
					usr.Sref += 3.5
					usr.Sspd += 3.5
					usr.Snin += 14
				if(S.tier==4)
					usr.Scon += 24
					usr.Sref += 6
					usr.Sspd += 6
					usr.Snin += 21

		var/obj/EleWater = locate(/obj/Perk/Elemental_Training_Water) in usr.contents
		if(EleWater)
			for(var/obj/Perk/Elemental_Training_Water/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5.5
				if(S.tier==2)
					usr.Scon += 12
					usr.Sdef += 2
					usr.Sref += 2
					usr.Snin += 9.5
				if(S.tier==3)
					usr.Scon += 17
					usr.Sdef += 3.5
					usr.Sref += 3.5
					usr.Snin += 13.5
				if(S.tier==4)
					usr.Scon += 24
					usr.Sdef += 6
					usr.Sref += 6
					usr.Snin += 20.5

		var/obj/EleFire = locate(/obj/Perk/Elemental_Training_Fire) in usr.contents
		if(EleFire)
			for(var/obj/Perk/Elemental_Training_Fire/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 6.5
				if(S.tier==2)
					usr.Scon += 12
					usr.Satkspd += 2
					usr.Sstr += 2
					usr.Snin += 10.5
				if(S.tier==3)
					usr.Scon += 17
					usr.Satkspd += 3.5
					usr.Sstr += 3.5
					usr.Snin += 14.5
				if(S.tier==4)
					usr.Scon += 24
					usr.Satkspd += 6
					usr.Sstr += 6
					usr.Snin += 21.5

/*
		var/obj/Weight_Training = locate(/obj/Perk/Weight_Training) in usr.contents
		if(Weight_Training)
			for(var/obj/Perk/Weight_Training/S in usr.contents)
				if(S.tier=="Master")
					usr.Sstr += 20
					usr.Sspd += 20
				if(S.tier==1)
					usr.Sstr += 2.5
					usr.Sspd += 2.5
					usr.Sstam += 2000
				if(S.tier==2)
					usr.Sstr += 6.5
					usr.Sspd += 5.5
					usr.Sstam += 4000
				if(S.tier==3)
					usr.Sstr += 11
					usr.Sspd += 10
					usr.Sstam += 8000
				if(S.tier==4)
					usr.Sstr += 20
					usr.Sspd += 20
					usr.Sstam += 14000
*/

		var/obj/Marksman = locate(/obj/Perk/Marksman) in usr.contents
		if(Marksman)
			for(var/obj/Perk/Marksman/S in usr.contents)
				if(S.tier=="Master")
					usr.Sstr += 20
					usr.Sref += 20
				if(S.tier==1)
					usr.Sstr += 3.5
					usr.Sref += 2.5
					usr.Sken += 4.5
				if(S.tier==2)
					usr.Sstr += 7.5
					usr.Sref += 4.5
					usr.Sken += 6
				if(S.tier==3)
					usr.Sstr += 12.5
					usr.Sref += 8.5
					usr.Sken += 12.5
				if(S.tier==4)
					usr.Sstr += 21.5
					usr.Sref += 11.5
					usr.Sken += 23

		var/obj/FlickerFight = locate(/obj/Perk/Flicker_Fighter) in usr.contents
		if(FlickerFight)
			for(var/obj/Perk/Flicker_Fighter/S in usr.contents)
				if(S.tier=="Master")
					usr.Sspd += 20
					usr.Scon += 20
				if(S.tier==1)
					usr.Scon += 2.5
					usr.Sspd += 1.5
				if(S.tier==2)
					usr.Scon += 5
					usr.Sspd += 3
				if(S.tier==3)
					usr.Scon += 10
					usr.Sspd += 6
				if(S.tier==4)
					usr.Scon += 16.5
					usr.Sspd += 10.5




		var/obj/BasicSeal = locate(/obj/Perk/Basic_Sealing) in usr.contents
		if(BasicSeal)
			for(var/obj/Perk/Basic_Sealing/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Sint += 9.5
					usr.Snin  += 10
				if(S.tier==1)
					usr.Scon += 3
					usr.Sint += 3.5
					usr.Snin += 5
				if(S.tier==2)
					usr.Scon += 7.5
					usr.Sint += 9
					usr.Snin  += 7.5
				if(S.tier==3)
					usr.Scon += 11.5
					usr.Sint += 14
					usr.Snin  += 9.5
				if(S.tier==4)
					usr.Scon += 16
					usr.Sint += 20.5
					usr.Snin  += 15

		var/obj/EleWind = locate(/obj/Perk/Elemental_Training_Wind) in usr.contents
		if(EleWind)
			for(var/obj/Perk/Elemental_Training_Wind/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5
				if(S.tier==2)
					usr.Scon += 12
					usr.Satkspd += 2
					usr.Sspd += 2
					usr.Snin += 9
				if(S.tier==3)
					usr.Scon += 17
					usr.Satkspd += 3.5
					usr.Sspd += 3.5
					usr.Snin += 13
				if(S.tier==4)
					usr.Scon += 24
					usr.Satkspd += 6
					usr.Sspd += 6
					usr.Snin += 20

		var/obj/EleIce = locate(/obj/Perk/Elemental_Training_Ice)
		if(EleIce)
			for(var/obj/Perk/Elemental_Training_Ice/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5
				if(S.tier==2)
					usr.Scon += 12
					usr.Sdef += 2
					usr.Sspd += 2
					usr.Snin += 9
				if(S.tier==3)
					usr.Scon += 17
					usr.Sdef += 3.5
					usr.Sspd += 3.5
					usr.Snin += 13
				if(S.tier==4)
					usr.Scon += 24
					usr.Sdef += 6
					usr.Sspd += 6
					usr.Snin += 17

		var/obj/EleBoil = locate(/obj/Perk/Elemental_Training_Boil)
		if(EleBoil)
			for(var/obj/Perk/Elemental_Training_Boil/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5.5
				if(S.tier==2)
					usr.Scon += 12
					usr.Satkspd += 2
					usr.Sstr += 2
					usr.Snin += 9.5
				if(S.tier==3)
					usr.Scon += 17
					usr.Satkspd += 3.5
					usr.Sstr += 3.5
					usr.Snin += 13.5
				if(S.tier==4)
					usr.Scon += 24
					usr.Satkspd += 6
					usr.Sstr += 6
					usr.Snin += 20.5

		var/obj/EleStorm = locate(/obj/Perk/Elemental_Training_Storm)
		if(EleStorm)
			for(var/obj/Perk/Elemental_Training_Storm/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 6
				if(S.tier==2)
					usr.Scon += 12
					usr.Satkspd += 2
					usr.Sdef += 2
					usr.Snin += 10
				if(S.tier==3)
					usr.Scon += 17
					usr.Satkspd += 3.5
					usr.Sstr += 3.5
					usr.Snin += 14
				if(S.tier==4)
					usr.Scon += 24
					usr.Satkspd += 6
					usr.Sstr += 6
					usr.Snin += 21

		var/obj/EleWood = locate(/obj/Perk/Elemental_Training_Wood)
		if(EleWood)
			for(var/obj/Perk/Elemental_Training_Wood/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5.5
				if(S.tier==2)
					usr.Scon += 12
					usr.Sdef += 2
					usr.Sdur += 2
					usr.Snin += 9.5
				if(S.tier==3)
					usr.Scon += 17
					usr.Sdef += 3.5
					usr.Sdur += 3.5
					usr.Snin += 13.5
				if(S.tier==4)
					usr.Scon += 24
					usr.Sdef += 6
					usr.Sdur += 6
					usr.Snin += 20.5

		var/obj/PoiProf = locate(/obj/Perk/Poison_Proficiency)
		if(PoiProf)
			for(var/obj/Perk/Poison_Proficiency/S in usr.contents)
				if(S.tier=="Master")
					usr.Sint += 30
				if(S.tier==1)
					usr.Sint += 6
				if(S.tier==2)
					usr.Sint += 16
				if(S.tier==3)
					usr.Sint += 24
				if(S.tier==4)
					usr.Sint += 36


		var/obj/EleLava = locate(/obj/Perk/Elemental_Training_Lava)
		if(EleLava)
			for(var/obj/Perk/Elemental_Training_Lava/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 6
				if(S.tier==2)
					usr.Scon += 12
					usr.Sdef += 2
					usr.Sstr += 2
					usr.Snin += 10
				if(S.tier==3)
					usr.Scon += 17
					usr.Sdef += 3.5
					usr.Sstr += 3.5
					usr.Snin += 14
				if(S.tier==4)
					usr.Scon += 24
					usr.Sdef += 6
					usr.Sstr += 6
					usr.Snin += 21

		var/obj/EleCrystal = locate(/obj/Perk/Elemental_Training_Crystal)
		if(EleCrystal)
			for(var/obj/Perk/Elemental_Training_Ice/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5.5
				if(S.tier==2)
					usr.Scon += 12
					usr.Sdef += 2
					usr.Sref += 2
					usr.Snin += 9.5
				if(S.tier==3)
					usr.Scon += 17
					usr.Sdef += 3.5
					usr.Sdur += 3.5
					usr.Snin += 13.5
				if(S.tier==4)
					usr.Scon += 24
					usr.Sdef += 6
					usr.Sdur += 6
					usr.Snin += 20.5

		var/obj/EleMagnetism = locate(/obj/Perk/Elemental_Training_Magnetism)
		if(EleMagnetism)
			for(var/obj/Perk/Elemental_Training_Magnetism/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 5
				if(S.tier==2)
					usr.Scon += 12
					usr.Sdef += 2
					usr.Satkspd += 2
					usr.Snin += 9
				if(S.tier==3)
					usr.Scon += 17
					usr.Sdef += 3.5
					usr.Satkspd += 3.5
					usr.Snin += 13
				if(S.tier==4)
					usr.Scon += 24
					usr.Sdef += 6
					usr.Satkspd += 6
					usr.Snin += 20

		var/obj/EleDust = locate(/obj/Perk/Elemental_Training_Dust)
		if(EleDust)
			for(var/obj/Perk/Elemental_Training_Dust/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 4
				if(S.tier==2)
					usr.Scon += 16
					usr.Snin += 8
				if(S.tier==3)
					usr.Scon += 24
					usr.Snin += 12
				if(S.tier==4)
					usr.Scon += 36
					usr.Snin += 16
/*
		var/obj/EleBlaze = locate(/obj/Perk/Elemental_Training_Blaze)
		if(EleBlaze)
			for(var/obj/Perk/Elemental_Training_Blaze/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 2
					usr.Snin += 3.5
				if(S.tier==2)
					usr.Scon += 4
					usr.Snin += 5.5
				if(S.tier==3)
					usr.Scon += 7.5
					usr.Snin += 13.5
				if(S.tier==4)
					usr.Scon += 14
					usr.Snin += 25
*/

		var/obj/EleDark = locate(/obj/Perk/Elemental_Training_Dark)
		if(EleDark)
			for(var/obj/Perk/Elemental_Training_Dark/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 3
					usr.Snin += 6.5
				if(S.tier==2)
					usr.Scon += 6
					usr.Snin += 10.5
				if(S.tier==3)
					usr.Scon += 12
					usr.Snin += 14.5
				if(S.tier==4)
					usr.Scon += 18
					usr.Snin += 21.5

		var/obj/EleSteel = locate(/obj/Perk/Elemental_Training_Steel)
		if(EleSteel)
			for(var/obj/Perk/Elemental_Training_Steel/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 3
					usr.Sdef += 3
					usr.Sdur += 3
				if(S.tier==2)
					usr.Scon += 6
					usr.Sdef += 6
					usr.Sdur += 6
					usr.Snin += 4
				if(S.tier==3)
					usr.Scon += 8
					usr.Sdef += 8
					usr.Sdur += 8
					usr.Snin += 6
				if(S.tier==4)
					usr.Scon += 12
					usr.Sdef += 12
					usr.Sdur += 12
					usr.Snin += 10

		var/obj/EleExplosion = locate(/obj/Perk/Elemental_Training_Explosion)
		if(EleExplosion)
			for(var/obj/Perk/Elemental_Training_Explosion/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 4
					usr.Snin += 8
				if(S.tier==2)
					usr.Scon += 6
					usr.Satkspd += 3
					usr.Snin += 11
				if(S.tier==3)
					usr.Scon += 8.5
					usr.Satkspd += 4.5
					usr.Snin += 16
				if(S.tier==4)
					usr.Scon += 12
					usr.Satkspd += 6
					usr.Snin += 23.5

		var/obj/EleSwift = locate(/obj/Perk/Elemental_Training_Swift)
		if(EleSwift)
			for(var/obj/Perk/Elemental_Training_Swift/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 3
					usr.Sspd += 3
					usr.Snin += 3.5
				if(S.tier==2)
					usr.Scon += 5
					usr.Sspd += 5
					usr.Snin += 6
				if(S.tier==3)
					usr.Scon += 10
					usr.Sspd += 9
					usr.Snin += 9.5
				if(S.tier==4)
					usr.Scon += 3
					usr.Sspd += 3
					usr.Snin += 3.5
		var/obj/EleScorch = locate(/obj/Perk/Elemental_Training_Scorch)
		if(EleScorch)
			for(var/obj/Perk/Elemental_Training_Scorch/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 6
					usr.Snin += 7
				if(S.tier==2)
					usr.Scon += 12
					usr.Snin += 11
				if(S.tier==3)
					usr.Scon += 17
					usr.Snin += 15
				if(S.tier==4)
					usr.Scon += 24
					usr.Snin += 22
/*		var/obj/EleHero = locate(/obj/Perk/Elemental_Training_Hero)
		if(EleHero)
			for(var/obj/Perk/Elemental_Training_Hero/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 2
					usr.Snin += 2.5
				if(S.tier==2)
					usr.Scon += 4
					usr.Snin += 4.5
				if(S.tier==3)
					usr.Scon += 6
					usr.Snin += 6.5
				if(S.tier==4)
					usr.Scon += 8
					usr.Snin += 8.5


		var/obj/EleIllusion = locate(/obj/Perk/Elemental_Training_Illusion)
		if(EleIllusion)
			for(var/obj/Perk/Elemental_Training_Illusion/S in usr.contents)
				if(S.tier=="Master")
					usr.Scon += 10
					usr.Snin += 9.5
				if(S.tier==1)
					usr.Scon += 2
					usr.Snin += 2.5
				if(S.tier==2)
					usr.Scon += 4
					usr.Snin += 4.5
				if(S.tier==3)
					usr.Scon += 6
					usr.Snin += 6.5
				if(S.tier==4)
					usr.Scon += 8
					usr.Snin += 8.5 */



		var/obj/Senjew = locate(/obj/Perk/Senju_Clan) in usr.contents
		if(Senjew)
			usr.BaseStat = usr.BaseStat * 1.3
			usr<<"What great genes you possess"

		var/obj/Medicc = locate(/obj/Perk/Medic) in usr.contents
		if(Medicc)
			usr.Sint *= 1.2
			usr.Scon += 3



		var/obj/UchiHate = locate(/obj/Perk/Uchiha_Hatred) in usr.contents
		if(UchiHate)
			usr.BaseStat = usr.BaseStat * 1.10
			usr<<"My you're an angry person aren't you?"
		for(var/obj/Perk/M in usr.contents)
			if(M.tier == 1)
				usr.Sstam += M.giStamina
				usr.Schakra += M.giChakra
				usr.Snin += M.giNin
				usr.Stai += M.giTai
				usr.Sgen += M.giGen
				usr.Sint += M.giInt
				usr.Sken += M.giKen
				usr.Sref += M.giRef
				usr.Sspd += M.giSpd
				usr.Scon += M.giCon
				usr.Sstr += M.giStr
				usr.Sdef += M.giDef
				usr.Satkspd += M.giAtkspd
				usr.Sdur += M.giDur
				usr.SConst += M.giConst
				usr.Sgenres += M.giGenres
				usr.Ssenserange += M.giSenserange
			if(M.tier == 2)
				if(M.giChakra > 1)
					usr.Schakra += M.giChakra + 500
				if(M.giStamina > 1)
					usr.Sstam += M.giStamina	+ 500
				if(M.giNin > 0)
					usr.Snin += M.giNin	+ 1
				if(M.giKen > 0)
					usr.Sken += M.giKen + 1
				if(M.giTai > 0)
					usr.Stai += M.giTai	+ 1
				if(M.giGen > 0)
					usr.Sgen += M.giGen	+ 1
				if(M.giInt > 0)
					usr.Sint += M.giInt	+ 1
				if(M.giRef > 0)
					usr.Sref += M.giRef	+ 1
				if(M.giSpd > 0)
					usr.Sspd += M.giSpd	+ 1
				if(M.giCon > 0)
					usr.Scon += M.giCon	+ 1
				if(M.giStr > 0)
					usr.Sstr += M.giStr	+ 1
				if(M.giDef > 0)
					usr.Sdef += M.giDef	+ 1
				if(M.giAtkspd > 0)
					usr.Satkspd += M.giAtkspd + 1
				if(M.giDur > 0)
					usr.Sdur += M.giDur	+ 1
				if(M.giConst > 0)
					usr.SConst += M.giConst	+ 0
				if(M.giGenres > 0)
					usr.Sgenres += M.giGenres + 1
				if(M.giSenserange > 0)
					usr.Ssenserange += M.giSenserange + 20
			if(M.tier == 3)
				if(M.giChakra > 0)
					usr.Schakra += M.giChakra	+ 1000
				if(M.giChakra > 0)
					usr.Sstam += M.giStamina	+ 1000
				if(M.giNin > 0)
					usr.Snin += M.giNin	+ 2
				if(M.giKen > 0)
					usr.Sken += M.giKen + 2
				if(M.giTai > 0)
					usr.Stai += M.giTai	+ 2
				if(M.giGen > 0)
					usr.Sgen += M.giGen	+ 2
				if(M.giInt > 0)
					usr.Sint += M.giInt	+ 2
				if(M.giRef > 0)
					usr.Sref += M.giRef	+ 2
				if(M.giSpd > 0)
					usr.Sspd += M.giSpd	+ 2
				if(M.giCon > 0)
					usr.Scon += M.giCon	+ 2
				if(M.giStr > 0)
					usr.Sstr += M.giStr	+ 2
				if(M.giDef > 0)
					usr.Sdef += M.giDef	+ 2
				if(M.giAtkspd > 0)
					usr.Satkspd += M.giAtkspd + 2
				if(M.giDur > 0)
					usr.Sdur += M.giDur	+ 2
				if(M.giConst > 0)
					usr.SConst += M.giConst	+ 0
				if(M.giGenres > 0)
					usr.Sgenres += M.giGenres + 2
				if(M.giSenserange > 0)
					usr.Ssenserange += M.giSenserange + 40
			if(M.tier == 4)
				if(M.giChakra > 0)
					usr.Schakra += M.giChakra + 1500
				if(M.giChakra > 0)
					usr.Sstam += M.giStamina	+ 1500
				if(M.giNin > 0)
					usr.Snin += M.giNin	+ 3
				if(M.giKen > 0)
					usr.Sken += M.giKen + 3
				if(M.giTai > 0)
					usr.Stai += M.giTai	+ 3
				if(M.giGen > 0)
					usr.Sgen += M.giGen	+ 3
				if(M.giInt > 0)
					usr.Sint += M.giInt	+ 3
				if(M.giRef > 0)
					usr.Sref += M.giRef	+ 3
				if(M.giSpd > 0)
					usr.Sspd += M.giSpd	+ 3
				if(M.giCon > 0)
					usr.Scon += M.giCon	+ 3
				if(M.giStr > 0)
					usr.Sstr += M.giStr	+ 3
				if(M.giDef > 0)
					usr.Sdef += M.giDef	+ 3
				if(M.giAtkspd > 0)
					usr.Satkspd += M.giAtkspd + 3
				if(M.giDur > 0)
					usr.Sdur += M.giDur	+ 3
				if(M.giConst > 0)
					usr.SConst += M.giConst	+ 0
				if(M.giGenres > 0)
					usr.Sgenres += M.giGenres + 3
				if(M.giSenserange > 0)
					usr.Ssenserange += M.giSenserange + 60
			if(M.tier == "Master")
				if(M.giChakra > 0)
					usr.Schakra += M.giChakra + 4000
				if(M.giChakra > 0)
					usr.Sstam += M.giStamina	+ 4000
				if(M.giNin > 0)
					usr.Snin += M.giNin	+ 5
				if(M.giTai > 0)
					usr.Stai += M.giTai	+ 5
				if(M.giKen > 0)
					usr.Sken += M.giKen + 5
				if(M.giGen > 0)
					usr.Sgen += M.giGen	+ 5
				if(M.giInt > 0)
					usr.Sint += M.giInt	+ 5
				if(M.giRef > 0)
					usr.Sref += M.giRef	+ 5
				if(M.giSpd > 0)
					usr.Sspd += M.giSpd	+ 5
				if(M.giCon > 0)
					usr.Scon += M.giCon	+ 5
				if(M.giStr > 0)
					usr.Sstr += M.giStr	+ 5
				if(M.giDef > 0)
					usr.Sdef += M.giDef	+ 5
				if(M.giAtkspd > 0)
					usr.Satkspd += M.giAtkspd + 5
				if(M.giDur > 0)
					usr.Sdur += M.giDur	+ 5
				if(M.giConst > 0)
					usr.SConst += M.giConst	+ 0
				if(M.giGenres > 0)
					usr.Sgenres += M.giGenres + 5
				if(M.giSenserange > 0)
					usr.Ssenserange += M.giSenserange + 100
		sleep(15)
		usr<<"<font color=#00873D>Your current trait is being taken into consideration."
		if(usr.Trait=="Hardworker")
			usr.BaseStat += 2.4
			usr<<"You sure do work hard!"
		if(usr.Trait=="Slacker")
			usr.BaseStat -= 0.5
			usr<<"You really should put in more effort.."
		if(usr.Trait=="Genius")
			usr.Sint *= 1.3
			usr<<"My aren't you smart!"
		if(usr.Trait=="Pacifist")
			usr.Sref += 0.5
			usr<<"I don't really care for fighting either~"
		if(usr.Trait=="Insomniac")
			usr.BaseStat /= 2
			usr<<"You know, you should really get some rest."
		if(usr.Trait=="Mentalist")
			usr<<"Such intelligence! Much physical atrophy! Wow!"
		if(usr.Trait=="Sadist")
			usr.Sstr += 0.4
			usr<<"...Y-you want to bite my what!?"
		if(usr.Trait=="Super Prodigy")
			usr.BaseStat *=1.8
		if(usr.Trait=="Sadomasochist")
			usr.Sstr += 0.4
			usr.Sdur += 0.4
			usr<<"W-wow...You're really kinky...I like it!~"
		if(usr.Trait=="Strategist")
			usr<<"Well aren't you a good thinker.~"
		if(usr.Trait=="Masochist")
			usr.Sdur += 0.4
			usr<<"...Y-you want me to step on your who now!?"
		if(usr.Trait=="Battlehardened")
			usr.BaseStat = usr.BaseStat * 1.35
			usr<<"You look like you've seen some shit man..."
		if(usr.Trait=="Prodigy")
			usr<<"Our studies indicate that you are a Prodigy."
			usr.BaseStat *= 1.3
/*		if(usr.Trait=="Anomaly")
			usr<<"I-I've never seen anyone quite like this. . . "
			usr.BaseStat = usr.BaseStat * 1.8
*/
		if(usr.Trait=="Berserker")
			usr.BaseStat += 0.45
			usr.Sint -= 0.8
			usr<<"P-please relax around me."
		if(usr.Trait=="Frail")
			usr.BaseStat /= 3
			usr<<"You should watch out...You're so frail."
		if(usr.Trait=="Old Person")
			usr.BaseStat -= 3
			usr<<"My aren't you old!"
			if(rand(25))
				usr.Death()
		sleep(15)
		usr<<"<font color=red>We're now checking on your genes~"
		if(locate(/obj/Gene/High_Healing_Rate)in usr.contents)
			usr<<"Weren't you just injured?"
		if(locate(/obj/Gene/Monstrous_Chakra)in usr.contents)
			usr.Schakra = usr.Schakra*1.5
			usr<<"Y-your chakra levels are off the charts!!"
		if(locate(/obj/Gene/Small_Reservoir)in usr.contents)
			usr.Schakra = usr.Schakra/2
		if(locate(/obj/Gene/Monstrous_Stamina)in usr.contents)
			usr.Sstam = usr.Sstam*1.2
			usr<<"Do you ever run out of steam?"
		if(locate(/obj/Gene/Depleting_Stamina)in usr.contents)
			usr.Sstam = usr.Sstam/2.5
		if(locate(/obj/Gene/High_Intelligence)in usr.contents)
			usr.Sint = usr.Sint*1.2
			usr<<"Aren't you a smart cookie?"
		if(locate(/obj/Gene/Low_Intelligence)in usr.contents)
			usr.Sint = usr.Sint/1.1
		if(locate(/obj/Gene/High_Speed) in usr.contents)
			usr.Sspd = usr.Sspd*1.2
			usr<<"Slow down a bit would ya?!"
		if(locate(/obj/Gene/Low_Speed) in usr.contents)
			usr.Sspd = usr.Sspd/1.2
		if(locate(/obj/Gene/High_Defense) in usr.contents)
			usr.Sdef = usr.Sdef*1.2
			usr<<"My my, aren't you defensive?"
		if(locate(/obj/Gene/Low_Defense) in usr.contents)
			usr.Sdef = usr.Sdef/1.1
		if(locate(/obj/Gene/Monster_Body) in usr.contents)
			usr.Sdur = usr.Sdur*1.2
			usr<<"Brickhouse headass"
		if(locate(/obj/Gene/Fragile_Body) in usr.contents)
			usr.Sdur = usr.Sdur/1.1
		if(locate(/obj/Gene/Longevity) in usr.contents)
			usr.SConst = usr.SConst*2
			usr<<"You're going to live for a long time my friend."
		if(locate(/obj/Gene/Reflexive) in usr.contents)
			usr.Sref = usr.Sref*1.2
			usr<<"Wow! I've never seen anyone with moves so sharp."
		if(locate(/obj/Gene/Monstrous_Strength) in usr.contents)
			usr.Sstr = usr.Sstr*1.2
			usr<<"P-please don't hit me--YAMATE-KUDASAI"
		if(locate(/obj/Gene/Miniscule_Strength) in usr.contents)
			usr.Sstr = usr.Sstr/2
		if(locate(/obj/Gene/High_Control) in usr.contents)
			usr.Scon = usr.Scon*1.2
			usr<<"Teach me control like that!!"
		if(locate(/obj/Gene/Low_Control) in usr.contents)
			usr.Scon = usr.Scon/1.1
		if(locate(/obj/Gene/Child) in usr.contents)
			usr.BaseStat /= 2
		if(locate(/obj/Gene/Chakra_Borne_Illness) in usr.contents)
			usr.BaseStat = usr.BaseStat * 2
		if(locate(/obj/Gene/Custom_Dojutsu) in usr.contents)
			usr<<"<font color=black>Your eyes feel a bit weird, a slight burst of chakra seems to clear it right up."
		sleep(15)
		usr<<"<font color=#00873D>Now we're going to calculate for any sicknesses you have."
		if(locate(/obj/Illness/Fatal_Auto_Immune_Deficiency) in usr.contents)
			usr.BaseStat /=4
			usr<<"You have a fatal illness...It seems you're going to die soon."
			if(prob(45))
				usr.Death()
		if(locate(/obj/Illness/Wasting_Syndrome) in usr.contents)
			usr.BaseStat /=5
			usr<<"My..You're just wasting away..."
		if(locate(/obj/Illness/Non_Fatal_Auto_Immune_Deficiency) in usr.contents)
			usr.BaseStat /= 3.5
			usr<<"You're so sick! You should see a medic!"
		usr<<"<font color=#00873D>Now we're going to calculate in all of your injuries!~~"
		sleep(15)
		for(var/obj/Injury/INJ in usr.contents)
			usr.Schakra -= INJ.TChakra
			usr.Sstam -= INJ.TStamina
			usr.Snin -= INJ.TNin
			usr.Stai -= INJ.TTai
			usr.Sgen -= INJ.TGen
			usr.Sint -= INJ.TInt
			usr.Sref -= INJ.TRef
			usr.Sspd -= INJ.TSpd
			usr.Scon -= INJ.TCon
			usr.Sstr -= INJ.TStr
			usr.Sdef -= INJ.TDef
			usr.Sdur -= INJ.TDur
			usr.Sgenres -= INJ.TGenres
			usr.Satkspd -= INJ.TAtkspd
			usr.SConst -= INJ.TConst
		usr<<"<font color=#00873D>Now we're going to calculate all of your stats. We're almost done!"
		sleep(15)
		var/obj/NiC = locate(/obj/Perk/Shinobi_Info_Card/) in usr.contents
		if(!NiC)
			var/obj/Perk/Shinobi_Info_Card/A=new(usr)
			A.loc = usr
		if(usr.Ssenserange >=1)
			usr.Shingan = 1
			usr.senserange = usr.Ssenserange
		Jchakra = usr.Schakra
		maxJchakra = usr.Schakra
		Jstam = usr.Sstam
		maxJstam = usr.Sstam
		JConst = usr.SConst
		maxJConst = usr.SConst
		Jnin  = (usr.BaseStat + usr.Snin)
		Jken  = (usr.BaseStat + usr.Sken)
		Jgen  = (usr.BaseStat + usr.Sgen)
		Jhss  = (usr.HandsealSpeed + usr.Shss)
		Jtai  = (usr.BaseStat + usr.Stai)
		Jcon  = (usr.BaseStat + usr.Scon)
		Jint  = (usr.BaseStat + usr.Sint)
		Jref  = (usr.BaseStat + usr.Sref)
		Jspd  = (usr.BaseStat + usr.Sspd)
		Jstr  = (usr.BaseStat + usr.Sstr)
		Jdef  = (usr.BaseStat + usr.Sdef)
		Jdur  = (usr.BaseStat + usr.Sdur)
		Jgenres = (usr.BaseStat + usr.Sgenres)
		Jatkspd = (usr.BaseStat + usr.Satkspd)
		if(usr.Trait=="Mentalist")
			usr.Jgen = usr.Jgen*1.2
			usr.Jint = usr.Jint*1.2
			usr.Jgenres = usr.Jgenres*1.2
			usr.Jstr = usr.Jstr-3.0
			usr.Jdur = usr.Jdur-3.0
			usr.Jtai = usr.Jtai-3.0
			usr.Jref = usr.Jref-3.0
			usr.Jspd = usr.Jspd-3.0
			usr.Jdef = usr.Jdef-3.0
		usr.Schakra = 0
		usr.Sstam = 0
		usr.Snin = 0
		usr.Stai = 0
		usr.Sken = 0
		usr.Sgen = 0
		usr.Sint = 0
		usr.Sref = 0
		usr.Sspd = 0
		usr.Scon = 0
		usr.Sstr = 0
		usr.Sdef = 0
		usr.Sdur = 0
		usr.Shss = 0

		usr.Sgenres = 0
		usr.Satkspd = 0
		usr.SConst = 0
		usr.BaseStat = 0
		usr.Ssenserange = 0
		sleep(20)
		usr<<"<font color=#00873D>All Done!~"
		usr.Skill_Rank_Check()
		usr.Login_Rank_Check()








obj/Perk
	Shinobi_Info_Card
		icon='InfoCardNew.dmi'
		icon_state = "Info"
		Click()
			if(src in usr.contents)
				winshow(usr, "NIC", 1)
				winset(usr,"NIC.Strength", "text=\"[usr.Jstr]\"")
				winset(usr,"NIC.Stamina", "text=\"[usr.Jstam]\"")
				winset(usr,"NIC.Chakra", "text=\"[usr.Jchakra]\"")
				winset(usr,"NIC.Control", "text=\"[usr.Jcon]\"")
				winset(usr,"NIC.Speed", "text=\"[usr.Jspd]\"")
				winset(usr,"NIC.Reflex", "text=\"[usr.Jref]\"")
				winset(usr,"NIC.Intelligence", "text=\"[usr.Jint]\"")
				winset(usr,"NIC.Taijutsu", "text=\"[usr.Jtai]\"")
				winset(usr,"NIC.Genjutsu", "text=\"[usr.Jgen]\"")
				winset(usr,"NIC.Durability", "text=\"[usr.Jdur]\"")
				winset(usr,"NIC.AttackSpeed", "text=\"[usr.Jatkspd]\"")
				winset(usr,"NIC.NinDefense", "text=\"[usr.Jdef]\"")
				winset(usr,"NIC.Ninjutsu", "text=\"[usr.Jnin]\"")
				winset(usr,"NIC.Name", "text=\"[usr.name]\"")
				winset(usr,"NIC.GenRes", "text=\"[usr.Jgenres]\"")
				winset(usr,"NIC.FaceID","image=FaceID")

mob/var
	FaceID={"<html>
	<img src=url></html>"}




//obj/Perk
	//Shinobi_Info_Card
		//icon='InfoCardNew.dmi'
		//icon_state = "Info"
		//Click()
			//if(src in usr.contents)
			//	usr << browse("<html><head><center><title>[usr.name]'s Ninja Info Card</title></center></head><body bgcolor=#000000><font color=[usr.SayFont]><font face=calibri><font size=4>Ninja Info Card</size><br>---<br>[usr] has these parameters:<br><br> Chakra:[usr.Jchakra] | Stamina: [usr.Jstam]<br><hr> Ninjutsu:[usr.Jnin] | Taijutsu: [usr.Jtai] | Genjutsu: [usr.Jgen] <br><hr>Intelligence: [usr.Jint] | Control: [usr.Jcon]<br><hr> Reflexes: [usr.Jref] | Speed: [usr.Jspd] <br><hr> Physical Power: [usr.Jstr] | Physical Durability: [usr.Jdur] | Attack Speed: [usr.Jatkspd]<br><hr>Genjutsu Resistance: [usr.Jgenres] | Ninjutsu Defense: [usr.Jdef]<body></html>","window=[usr.name];size=705x400;can_resize=0;can_minimize=0")



obj
	var
		cha = 100
		sta = 100
		ni = 1
		ta = 1
		ge = 1
		inte = 1
		ref = 1
		ken = 1
		sp = 1
		co = 1
		str = 1
		def = 1
		hss = 1








mob/Admin3/verb
/*
	Give_Ninja_Info_Card(mob/M in world)
		set category = "Perk Master"
		var/s=input("You're Giving A Ninja Their Card Today?")in list("Yes","No")
		if(s=="Yes")
			var/B=input("Please Give This Character Some Chakra")as num
			var/C=input("Please Give This Character Some Stamina")as num
			var/D=input("How proficient on a 1 - 10 scale are they with Ninjutsu?")as num
			var/E=input("How proficient on a 1 - 10 scale are they with Taijutsu?")as num
			var/F=input("How good is their Genjutsu on a 1 - 10 scale?")as num
			var/G=input("How intelligent are they? 1 - 10 1 being Naruto Pre-Timeskip; 10 being smarter than Shikamaru")as num
			var/H=input("How good are their reflexes? 1 - 10 1 being a Heavy Akimichi; 10 being 8th gate")as num
			var/I=input("How fast are they? 1 - 10 1 being Fodder Akimichi; 10 being Madara or Minato")as num
			var/J=input("How strong are they? 1-10 1 being Spongebob; 10 being 8th Gate Gai")as num
			var/K=input("How good is their chakra control? 1 - 10")as num
			var/L=input("How great is their Defense? 1 - 10 1 being a normal bunshin; 10 being Domu + Sand Armour")as num
			var/obj/Perk/Shinobi_Info_Card/A=new(M)
			A.cha = B
			M.Jchakra = B
			M.maxJchakra = B
			A.sta = C
			M.Jstam = C
			M.maxJstam = C
			A.ni = D
			M.Jnin = D
			A.ta = E
			M.Jtai = E
			A.ge = F
			M.Jgen = F
			A.inte = G
			M.Jint = G
			A.ref = H
			M.Jref = H
			A.sp = I
			M.Jspd = I
			A.co = K
			M.Jcon = K
			A.str = J
			M.Jstr = J
			A.def = L
			M.Jdef = L
*/