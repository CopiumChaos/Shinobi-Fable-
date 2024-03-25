



mob/perkmaster/verb/Set_Drains()
	set category = "Perk Master"
	for(var/obj/Custom/A in world)
		if(A.jut == "Kenjutsu" || A.jut == "Taijutsu" || A.jut == "Shurikenjutsu")
			A.idran = "Stamina"
		else
			A.idran = "Chakra"
	world<<"<font color=red>[usr.displaykey] has unlocked all jutsus."
	Admin_Logs+="<br>[usr]([usr.key]) has set all drains."
	SaveLogs()



mob
	proc
		SalaryPay()
			set background=1
			if(src.Village)
				src.Yen += src.Salary
				src<<"You got paid!"

			if(src.Village == "Konohagakure")
				KonohaCash += src.Salary*KonohaTax
				src.Yen -= src.Salary*KonohaTax
				src<<"<font color=gold>You've paid your taxes."

			if(src.Village == "Kirigakure")
				KiriCash += src.Salary*KiriTax
				src.Yen -= src.Salary*KiriTax
				src<<"<font color=gold>You've paid your taxes."

			if(src.Village == "Sunagakure")
				SunaCash += src.Salary*SunaTax
				src.Yen -= src.Salary*SunaTax
				src<<"<font color=gold>You've paid your taxes."

			if(src.Village == "Kumogakure")
				KumoCash += src.Salary*KumoTax
				src.Yen -= src.Salary*KumoTax
				src<<"<font color=gold>You've paid your taxes."

			if(src.Village == "Kuraigakure")
				KumoCash += src.Salary*KuraiTax
				src.Yen -= src.Salary*KuraiTax
				src<<"<font color=gold>You've paid your taxes."

			if(src.Village == "Amegakure")
				AmeCash += src.Salary*AmeTax
				src.Yen -= src.Salary*AmeTax
				src<<"<font color=gold>You've paid your taxes."

			if(src.Village == "Genji No Sato")
				GenjiCash += src.Salary*GenjiTax
				src.Yen -= src.Salary*GenjiTax

			if(src.Village == "Shinkogakure")
				ShinCash += src.Salary*ShinTax
				src.Yen -= src.Salary*ShinTax


			if(prob(45))
				src.SicknessDrain()
			for(var/obj/Prison_Door/P in world)
				if(P.Renter == src)
					if(src.Yen >= P.Rent)
						src.Yen -= P.Rent
						src<<"<font color=gold>You paid your rent!"
						if(usr.Village == "Konohagakure")
							KonohaCash += P.Rent
						if(usr.Village == "Kirigakure")
							KiriCash += P.Rent
						if(usr.Village == "Kumogakure")
							KumoCash += P.Rent
						if(usr.Village == "Sunagakure")
							SunaCash += P.Rent
						if(usr.Village == "Amegakure")
							AmeCash += P.Rent
						if(usr.Village == "Shinkogakure")
							ShinCash += P.Rent
						if(usr.Village == "Kuraigakure")
							KuraiCash += P.Rent
					else
						src<<"You couldn't pay your rent and lost your home!"
						P.Renter = null
						P.Password = "Orozisaurus"
						P.Rentable = 1
			spawn(12000)
			src.SalaryPay()


mob
	var
		Salary = 50
		Buffed = 0

mob/var/perkmaster=0
mob/var/katra=300
mob/var/maxkatra=300

mob/verb
	Admin_Help(msg as message)
		if(msg=="")
			return
		var/thetext=copytext(msg,1,350)
		if(!usr.Admin)
			usr << output("<i><font color=[usr.OOCFont]>(<font color = red><b>ADMIN HELP</b><font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = black>[displaykey]<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = black>[usr.name]<font color=[usr.OOCFont]>)<font color=black>: [html_encode(thetext)]</i>","World.OOC")
		for(var/mob/M in world)
			if(M.Admin)
				if(M.OOCAH)
					M << output("<i><font color=[usr.OOCFont]>(<font color = red><b>ADMIN HELP</b><font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = black>[displaykey]<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = black>[usr.name]<font color=[usr.OOCFont]>)<font color=black>: [html_encode(thetext)]</i>","AdminPanel.AC")
					M << output("<font color=[usr.OOCFont]>><a href=?src=\ref[src];action=respond>Respond</a>","AdminPanel.AC")
					winset(M, "World","flash=-1")



mob/var/senserange = 0



mob/verb/StatPoints2(T as text)
	set name=".UpBuff"
	set hidden=1

//	if(type in list("Strength","Endurance","NewStr","Resistance","Force","Speed","Offense","Reflex","Intel", "ManaSpirit","Enchantment", "Stamina", "Kicon"))


//		if(type=="NewStr")
	if(T == "Strength")
		var/addd = input("How many points do you wish to put towards Strength?")as num
		winset(src, "NewStr", "text=[addd]")

	if(T == "Taijutsu")
		var/addd = input("How many points do you wish to put towards the Buff's Taijutsu?")as num
		winset(src, "NewTai", "text=[addd]")

	if(T == "Endurance")
		var/addd = input("How many points do you wish to put towards the Buff's Endurance?")as num
		winset(src, "NewEnd", "text=[addd]")

	if(T == "Defense")
		var/addd = input("How many points do you wish to put towards the Buff's Nin Def?")as num
		winset(src, "NewDef", "text=[addd]")

	if(T == "Ninjutsu")
		var/addd = input("How many points do you wish to put towards the Buff's Ninjutsu?")as num
		winset(src, "NewNin", "text=[addd]")

	if(T == "Control")
		var/addd = input("How many points do you wish to put towards the Buff's Control?")as num
		winset(src, "NewCon", "text=[addd]")

	if(T == "Chakra")
		var/addd = input("How much chakra will the buff give?")as num
		winset(src, "NewChakra", "text=[addd]")

	if(T == "Stamina")
		var/addd = input("How much stamina will the buff give?")as num
		winset(src, "NewStamina", "text=[addd]")

	if(T== "Reflex")
		var/addd = input("How many points do you wish to put towards the Buff's Reflex?")as num
		winset(src, "NewRflx", "text=[addd]")

	if(T == "Intel")
		var/addd = input("How many points do you wish to put towards the Buff's Intel?")as num
		winset(src, "NewIntel", "text=[addd]")

	if(T == "Genjutsu")
		var/addd = input("How many points do you wish to put towards the Buff's Genjutsu?")as num
		winset(src, "NewGen", "text=[addd]")

	if(T == "GenjutsuRes")
		var/addd = input("How many points do you wish to put towards the Buff's Genjutsu Resistance?")as num
		winset(src, "NewGenRes", "text=[addd]")

	if(T == "Speed")
		var/addd = input("How many points do you wish to put towards the Buff's Speed?")as num
		winset(src, "NewSpe", "text=[addd]")

	if(T == "AttackSpeed")
		var/addd = input("How many points do you wish to put towards the Buff'Attack Speed?")as num
		winset(src, "NewAS", "text=[addd]")

	if(T == "Name")
		var/addd = input("What's the buff name?")as text
		winset(src, "NewName", "text=[addd]")

	if(T == "Type")
		var/add = input("What type is it?") in list ("Genjutsu", "Ninjutsu", "Fuuinjutsu", "Taijutsu", "Doujutsu", "Senjutsu", "Kenjutsu", "Medical")
		winset(src, "NewType", "text=[add]")

//	winset(src, "NewGen", "text=[addd]")
//	winset(src, "NewGenRes", "text=[addd]")


mob/verb/StatPoints()
	set name=".Finalize"
	set hidden=1
	var/mob/V = input("Which Mob?") as mob in world
	if(!V.client)
		return

	if(!V.key)
		return

	var/obj/Custom/Blank_Buff/N = new(V)
//	var/mob/V = input("Which Mob?") as mob in world
	N.GChak = text2num(winget(src, "NewChakra", "text"))
	N.GStam = text2num(winget(src, "NewStamina", "text"))
	N.Gnin = text2num(winget(src, "NewNin", "text"))
//	N.Gsense = 50
	N.Ggen = text2num(winget(src, "NewGen", "text"))
	N.Gtai = text2num(winget(src, "NewTai", "text"))
	N.Gcon = text2num(winget(src, "NewCon", "text"))
	N.Gint = text2num(winget(src, "NewInt", "text"))
	N.Gref = text2num(winget(src, "NewRflx", "text"))
	N.Gspd = text2num(winget(src, "NewSpe", "text"))
	N.Gstr = text2num(winget(src, "NewStr", "text"))
	N.Gdef = text2num(winget(src, "NewDef", "text"))
	N.Gdur = text2num(winget(src, "NewEnd", "text"))
	N.Gatkspd = text2num(winget(src, "NewAS", "text"))
	N.name = winget(src, "NewName", "text")
	N.jut = winget(src, "NewType", "text")
	N.description = input(usr,"Edit!","[N] Description", "[N.desc]") as message


//	var/mob/V = input("Which Mob?") as mob in world



//	winset(src, "NewStr", "text")
//	winset(src, "NewTai", "text]")
//	winset(src, "NewEnd", "text=[addd]")
//	winset(src, "NewDef", "text=[addd]")
//	winset(src, "NewNin", "text=[addd]")
//	winset(src, "NewCon", "text=[addd]")
//	winset(src, "NewChakra", "text=[addd]")
//	winset(src, "NewStamina", "text=[addd]")
//	winset(src, "NewRflx", "text=[addd]")
//	winset(src, "NewInt", "text=[addd]")
//	winset(src, "NewGen", "text=[addd]")
//	winset(src, "NewGenRes", "text=[addd]")
//	winset(src, "NewSpe", "text=[addd]")
//	winset(src, "NewAS", "text=[addd]")


mob/perkmaster/verb
	Set_Boosts()
		set category="Perk Master"
		for(var/obj/Custom/Blank_Buff/A in world)
			A.BOOST = 20
		world<<"[usr] has set all Buff Boosts."

	Give_Perk(mob/M in world)
		set category="Perk Master"
		var/choice = input("What perk would you like to give?")in typesof(/obj/Perk/) + "Cancel"
		M.contents += new choice
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the perk [choice]."
		SaveLogs()

	Give_Custom_Perk(mob/M in world)
		set category="Perk Master"
		var/C=input("Please Name The Perk You Would Like To Give To [usr]")as text
		var/B=input("Please Give A Description To The Perk You Would Like To Give To [usr]")as message
		var/D=input("Please State The Tier Of The Perk You Would Like To Give To [usr]")as num
		var/obj/Perk/Blank_Perk/E=new(M)
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the perk [C]."
		SaveLogs()
		E.name=C
		E.description=B
		E.tier=D
		var/F=input("Can this perk go beyond its current tier?") in list("Yes","No")
		if(F=="Yes")
			return
		if(E=="No")
			if(E.tier==1)
				E.canttier2=0
			if(E.tier==2)
				E.canttier3=0
			if(E.tier==3)
				E.canttier4=0
			if(E.tier==4)
				E.canttier5=0

	Give_Custom_Weapon(mob/M in world)
		set category="Perk Master"
		var/C=input("Please Name The Weapon You Would Like To Give To [usr]")as text
		var/B=input("Please Give A Description To The Weapon You Would Like To Give To [usr]")as text
		var/D=input("Please State The Tier Of The Weapon You Would Like To Give To [usr]")as num
		var/obj/Perk/Blank_Perk/E=new(M)
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the weapon [C]."
		SaveLogs()
		E.name=C
		E.description=B
		E.tier=D
		var/F=input("Can this weapon go beyond its current tier?") in list("Yes","No")
		if(F=="Yes")
			return
		if(E=="No")
			if(E.tier==1)
				E.canttier2=0
			if(E.tier==2)
				E.canttier3=0
			if(E.tier==3)
				E.canttier4=0
			if(E.tier==4)
				E.canttier5=0







	Give_Custom_Jutsu(mob/M in world)
		set category="Perk Master"


		var/C=input("Please Name The Jutsu You Would Like To Give To [usr]")as text
		var/B=input("Please Give A Description To The Jutsu You Would Like To Give To [usr]")as message
		var/D=input("How much does this jutsu drain?")as num
		var/F=input("How skilled is [usr] with this jutsu?","New, Novice, Expert, Veteran, Mastered")as text
		var/H=input("What type of jutsu is this?","Genjutsu,Taijutsu,Ninjutsu")as text
		var/G=input("What Rank Is This Jutsu?","E,D,C,B,A,S")as text
		var/I=input("What is the Element of this Jutsu?","Put Elementless if it has none.") as text
		var/J=input("Does this drain Chakra or Stamina?","Pick one.")in list("Chakra","Stamina")
		var/K=input("Is this a Kekkei Genkai Based Jutsu?","Pick.")in list("Yes","No")
		var/L=input("How many handseals does this jutsu have?")as num
		var/T=input("How long of a cooldown?")as num
		var/obj/Custom/Blank_Jutsu/E=new(M)
		E.name=C
		E.description=B
		E.dran=D
		E.skil=F
		E.jut=H
		E.ran=G
		E.ele=I
		E.idran=J
		E.hseal=L
		E.cd=T
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the Custom Jutsu [C]."
		SaveLogs()
		if(K=="Yes")
			E.Kekkei = 1



	Give_Custom_JutsuToSummon(obj/O in world)
		set category="Perk Master"
		var/C=input("Please Name The Jutsu You Would Like To Give To [usr]")as text
		var/B=input("Please Give A Description To The Jutsu You Would Like To Give To [usr]")as text
		var/D=input("How much does this jutsu drain?")as num
		var/F=input("How skilled is [usr] with this jutsu?","New, Novice, Expert, Veteran, Mastered")as text
		var/H=input("What type of jutsu is this?","Genjutsu,Taijutsu,Ninjutsu")as text
		var/G=input("What Rank Is This Jutsu?","E,D,C,B,A,S")as text
		var/I=input("What is the Element of this Jutsu?","Put Elementless if it has none.") as text
		var/J=input("Does this drain Chakra or Stamina?","Pick one.")in list("Chakra","Stamina")
		var/K=input("Is this a Kekkei Genkai Based Jutsu?","Pick.")in list("Yes","No")
		var/obj/Custom/Blank_Jutsu/E=new(O)
		E.name=C
		E.description=B
		E.dran=D
		E.skil=F
		E.jut=H
		E.ran=G
		E.ele=I
		E.idran=J
		Admin_Logs+="<br>[usr]([usr.key]) has given [O] the Custom Jutsu [C]."
		SaveLogs()
		if(K=="Yes")
			E.Kekkei = 1

//	Give_Custom_Equipment(mob/M in world)
//		set category = "Perk Master"
///		var/A=input("Please Name the Custom Equipment that you are giving [usr]")as text
	//	var/B=input("Please Describe the Custom Equipment.")as text
//		var/D=input("How much ninjutsu will this Equipment give?")as num
//		var/E=input("How much genjutsu will this Equipment give?")as num
//		var/F=input("How much taijutsu will this Equipment give?")as num
//		var/G=input("How much control will this Equipment give?")as num
//		var/H=input("How much intelligence will this Equipment give?")as num
//		var/I=input("How much reflex will this Equipment give?")as num
//		var/J=input("How much speed will this Equipment give?")as num
//		var/K=input("How much strength will this Equipment give?")as num
//		var/L=input("How much Defense will this Equipment give?")as num
//		var/T=input("How much durability will this Equipment give?")as num
//		var/U=input("How much attack speed with this Equipment give?")as num
//		var/obj/Custom_Equipment/N=new(M)
//		N.name = A
//		N.ziNin = D
///		N.ziGen = E
	//	N.ziTai = F
//		N.ziCon = G
//		N.ziInt = H
//		N.ziRef = I
//		N.ziSpd = J
//		N.ziStr = K
//		N.ziDef = L
//		N.ziDur = T
//		N.ziAtkspd = U
//		N.description = B
	Give_Custom_Buff()
		set category = "Perk Master"
		winshow(src, "RewardStats", 1)
//		var/obj/Custom/Blank_Buff/N = new //=new(M)



	//	winset(src,"StatPoints","text=[StatPoints]")
//		winset(src,"BuffStr","text=[N.Gstr]")
//		winset(src,"BuffEnd","text=[N.Gdur]")
//		winset(src,"BuffSpd","text=[N.Gspd]")
//		winset(src,"BuffNin","text=[N.Gnin]")
//		winset(src,"BuffCon","text=[N.Gcon]")
//		winset(src,"BuffAs","text=[N.Gatkspd]")
//		winset(src,"BuffRflx","text=[N.Gref]")
//		winset(src,"BuffNinDef","text=[N.Gdef]")
//		winset(src,"BuffInt","text=[N.Gint]")
//		winset(src,"BuffTai","text=[N.Gtai]")


		//	N.GChak = -50
		//	N.GStam = 0
		//	N.Gnin = 0.54
		//	N.Gsense = 50
		//	N.Ggen = 2.75
		//	N.Gtai = 3.05
		//	N.Gcon = 1.00
		//	N.Gint = 1.00
		//	N.Gref = 1.55
		//	N.Gspd = 0.54
		//	N.Gstr = 0.54
		//	N.Gdef = 1.55
		//	N.Gdur = 0.54
		///	N.Gatkspd = 0.55

//		winset(src,"LabelRewardManaForce","text=[ManaSpirit * PManaSpiritMod]")
//		winset(src,"LabelRewardIntel","text=[Intelligence * Intel]")

	//	var/A=input("Please Name the Custom Buff that you are giving [usr]")as text
	//	var/B=input("How much chakra will this buff give?")as num
	//	var/C=input("How much stamina will this buff give?")as num
	//	var/D=input("How much ninjutsu will this buff give?")as num
	//	var/E=input("How much genjutsu will this buff give?")as num
	//	var/F=input("How much taijutsu will this buff give?")as num
	//	var/G=input("How much control will this buff give?")as num
	//	var/H=input("How much intelligence will this buff give?")as num
	//	var/I=input("How much reflex will this buff give?")as num
	//	var/J=input("How much speed will this buff give?")as num
	//	var/K=input("How much strength will this buff give?")as num
	//	var/L=input("How much Defense will this buff give?")as num
	//	var/GR=input("How much genresistence will this buff give?")as num
	//	var/T=input("How much durability will this buff give?")as num
	//	var/U=input("How much attack speed with this buff give?")as num
	//	var/O=input("Is this Buff a sensory Buff?")in list("Yes","No")
	//	var/P=input("Is this Buff Sharingan?")in list("Yes","No")
	//	var/Q=input("Is this Buff Byakugan?")in list("Yes","No")
	//	var/S=input("And Finally, Give it a description.")as text
	//	var/obj/Custom/Blank_Buff/N=new(M)
	//	N.name = A
	//	if(O=="Yes")
	//		var/R=input("How far of a sensing range in blocks does this buff give?")as num
	//		N.Gsense = R
	//		N.jut = "Ninjutsu"
	//		N.Sensory = 1
	//	if(P=="Yes")
	//		N.Sharingan = 1
	//		N.icon = 'SkillCard.dmi'
	//		N.jut = "Doujutsu"
	//		var/Z = input("What tier of Sharingan?") in list("One","Two","Three","Mangekyou")
	//		if(Z=="One")
	//			N.icon_state = "Sharingan1"
	//			N.GChak = -150
	//			N.GStam = 0
	//			N.Gnin = 0.23
	//			N.Ggen = 1.01
	//			N.Gtai = 1.12
	//			N.Gcon = 0.45
	//			N.Gint = 0.32
	//			N.Gref = 1.14
	//			N.Gspd = 0.12
	//			N.Gstr = 0.09
	//			N.Gdef = 0.67
	//			N.Gdur = 0.02
	//			N.Gatkspd = 0.42
	//			N.description = S
	//			N.jut = "Doujutsu"
	//			return
	//		if(Z=="Two")
	//			N.icon_state = "Sharingan2"
	//			N.GChak = -215
	//			N.GStam = -150
	//			N.Gnin = 0.46
	//			N.Ggen = 2.02
	//			N.Gtai = 2.24
	//			N.Gcon = 0.90
	//			N.Gint = 0.64
	//			N.Gref = 2.28
	//			N.Gspd = 0.24
	//			N.Gstr = 0.18
	//			N.Gdef = 1.24
	//			N.Gdur = 0.04
	//			N.Gatkspd = 0.82
	//			N.description = S
	//			N.jut = "Doujutsu"
	//			N.SharinganCopyy = 1
	//			return
	//		if(Z=="Three")
	//			N.icon_state = "Sharingan3"
	//			N.GChak = -320
	//			N.GStam = -200
	//			N.Gnin = 0.92
	//			N.Ggen = 4.04
	//			N.Gtai = 4.48
	//			N.Gcon = 1.80
	//			N.Gint = 1.28
	//			N.Gref = 4.56
	//			N.Gspd = 0.48
	//			N.Gstr = 0.36
	//			N.Gdef = 2.48
	//			N.Gdur = 0.08
	//			N.Gatkspd = 1.64
	//			N.description = S
	//			N.jut = "Doujutsu"
	//			N.SharinganCopyy = 1
	//			return
	//		if(Z=="Mangekyou")
	//			var/rando = rand(1,4)
	//			if(rando==1)
	//				N.icon_state = "Itachi"
	//				N.GChak = -455
	//				N.GStam = -200
	//				N.Gnin = 0.92
	//				N.Ggen = 8.08
	///				N.Gtai = 4.48
		//			N.Gcon = 1.80
		//			N.Gint = 1.28
		//			N.Gref = 4.56
		//			N.Gspd = 0.48
		//			N.Gstr = 0.36
		//			N.Gdef = 2.48
		//			N.Gdur = 0.08
		//			N.Gatkspd = 1.64
		//			N.description = S
		//			N.jut = "Doujutsu"
		//			N.SharinganCopyy = 1
		//			return
		//		if(rando==2)
		//			N.icon_state = "Izuna"
		//			N.GChak = -555
		//			N.GStam = -200
		//			N.Gnin = 4.85
		//			N.Ggen = 4.04
		//			N.Gtai = 4.48
		//			N.Gcon = 1.80
		//			N.Gint = 1.28
		//			N.Gref = 4.56
		//			N.Gspd = 0.48
		//			N.Gstr = 0.36
		//			N.Gdef = 2.48
		//			N.Gdur = 0.08
		//			N.Gatkspd = 1.64
		//			N.description = S
		//			N.jut = "Doujutsu"
		//			N.SharinganCopyy = 1
		//			return
		//		if(rando==3)
		//			N.icon_state = "Madara"
		//			N.GChak = -666
		//			N.GStam = -200
		//			N.Gnin = 3.25
		//			N.Ggen = 5.04
		//			N.Gtai = 4.48
		//			N.Gcon = 1.80
		//			N.Gint = 1.28
		//			N.Gref = 8.56
		//			N.Gspd = 0.48
		//			N.Gstr = 0.36
		//			N.Gdef = 2.48
		//			N.Gdur = 0.08
		//			N.Gatkspd = 1.64
		//			N.description = S
		///			N.jut = "Doujutsu"
			///		N.SharinganCopyy = 1
				//	return
		//		if(rando==4)
		//			N.icon_state = "Kakashi"
		///			N.GChak = -555
			//		N.GStam = -200
			//		N.Gnin = 8.54
			//		N.Ggen = 4.04
			//		N.Gtai = 4.48
			//		N.Gcon = 3.45
			//		N.Gint = 1.28
			//		N.Gref = 4.56
			//		N.Gspd = 0.48
			//		N.Gstr = 0.36
			//		N.Gdef = 2.48
			//		N.Gdur = 0.08
			//		N.Gatkspd = 1.64
			//		N.description = S
			///		N.jut = "Doujutsu"
			//		N.SharinganCopyy = 1
			//		return
		//if(Q=="Yes")
		//	N.Byakugan = 1
		//	N.icon = 'SkillCard.dmi'
		//	N.icon_state = "Byakugan"
		//	N.GChak = -50
		//	N.GStam = 0
		//	N.Gnin = 0.54
		//	N.Gsense = 50
		//	N.Ggen = 2.75
		//	N.Gtai = 3.05
		//	N.Gcon = 1.00
		//	N.Gint = 1.00
		//	N.Gref = 1.55
		//	N.Gspd = 0.54
		//	N.Gstr = 0.54
		//	N.Gdef = 1.55
		//	N.Gdur = 0.54
		///	N.Gatkspd = 0.55
		//	/N.description = S
	//		N.jut = "Doujutsu"
	//		return
	//	N.GChak = B
//		N.GStam = C
//		N.Gnin = D
//		N.Ggen = E
//		N.Gtai = F
//		N.Gcon = G
//		N.Gint = H
///		N.Gref = I
	//	N.Gspd = J
//		N.Gstr = K
//		N.Gdef = L
//		N.Gdur = T
//		N.Ggenres = GR
//		N.Gatkspd = U
//		N.description = S
//		N.jut = "Ninjutsu"
	//	Admin_Logs+="<br>[usr]([usr.key]) has given [M] the Custom Buff [N.name]."
		SaveLogs()



/*
	Show_Admin_Help()
		set category = "Admin"
		if(AHon)
			winshow(src,"AH",0)
			AHon=0
		else
			winshow(src,"AH",1)
			AHon=1
*/

	Give_RPP(mob/M in world)
		set category="Admin"
		var/amount = input("How many RPP would you like to give [M]?") as num
		M.RPP += amount

	Give_LC(mob/M in world)
		set category="Admin"
		var/LC = input("Enter the date of LC")as text
		M.Lclog=LC
		var/amount = input("How muchh RPP would you like to give [M]") as num
		M.RPP += amount
		M.JRPP += amount/2

	Give_JRPP(mob/M in world)
		set category="Admin"
		var/amount = input("How many JRPP would you like to give [M]?") as num
		M.JRPP += amount



mob/Admin3/verb
	//Give_Gene_Or_Illness(mob/M in world)
	//	set category="Perk Master"
	//	var/choice = input("What Gene or Illness would you like to give?")in typesof(/obj/Gene/) + typesof(/obj/Illness) + "Cancel"
	//	M.contents += new choice
	//	Admin_Logs+="<br>[usr]([usr.key]) has given [M] the Gene or Illness [choice]."
	//	SaveLogs()

	//Give_Injury(mob/M in world)
	//	set category="Perk Master"
	//	var/A = input("What will you name the Injury?")as text
	//	var/B = input("What will be the details of the Injury?")as text
	//	var/obj/Injury/Blank_Injury/N=new(M)
	//	N.name = A
	//	N.suffix = B
	//	usr<<"You now need to edit the injury in the individual's inventory and set the stat deficits to match the injury's severity and drawbacks."
	//	Admin_Logs+="<br>[usr]([usr.key]) has given [M] the injury [N.name]."
	//	SaveLogs()

	Give_Custom_Blank_Gene(mob/M in world)
		set category="Perk Master"
		var/A = input("What will you name the Custom Gene?")as text
		var/B = input("What will be the details of the Custom Gene?")as text
		var/obj/Gene/N=new(M)
		N.name = A
		N.suffix = B
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the custom Gene [N.name]."
		SaveLogs()


	Edit_Skill_Rank(mob/M in world)
		set category="Perk Master"
		var/R=input("Please Enter The Rank Letter Followed by Plus(+) or Minus(-)")as text
		M.srank=R
		Admin_Logs+="<br>[usr]([usr.key]) has editted [M]'s Skill Rank to [R]."
		SaveLogs()

//By using wind-based chakra, the user can infuse their bladed weapons with it from a distance and manipulate them.


mob/verb
	Spend_RPP()
		var/Q = input("How would you like to spend your RPP?") in list("Perk Advancement","Salary Increase","New Perk","New Jutsu", "New Buff","Clan Setup","Cancel")
		if(Q=="Perk Advancement")
			var/list/O = new/list
			for(var/obj/Perk/P in usr.contents)
				O.Add(P)
			var/obj/Perk/Z = input("Which perk would you like to spend RPP on?") in O
			var/amount = input("How much RPP?") as num
			if(abs(amount) > usr.RPP)
				usr<<"You don't have enough RPP..."
				return
			if(abs(amount) == 0)
				usr<<"Stop your shit..."
				Admin_Logs+="<br>[usr] tried to bug abuse! Abuse!</font></big>"
				return
			else
				usr.RPP -= abs(amount)
				Z.RPPSpent += abs(amount)
				Z.RPPCheck()
				usr<<"You have [usr.RPP] Roleplay points left."

		/*if(Q=="Jutsu Advancement")
			var/Advancing = 1
			var/list/O = new/list
			for(var/obj/Custom/C in usr.contents)
				O.Add(C)
			var/obj/Custom/Z = input("Which Jutsu would you like to spend RPP on?") in O
			var/amount = input("How much RPP?") as num
			if(abs(amount) > usr.RPP)
				usr<<"You dont have that much RPP..."
				return
			else
				if(Advancing == 1)
					var/StudyTime = locate(/obj/Perk/Studious_1/) in usr.contents
					if(StudyTime)
						for(var/obj/Perk/Studious_1/B in usr.contents)
							if(B.tier == 1)
								usr.RPP += abs(amount)/8
								usr<<"You have been refunded [abs(amount)/8] Roleplay Points."
							if(B.tier == 2 )
								usr.RPP += abs(amount)/4
								usr<<"You have been refunded [abs(amount)/4] Roleplay Points."
							if(B.tier == 3 )
								usr.RPP += abs(amount)/2
								usr<<"You have been refunded [abs(amount)/2] Roleplay Points."
							if(B.tier == 4 )
								usr.RPP += abs(amount)/1.5
								usr<<"You have been refunded [abs(amount)/1.5] Roleplay Points."



					var/Perked = locate(/obj/Perk/)in usr.contents
					if(Perked)
						for(var/obj/Perk/A in usr.contents)
							if(findtext(A.name,"Elemental Training [Z.ele]"))
								Z.RPPSpent += abs(amount*1.5)
								Z.RPPSpend()
								usr.RPP -= abs(amount)
								usr<<"You have [usr.RPP] Roleplay Points left."
								Advancing = 0



							if(findtext(A.name,"Elemental Anomaly [Z.ele]"))
								Z.RPPSpent += abs(amount*2)
								Z.RPPSpend()
								usr.RPP -= abs(amount)
								usr<<"You have [usr.RPP] Roleplay Points Left."
								Advancing = 0

							else
								Z.RPPSpent += abs(amount)
								Z.RPPSpend()
								usr.RPP -= abs(amount)
								usr<<"You have [usr.RPP] Roleplay Points left."
								Advancing = 0
								return

					else
						Z.RPPSpent += abs(amount)
						Z.RPPSpend()
						usr.RPP -= abs(amount)
						usr<<"You have [usr.RPP] Roleplay Points left."
						Advancing = 0





				Advancing = 0
				*/










		/*if(Q=="Salary Increase")
			var/P = input("Spend 10,000 Yen to increase your salary by a random amount between  and 700?") in list ("Yes","No")
			if(P=="Yes")
				if(usr.ckey == "Chopius_Chaos"&&usr.Yen>=50)
					usr.Yen -= 50
					var/rando=rand(200,500)
					usr.Salary += rando
					usr<<"Your salary has increased by [rando]."
					return
				if(usr.Yen>=2000)
					usr.Yen -= 2000
					var/rando=rand(250,700)
					usr.Salary += rando
					usr<<"Your salary has increased by [rando]."
					return
			if(P=="No")
				return
				*/

		if(Q=="Salary Increase")
			var/P = input("How much would you like to spend to increase your salary") in list ("10,000","100,000","1,000,000","10,000,000","None")
			if(P=="10,000")
				if(usr.Yen>=10000)
					usr.Yen -= 10000
					usr.Salary += 10
					usr<<"Your salary has increased by 10!"
			if(P=="100,000")
				if(usr.Yen>=100000)
					usr.Yen -= 100000
					usr.Salary += 105
					usr<<"Your salary has increased by 105!"
			if(P=="1,000,000")
				if(usr.Yen>=1000000)
					usr.Yen -= 1000000
					usr.Salary += 1100
					usr<<"Your salary has increased by 1,100!"
			if(P=="10,000,000")
				if(usr.Yen>=10000000)
					usr.Yen -= 10000000
					usr.Salary += 11500
					usr<<"Your salary has increased by 11,500!"
					return
			if(P=="None")
				return

		if(Q=="New Perk")
			usr.debug_database()
			/*var/Perk = input("Which perk would you like to purchase?","Buy a Perk!")in list("Strength","Hand Seal Speed","Reflex","Speed","Body","Stamina","Adrenaline Focus","Innate Sensing","Mind","Sight","Studious","Chakra","Hearing","Attack Speed","Chakra Control","Smell","Karate","Ninjutsu Defense","Marksman","Cancel")
			if(usr.RPP >= 1000)
				var/list/O = new/list
				for(var/obj/Perk/P in usr.contents)
					O.Add(P)
				if(findtext("[usr.srank]","D"))
					if(O.len>=10)
						return
				if(findtext("[usr.srank]","C"))
					if(O.len>=20)
						return
				if(findtext("[usr.srank]","B"))
					if(O.len>=30)
						return
				if(findtext("[usr.srank]","A"))
					if(O.len>=40)
						return
				if(findtext("[usr.srank]","S"))
					if(O.len>=50)
						return

				if(Perk=="Chakra Control")
					var/obj/chakracon = locate(/obj/Perk/Chakra_Control) in usr.contents
					if(chakracon)
						usr<<"You already have a chakra control perk."
						return
					else
						usr.contents += new/obj/Perk/Chakra_Control
						usr<<"You have obtained the chakra control perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Strength")
					var/obj/strength = locate(/obj/Perk/Strength) in usr.contents
					if(strength)
						usr<<"You already have a strength perk."
						return
					else
						usr.contents += new/obj/Perk/Strength
						usr<<"You have obtained the strength perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Hand Seal Speed")
					var/obj/hsp = locate(/obj/Perk/Hand_Seal_Speed) in usr.contents
					if(hsp)
						usr<<"You already have a hand seal speed perk."
						return
					else
						usr.contents += new/obj/Perk/Hand_Seal_Speed
						usr<<"You have obtained the hand seals speed perk!"
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Reflex")
					var/obj/reflex = locate(/obj/Perk/Reflex) in usr.contents
					if(reflex)
						usr<<"You already have a reflex perk."
						return
					else
						usr.contents += new/obj/Perk/Reflex
						usr<<"You have obtained the reflex perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Speed")
					var/obj/speed = locate(/obj/Perk/Speed) in usr.contents
					if(speed)
						usr<<"You already have a speed perk."
						return
					else
						usr.contents += new/obj/Perk/Speed
						usr<<"You have obtained the Speed perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Body")
					var/obj/Body = locate(/obj/Perk/Body) in usr.contents
					if(Body)
						usr<<"You already have a Body perk."
						return
					else
						usr.contents += new/obj/Perk/Body
						usr<<"You have obtained the body perk. You can feel your body reacting already."
						viewers() << output("<font color=[usr.SayFont]>[usr]([usr.rank2] [usr.srank]) says<font color = white>: My body is ready...","World.IC")
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Stamina")
					var/obj/Stamina = locate(/obj/Perk/Stamina) in usr.contents
					if(Stamina)
						usr<<"You already have a Stamina perk."
						return
					else
						usr.contents += new/obj/Perk/Stamina
						usr<<"You have obtained the Stamina perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Adrenaline Focus")
					var/obj/AD = locate(/obj/Perk/Adrenaline_Focus) in usr.contents
					if(AD)
						usr<<"You already have a Adrenaline Focus perk."
						return
					else
						usr.contents += new/obj/Perk/Adrenaline_Focus
						usr<<"You have obtained the Adrenaline Focus perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Innate Sensing")
					var/obj/Sense = locate(/obj/Perk/Innate_Sensing) in usr.contents
					if(Sense)
						usr<<"You already have a Sensing perk."
						return
					else
						usr.contents += new/obj/Perk/Innate_Sensing
						usr<<"You have obtained the Innate Sensing perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Mind")
					var/obj/Mind = locate(/obj/Perk/Mind) in usr.contents
					if(Mind)
						usr<<"You already have a Mind perk."
						return
					else
						usr.contents += new/obj/Perk/Mind
						usr<<"You have obtained the Mind perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Sight")
					var/obj/Sight = locate(/obj/Perk/Sight) in usr.contents
					if(Sight)
						usr<<"You already have a Sight perk."
						return
					else
						usr.contents += new/obj/Perk/Sight
						usr<<"You have obtained the Sight perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Studious")
					var/obj/Study = locate(/obj/Perk/Studious_1) in usr.contents
					if(Study)
						usr<<"You already have a Studious perk."
						return
					else
						usr.contents += new/obj/Perk/Studious_1
						usr<<"You have obtained the Studious perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Chakra")
					var/obj/Chakra = locate(/obj/Perk/Chakra) in usr.contents
					if(Chakra)
						usr<<"You already have a Chakra perk."
						return
					else
						usr.contents += new/obj/Perk/Chakra
						usr<<"You have obtained the Chakra perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Hearing")
					var/obj/Hear = locate(/obj/Perk/Hearing) in usr.contents
					if(Hear)
						usr<<"You already have a Hearing perk."
						return
					else
						usr.contents += new/obj/Perk/Hearing
						usr<<"You have obtained the Hearing perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()

				if(Perk=="Smell")
					var/obj/Smell = locate(/obj/Perk/Smell) in usr.contents
					if(Smell)
						usr<<"You already have a Smell perk."
						return
					else
						usr.contents += new/obj/Perk/Smell
						usr<<"You have obtained the Smell perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Attack Speed")
					var/obj/Aspd = locate(/obj/Perk/Attack_Speed) in usr.contents
					if(Aspd)
						usr<<"You already have the attack speed perk."
						return
					else
						usr.contents += new/obj/Perk/Attack_Speed
						usr<<"You have obtained the Attack Speed perk."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Karate")
					var/obj/Karate = locate(/obj/Perk/Karate) in usr.contents
					if(Karate)
						usr<<"You already have a Karate perk."
						return
					else
						usr.contents += new/obj/Perk/Karate
						usr<<"You have obtained the Karate perk. Hiya!"
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Ninjutsu Defense")
					var/obj/NinjutsuDefense = locate(/obj/Perk/Ninjutsu_Defense) in usr.contents
					if(NinjutsuDefense)
						usr<<"You already have a Ninjutsu Defense perk dumbass trickin ass bitch"
						return
					else
						usr.contents += new/obj/Perk/Ninjutsu_Defense
						usr<<"You have obtained the Ninjutsu defense perk. You feel ready to leap right into oncoming jutsu!"
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Marksman")
					var/obj/Marksman = locate(/obj/Perk/Marksman) in usr.contents
					if(Marksman)
						usr<<"You already have a Marksman perk you dumbass trickin ass bitch"
						return
					else
						if(locate(/obj/Perk/Sight) in usr.contents)
							for(var/obj/Perk/Sight/S in usr.contents)
								if(S.tier>=2)
									usr.contents += new/obj/Perk/Marksman
									usr<<"You have obtained the Marksman perk. Your aim sure has improved!"
									usr.RPP -= 1000
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You dont meet the requirements for this perk."*/


		if(Q=="New Buff")
			var/varBuff
			var/A=input("You want a buff?", "Learn Buff") in list("Ninjutsu","Taijutsu","Clan","Cancel")
			if(A=="Taijutsu")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Taijutsu Buff?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varBuff=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Blank_Buff/Taijutsu/Drank) + list("Cancel")
						if(usr.JRPP>= 500 && !locate(/obj/Perk/Anomaly)in usr.contents )
							usr.contents += new varBuff
							usr.JRPP -=500
							if(locate(/obj/Perk/Anomaly)in usr.contents && usr.JRPP >= 250)
								usr.JRPP -= 250
								usr.contents += new varBuff
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varBuff=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Blank_Buff/Taijutsu/Crank) + list("Cancel")
						if(usr.JRPP>= 500)
							usr.contents += new varBuff
							usr.JRPP -= 500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 325
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varBuff=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Blank_Buff/Taijutsu/Brank) + list("Cancel")
						if(usr.JRPP>= 1500)
							usr.contents += new varBuff
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 475
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varBuff=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Blank_Buff/Taijutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2500)
							usr.contents += new varBuff
							usr.JRPP -= 2500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 600
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varBuff=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Blank_Buff/Taijutsu/Srank) + list("Cancel")
						if(usr.JRPP>= 2000)
							usr.contents += new varBuff
							usr.JRPP -= 2000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////CLAN JUTSU////////////////////////////////////////////////////////////////////////////////////////////////////////

			if(A=="Clan")
				var/Clan=input("What Clan","Pick Clan") in list("Uchiha","Senju","Hyuuga","Chinoike","Nara","Aburame","Akimichi","Inuzuka","Yamanaka","Hozuki","Yuki","Hoshigaki","Kaguya","Sabaku","Cancel")
				if(Clan=="Hyuuga")
					if(usr.Hyuuga == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Hyuuga/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varBuff
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Hyuuga/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varBuff
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Hyuuga/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varBuff
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Hyuuga/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varBuff
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Hyuuga/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varBuff
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You are not apart of the Hyuuga clan!!"


				if(Clan=="Akimichi")
					if(usr.Akimichi == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Akimichi/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varBuff
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Akimichi/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varBuff
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Akimichi/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varBuff
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Akimichi/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varBuff
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Akimichi/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varBuff
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You are not apart of the Akimichi clan!!"


				if(Clan=="Inuzuka")
					if(usr.Inuzuka == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Inuzuka/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varBuff
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Inuzuka/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varBuff
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Inuzuka/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varBuff
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Inuzuka/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varBuff
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Inuzuka/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varBuff
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You are not apart of the Inuzuka clan!!"


				if(Clan=="Kaguya")
					if(usr.Kaguya == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Kaguya/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varBuff
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Kaguya/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varBuff
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Kaguya/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varBuff
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Kaguya/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varBuff
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varBuff=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Blank_Buff/Clan/Kaguya/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varBuff
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You are not apart of the Kaguya clan!!"
////////////////////////////////////END OF CLAN JUTSU ////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////SEALING JUTSU/////////////////////////////////////////////////////////////////////////////////////////////////////////
		if(Q=="New Jutsu")
			var/varJutsu
			var/A=input("What Type of Jutsu?","Learn Jutsu") in list("Ninjutsu","Taijutsu","Genjutsu","Fuuinjutsu","Kenjutsu","Medical","Clan","Non-Elemental","Shurikenjutsu","Village Uniques","Buff","Cancel")
			if(A=="Fuuinjutsu")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Fuuinjutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Drank) + list("Cancel")
						if(usr.JRPP>= 250 && !locate(/obj/Perk/Anomaly)in usr.contents )
							usr.contents += new varJutsu
							usr.JRPP -=250
							if(locate(/obj/Perk/Anomaly)in usr.contents && usr.JRPP >= 250)
								usr.JRPP -= 250
								usr.contents += new varJutsu
							if(locate(/obj/Perk/Innate_Talent_Fuuinjutsu)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Crank) + list("Cancel")
						if(usr.JRPP>= 500)
							usr.contents += new varJutsu
							usr.JRPP -= 500
							if(locate(/obj/Perk/Innate_Talent_Fuuinjutsu)in usr.contents)
								usr.JRPP += 75
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 325
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Brank) + list("Cancel")
						if(usr.JRPP>= 1500)
							usr.contents += new varJutsu
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Innate_Talent_Fuuinjutsu)in usr.contents)
								usr.JRPP += 225
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 475
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2500)
							usr.contents += new varJutsu
							usr.JRPP -= 2500
							if(locate(/obj/Perk/Innate_Talent_Fuuinjutsu)in usr.contents)
								usr.JRPP += 375
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 600
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2000)
							usr.contents += new varJutsu
							usr.JRPP -= 2000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////KENJUTSU//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			if(A=="Kenjutsu")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Kenjutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Kenjutsu/Drank) + list("Cancel")
						if(usr.JRPP>= 250 && !locate(/obj/Perk/Anomaly)in usr.contents )
							usr.contents += new varJutsu
							usr.JRPP -=250
							if(locate(/obj/Perk/Anomaly)in usr.contents && usr.JRPP >= 250)
								usr.JRPP -= 250
								usr.contents += new varJutsu
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Kenjutsu/Crank) + list("Cancel")
						if(usr.JRPP>= 500)
							usr.contents += new varJutsu
							usr.JRPP -= 500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 325
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Kenjutsu/Brank) + list("Cancel")
						if(usr.JRPP>= 1500)
							usr.contents += new varJutsu
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 475
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 225
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Kenjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2500)
							usr.contents += new varJutsu
							usr.JRPP -= 2500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 600
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 375
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Kenjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2000)
							usr.contents += new varJutsu
							usr.JRPP -= 2000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
/////////////////////////////////////////////////////////////////////////////////////////////////MEDICAL/////////////////////////////////////////////////////////////////////
			if(A=="Medical")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Medical Ninjutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Medic/Drank) + list("Cancel")
						if(usr.JRPP>= 250 && !locate(/obj/Perk/Anomaly)in usr.contents )
							usr.contents += new varJutsu
							usr.JRPP -=250
							if(locate(/obj/Perk/Anomaly)in usr.contents && usr.JRPP >= 250)
								usr.JRPP -= 250
								usr.contents += new varJutsu
							if(locate(/obj/Perk/Innate_Talent_Medical)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Medic/Crank) + list("Cancel")
						if(usr.JRPP>= 500)
							usr.contents += new varJutsu
							usr.JRPP -= 500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 325
							if(locate(/obj/Perk/Innate_Talent_Medical)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Medic/Brank) + list("Cancel")
						if(usr.JRPP>= 1500)
							usr.contents += new varJutsu
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 475
							if(locate(/obj/Perk/Innate_Talent_Medical)in usr.contents)
								usr.JRPP += 225
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Medic/Arank) + list("Cancel")
						if(usr.JRPP>= 2500)
							usr.contents += new varJutsu
							usr.JRPP -= 2500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 600
							if(locate(/obj/Perk/Innate_Talent_Medical)in usr.contents)
								usr.JRPP += 375
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Medic/Arank) + list("Cancel")
						if(usr.JRPP>= 2000)
							usr.contents += new varJutsu
							usr.JRPP -= 2000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."


			if(A=="Shurikenjutsu")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Shurikenjutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Shurikenjutsu/Drank) + list("Cancel")
						if(usr.JRPP>= 250 && !locate(/obj/Perk/Anomaly)in usr.contents )
							usr.contents += new varJutsu
							usr.JRPP -=250
							if(locate(/obj/Perk/Anomaly)in usr.contents && usr.JRPP >= 250)
								usr.JRPP -= 250
								usr.contents += new varJutsu
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Shurikenjutsu/Crank) + list("Cancel")
						if(usr.JRPP>= 500)
							usr.contents += new varJutsu
							usr.JRPP -= 500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 325
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Shurikenjutsu/Brank) + list("Cancel")
						if(usr.JRPP>= 1500)
							usr.contents += new varJutsu
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 475
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 225
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Shurikenjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2500)
							usr.contents += new varJutsu
							usr.JRPP -= 2500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 600
							if(locate(/obj/Perk/Innate_Talent_Kenjutsu)in usr.contents)
								usr.JRPP += 375
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Shurikenjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2000)
							usr.contents += new varJutsu
							usr.JRPP -= 2000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else

			if(A=="Non-Elemental")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Kenjutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Ninjutsu/Drank) + list("Cancel")
						if(usr.JRPP>= 250 && !locate(/obj/Perk/Anomaly)in usr.contents )
							usr.contents += new varJutsu
							usr.JRPP -=250
							if(locate(/obj/Perk/Anomaly)in usr.contents && usr.JRPP >= 250)
								usr.JRPP -= 250
								usr.contents += new varJutsu
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Ninjutsu/Crank) + list("Cancel")
						if(usr.JRPP>= 500)
							usr.contents += new varJutsu
							usr.JRPP -= 500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 325
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Ninjutsu/Brank) + list("Cancel")
						if(usr.JRPP>= 1500)
							usr.contents += new varJutsu
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 475
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Ninjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2500)
							usr.contents += new varJutsu
							usr.JRPP -= 2500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 600
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Ninjutsu/Arank) + list("Cancel")
						if(usr.JRPP>= 2000)
							usr.contents += new varJutsu
							usr.JRPP -= 2000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."


			if(A=="Genjutsu")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Genjutsu","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Drank) + list("Cancel")
						if(usr.JRPP>= 250)
							usr.contents += new varJutsu
							usr.JRPP -= 250
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 125
							if(locate(/obj/Perk/Innate_Talent_Genjutsu)in usr.contents)
								usr.JRPP += 37.5
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Crank) + list("Cancel")
						if(usr.JRPP>= 500)
							usr.contents += new varJutsu
							usr.JRPP -= 500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.RPP += 225
							if(locate(/obj/Perk/Innate_Talent_Genjutsu)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Brank) + list("Cancel")
						if(usr.JRPP>= 1500)
							usr.contents += new varJutsu
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 325
							if(locate(/obj/Perk/Innate_Talent_Genjutsu)in usr.contents)
								usr.JRPP += 225
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Arank) + list("Cancel")
						if(usr.RPP>= 2500)
							usr.contents += new varJutsu
							usr.RPP -= 2500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 400
							if(locate(/obj/Perk/Innate_Talent_Genjutsu)in usr.contents)
								usr.JRPP += 375
							usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Srank) + list("Cancel")
						if(usr.JRPP>= 5200)
							usr.contents += new varJutsu
							usr.JRPP -= 5200
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 600
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."

			if(A=="Taijutsu")
				usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Taijutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Drank) + list("Cancel")
						if(usr.JRPP >= 250)
							usr.contents += new varJutsu
							usr.JRPP -= 250
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 150
							if(locate(/obj/Perk/Innate_Talent_Taijutsu)in usr.contents)
								usr.JRPP += 37.5
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Crank) + list("Cancel")
						if(usr.JRPP >= 500)
							usr.contents += new varJutsu
							usr.JRPP -= 500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 250
							if(locate(/obj/Perk/Innate_Talent_Taijutsu)in usr.contents)
								usr.JRPP += 75
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Brank) + list("Cancel")
						if(usr.JRPP >= 1500)
							usr.contents += new varJutsu
							usr.JRPP -= 1500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 400
							if(locate(/obj/Perk/Innate_Talent_Taijutsu)in usr.contents)
								usr.JRPP += 225
							usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more JRPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Arank) + list("Cancel")
						if(usr.JRPP >= 2500)
							usr.contents += new varJutsu
							usr.JRPP -= 2500
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.JRPP += 500
							if(locate(/obj/Perk/Innate_Talent_Taijutsu)in usr.contents)
								usr.JRPP += 375
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Srank) + list("Cancel")
						if(usr.JRPP >= 5000)
							usr.contents += new varJutsu
							usr.JRPP -= 5000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.RPP += 1000
							if(locate(/obj/Perk/Anomaly)in usr.contents)
								usr.RPP += 750
							usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."



			if(A=="Ninjutsu")
				var/Element=input("What Element of Ninjutsu?","Pick Element") in list("Fire","Earth","Water","Wind","Lightning","Lava","Steel","Storm","Explosion","Steam","Non-Elemental","Cancel")
				if(Element=="Fire")
					if(usr.PrimaryElement=="Fire"||usr.SecondaryElement=="Fire"||usr.TertiaryElement=="Fire"||usr.QuadranaryElement=="Fire"||usr.QuinaryElement=="Fire")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									if(locate(/obj/Perk/Innate_Talent_Katon)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									if(locate(/obj/Perk/Innate_Talent_Katon)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Katon)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									if(locate(/obj/Perk/Innate_Talent_Katon)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You do not have the fire element so you cannot learn a fire jutsu currently."
				if(Element=="Water")
					if(usr.PrimaryElement=="Water"||usr.SecondaryElement=="Water"||usr.TertiaryElement=="Water"||usr.QuadranaryElement=="Water"||usr.QuinaryElement=="Water")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You do not have the water element so you cannot learn a water jutsu currently."

				if(Element=="Earth")
					if(usr.PrimaryElement=="Earth"||usr.SecondaryElement=="Earth"||usr.TertiaryElement=="Earth"||usr.QuadranaryElement=="Earth"||usr.QuinaryElement=="Earth")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.RPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 625
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.RPP += 488
									if(locate(/obj/Perk/Innate_Talent_Doton)in usr.contents)
										usr.RPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 400
									if(locate(/obj/Perk/Innate_Talent_Doton)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Doton)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 175
									if(locate(/obj/Perk/Innate_Talent_Doton)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
					else
						usr<<"You do not have the earth element so you cannot learn a earth jutsu currently."
				if(Element=="Lightning")
					if(usr.PrimaryElement=="Lightning"||usr.SecondaryElement=="Lightning"||usr.TertiaryElement=="Lightning"||usr.QuadranaryElement=="Lightning"||usr.QuinaryElement=="Lightning")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 875
									if(locate(/obj/Perk/Innate_Talent_Raiton)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 600
									if(locate(/obj/Perk/Innate_Talent_Raiton)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 450
									if(locate(/obj/Perk/Innate_Talent_Raiton)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 200
									if(locate(/obj/Perk/Innate_Talent_Raiton)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
					else
						usr<<"You do not have the lightning element so you cannot learn a lightning jutsu currently."
				if(Element=="Wind")
					if(usr.PrimaryElement=="Wind"||usr.SecondaryElement=="Wind"||usr.TertiaryElement=="Wind"||usr.QuadranaryElement=="Wind"||usr.QuinaryElement=="Wind")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 625
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 988
									if(locate(/obj/Perk/Innate_Talent_Fuuton)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 400
									if(locate(/obj/Perk/Innate_Talent_Fuuton)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Fuuton)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 175
									if(locate(/obj/Perk/Innate_Talent_Fuuton)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
					else
						usr<<"You do not have the wind element so you cannot learn a wind jutsu currently."
				if(Element=="Steam")
					if(usr.PrimaryElement=="Steam"||usr.SecondaryElement=="Steam"||usr.TertiaryElement=="Steam"||usr.QuadranaryElement=="Steam"||usr.QuinaryElement=="Steam")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Steam/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Steam/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Steam/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Steam/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Steam/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You do not have the steam element so you cannot learn a steam jutsu currently."

				if(Element=="Lava")
					if(usr.PrimaryElement=="Lava"||usr.SecondaryElement=="Lava"||usr.TertiaryElement=="Lava"||usr.QuadranaryElement=="Lava"||usr.QuinaryElement=="Lava")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Lava/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Lava/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Lava/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Lava/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Lava/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You do not have the lava element so you cannot learn a lava jutsu currently."

				if(Element=="Explosion")
					if(usr.PrimaryElement=="Explosion"||usr.SecondaryElement=="Explosion"||usr.TertiaryElement=="Explosion"||usr.QuadranaryElement=="Explosion"||usr.QuinaryElement=="Explosion")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Explosion/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Explosion/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Explosion/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 225
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Explosion/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 75
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Explosion/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									if(locate(/obj/Perk/Innate_Talent_Suiton)in usr.contents)
										usr.JRPP += 37.5
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You do not have the explosion element so you cannot learn a explosion jutsu currently."

			if(A=="Village Uniques")
				var/Village=input("What Village","Pick village") in list("Leaf Village","Mist Village","Sand Village","Dark Village","Cancel")
				if(Village=="Leaf Village")
					if(usr.Village == "Konohagakure")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Konohagakure/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Konohagakure/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Konohagakure/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Konohagakure/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Konohagakure/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You aren't a Hidden Leaf shinobi...SWINE!"
				if(Village=="Dark Village")
					if(usr.Village == "Kuraigakure")
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kuraigakure/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kuraigakure/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kuraigakure/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kuraigakure/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kuraigakure/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You aren't a Hidden Mist Shinobi"
			if(A=="Clan")
				var/Clan=input("What Clan","Pick Clan") in list("Uchiha","Senju","Hyuuga","Chinoike","Nara","Aburame","Akimichi","Inuzuka","Yamanaka","Hozuki","Yuki","Hoshigaki","Kaguya","Sabaku","Cancel")
				if(Clan=="Hyuuga")
					if(usr.Hyuuga == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hyuuga/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.JRPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hyuuga/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hyuuga/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hyuuga/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hyuuga/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 125
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You are not apart of the Hyuuga clan!!"

				if(Clan=="Nara")
					if(usr.Nara == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Nara/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Nara/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Nara/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Nara/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Nara/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Nara."


				if(Clan=="Yamanaka")
					if(usr.Yamanaka == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yamanaka/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yamanaka/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yamanaka/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yamanaka/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yamanaka/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Yamanaka"
				if(Clan=="Akimichi")
					if(usr.Akimichi == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Akimichi/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Akimichi/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Akimichi/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Akimichi/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Akimichi/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Akimichi."

				if(Clan=="Uchiha")
					if(usr.Uchiha == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Uchiha/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Uchiha/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Uchiha/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Uchiha/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Uchiha/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent an Uchiha."

				if(Clan=="Sabaku")
					if(usr.Sabaku == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Sabaku/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Sabaku/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Sabaku/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Sabaku/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Sabaku/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Sabaku"



				if(Clan=="Inuzuka")
					if(usr.Inuzuka == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Inuzuka/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Inuzuka/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Inuzuka/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Inuzuka/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Inuzuka/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent an Inuzuka"

				if(Clan=="Aburame")
					if(usr.Aburame == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Aburame/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Aburame/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Aburame/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Aburame/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Aburame/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent an Aburame"


				if(Clan=="Yuki")
					if(usr.Yuki == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yuki/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yuki/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yuki/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yuki/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Yuki/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Yuki"


				if(Clan=="Hozuki")
					if(usr.Hozuki == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hozuki/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hozuki/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hozuki/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hozuki/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hozuki/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Hozuki"

				if(Clan=="Kaguya")
					if(usr.Kaguya == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kaguya/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kaguya/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kaguya/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kaguya/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Kaguya/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Kaguya."

				if(Clan=="Hoshigaki")
					if(usr.Hoshigaki == 1)
						usr<<"S Rank Jutsu Cost 5000 | A Rank Jutsu Cost 2500 | B Rank Jutsu Cost 1500 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hoshigaki/Srank) + list("Cancel")
								if(usr.JRPP >= 5000)
									usr.contents += new varJutsu
									usr.JRPP -= 5000
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 750
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hoshigaki/Arank) + list("Cancel")
								if(usr.JRPP >= 2500)
									usr.contents += new varJutsu
									usr.JRPP -= 2500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 500
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough JRPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hoshigaki/Brank) + list("Cancel")
								if(usr.JRPP >= 1500)
									usr.contents += new varJutsu
									usr.JRPP -= 1500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 375
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hoshigaki/Crank) + list("Cancel")
								if(usr.JRPP >= 500)
									usr.contents += new varJutsu
									usr.JRPP -= 500
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more JRPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D") || findtext("[usr.srank]","E"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Hoshigaki/Drank) + list("Cancel")
								if(usr.JRPP >= 250)
									usr.contents += new varJutsu
									usr.JRPP -= 250
									if(locate(/obj/Perk/Anomaly)in usr.contents)
										usr.JRPP += 250
									usr<<"You recieve a new jutsu! You have [usr.JRPP] JRPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You arent a Hozuki"


		if(Q=="Clan Setup")
			var/c1 = locate(/obj/Perk/Akimichi_Clan) in usr.contents
			var/c2 = locate(/obj/Perk/Chinoike_Clan) in usr.contents
			var/c3 = locate(/obj/Perk/Senju_Clan) in usr.contents
			var/c4 = locate(/obj/Perk/Uzumaki_Clan) in usr.contents
			var/c5 = locate(/obj/Perk/Kaguya_Clan) in usr.contents
			var/c6 = locate(/obj/Perk/Hoshigaki_Clan) in usr.contents
			var/c7 = locate(/obj/Perk/Yuki_Clan) in usr.contents
			var/c8 = locate(/obj/Perk/Sabaku_Clan) in usr.contents
			var/c9 = locate(/obj/Perk/Sarutobi_Clan) in usr.contents
			var/c10 = locate(/obj/Perk/Aburame_Clan) in usr.contents
			var/c11 = locate(/obj/Perk/Yamanaka_Clan) in usr.contents
			var/c12 = locate(/obj/Perk/Sezokutekina_Clan) in usr.contents
			var/c13 = locate(/obj/Perk/Inuzuka_Clan) in usr.contents
			var/c14 = locate(/obj/Perk/Maboroshi_Clan) in usr.contents
			var/c15 = locate(/obj/Perk/Akai_Clan) in usr.contents
			var/c16 = locate(/obj/Perk/Kedion_Clan) in usr.contents
			var/c17 = locate(/obj/Perk/Hozuki_Clan) in usr.contents
			var/c18 = locate(/obj/Perk/Nara_Clan) in usr.contents
			var/c21 = locate(/obj/Perk/Main_Hyuuga_Clan) in usr.contents
			var/c22 = locate(/obj/Perk/Branch_Hyuuga_Clan) in usr.contents
			var/c23 = locate(/obj/Perk/Uchiha_Clan) in usr.contents
			var/c24 = locate(/obj/Perk/Yuki_Clan) in usr.contents
			var/c25 = locate(/obj/Perk/Yokibuki_Clan) in usr.contents
			if(c1||c2||c3||c4||c5||c6||c7||c8||c9||c10||c11||c12||c13||c14||c15||c16||c17||c18||c21||c22||c23||c24||c25||usr.hasclan==1)
				usr<<"You are already in a clan."
			else
				var/PickClan = input("Which clan would you like to be?","Clan Setup")in list("Aburame","Akimichi","Hyuuga(Main)","Hyuuga(Branch)","Inuzuka","Nara","Sarutobi","Uzumaki","Yamanaka","Kaguya","Hozuki","Hoshigaki","Yuki","Yokibuki")
				if(PickClan == "Aburame")
					switch(alert("Are you sure you want to be an Aburame?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Aburame_Clan
								usr.Clan="Aburame"
								usr.hasclan = 1
								usr.Aburame = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Akimichi")
					switch(alert("Are you sure you want to be an Akimichi?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Akimichi_Clan
								usr.Clan="Akimichi"
								usr.hasclan = 1
								usr.Akimichi = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Hyuuga(Main)")
					switch(alert("Are you sure you want to be an Hyuuga?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Main_Hyuuga_Clan
								usr.Clan="Hyuuga"
								usr.hasclan = 1
								usr.Hyuuga = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Hyuuga(Branch)")
					switch(alert("Are you sure you want to be an Hyuuga?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Branch_Hyuuga_Clan
								usr.Clan="Hyuuga"
								usr.hasclan = 1
								usr.Hyuuga = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Inuzuka")
					switch(alert("Are you sure you want to be an Inuzuka?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Inuzuka_Clan
								usr.Clan="Inuzuka"
								usr.hasclan = 1
								usr.Inuzuka = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Nara")
					switch(alert("Are you sure you want to be an Nara?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Nara_Clan
								usr.Clan="Nara"
								usr.hasclan = 1
								usr.Nara = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Uzumaki")
					switch(alert("Are you sure you want to be an Uzumaki?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Uzumaki_Clan
								usr.Clan="Uzumaki"
								usr.hasclan = 1
								usr.Uzumaki = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Yamanaka")
					switch(alert("Are you sure you want to be an Yamanaka?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Konohagakure")
								usr.contents += new/obj/Perk/Yamanaka_Clan
								usr.Clan="Yamanaka"
								usr.hasclan = 1
								usr.Yamanaka = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Konohagakure."
						if("No")
							return
				if(PickClan == "Kaguya")
					switch(alert("Are you sure you want to be an Kaguya?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Kuraigakure")
								usr.contents += new/obj/Perk/Kaguya_Clan
								usr.Clan="Kaguya"
								usr.hasclan = 1
								usr.Kaguya = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Kuraigakure."
						if("No")
							return
				if(PickClan == "Hozuki")
					switch(alert("Are you sure you want to be an Hozuki?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Kuraigakure")
								usr.contents += new/obj/Perk/Hozuki_Clan
								usr.Clan="Hozuki"
								usr.hasclan = 1
								usr.Hozuki = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Kuraigakure."
						if("No")
							return
				if(PickClan == "Hoshigaki")
					switch(alert("Are you sure you want to be an Hoshigaki?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Kuraigakure")
								usr.contents += new/obj/Perk/Hoshigaki_Clan
								usr.Clan="Hoshigaki"
								usr.hasclan = 1
								usr.Hoshigaki = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Kuraigakure."
						if("No")
							return
				if(PickClan == "Yuki")
					switch(alert("Are you sure you want to be an Yuki?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Kuraigakure")
								usr.contents += new/obj/Perk/Yuki_Clan
								usr.Clan="Yuki"
								usr.hasclan = 1
								usr.Yuki = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Kuraigakure."
						if("No")
							return
				if(PickClan == "Yokibuki")
					switch(alert("Are you sure you want to be an Yokibuki?",,"Yes","No"))
						if("Yes")
							if(usr.Village =="Kuraigakure")
								usr.contents += new/obj/Perk/Yokibuki_Clan
								usr.Clan="Yokibuki"
								usr.hasclan = 1
								usr.Yokibuki = 1
								usr.RPP -= 0
								if (findtext("[usr.name]", ","))
									return
								if(findtext("[usr.name]"," "))
									return
								else
									usr.name="[usr.Clan], [name]"
							else
								usr<<"This clan is restricted to Kuraigakure."
						if("No")
							return
/*
Skill Ranks = New, Novice, Expert, Veteran, Master

Jutsu Rank = A, B, C, D, E, S
*/
obj/Custom
	proc
		RPPSpend()
			if(src.skil=="New")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Novice"
						src.dran -= (src.dran*(0.15))
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Novice"
						src.dran -= (src.dran*(0.15))
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Novice"
						src.dran -= (src.dran*(0.15))
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Novice"
						src.dran -= (src.dran*(0.15))
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Novice"
						src.dran = (src.dran*(0.15))
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Novice"
						src.dran -= (src.dran*(0.15))
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0
				return
			if(src.skil=="Novice")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Expert"
						src.dran -= (src.dran*(0.20))
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Expert"
						src.dran -= (src.dran*(0.20))
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Expert"
						src.dran -= (src.dran*(0.20))
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Expert"
						src.dran -= (src.dran*(0.20))
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Expert"
						src.dran -= (src.dran*(0.20))
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Expert"
						src.dran -= (src.dran*(0.20))
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0
				return
			if(src.skil=="Expert")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Veteran"
						src.dran -= (src.dran*(0.25))
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Veteran"
						src.dran -= (src.dran*(0.25))
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Veteran"
						src.dran -= (src.dran*(0.25))
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Veteran"
						src.dran -= (src.dran*(0.25))
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Veteran"
						src.dran -= (src.dran*(0.25))
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Veteran"
						src.dran -= (src.dran*(0.25))
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0
				return
			if(src.skil=="Veteran")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Mastered"
						src.dran -= (src.dran*(0.30))
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Mastered"
						src.dran -= (src.dran*(0.30))
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Mastered"
						src.dran -= (src.dran*(0.30))
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Mastered"
						src.dran -= (src.dran*(0.30))
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Mastered"
						src.dran -= (src.dran*(0.30))
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Mastered"
						src.dran -= (src.dran*(0.30))
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0
				return
			if(src.skil=="Mastered")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.dran = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						usr<<"[src] is now [src.skil]."
						src.RPPSpent = 0
				usr.Skill_Rank_Check()
				return







obj/Perk
	proc
		RPPCheck()
			if(src.tier == 1)
				if(!src.canttier2)
					if(src.RPPSpent>=1000)
						src.tier = 2
						src.RPPSpent -= 1000
						src.description = "[src.tier2descrip]"
						src.name = "[src.tier2name]"
						src.icon_state = "[src.tier2state]"
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					usr<<"This is fully upgraded already..."
					usr.RPP += src.RPPSpent
					usr.Skill_Rank_Check()
					src.RPPSpent = 0

			if(src.tier == 2)
				if(!src.canttier3)
					if(src.RPPSpent>=2500)
						src.tier = 3
						src.RPPSpent -= 2500
						src.description = "[src.tier3descrip]"
						src.name = "[src.tier3name]"
						src.icon_state = "[src.tier3state]"
						if(istype(src,/obj/Perk/Chakra))
							usr.Jchakra += 500
						if(istype(src,/obj/Perk/Stamina))
							usr.Jstam += 500
						if(istype(src,/obj/Perk/Speed))
							usr.Jspd += 1
						if(istype(src,/obj/Perk/Body))
							usr.Jdef += 1
							usr.Jdur += 1.1
						if(istype(src,/obj/Perk/Reflex))
							usr.Jref += 1
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					usr<<"Tbis is fully upgraded already..."
					usr.RPP += src.RPPSpent
					src.RPPSpent = 0

			if(src.tier == 3)
				if(!src.canttier4)
					if(src.RPPSpent >=5000)
						src.tier = 4
						src.RPPSpent -= 5000
						src.description = "[src.tier4descrip]"
						src.name = "[src.tier4name]"
						src.icon_state = "[src.tier4state]"
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						if(istype(src,/obj/Perk/Chakra))
							usr.Jchakra += 2000
						if(istype(src,/obj/Perk/Stamina))
							usr.Jstam += 2000
						if(istype(src,/obj/Perk/Speed))
							usr.Jspd += 1
						if(istype(src,/obj/Perk/Body))
							usr.Jdef += 1
							usr.Jdur += 1.1
						if(istype(src,/obj/Perk/Reflex))
							usr.Jref += 1
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					usr<<"This is fully upgraded already."
					usr.RPP += src.RPPSpent
					src.RPPSpent = 0
					usr.Skill_Rank_Check()

			if(src.tier == 4)
				if(src.canttier5&&!src.cantmaster)
					if(src.RPPSpent >= 50000)
						src.tier = "Master"
						src.RPPSpent = 0
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.description = "[src.masterdescrip]"
						src.name = "[src.mastername]"
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					if(!src.canttier5)
						if(src.RPPSpent >= 10000)
							src.tier = 5
							src.RPPSpent = 0
							usr.Skill_Rank_Check()
							src.description = "[src.tier5descrip]"
							src.name = "[src.tier5name]"
							src.icon_state = "[tier5state]"
							usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
							for(var/mob/M in world)
								if(M.key in Admin3s)
									M<<"[usr] has increased [src] to tier [src.tier]"
			if(src.tier == 5)
				if(src.cantmaster)
					usr<<"This is fully upgraded already."
					usr.RPP += src.RPPSpent
					src.RPPSpent = 0
					return
				if(src.RPPSpent >= 15000)
					src.tier = "Master"
					src.RPPSpent = 0
					usr.exptunarank += 1
					usr.Skill_Rank_Check()
					src.description = "[src.masterdescrip]"
					src.name = "[src.mastername]"
					usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
					for(var/mob/M in world)
						if(M.key in Admin3s)
							M<<"[usr] has increased [src] to tier [src.tier]"
			if(src.tier == "Master")
				usr<<"This is fully upgraded already."
				usr.RPP += src.RPPSpent
				src.RPPSpent = 0
				return

			usr.Skill_Rank_Check()


