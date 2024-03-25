obj/Custom
	var/PreviewCon = 'Preview.dmi'
	verb
		Inspect()
			winshow(usr, "Preview", 1)
			winset(usr,"Preview.Name", "text=\"[src.name] - [src.ran]\"")
			winset(usr,"Preview.Icon","image=[src.PreviewCon]")
			winset(usr,"Preview.Description","text=\"[src.description]\"")
			winset(usr,"Preview.Drain","text=\"Base Drain: [src.dran]\"")
			winset(usr,"Preview.Type","text=\"[src.jut]\"")
			winset(usr,"Preview.Mastery","text=\"[src.skil]\"")
			winset(usr,"Preview.EXP","text=\"[src.RPPSpent] RPP Spent into Jutsu\"")

obj/Perk
	verb
		Inspect()
			winshow(usr, "PerkPreview", 1)
			winset(usr,"PerkPreview.Name", "text=\"[src.name]\"")
			winset(usr,"PerkPreview.Description","text=\"[src.description]\"")
			winset(usr,"PerkPreview.EXP","text=\"[src.RPPSpent] RPP Spent into perk\"")
			winset(usr,"PerkPreview.Tier","text=\"Tier: [src.tier]\"")


mob
	verb
		Set_Health()
			set category = "Combat"
			var SetConst = input("Would you like to change your health?") in list ("Yes","No")
			if(SetConst == "Yes")
				var/amount = input("What do you want to set your health to?") as num
				if(amount>usr.maxJConst) amount=usr.maxJConst
				view(8)<<"<font color=[usr.SayFont]>[usr] is at [amount] health!"

mob
	verb
		Set_Chakra()
			set category = "Combat"
			var SetConst = input("Would you like to change your chakra?") in list ("Yes","No")
			if(SetConst == "Yes")
				var/amount = input("how much u wan") as num
				usr.Jchakra += amount
				if(amount>usr.maxJchakra) usr.Jchakra=usr.maxJchakra
				view(8)<<"<font color=[usr.SayFont]>[usr] is at [Jchakra] chakra!"


mob
	verb
		Set_Stamina()
			set category = "Combat"
			var SetConst = input("Would you like to change your stamina?") in list ("Yes","No")
			if(SetConst == "Yes")
				var/amount = input("how much u wan") as num
				usr.Jstam += amount
				if(amount>usr.maxJstam) usr.Jstam=usr.maxJstam
				view(8)<<"<font color=[usr.SayFont]>[usr] is at [Jstam] stamina!"

mob
	verb
		Show_Stat()
			set category = "Combat"
			var ShowingSt = input("What stat will you show?") in list ("Chakra","Stamina","Ninjutsu","Taijutsu","Genjutsu","Intelligence","Reflex","Speed","Control","Strength","Defense","Attack Speed","Durability","Gen Res","Handseal Speed","Ninjutsu Damage","Nevermind")
			//var/Showing = prompt("What stat will you show?") in list ("Chakra","Stamina","Ninjutsu","Taijutsu","Genjutsu","Intelligence","Reflex","Speed","Control","Strength","Defense","Attack Speed","Durability","Gen Res","Nevermind")
			if(ShowingSt == "Chakra")
				var/showstat=input("How much chakra would you like to show?") as num
				if(showstat>usr.Jchakra) showstat=usr.Jchakra
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Chakra is [showstat]."
			if(ShowingSt == "Stamina")
				var/showstat=input("How much stamina would you like to show?") as num
				if(showstat>usr.Jstam) showstat=usr.Jstam
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Stamina is [showstat]."
			if(ShowingSt == "Ninjutsu")
				var/showstat=input("How much ninjutsu would you like to show?") as num
				if(showstat>usr.Jnin) showstat=usr.Jnin
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Ninjutsu is [showstat]."
			if(ShowingSt == "Taijutsu")
				var/showstat=input("How much taijutsu would you like to show?") as num
				if(showstat>usr.Jtai) showstat=usr.Jtai
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Taijutsu is [showstat]."
			if(ShowingSt == "Genjutsu")
				var/showstat=input("How much genjutsu would you like to show?") as num
				if(showstat>usr.Jgen) showstat=usr.Jgen
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Genjutsu is [showstat]."
			if(ShowingSt == "Intelligence")
				var/showstat=input("How much intelligence would you like to show?") as num
				if(showstat>usr.Jint) showstat=usr.Jint
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Intelligence is [showstat]."
			if(ShowingSt == "Reflex")
				var/showstat=input("How much reflex would you like to show?") as num
				if(showstat>usr.Jref) showstat=usr.Jref
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Reflex is [showstat]."
			if(ShowingSt == "Speed")
				var/showstat=input("How much speed would you like to show?") as num
				if(showstat>usr.Jspd) showstat=usr.Jspd
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Speed is [showstat]."
			if(ShowingSt == "Control")
				var/showstat=input("How much control would you like to show?") as num
				if(showstat>usr.Jcon) showstat=usr.Jcon
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Control is [showstat]."
			if(ShowingSt == "Strength")
				var/showstat=input("How much strength would you like to show?") as num
				if(showstat>usr.Jstr) showstat=usr.Jstr
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Strength is [showstat]."
			if(ShowingSt == "Defense")
				var/showstat=input("How much defense would you like to show?") as num
				if(showstat>usr.Jdef) showstat=usr.Jdef
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Defense is [showstat]."
			if(ShowingSt == "Attack Speed")
				var/showstat=input("How much attack speed would you like to show?") as num
				if(showstat>usr.Jatkspd) showstat=usr.Jatkspd
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Attack Speed is [showstat]."
			if(ShowingSt == "Durability")
				var/showstat=input("How much durability would you like to show?") as num
				if(showstat>usr.Jdur) showstat=usr.Jdur
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Durability is [showstat]."
			if(ShowingSt == "Gen Res")
				var/showstat=input("How much genjutsu resistence would you like to show?") as num
				if(showstat>usr.Jgenres) showstat=usr.Jgenres
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Genjutsu Res is [showstat]."
			if(ShowingSt == "Ninjutsu Damage")
				var/showstat=input("How much ninjutsu power would you like to show?") as num
				if(showstat>usr.Jnin + usr.Jcon) showstat=usr.Jnin + usr.Jcon
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Ninjutsu Damage is [showstat]."
			if(ShowingSt == "Taijutsu Damage")
				var/showstat=input("How much taijutsu power would you like to show?") as num
				if(showstat>usr.Jtai + usr.Jstr) showstat=usr.Jtai + usr.Jstr
				view(6)<<"<font color=[usr.SayFont]>[usr]'s Ninjutsu Damage is [showstat]."
			if(ShowingSt == "Handseal Speed")
				var/showstat=input("How much handseal speed would you like to show?") as num
				if(showstat>usr.Jhss) showstat=usr.Jhss
				view(6)<<"<font color=[usr.SayFont]>[usr] is able to make [showstat] handseals per round."
			if(ShowingSt == "Nevermind")
				view(6)<<"<font color=[usr.SayFont]>[usr] decided not to show stats."





mob/verb
    customface(i as icon) // When used it will prompt the user for a file, the type beinc an icon
        set name = "customface" // This is just "hiding" the verb because I use a button. You don't need this otherwise.
        set hidden=1
        set category = "Commands" // Not needed unless the verb is actually visible, d'oh
        var/d="[i]" // the "i" provided by the player
        if(findtext(d,".dmi")) //Makes sure it's a DMI file
            switch(alert("Do you want to change your face icon?","Confirm","Yes","No"))
                if("Yes")
                    var/icon/arg = icon(i) //Setting max height/width and scaling...
                    var/w = arg.Width()
                    var/h = arg.Height()
                    if(w > 32 || h > 64)
                        var/s = max(w/32, h/64)
                        arg.Scale(round(w/s,1), round(h/s,1))
                        usr.face = arg
                        usr<<output("<small><font color=yellow>You have changed your face icon.</font>","ooc_output")
                    else
                        usr.face = i
                        usr<<output("<small><font color=yellow>You have changed your face icon.</font>","ooc_output")
                else
                    return
        else
            usr<<output("<small><font color=yellow>Error: File must be .dmi</font>","ooc_output")
        return

mob/var
	face = null

mob
	var
		JConst = 1000
		maxJConst = 1000
		Jchakra = 300
		maxJchakra = 300
		Jstam = 300
		maxJstam= 300
		Jken = 1
		Jhss = 1
		Jnin = 1
		Jgen = 1
		Jtai = 1
		Jcon = 1
		Jint = 1
		Jref = 1
		Jspd = 1
		Jstr = 1
		Jdef = 1
		Jdur = 1
		Jatkspd = 1
		Jchak = 0
		Jgenres = 1

	proc
		ChakraMed()
			if(usr.Jchak)
				if(usr.Jchakra < usr.maxJchakra)
					usr.Jchakra+=usr.maxJchakra*(0.01)
					spawn(70)
					usr.ChakraMed()
				if(usr.Jchakra >= usr.maxJchakra)
					usr.Jchakra = usr.maxJchakra
		StamMed()
			if(usr.Jstam < usr.maxJstam)
				usr.Jstam+=usr.maxJstam*(0.01)
				usr.JConst += usr.maxJConst*(0.005)
				spawn(70)
				usr.StamMed()
			if(usr.Jstam >= usr.maxJstam)
				usr.Jstam = usr.maxJstam



		Healing_Pill()
			while(usr.JConst < usr.maxJConst)
				usr.JConst += 5
				usr.Constitution_Check()
				sleep(30)

		SicknessDrain()
			if(locate(/obj/Illness/Fever/)in src.contents)
				usr.JConst -= 10
				usr.Constitution_Check()
			if(locate(/obj/Illness/Encephilitis/)in src.contents)
				usr.JConst -= 25
				usr.Constitution_Check()
			if(locate(/obj/Illness/Flu/)in src.contents)
				usr.JConst -= 20
				usr.Constitution_Check()
			if(locate(/obj/Illness/Common_Cold/)in src.contents)
				usr.JConst -= 15
				usr.Constitution_Check()
			if(locate(/obj/Illness/Congestive_Heart_Failure/)in src.contents)
				usr.JConst -= 35
				usr.Constitution_Check()
			if(locate(/obj/Illness/Wasting_Syndrome/)in src.contents)
				usr.JConst -= 40
				usr.Constitution_Check()
			if(locate(/obj/Illness/Diarrhea/)in src.contents)
				usr.JConst -= 15
				usr.Constitution_Check()
			if(locate(/obj/Illness/Tuberculosis/)in src.contents)
				usr.JConst -= 40
				usr.Constitution_Check()
			if(locate(/obj/Illness/Nausea/)in src.contents)
				usr.JConst -= 20
				usr.Constitution_Check()
			if(locate(/obj/Illness/Fatal_Auto_Immune_Deficiency/)in src.contents)
				usr.JConst -= 150
				usr.Constitution_Check()
			if(locate(/obj/Illness/Non_Fatal_Auto_Immune_Deficiency/)in src.contents)
				usr.JConst -= 60
				usr.Constitution_Check()




mob/var/SharinganBuffCopy = 0




obj/Custom
	var
		RPPSpent = 0
		ele = ""
		Kekkei = 0
		Activo = 0
		BOOST = 0
		GChak = 0
		GStam = 0
		Gnin = 0
		Ggen = 0
		Gtai = 0
		Gcon = 0
		Gint = 0
		Gref = 0
		Gken = 0
		Gspd = 0
		Gstr = 0
		Gdef = 0
		Gdur = 0
		Ggenres = 0
		Gatkspd = 0
		Sensory = 0
		Gsense = 0
		Sharingan = 0
		Ketsuryugan = 0
		TSharingan = 0
		TByakugan = 0
		SharinganCopyy = 0
		Byakugan = 0
		Mathsresult = 0
		MathsresultStamina = 0

		is_buff = 0
	Blank_Buff
		icon = 'skillcard.dmi'
		icon_state = "Hachimon"
		is_buff = 1
		Click()
			if(src in usr.contents)
				if(!src.Activo)
					usr.Jchakra += src.GChak
					usr.Jstam += src.GStam
					usr.Jnin += src.Gnin
					usr.Jgen += src.Ggen
					usr.Jtai += src.Gtai
					usr.Jcon += src.Gcon
					usr.Jint += src.Gint
					usr.Jref += src.Gref
					usr.Jspd += src.Gspd
					usr.Jstr += src.Gstr
					usr.Jdef += src.Gdef
					usr.Jdur += src.Gdur
					usr.Jatkspd += src.Gatkspd
					view(6)<<"<html><center>[usr] activates:<br>[src.name]<hr><br>[src.description]</center></html>"
					if(src.Sensory==1)
						usr.Shingan = 1
						usr.senserange += src.Gsense
					if(src.Sharingan == 1)
						usr.Sharingan = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s pupils begin turn red as they activate Sharingan!<font color = white>*)"
						usr.overlays += 'Sharingan.dmi'
						if(src.SharinganCopyy == 1)
							usr.SharinganBuffCopy = 1
					if(src.Ketsuryugan == 1)
						usr.Ketsuryugan = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes redden and bleed as they activate Ketsuryugan!<font color = white>*)"
						usr.overlays += 'Sharingan.dmi'
					if(src.TSharingan == 1)
						usr.Sharingan = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]uncovers their transplanted Sharingan.<font color = white>*)"
						usr.overlays += 'Sharingan2.dmi'
						if(src.SharinganCopyy == 1)
							usr.SharinganBuffCopy = 1
					if(src.Byakugan == 1)
						usr.Byakugan = 1
						usr.ByakuganNetwork()
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s hidden iris becomes more apparent, as veins  bulge lateral to each eye.<font color = white>*)"
						usr.overlays += 'Hyuuga.dmi'
					if(src.TByakugan == 1)
						usr.Byakugan = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] exposes their transplanted Byakugan.<font color = white>*)"
						usr.overlays += 'Hyuuga2.dmi'
					if(findtext("[src.name]","Andorra Mode"))
						viewers() << "<font color=yellow>(*<font color=[usr.SayFont]>[usr]'s eyes turn yellow as a black bar forms down to the center.<font color = white>*)"
						usr.overlays += 'AndorraMode.dmi'

					src.Activo = 1
					usr.Buffed = 1
				else
					if(src.TSharingan == 1 || src.TByakugan == 1)
						usr<<"You cannot toggle this buff off. Find an eye wrap or blindfold."
						return
					usr.Jgenres -= src.Ggenres
					usr.Jnin -= src.Gnin
					usr.Jgen -= src.Ggen
					usr.Jtai -= src.Gtai
					usr.Jcon -= src.Gcon
					usr.Jint -= src.Gint
					usr.Jref -= src.Gref
					usr.Jspd -= src.Gspd
					usr.Jstr -= src.Gstr
					usr.Jdef -= src.Gdef
					usr.Jdur -= src.Gdur
					usr.Jatkspd -= src.Gatkspd
					usr.senserange -= src.Gsense
					usr.Shingan = 0
					if(src.BOOST < 15)
						if(src.Ggenres > 0)
							src.Ggenres += rand(0.10,0.20)
						if(src.Gnin > 0)
							src.Gnin += rand(0.10,0.20)
						if(src.Ggen > 0)
							src.Ggen += rand(0.10,0.20)
						if(src.Gtai > 0)
							src.Gtai += rand(0.10,0.20)
						if(src.Gcon > 0)
							src.Gcon += rand(0.10,0.20)
						if(src.Gint > 0)
							src.Gint += rand(0.10,0.20)
						if(src.Gref > 0)
							src.Gref += rand(0.10,0.20)
						if(src.Gspd > 0)
							src.Gspd += rand(0.10,0.20)
						if(src.Gstr > 0)
							src.Gstr += rand(0.10,0.20)
						if(src.Gdef > 0)
							src.Gdef += rand(0.10,0.20)
						if(src.Gdur > 0)
							src.Gdur += rand(0.10,0.20)
						if(src.Gatkspd > 0)
							src.Gatkspd += rand(0.10,0.20)
						if(src.Gsense > 0)
							src.Gsense += rand(2,5)
						if(src.GChak < 0)
							src.GChak += rand(10,15)
						if(src.GStam <0)
							src.GStam += rand(10,15)
						src.BOOST += 1

					if(src.Sharingan == 1)
						usr.Sharingan = 0
						usr.overlays -= 'Sharingan.dmi'
						src.GChak += rand(10,13)
						if(src.SharinganCopyy == 1)
							usr.SharinganBuffCopy = 0

					if(src.Byakugan == 1)
						usr.Byakugan = 0
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s iris and pupil become barely discernable with both appearing their normal color<font color = white>*)"
						usr.overlays -= 'Hyuuga.dmi'
						src.GChak += rand(5,7.5)

					if(src.Ketsuryugan ==1)
						usr.Ketsuryugan = 0
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s shit turns to normal"
						usr.overlays -= 'Sharingan.dmi'
					usr.Buffed = 0
					src.Activo = 0

					if(findtext("[src.name]","Andorra Mode"))
						viewers() << "<font color=yellow>(*<font color=[usr.SayFont]>[usr]'s eyes return to their normal color.<font color = white>*)"
						usr.overlays -= 'AndorraMode.dmi'
					usr.Buffed = 0
					src.Activo = 0
					view(6)<<"<html><center>[usr] deactivates:<hr><br>[src.name]</center></html>"

	Blank_Jutsu
		icon = 'skillcard.dmi'
		icon_state = "Kawarimi"
		description = ""
		Click()
			if(src in usr.contents)
				if(src.name == "Sickle Weasel Technique")
					var/obj/items/Weapon/Kyodai_Sensu/A = locate() in usr.contents
					if(A)
						usr<<"You swing your fan!"
					else
						usr<<"You need a fan for that."
						return
				if(src.idran == "Chakra")
					var/Cost = src.dran
					Mathsresult = Cost
					var/times = input("How many times will you use this jutsu?")as num
					for(var/obj/Perk/A in usr.contents)
						if(findtext(A.name,"Elemental Training [src.ele]"))
							if(A.tier==1)
								Mathsresult -= (src.dran*0.10)
							if(A.tier==2)
								Mathsresult -= (src.dran*0.20)
							if(A.tier==3)
								Mathsresult -= (src.dran*0.30)
							if(A.tier==4)
								Mathsresult -= (src.dran*0.40)
							if(A.tier==5)
								Mathsresult -= (src.dran*0.50)
							if(A.tier=="Master")
								Mathsresult -= (src.dran*0.60)
						if(findtext(A.name,"Chakra Control"))
							if(src.ele == "Elementless" || !src.ele == "Fire" || !src.ele == "Water" || !src.ele == "Lightning" || !src.ele == "Wind" || !src.ele == "Earth")
								if(A.tier==1)
									Mathsresult -= (src.dran*0.10)
								if(A.tier==2)
									Mathsresult -= (src.dran*0.20)
								if(A.tier==3)
									Mathsresult -= (src.dran*0.30)
								if(A.tier==4)
									Mathsresult -= (src.dran*0.40)
								if(A.tier==5)
									Mathsresult -= (src.dran*0.50)
								if(A.tier=="Master")
									Mathsresult -= (src.dran*0.60)
						Cost = round(Mathsresult)
						if(Cost <= 100)
							Cost = 100
					if(usr.Jchakra>=(Cost*times))
						usr.Jchakra-=(Cost*times)
						viewers(16) << output("<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele] / Handseals: [src.hseal] / Cooldown: [src.cd] round(s)","World.OOC")
						usr.SkillUp()
						if(src.ele=="Fire")
							var/obj/HousenkaAbil/A = new
							A.loc=usr.loc
							A.dir=usr.dir
							walk(A,usr.dir)
						if(src.ele=="Water")
							var/obj/SuiryuudanAbil/A = new
							A.loc=usr.loc
							A.dir = usr.dir
							walk(A,usr.dir)
						if(src.ele=="Lightning")
							var/obj/IkadzuchiAbil/A = new
							A.loc=usr.loc
							A.dir = usr.dir
							walk(A,usr.dir)
						if(src.ele=="Wind")
							var/obj/KazeAbil/A = new
							A.loc=usr.loc
							A.dir = usr.dir
							walk(A,usr.dir)
						if(src.ele=="Earth")
							var/obj/Rock/A = new
							A.loc = usr.loc
							A.dir = usr.dir
							walk(A,usr.dir)
						if(prob(45))
							src.RPPSpent += rand(0.5,0.8)
							src.RPPSpend()
						for(var/obj/Perk/A in usr.contents)
							if(A.name == "Serene State")
								usr.Jchakra+=usr.maxJchakra*(0.1)
							if(usr.Jchakra >= usr.maxJchakra)
								usr.Jchakra = usr.maxJchakra
						for(var/mob/M in oviewers())
							if(M.SharinganBuffCopy)
								var/GG = input(M,"[usr] has used [src]! Your sharingan allows you to copy it! Wil you?")in list("Yes","No")
								if(GG=="Yes")
									var/obj/Custom/Blank_Jutsu/E = new(M)
									E.name=src.name
									E.description=src.description
									E.dran=src.dran*1.95
									E.skil="[src.skil]"
									E.jut=src.jut
									E.ran=src.ran
									E.ele=src.ele
									E.Kekkei = src.Kekkei
									M.SharinganBuffCopy = 0
									sleep(2500)
									M.SharinganBuffCopy = 1
									M<<"Your ability to copy techniques with the Sharingan has returned."
								if(GG=="No")
									return

					else
						var/Try = input("Will you attempt to use this jutsu? There's a possibility of death if you over extend yourself!") in list("Yes","No")
						if(Try == "Yes")
							if(prob(25))
								usr.Jchakra = 0
								viewers(16) << output("<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br> [src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]","World.OOC")
								usr.SkillUp()
								for(var/obj/Perk/A in usr.contents)
									if(A.name == "Serene State")
										usr.Jchakra+=usr.maxJchakra*(0.1)
									if(A.name == "Mastery")
										src.RPPSpent += rand(0.5,0.8)
										src.RPPSpend()
							else
								usr<<"You overextend your chakra using the jutsu....You're kncoked out"
								view()<<"[usr] has passed out from overextending their chakra."
								usr.Health = 0
						if(Try == "No")
							usr<<"You don't have enough chakra left to use this...."
							oviewers()<<"This character has tried to use a jutsu they don't have the chakra for.."



				if(src.idran == "Stamina")
					MathsresultStamina = src.dran
					if(MathsresultStamina <= 100)
						MathsresultStamina = 100
					if(usr.Jstam>=MathsresultStamina)
						usr.Jstam-=round(MathsresultStamina)
						viewers(16) << output("<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br> [src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Stamina Drain: [src.dran] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]","World.OOC")
						usr.SkillUp()
						for(var/obj/Perk/A in usr.contents)
							if(A.name == "Serene State")
								usr.Jstam+=usr.maxJstam*(0.1)
							if(A.name== "Mastery")
								src.RPPSpent += rand(0.5,0.8)
						for(var/mob/M in oviewers())
							if(M.SharinganBuffCopy)
								var/GG = input(M,"[usr] has used [src]! Your sharingan allows you to copy it! Wil you?")in list("Yes","No")
								if(GG=="Yes")
									var/obj/Custom/Blank_Jutsu/E = new(M)
									E.name=src.name
									E.description=src.description
									E.dran=src.dran*1.95
									E.skil="[src.skil]"
									E.jut=src.jut
									E.ran=src.ran
									E.ele=src.ele
									E.Kekkei = src.Kekkei
									M.SharinganBuffCopy = 0
									sleep(2500)
									M.SharinganBuffCopy = 1
									M<<"Your ability to copy techniques with the Sharingan has returned."
								if(GG=="No")
									return
					else
						usr<<"You don't have enough stamina left to use this...."
						oviewers()<<"This character has tried to use a jutsu they don't have the stamina for.."
				src.ErpUp()

obj/Custom/Med
	Meditate
	icon= 'perks.dmi'
	icon_state = "med"
	jut = "Ninjutsu"
	Click()
		if(src in usr.contents)
			if(!usr.Jchak)
				usr.icon_state = "Focus"
				usr.move = 0
				usr.Jchak = 1
				usr<<"You begin to meditate and restore chakra."
				oview()<<"[usr] has began to meditate and restore their chakra."
				usr.ChakraMed()
				usr.StamMed()
				usr.Constitution_Check()

			else
				usr.icon_state = ""
				usr.move = 1
				usr.Jchak = 0
				usr<<"You are no longer meditating."