




obj/Custom
	var/RPPCost = 0
	var/CalDran
	Click()
		if(src in usr.contents)
			if(is_buff)
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
					return


			if(src.name == "Sickle Weasel Technique")
				var/obj/items/Weapon/Kyodai_Sensu/A = locate() in usr.contents
				if(A)
					usr<<"You swing your fan!"
				else
					usr<<"You need a fan for that."
					return
			if(src.CalDran > 0)
				if(usr.Calories >= src.CalDran)
					var/Cost = src.CalDran
					var/times = input("How many times will you use this jutsu?")as num
					var/chiz = Cost * times
					for(var/obj/Perk/A in usr.contents)
						if(findtext("[A.name]","Control"))
							if(A.tier==1)
								Cost = src.CalDran*0.90
							if(A.tier==2)
								Cost = src.CalDran*0.80
							if(A.tier==3)
								Cost = src.CalDran*0.70
							if(A.tier==4)
								Cost = src.CalDran*0.60
							if(A.tier==5)
								Cost = src.CalDran*0.50
							if(A.tier=="Master")
								Cost = src.CalDran*0.40
						if(findtext("[A.name]","Calorie Fighter"))
							Cost = Cost/2
					if(usr.Calories>=Cost*times)
						usr.Calories-=Cost*times
						viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Calorie Drain: [chiz] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
						usr.SkillUp()
						src.ErpUp()
					return

			if(src.idran == "Chakra")
				var/Cost = src.dran
				Mathsresult = Cost
				var/times = input("How many times will you use this jutsu?")as num
				for(var/obj/Perk/A in usr.contents)
					if(findtext(A.name,"Elemental Training [src.ele]"))
						if(A.tier==1)
							Mathsresult -= (src.dran*0.02)
						if(A.tier==2)
							Mathsresult -= (src.dran*0.04)
						if(A.tier==3)
							Mathsresult -= (src.dran*0.08)
						if(A.tier==4)
							Mathsresult -= (src.dran*0.16)
						if(A.tier==5)
							Mathsresult -= (src.dran*0.31)
						if(A.tier=="Master")
							Mathsresult -= (src.dran*0.52)
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
					viewers(16) << output("<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=black>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele] / Handseals: [src.hseal] / Cooldown: [src.cd] round(s)","World.OOC")
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
					if(prob(35))
						src.RPPSpent += rand(0.5,0.8)
						src.RPPSpend()

					for(var/obj/Perk/A in usr.contents)
						if(A.name == "Serene State")
							usr.Jchakra+=usr.maxJchakra*(0.05)
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
							viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
							usr.SkillUp()
							for(var/obj/Perk/A in usr.contents)
								if(A.name == "Serene State")
									usr.Jchakra+=usr.maxJchakra*(0.1)
									if(usr.Jchakra >= usr.maxJchakra)
										usr.Jchakra = usr.maxJchakra

						else
							usr<<"You overextend your chakra using the jutsu....You're unconcious."
							view()<<"[usr] has passed out from overextending their chakra."
							usr.Health = 0
							usr.KO = 1
					if(Try == "No")
						usr<<"You don't have enough chakra left to use this...."
						oviewers()<<"This character has tried to use a jutsu they don't have the chakra for.."

/*			if(src.idran == "Stamina")
				if(usr.Jstam>=src.dran)
					usr.Jstam-=src.dran
					viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu  <center><hr><br>[src.name](<font color=black>[jut]</font>) <hr><br> [src.description]<hr><br>Stamina Drain: [src.dran] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
					usr.SkillUp()
					for(var/obj/Perk/A in usr.contents)
						if(A.name == "Serene State")
							usr.Jstam+=usr.maxJstam*(0.1)
							if(usr.Jstam >= usr.maxJstam)
								usr.Jstam = usr.maxJstam
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

*/
			if(src.idran == "Stamina")
				var/Cost = src.dran
				Mathsresult = Cost
				var/times = input("How many times will you use this jutsu?")as num
				for(var/obj/Perk/A in usr.contents)
					if(findtext(A.name,"Stamina"))
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
				if(usr.Jstam>=(Cost*times))
					usr.Jstam-=(Cost*times)
					viewers(16) << output("<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=black>[jut]</font>) <hr><br> [src.description]<hr><br>Stamina Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele] / Cooldown: [src.cd] round(s)","World.OOC")
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
					if(prob(35))
						src.RPPSpent += rand(0.5,0.8)
						src.RPPSpend()

					for(var/obj/Perk/A in usr.contents)
						if(A.name == "Serene State")
							usr.Jchakra+=usr.maxJchakra*(0.05)
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
							viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
							usr.SkillUp()
							for(var/obj/Perk/A in usr.contents)
								if(A.name == "Serene State")
									usr.Jchakra+=usr.maxJchakra*(0.1)
									if(usr.Jchakra >= usr.maxJchakra)
										usr.Jchakra = usr.maxJchakra

						else
							usr<<"You overextend your stamina using the jutsu....You're unconcious."
							view()<<"[usr] has passed olut from overextending theirself."
							usr.Health = 0
					if(Try == "No")
						usr<<"You don't have enough stamina left to use this...."
						oviewers()<<"This character has tried to use a jutsu they don't have the steam for.."

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	Blank_Buff
		BOOST = 15
		Elemental
			Lightning
				Drank
				Crank
				Brank
				Arank
					LightningArmor
						GChak = -600
						Gref = 13
						Gspd = 13
						Gdur = 5
						Gdef = 5
						Gatkspd = 8.5
						name = "Lightning Armor"
						description = "The user wraps their body in a layer of lightning chakra which, instead of being used offensively, is used to electrically stimulate the user's nervous system. The technique speeds up neural synapses to react faster, and to push physical prowess to the absolute limit, allowing for tremendous raw speed. The technique has different levels of activation. The level's activation is depicted by the users hair which stands up when the technique is activated to the fullest. The higher the level, the higher the speed the user can achieve.<br>(users Durability and Ninjutsu Defense are increased by Con/2)"
						jut = "Ninjutsu"
				Srank
			Earth
				Drank
				Crank
				Brank
					EarthSpear
						GChak = -300
						Gdur = 7
						Gdef = 5.5
						Gspd = -2.5
						Gatkspd = -2.5
						Gstr = 4
						name = "Earth Spear"
						description = "The user flows chakra through all parts of their body causing it to become noticeably darker, which increases their defensive power to its utmost limits by making the skin as hard as diamond, easily capable of withstanding most attacks with little to no damage. As a result the amount of techniques that can break through the areas hardened by the Earth Spear are close to zero, excluding its undeniable weak point: Lightning Release ninjutsu. Furthermore, the destructive power of physical attacks is increased, making this a great all-purpose technique."
						jut = "Ninjutsu"
				Arank
				Srank
			Wind
				Drank
				Crank
				Arank
				Srank
			Water
				Drank
				Crank
				Arank
				Srank
			Fire
				Drank
				Crank
				Arank
				Srank

		Clan
			Uchiha
				Drank
				Crank
					SharinganT2
						icon_state = "Sharingan2"
						GChak = -230
						Gnin = 2.5
						Ggen = 2.5
						Gref = 4.5
						Ggenres = 2.5
						name = "Sharingan"
						description = "This characters sharingan has evolved, now bearing two tomoe instead of one. "
						jut = "Doujutsu"
						SharinganCopyy = 1
				Brank
					SharinganT3
						icon_state = "Sharingan3"
						GChak = -100
						Gnin = 4.0
						Ggen = 5.0
						Gref = 10
						Ggenres = 10
						name = "Sharingan"
						description = "This person has achieved Tomoe 3 of the Sharingan."
						jut = "Doujutsu"
						SharinganCopyy = 1
				Arank
				Srank
					MangekyouSharingan
						GChak = -200
						Gnin = 5.0
						Ggenres = 5.0
						Ggen = 4
						Gtai = 4.0
						Gref = 6.0
						Gcon = 2.5
						name = "Mangekyou Sharingan"
						description = "This person has unlocked the legendary Mangekyou Sharingan."
						jut = "Doujutsu"
			Chinoike
				Drank
					Ketsuryugan
						icon_state = "Sharingan"
						GChak = -50
						Ggen = 3
						description = " The Ketsuryugan allows them to perform powerful genjutsu, of comparable strength to the Uchiha clan's Sharingan. They can also use the Ketsuryugan to manipulate liquids that have high iron contents, such as blood or the water that naturally flows in the Valley of Hell. Before they can manipulate such liquids, it is necessary that they imbue it with their own chakra."
						jut = "Doujutsu"
						ran = "D"
			Hyuuga
				Drank
					Byakugan
						icon_state = "Byakugan"
						GChak = -50
						Gref = 3.5
						Gsense = 50
						Sensory = 1
						Byakugan = 1
						description = "The Byakugan gives the user a near 360º field of vision, except for one blind spot at the back of the neck above the first thoracic vertebra. The range of this vision varies between users and in fact can be improved with training. Its vision can penetrate through most solid objects and obstructions, though certain barriers may distort the Byakugan's perception somewhat. The Byakugan is also able to more effectively follow high-speed movements to better react to them. In the anime, the Byakugan is shown magnifying in on small targets and seeing infrared to detect a target's body heat. Arguably, its greatest ability is to see chakra to a greater degree than the Sharingan: it can identify chakra by the specific individuals it originates from, determine when genjutsu is being used, and discern certain types of clone from the real thing. The Byakugan's ability to see chakra is so acute that it can actually see the chakra."
						jut = "Doujutsu"
				Crank
					Gentle_Fist
						GChak = -30
						GStam = -45
						Gref = 3.5
						Gspd = 1.5
						Gatkspd = 3.5
						description = "The user drops into the Hyuuga Clan's signature combat form. Their strikes target their opponents vital organs and chakra pathways instead of aiming to do physical external damage.<br\[Each Succesful strike deals 1 true damage and 5% chakra damage]"
						jut = "Taijutsu"
						is_buff = 1
				Brank
				Arank
				Srank
			Nara
				Drank
				Crank
				Brank
				Arank
				Srank
			Akimichi
				Drank
				Crank
				Brank
					SuperExpansionJutsu
						GChak = -250
						Gstr = 25
						Gspd = -10
						Gdur = 15
						Gdef = 15
						Gatkspd = -15
						name = "Super Expansion Jutsu"
						description = "This is a heightened version of the Akimichi clan's Multi-Size Technique. It is essentially the same as the base version, though the user becomes significantly larger, on a scale comparable to a mountain. Because of their huge size, any physical attacks the user makes are by default extremely powerful and cover a wide area. Such a drastic increase in size places a great strain on the user's body<br>\[While in this state, the users attacks can reach up to 15 tiles from the user while also covering 3 tiles in width]"
						jut = "Ninjutsu"
						is_buff = 1
				Arank
				Srank
			Aburame
				Drank
				Crank
				Brank
				Arank
				Srank
			Yamanaka
				Drank
				Crank
				Brank
				Arank
				Srank
			Inuzuka
				Drank
				Crank
					BeastMimicry
						GChak = -120
						GStam = -50
						Gint = -1.00
						Gref = 3.5
						Gspd = 3.5
						Gstr = 2.00
						Gatkspd = 2.50
						name = "Ninja Art of Beast Mimicry: All-Fours Jutsu"
						description = "The user goes down on all fours, their body taking on a feral look as their chakra creates a cloak around their body, giving them the impression of becoming a beast."
						jut = "Taijutsu"
				Brank
					DoubleHeadedWolf
						GChak = -90
						GStam = -120
						Gnin = 3
						Ggen = 0
						Gtai = 7.0
						Gcon = -3.0
						Gint = -3.0
						Gref = 3.5
						Gspd = 7.5
						Gstr = 4.5
						Gdef = 3.5
						Gdur = 5.5
						Ggenres = 0
						Gatkspd = 5
						name = "Inuzuka-Style: Human Beast Combination Transformation: Double Headed Wolf"
						description = "A Combination Transformation where the user and their ninken become a single entity. It is a speciality of the Inuzuka clan, they fuse into a two-headed wolf, thus drastically increasing their size, and power. In their direct attacks, they demonstrate great efficiency. Furthermore, using techniques in addition to this gives birth to an extraordinary destructive power."
						jut = "Taijutsu"
						is_buff = 1
				Arank
				Srank
			Kaguya
				Drank
				Crank
					DanceOfTheWillow
						GChak = -20
						GStam = -100
						Gtai = 2.75
						Gstr = 1.75
						Gdef = 2.45
						Gdur = 2.5
						Gatkspd = 2.5
						name = "Dance of the Willow"
						description = "The first of the Kaguya's five dances. To perform this dance, The user grows several long bone blades from his body for use as weapons. There isn't any set form for the Dance of the Willow. Just like a willow  that is shaken by the wind, the opponents attacks are simply parried and countered. This dance form is incredibly acrobatic, using spins, charges, and long sweeping slashes to make the strikes more effective and to evade opponents' counter strikes."
						jut = "Taijutsu"
						is_buff = 1
					DanceOfTheCamellia
						GChak = -20
						GStam = -125
						Gtai = 2.75
						Gref = 2.00
						Gspd = 1.00
						Gstr = -1.00
						Gdef = 1.45
						Gdur = 3.00
						Gatkspd = 3.00
						name = "Dance of the Camellia"
						description = "The second of the Kaguya's five dances, which he performs by modifying one of his upper arm bones to create a short, bone-hilted bone sword. He then stabs chaotically and continuously which causes the opponents eyes to lag behind. The speed resembles afterimages, the hand with the sword is again and again visibly projected."
						jut = "Taijutsu"
						is_buff = 1
					DanceOfTheLarch
						GChak = -20
						GStam = -125
						Gtai = 3.75
						Gref = 1.65
						Gspd = 0.75
						Gstr = 2.00
						Gdef = 1.45
						Gdur = 3.75
						Gatkspd = 2.45
						name = "Dance of the Larch"
						description = "The third of the Kaguya's five dances. From the body, several bones pop out all at once. The stronger the opponent's physical attack, the more powerful the counter attack is, dealing severe damage. The sudden Defense, combined with the needle-like bones high killing ability, makes way for a technique which potential his high for battle.<br>(Damage when struck:Durability+Opponents physical damage/4)"
						jut = "Taijutsu"
						is_buff = 1
				Brank
				Arank
				Srank
			Hoshigaki
				Drank
				Crank
				Brank
				Arank
				Srank
			Yuki
				Drank
				Crank
				Brank
				Arank
				Srank
			Hozuki
				Drank
				Crank
				Brank
				Arank
				Srank
			Sabaku
				Drank
				Crank
					SandArmor
						GChak = -200
						Gdur= 4
						Gdef = 4
						Gspd = -2.5
						Gatkspd = -2.5
						Gtai = -2.0
						name = "Sand Armor"
						description = "Using this technique, the user can cover themselves in a compacted layer of sand, providing an additional defense should their Shield of Sand fail; Though quite effective, maintaining the armor requires a large amount of chakra and stamina. Furthermore, it is nowhere as resilient as the Shield of Sand, since it easily breaks away upon impact, indicating that the sole purpose of the armor is to absorb impact channeled unto the users body during battle. Another weakness is the additional weight of the sand which leads to decreased levels of speed and mobility."
						jut = "Ninjutsu"
				Brank
				Arank
				Srank

		Taijutsu
			Drank
			Crank
			Brank
				GateofOpening
					GStam = -100
					Gtai = 2
					Gspd = 1.5
					Gatkspd = 2
					Gstr = 4.0
					name = "Gate of Opening"
					description = "The Gate of Opening located in the brain, removes the restraints of the brain on the muscles so 100% of the user's strength can be used whereas normally, a person can only use 20% of their muscles' strength to keep them from disintegrating. Unlocking this gate allows the user to use the Front Lotus."
					jut = "Taijutsu"
				GateofHealing
					GStam = 1000
					Gstr = 1.5
					name = "Gate of Healing"
					description = "The user unlocks the Gate of Healing, revitalizing their torn muscles and quickly regenerating the tears. The user's body is revitalized in order to supplement their muscles with additional stamina. By doing so, they are able to channel more of their energy and withstand the crippling effects of the Gate of Opening."
					jut = "Taijutsu"
				GateofLife
					GChak = 1000
					GStam = -200
					Gtai = 3.0
					Gspd = 3.5
					Gatkspd = 3.5
					name = "Gate of Life"
					description = "The user opens the Gate of Life, resulting in increased blood flow. This increased blood flow results in the user's epidermis turning a pale reddish color, before completely evolving into that of a deep crimson reminiscent of the bloodstream."
					jut = "Taijutsu"
				GateofPain
					GStam = -200
					GChak = 1000
					Gspd = 6.5
					Gatkspd = 6.5
					Gtai = 6.5
					Gcon = -6.5
					Ggenres = 3.5
					name = "Gate of Pain"
					description = "The Gate of Pain, located on the spinal cord, increases the user's speed and power. May cause muscle tissue to tear on use."
					jut = "Taijutsu"
				GateofLimit
					GStam = -500
					GChak = 1000
					Gatkspd = 5.0
					Gref = 5.0
					Gspd = 5.0
					Gstr = 5.0
					Gtai = 5.0
					Ggenres = 5.0 //subject to change
					name = "Gate of Limit"
					description = "The Gate of Limit, located in the abdomen, increases the user's speed and power."
					jut = "Taijutsu"
				GateofView
					GStam = -600
					GChak = 1000
					Gatkspd = 7.5
					Gatkspd = 7.5
					Gspd = 7.5
					Gref = 7.5
					Gtai = 7.5
					Ggenres = 7.5
					name = "Gate of View"
					description = "The Gate of View, cated in the stomach, increases the user's speed and power. Opening of this gate releases such enormous amounts of energy that it can cause nearby water bodies to form a vortex around the user. Once opened, capable users can perform the Morning Peacock."
					jut = "Taijutsu"
				GateofWonder
					GStam = -700
					GChak = 2000
					Gatkspd = 10.0
					Gspd = 10.0
					Gref= 10.0
					Gtai = 10.0
					Ggenres = 10.0
					name = "Gate of Wonder"
					description = "The Gate of Wonder, located below the stomach, further increases the user's speed and power. Only after this gate is activated, can a capable user perform the Daytime Tiger. Those who open this gate will secrete glowing green — blue in the anime — sweat from every inch of their body which immediately evaporates from their own heat energy, creating an aura which people mistake as a chakra coating. Unfortunately, the side effects of opening the gate are that the user's muscle fibres are ripped to shreds, causing intense pain if anything or anyone touches them."
					jut = "Taijutsu"
				GateofDeath
					GStam = 5000
					GChak = 5000
					Gatkspd = 13.5
					Gspd = 13.5
					Gref = 13.5
					Gtai = 13.5
					Ggenres = 20.0
					name = "Gate of Death"
					description = "The Gate of Death, located at the heart, requires the user to puncture their chest just above the heart in order to open it. Opening this gate will cause the user's blood to emanate a flaming aura of red steam from all pores of their body, hair, and eyebrows. Releasing this gate uses up all of the body's energy while making the heart pump at maximum power. Exceeding the power of every other gate, the user is granted approximately a hundred times their normal power, far beyond that of the five Kage. Once activated, those who are capable can perform the Evening Elephant and the Night Guy. Unfortunately, the side effect of opening this gate is that it comes at the expense of the user's life, causing the user to crumble to ash, having virtually cooked themselves from the inside-out."
					jut = "Taijutsu"
				DrunkenFist
					GStam = -200
					Gref = 3.0
					Gspd = 2.5
					Gint = -3
					Gcon = -3
					name = "Drunken Fist"
					description = "runken Fist is a unique style of combat where, according to Might Guy, 'the more you drink, the drunker you get, and the stronger you become'. It can not be learned, taught, nor refined through training and practice. Drunken Fist fighters are not simply drunk: they become human powerhouses who'll strike unpredictably with an explosive fury and without any second thoughts about their actions. Once drunk, the user will lose their ability to know friend from foe and attack whomever is in their vicinity. The user's ability to dodge enemy attacks is also seemingly enhanced."
					jut = "Taijutsu"
			Arank
			Srank

		Ninjutsu
			Drank
			Crank
			Brank
			Arank
			Srank
		InitialRelease
			GChak = -100
			Gstr = 5
			Gspd = 5
			Gatkspd = 5
			Gref = 5
			description = "This characters seal containing their bijuu has weakened, allowing a portion of its chakra to leak out. Despite the seal not being fully broken, the bijuus inherently massive chakra provides increadible boosts to their hosts.<br>Note:This only occurs when the user is in a state of heightened emotions or their life is in potential danger"
			jut = "Ninjutsu"
/*		AuralJudgement
			GChak = 0
			GStam = 0
			Gnin = 1.5
			Ggen = 0
			Gtai = 5.0
			Gcon = -2.0
			Gint = 0
			Gref = 0
			Gspd = 0
			Gstr = 0
			Gdef = 2.0
			Gdur = 0
			Ggenres = 5.0
			Gatkspd = 0
			name = "Dark Release: Aural Judgement"
			description = "The user releases an aura of Dark Release Chakra from their body.  They take on a dark coloration.  Their eyes become bright yellow and they seem to give off a Dark Release stream of chakra as they move.  It drains the chakra from ninjutsu which come near the user, lowering the power of said techniques and transferring the chakra to the user.  The stream of chakra that follows them deals no damage, it is only cosmetic.  But when the user comes into contact with their opponent, they drain a small amount of chakra with each strike."
			jut = "Ninjutsu"
		SonataOfCorruption
			GChak = 0
			GStam = 0
			Gnin = 3
			Ggen = 0
			Gtai = 7
			Gcon = -3.0
			Gint = 0
			Gref = 3
			Gspd = 1
			Gstr = 1
			Gdef = 3.5
			Gdur = 1
			Ggenres = 7.0
			Gatkspd = 0
			name = "Dark Release: Sonata of Corruption"
			description = "The uses releases a much larger aura of Dark Release Chakra from their body, similarly to Aural Release. Their aura extends into several physical tendrils which are capable of draining chakra rapidly from targets struck by them. It drains massive amounts of chakra from ninjutsu which are launched at the user, transferring that chakra to the user. They are able to drain chakra from their targets with each physical strike made against them."
			jut = "Ninjutsu" */

		Arank
		EyeofKagura
			GChak = -100
			Gref = 3
			Gsense = 50
			Sensory = 1
			description = "By focusing and opening the mind's eye, the user is able to find and track an individual's chakra over a vast distance that exceeds ten kilometres. By further focusing their chakra, they can extend this range to far greater distances. This ability also gives them the capability to perceive fluctuations in a person's chakra made when a person is lying or if someone, including themself, is under a genjutsu. Also, by focusing on a particular chakra, they can perceive their target's movements and surrounding area with great detail. These sensory capabilities bless the user with abilities that even surpass dojutsu with comparable powers."
			name = "Eye of Kagura"
			jut = "Ninjutsu"
		Srank

		OldPerson
			Gstr = -4
			Gspd = -4
			Gref = -4
			Gdur = -3
			Gdef = -3
			Gint = 10
			name = "Old Person"
			description = "This person is old. Despite this, however, they are extremely wise and fit to teach the next generation of shinobi."
			jut = "Ninjutsu"
/*		HeroReleaseMask
			GChak = -25
			Gtai = 1.95
			Gref = 1.95
			Gdur = 0.2
			Gdef = 1.54
			Gint = 1.25
			Ggenres = 1.25
			Sensory = 3
			Gsense = 10
			name = "Hero Release: Mask!"
			description = "The user releases their hero chakra into their body. This increases their sight by 1 tier and gives them very low level sensing in the immediate area. This technique manifests as a colorful mask that covers just their eyes and nose."
			jut = "Ninjutsu"
		HeroReleaseCape
			GChak = -120
			GStam = -60
			Gnin = 0
			Ggen = 0
			Gtai = 4.5
			Gcon = 0
			Gint = 0
			Gref = 3.5
			Gspd = 2.75
			Gstr = 4.5
			Gdef = 3.0
			Gdur = 5.0
			Ggenres = 1.5
			Gatkspd = 0
			name = "Hero Release: Cape!"
			description = "The user distributes their Hero release chakra throughout their body for a boost in physical prowess. Contact with the Ouendan during this jutsu will result in a burning, shocking, and cutting sensation similar to the Strike technique, albeit the results are drastically lowered. This sudden release of chakra produces an interesting asthetic in which a cape appears at their back as if they were a literal superhero, accompanied by lighter hair sheen and iris coloration."
			jut = "Ninjutsu" */
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Ninjutsu
		skil = "New"
		jut = "Ninjutsu"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Shunshin"
		idran = "Chakra"
		Drank
			ran = "D"
			cd = 0
			Shunshin
				icon = 'Skillcard.dmi'
				icon_state = "Run"
				name = "Shunshin no Jutsu"
				dran = 350
				description = "A technique wherein the user exerts chakra into their body, increasing their metabolic rate, allowing them to cover a distance in a short period. This technique has a delay and causes the user to become dizzy and disoriented for a short period after use until mastered.<br><br>\[Dazed following the execution of technique unless Flicker Fighter perks are possessed.]<br>\[Speed/2 + Con/2 =Tiles moved]"
			Suimen
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Suimen"
				dran = 10
				description = "Suimen Hoko no Waza is a Ninjutsu technique based on the Kinobori no Waza technique that allows a ninja to walk on water as if it was a solid surface. Focusing an even amount of chakra out of the soles of their feet, they can balance themselves on the very surface of the water.<br><br>\[The user is capable of jumping Strength + Con/3 Tiles high]"
		Crank
			ran = "C"
			cd = 1
		Brank
			ran = "B"
			cd = 2
			Afterimage_Clone
				ran = "B"
				icon = 'Skillcard.dmi'
				icon_state = "Henge"
				name = "Afterimage Clone"
				dran = 1000
				description = "Using the Body Flicker Technique, the user moves around and creates several afterimages. With their speed, they can move between their afterimages, and deliver attacks from each of them, each of them having mass behind them. If attacked, they move out of the way, letting their opponent's attack go through one of the afterimages.<br><br>\[Creates 6 afterimages.]<br>\[Each turn, the user may use their Speed + 10 to avoid or launch a basic attack using one of the afterimages.]<br>\[Afterimages vanish when struck and have no mass or chakra, allowing certain Doujutsu or an appropriate sensory perk to easily tell them apart.]<br>\[Must be used once each turn it is active, or the afterimages vanish.]"
			Chakra_Disguise
				ran = "B"
				icon = 'Skillcard.dmi'
				icon_state = "Henge"
				name = "Chakra Disguise"
				dran = 500
				description = "After preparing this technique, the user will be able to change one's chakra signature, make it seem larger, smaller or even non-existent, due to a complex anachronism that the user creates in one's chakra changing their perspective to others. A skilled user can even imitate the chakra signature of another, though this requires some form of sensory or Doujutsu capable of detecting chakra."
		Arank
			ran = "A"
			cd = 3
		Srank
			ran = "S"
			cd = 4


	Shurikenjutsu
		idran ="Stamina"
		skil = "New"
		jut = "Shurikenjutsu"
		ele = "Elementless"
		icon = 'Skillcard.dmi'
		icon_state = "Shunshin"
		Drank
			ran = "D"
			cd = 0
			ManipulatedShuriken
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Manipulated Shuriken Technique"
				dran = 0
				description = "With this technique a translucent string, both elastic and highly durable, is attached to a shuriken, making it possible to alter its path after having thrown it. An expert will have the ability to freely glide the shuriken in any direction with just a single movement of their fingertip. The first attack, challenging the enemy, is avoided and after a time-lag of several seconds, it will come from behind. Depending on the performance, the possible tactics can be infinite.<br><br>\[Targets suffer -3 Reflex when reacting to this technique; this can be negated by T1 Sight.]<br>\[Can be linked directly into the use of the Shadow Rope Technique.]"

			ShadowShuriken
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Shadow Shuriken Technique"
				dran = 150
				description = "It's a simple technique where two shuriken, like the Fuma Shuriken, are piled one onto another and thrown simultaneously. However, depending on the way it's used, it can prove its absolute efficiency. The trick is to somehow draw the enemy's attention towards the upper shuriken. Then, they have to deal with the path of the lower, unnoticed shuriken. However, if the enemy notices both shuriken, which is done when they duck down, the technique ends up losing most of its efficiency.<br><br>\[Targets suffer -5 Reflex when reacting to this technique; this can be negated by T1 Sight.]"
		Crank
			ran = "C"
			cd = 1
			Shadow_Rope_Technique
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Shadow Rope Technique"
				dran = 350
				description = " The Shadow Rope Technique is a follow-up technique for the Manipulated Shuriken technique and while most use the manipulated shuriken to strike a target’s flank, this more advanced technique employs reinforcing the string with one’s chakra. This  can be used to bind a target, catch falls or even rappel or swing to a new position. If they aren't fast enough to move by then, they will become wrapped up in a thick wire.<br><br>\[This can only be used through the Manipulated Shuriken Technique.]<br>\[Bind Strength:Control/2 vs Strength]<br>\[Rappel/Swing speed during repositions is the user’s movement speed +5]"
		Brank
			ran = "B"
			cd = 2
		Arank
			ran = "A"
			cd = 3
		Srank
			ran = "S"
			cd = 4

	Kenjutsu
		idran = "Stamina"
		skil = "New"
		jut = "Kenjutsu"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Shunshin"
		Drank
			ran = "D"
		Crank
			ran = "C"
			cd = 1
			Moon_Light
				name = "Moon Light"
				dran = 550
				description = "The user attacks with their sword, stabs it into the ground, balances themselves on it and kicks their opponent away. Their kick is usually aimed at the upper abdomen until the neck area.<br><br>\[Lowers opponent's Reflex by -3, and extends user’s attack range by 1 Tile.]<br>\[Knocks opponent back by Kenjutsu/4.]"
		Brank
			ran = "B"
			cd = 2
			Tremor_Hilt
				name = "Tremor Hilt"
				dran = 700
				description = "The user prepares a stance before bursting forth with incredible speed. Upon reaching their opponent they unsheathe their blade and slam the hilt right into their opponents chest. Combining the speed of their advance and speed of the drawn blade they are able to inflict considerable blunt damage, leaving their opponent stunned and knocked completely off their feet.<br><br>\[Damage: Kenjutsu Damage + Speed/3, *Damage is factored BEFORE the Speed increase*]<br>\[Knockback: Speed/4]<br>\[Speed +10]"
		Arank
			ran = "A"
			cd = 3

		Srank
			ran = "S"
			cd = 4

	Fuuinjutsu
		idran = "Chakra"
		skil = "New"
		jut = "Fuuinjutsu"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Gogyou Fuuin"
		Drank
			ran = "D"
			cd = 0
			Basic_Sealing
				name = "Basic Sealing"
				dran = 300
				description = "This character is capable of performing basic sealing techniques. They are capable of sealing a small number of weapons into scrolls and inanimate objects of suitable size, but not onto another organic being.<br><br>\[Capable of sealing up to 10 small weapons such as kunai/shuriken/senbon.]<br>\[This technique follows typical multihit calculations.]"
		Crank
			ran = "C"
			cd = 1
			Five_Seal_Barrier
				name = "Five Seal Barrier"
				dran = 550
				description = "This technique creates a barrier around a place by placing 4 forbidden (?, kin) tags in different locations surrounding the place to be protected, a 5th tag on the location to be protected. The tags are placed on flat surfaces, and are connected with the user's chakra. This technique turns the entire range surrounded by the tags into a barrier space, and inside the space, the material's destruction is forbidden. Using any kind of physical attack to try and destroy something in the barrier is folly, as it will only lead to injury. To cancel this, it is necessary to search for the 4 tags and tear them off simultaneously. Meaning there must be at least 5 people on a team to cancel it.<br><br>\[Can be used over an area up to 10x10]<br>\[Durability:Seal efficacy + 5]"

			Finger_Carving_Seal
				name = "Finger Carving Seal"
				dran = 50
				description = "The user concentrates chakra into their finger and using the heat from that, can apply writing of whatever they want to a surface. This technique however requires them to be very delicate with their chakra control. This technique causes slight discomfort for a living target and if it is on flesh, it will scar."

			Lotus_Sealing
				name = "Lotus Sealing"
				dran = 550
				cd = 0
				description = "This character is capable of unique seals which allow them to store a moderate amount of weapons in scrolls and other inanimate objects.  This character's seal take on the shape of lotus flowers when used to their full capacity, and they are capable of creating remote triggers with their seals for traps.<br><br>\[This user can set up seals for containing or releasing objects that can be remotely activated.]<br>\[The size of the objects are determined by the user’s Fuuinjutsu perks.]<br>\[Activation Range=Control/4]<br>\[Release speed=User’s Control -5]"

		Brank
			ran = "B"
			cd = 2
			Fuuinjutsu_Fire_Sealing
				name = "Fuuinjutsu: Fire Seal"
				dran = 1150
				hseal = 4
				description = "A kind of Fuuinjutsu that involves sealing a technique's effects within a specific location. As it is tailored for Fire Release ninjutsu, it requires a caster well-versed in the exacting art of Sealing Formulas, as well as in ninjutsu. The jutsu-sealing space in the scroll is left blank, for the formula to be inscribed in with a brush. After performing the needed hand seals, chakra-like vapor appears from the scroll, and envelops the flames. They are sucked in towards the scroll, and the appearance of the kanji for <i>Seal</i> certifies the technique's completion.<br><br>\[Sealing Efficacy = Control + Intelligence -10]<br>\[Seals flames within 10 points of seal efficacy; only seals one technique at a time.]<br>\[Releasing Sealed Techniques requires a separate Chakra Action.]<br>\[The sealing and release of techniques use separate Cooldowns.]"

			Root_Sealing
				name = "ROOT Sealing"
				dran = 1750
				description = " This character is capable of applying seals directly to the body of other beings which restrict one very specific thing from the person. This can range from a word, to a certain single action, or even the use of a certain body part. This however does not apply to jutsu, or the execution of jutsu. This seal can not be used to cut someone's chakra.<br><br>\[Seal efficacy vs Intelligence+Control to resist; alternatively can resist against Seal efficacy vs Control+Strength to resist.]"
				hseal = 1

			Amplification_Summoning_Technique
				name = "Amplification Summoning Technique"
				dran = 1200
				hseal = 4
				description = "This is a summoning technique that, when applied, allows a summoned creature to multiply when being dealt damage. Upon being struck by a direct attack, the summon will divide into another identical beast. The beast can then recombine if needed, with one body carrying the heads of however many additional beasts were created.<br><br>\[Requires physical contact for initial application.]<br>\[Max Divisions: 1 per 10 Control to a max of 6.]<br>\[Multiple applications do not allow you to exceed this.]<br>\[Stats are equal to the original summon, but Health, Chakra and Stamina are split between all copies.]"

		Arank
			ran = "A"
			cd = 3
			Five_Pronged_Seal
				name = "Fuuinjutsu: Gogyou Fuuin"
				dran = 1900
				hseal = 1
				description = "Five Element Seal is a technique which produces a powerful seal that is used to block or disturb the flow of chakra in a target. Once the seal is completed, the target will become unconscious and unable to fight for a short time.<br><br>\[Completely negates usage of chakra after seal is applied. Individuals with large chakra pools are able to tap into their ninjutsu, albeit they are less effective.]<br>\[If a T3 Chakra perk or above is possessed, the sealed character can access their jutsu at 25% effectiveness, + an extra 25% for every tier beyond T3.]"
			Five_Pronged_Unseal
				name = "Fuuinjutsu: Gogyou Kaiin"
				hseal = 1
				dran = 850
				description = "This technique can be used to remove Fuuinjutsu of up to equal power, like its counterpart."

			Curse_Sealing
				name = "Curse Sealing"
				dran = 1750
				hseal = 19
				description = "This technique is used to suppress technique-induced marks on a person. Marks of weaker power can be completely suppressed by this technique alone, but for marks of higher power, like the Cursed Seal of Heaven, it will cause the seal's power to become dependent on the recipient's own willpower to some extent, especially if the sealer is not experienced enough to strengthen the seal with his own power."

		Srank
			ran = "S"
			cd = 4
			Reaper_Death_Seal
				name = "Reaper Death Seal"
				dran =4000
				hseal = 10
				description = "The Dead Demon Consuming Seal is a seal developed by the Uzumaki clan. It invokes the power of a spectral entity known as the Shinigami that can only be seen when it grasps one's soul."
			Reverse_Tetragram_Seal
				name = "Reverse Tetragram Sealing Jutsu"
				dran = 1500
				description = "This technique is a Fuuinjutsu that the user places across their chest, and sets it to activate upon their death. The technique releases 4 symbols from the user's body that then forms a large, black sphere around them. Anything caught inside the sphere's area is then drawn in and sealed within the user's corpse."


	Genjutsu
		idran = "Chakra"
		skil = "New"
		jut = "Genjutsu"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Nehan"
		Drank
			ran = "D"
			cd = 0
			Genjutsu_Kai
				name= "Genjutsu: Kai"
				dran = 250
				description = "The ninja needs to stop the flow of chakra in their body, and then apply an even stronger power to disrupt the flow of the caster's chakra; this is called Genjutsu Dissipation (???, Genjutsu Kai). This can also be done by an unaffected ninja by applying a sudden surge of chakra into the affected person.<br><br>\[User’s Control vs Genjutsu power.]<br>\[For every turn that given targets have been within a genjutsu, the User’s Control gains +5 for this calculation.]"
			Magen_Narakumi
				name = "Demonic Illusion: Death Mirage Jutsu"
				dran = 350
				hseal = 2
				description = "This is a genjutsu that reveals the fears that dwell inside people's hearts. Everyone has an image of the one thing they wouldn't want to ever see. This technique draws forth such an image from within the heart and has one mistake it for reality. First, an imaginary circle of leaves will spin around and envelop the target, falling away shortly after. After a short period, the illusion will begin. This is to make the illusion more convincing, since the user will likely have moved before the illusion sets in. If the mental image is a gruesome one, the shock will be accordingly great.<br><br>\[Damage:Genjutsu damage.]<br>\[Must use a visual or auditory trigger]"

			Interrogation_Jutsu
				name = "Interrogation Jutsu"
				dran = 350
				hseal = 1
				description = "A shinobi uses this genjutsu to break the will of his (captured) target, to make him or her give as much information as possible. However, if the target has strong will, the technique will be useless.<br><br>\[If the victim possesses a Will perk, they receive an additional +10 to their Gen Resistance.]"

			Mist_Servant
				name = "Mist Servant Jutsu"
				dran = 450
				hseal = 3
				description = "This genjutsu creates eerie black illusions of ninja, which appear one by one from trees and rocks, and then corners the enemy. Their movements are somehow slow, but when attacked they multiply, and in this way they appear like ghosts inhabiting the mist. Kunai may be added to this technique, by throwing them to match illusions’ movement, making them seem real. As the clones continue to multiply rapidly, the victim will eventually be worn down.<br><br>\[While reacting to basic attacks launched by the user and clones of this technique while it is active, the target’s reflex is reduced by -5.]<br>\[This technique is sustained using its full cost each turn.]"


		Crank
			ran = "C"
			cd = 1
			Magen_Katon
				name = "Demonic Illusion: Descending Fire Jutsu"
				dran = 550
				hseal = 5
				description = "This technique causes the illusion of a tremendous ball of fire falling from the sky into a designated area. The targets involved in the illusion literally feel the ball's hot temperature getting closer.<br><br>\[Landing: Genjutsu + Control vs Gen Res + Control.]<br>\[Damage: Genjutsu Damage vs Genjutsu Defense.]<br>\[Capable of causing brain damage.]"

			Genjutsu_Optic_Delusory
				name = "Demonic Illusion: False Surroundings Technique"
				dran = 550
				description = "A genjutsu that allows one to trick others into mistaking the place they're in for another. This technique's main feature is that it can be cast over an extensive surface, therefore any and all who step into the illusion's area of effect will fall under the spell. That said, it might not work so well on people who are well-versed or otherwise skilled in genjutsu.<br><br>\[Landing:Genjutsu + Control vs Gen Res + Control]<br>\[Must be used and calculated once each turn.]<br>\[Each turn, the landing calculation gains a -5 penalty.]"

			Sly_Mind_Effect
				name = "Sly Mind Affect Jutsu"
				dran = 550
				hseal = 1
				description = "This technique allows the user to change the enemies sense of direction as they see fit. When this technique was evoked, the enemy was forced to walk around continuously in circles by making it seem as if they're walking straight to their desired destination.<br><br>\[Landing: Genjutsu + Control vs Gen Res + Control.]<br>\[Must be used and calculated once each turn.]<br>\[Each turn, the landing calculation gains a -5 penalty.]"

			Hazy_Illusion
				name = "Hazy Genjutsu"
				dran = 560
				description = "This technique casts an illusion on the enemy that blurs the target's vision of the entire area. In addition, it causes the victim to react as though they're sinking in quicksand, effectively immobilizing the target.<br><br>\[Landing: Genjutsu + Control vs Gen Res + Control.]<br>\[Must be used and calculated once each turn.]<br>\[Each turn, the landing calculation gains a -5 penalty.]<br>\[-2 Reflex and Speed to captured targets per mastery level of this technique. Capped at -8]"

			Leaf_Style_Willow
				name = "Leaf-Style Willow"
				dran = 560
				description = "The user waves their sword back and forth, which when seen by the target locks them in a genjutsu which causes them to hallucinate multiple waving arms. The movement resembles that of a willow tree blowing in the wind. With the enemy off guard, the user is free to cut them down.<br><br>\[Landing: Genjutsu + Control vs Gen Res + Control]<br>\[Must be used and calculated once each turn.]<br>\[Each turn, the landing calculation gains a -5 penalty.]<br>\[-5 Reflex to a single target.]"

			Rockslide_Genjutsu
				name = "Rockslide Genjutsu"
				dran = 550
				hseal = 5
				description = "This technique casts an illusion on multiple targets, making them perceive multiple large explosions going off. From this, the victims will see the ground around them collapsing, disorienting them and leaving them confused and in a panic. This technique does not appear to be very powerful as an individual can negate it themselves and all others around them without direct contact on the fellow victims.<br><br>\[Landing: Genjutsu + Control vs Gen Res + Control]<br>\[Must be used and calculated once each turn.]<br>\[Each turn, the landing calculation gains a -5 penalty.]<br>\[-5 speed to targets captured by this technique.]"

		Brank
			ran = "B"
			cd = 2
			Genjutsu_Double_Optic_Delusory
				name = "Genjutsu: Inception"
				dran = 1200
				description = "This technique places another illusion within another illusion created by the user. When the target dispels the first illusion, they will not realize that a second is in place.<br>(Must be used in tandem with another genjutsu.)<br>(Once a genjutsu is broken the first time, they then must break it a second time)<br>(Second genjutsu receives a +10 to calcs)"
			Genjutsu_Shibari
				name = "Genjutsu: Genjutsu Binding"
				dran = 2000
				hseal = 4
				description = "As the name suggests, the user binds the opponent in a genjutsu, rendering them incapable of movement. This genjutsu can be used on more than one target at the same time. Once the target is bound, the user or an ally can rush up to the enemy and deliver a devastating killing blow.<br>(Bind Strength= Genjutsu+10 vs Strength)<br>(Bind Strength weakens by -5 every round)<br>(Using any other chakra action breaks the bind, unless dual caster is possessed)(The user may target up to control/10 targets for this technique.]"
			Genjutsu_Sylvan_Fetters
				name = "Genjutsu: Sylvan Fetters"
				dran = 1750
				hseal = 5
				description = "This is one of the genjutsu passed down since ancient times in Konohagakure. The user first disappears from plain sight in a mist-like fashion in order to approach the target without being detected. Once close enough, the target will then be completely robbed of their mobility as they see the mirage of a fast-growing tree coiling itself around them. Given that the subject remains conscious, this technique proves extremely efficient for information-gathering. Once the target is immobile, the user can then attack the enemy, usually after emerging from the trunk of the tree.<br>\[Bind Strength= Genjutsu+15 vs Strength]<br>\[Bind Strength weakens by -5 every round]<br>\[Using any other chakra action breaks the bind, unless dual caster is possessed.]<br>\[Lasts up to four turns.]"

			Lightning_Flash_Pillar
				name = "Lightning Illusion: Flash Pillar"
				dran = 1850
				description = "This genjutsu blinds the enemy with an extremely bright light that appears to emanate from the user's body.<br>(Bind Strength= Genjutsu+10 vs Strength)<br>(Bind Strength weakens by -5 every round)<br>(Using any other chakra action breaks the bind, unless dual caster is possessed)(The user may target up to control/10 targets for this technique.]"

		Arank
			ran = "A"
			cd = 3
			Nehan_Shoja
				name = "Genjutsu: Feather Illusion Jutsu"
				dran = 2400
				hseal = 1
				description = "It is a powerful genjutsu that generates a fluttering rain of sleep-inducing, illusory white feathers. Whomever sees them as they fall, piling up and covering the whole target area, will experience Eden-like bliss and fall into a state of tranquil slumber. No matter how much one resists the hypnotic spell, the desire to sleep is instinctive, and there's no fighting it. However, an experienced shinobi will be able to dispel the genjutsu before it takes effect.\[genjutsu range= Genjutsu/2 sized AOE centered on the user rounding down.]\[Targets have two turns to prevent falling asleep for five turns.]"
			Infinite_Darkness
				name = "Genjutsu: Infinite Darkness Jutsu"
				dran = 2400
				hseal = 1
				description = "This technique exerts an hallucinatory effect upon the eyesight, effectively blinding the opponent. No matter how skilled an opponent may be, they are forced to wait helpless in this world of darkness, as this technique allows the user to attack unseen. Although it negates sight, it does not stop the other senses.<br>(+20 to genjutsu calculations)<br>(Negates sight perks entirely)<br>(All those caught within their genjutsu have their reflexes halved)<br>(Blind fighter negates this technique)<br>(Non-Damaging)"

		Srank
			ran = "S"

	Taijutsu
		icon='Skillcard.dmi'
		icon_state="Run"
		Drank
			idran = "Stamina"
			skil = "New"
			jut = "Taijutsu"
			ran = "D"
			ele = "Elementless"
			Dynamic_Entry
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Dynamic Entry"
				description = "The technique is basically the user performing a jump kick into their opponent's face.<br><br>\[Attack speed +3]"
				dran = 150
		Crank
			idran = "Stamina"
			skil = "New"
			jut = "Taijutsu"
			ran = "C"
			cd = 1
			ele = "Elementless"
	//		Oukashou
	//			icon='Skillcard.dmi'
	//			icon_state="Oukashou"
	//			name = "Oukashou"
	//			description = "While some may see it as superhuman strength, this technique is actually an application of medical ninjutsu, that demands the ability to concentrate and minute chakra control. An immense amount of chakra is kneaded inside the body, and a moment later all of it is gathered into the fist. That chakra is then released into the target, which does a great amount of damage. With the damage done dependent on the amount of chakra used, it is also possible for a skilled shinobi to amass it in their fingertip. When the ground is hit it is pulverized into minute pieces by the excess shock, which are then scattered like flower petals, giving rise to the name Cherry Blossom Impact.<br><br>\[Damage: Taijutsu Damage+5.]<br>\[Debris Eruption range = User’s Strength/3 rounded down and centered on the point/target of impact.]"
	//			dran = 250
			Perfect_suplex
				name = "The Perfect Suplex"
				description = "The user grabs the target by the waist, lifts them up in the air, and bends backwards to slam them headfirst into the ground. The attack however is a double edge sword in also damaging the user.<br><br>\[Damage: (Strength + 5) + Fall Damage vs Durability x2]<br>\[User is hurt by their damage / 2]"
				dran = 500
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "C"
				ele = "Elementless"
			O_Sato_Gari
				name = "O-Sato-Gari"
				description = "The users grabs the person at the collar and sleeve and then pulls them towards their leg on the same side as the sleeve grip. Then the users step past them and swing their foot up. As the leg swings back down, the calf connects with theirs and they are thrown hard onto their backs.<br><br>\[Damage: Taijutsu vs Durability]<br>\[Speed: Attack speed]<br>\[Unless the target has Solid Feet, they are left on their backs and their reflex -5 for the following round]"
				dran = 500
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "C"
				ele = "Elementless"
			Leg_Straight
				name = "Leg Straight"
				description = "Similarly to the O-Sato-Gari, the user can choose to grab the collar of their target and yank them towards them. Bringing the opponent closer to them increases the amount of opposing momentum when the user brings their leg up and forces their heel right in their enemy’s gut. When done properly by a master and with enough force, it can even wind the target momentarily. Implementing the grabbing of the shirt makes it more difficult to avoid and is good when keeping the target on their toes by keeping the opening of two techniques (O-Sato-Gari and Leg Straight) closely tied to one another.<br><br>\[Damage: Taijutsu vs Durability]<br>\[Speed: Attack Speed]<br>\[If grabbing the target before attacking, add +3 taijutsu damage before damage calculation]<br>\[When mastered, if the user's strength is greater than the target's durability +10, they are staggered and lose a movement action next turn]"
				dran = 500
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "C"
				ele = "Elementless"
			Liver_Punch
				name = "Liver Punch"
				description = "The user gets into a boxer stance before giving a strong hook towards the side of an opponent, intending to aim at the liver. It requires a lot of strength and accuracy to pull off but when done correctly can have the target in serious pain.<br><br>\[Taijutsu Damage +5 vs Durability x2]<br>\[If a Major amount of damage is given, a turn is lost.]<br>\[If a Lethal amount of damage is given, target is stunned]<br>\[-3 reflex when reacting to this attack if used after Quick Jab]"
				dran = 600
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "C"
				ele = "Elementless"
			One_Two_Punch
				name = "The Ol’ One-Two!"
				description = "The user swings his arms in a horizontal arc with either the lead or rear hand. It offers a more devastating blow than the standard jab but can leave one open to counters. In exchange for the brief opening, if done correctly, it can sometimes outright knockout frailer opponents.<br><br>\[Damage: Taijutsu Damage vs Durability]<br>\[Speed: Attack speed -5]<br>\[When used after Quick Jab, the attack speed penalty is removed and instead gains +10 to damage before calculations]<br>\[Base Damage +5 when using a Tier 3 taijutsu perk]"
				dran = 500
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "C"
				ele = "Elementless"
		Brank
			idran = "Stamina"
			skil = "New"
			jut = "Taijutsu"
			ran = "B"
			cd = 2
			ele = "Elementless"
			Severe_Leaf_Hurricane
				name = "Severe Leaf Hurricane"
				icon_state="Run"
				icon='Skillcard.dmi'
				dran = 1400
				description = "A taijutsu using a combination of speed and power. The essence of this technique is concentrated in a spinning back kick, with such speed that not a single person can follow the user's movement, smashing his enemy with overwhelming strength. In the anime, it also creates a powerful whirlwind around the user which can be used to attack multiple opponents.<br><br>\[Attack Speed +10]<br>\[Damage: Taijutsu Damage vs Dura x2]<br>\[Kicks up a powerful whirlwind that hits every tile around the user and knocks back Strength vs Dura tiles(Min. 1, Max 10)]"
			Drop_Kick
				name = "Drop Kick"
				description = "Similar to Dynamic Entry, the user runs towards an opponent and tosses their whole body at them. This technique has a lot of power since it is using body weight as well as power. This does leave the user open for attacks afterward<br><br>\[Taijutsu Damage +10 vs Durability x2]<br>\[]<br>\[If this does medium damage or higher, it knocks targets back for Strength/3 tiles]"
				dran = 1650
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "B"
				ele = "Elementless"
			The_Peoples_Elbow
				name = "The People's Elbow"
				description = "The user recklessly throws themselves at the target elbow-first with complete abandon. This disregard for personal safety and sloppy display of brute strength will deal devastating damage to the target should it land but could also easily backfire.<br><br>\[Damage: Taijutsu Damage vs Durability]<br>\[Speed: Attack Speed -10]<br>\[When missing, the user takes 2/3 the damage of the technique vs durability x2]<br>\[Attack Speed penalty may be halved when using a T3 taijutsu perk]"
				dran = 1700
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "B"
				ele = "Elementless"
			Dempsey_Roll
				name = "The Dempsey Roll"
				description = "The user enters a stance by placing their own fist over their chin and mouth. They then begin to bob and weave constantly to throw off opponents that try to attack back. They then unload with a series of hooks with each bob and weave to devastate their opponent.<br><br>\[Taijutsu Damage +10 vs Durability x2]<br>\[Gains an extra attack with T2 Boxing]<br>\[Continues to gain extra attacks for each higher tier of Boxing]"
				dran = 1400
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "B"
				ele = "Elementless"
			Perfect_Uppercut
				name = "The Perfect Uppercut: Force Punch"
				description = "The user uses all of their strength to punch their opponent in the gut. This technique does not have knockback to it, as all of the force would be absorbed into the body. This causes the opponent to double over and lose their ability to move until they catch their breath.<br><br>\[Damage: Taijutsu Damage +10 vs Durability x2]<br>\[Gains +5 to attack speed and damage if used in the sequence of Quick Jab, The Ol' One-Two, and The Perfect Uppercut]<br>\[At Major damage, stuns for one whole turn]"
				dran = 1800
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "B"
				ele = "Elementless"
			Upper_Whirlwind
				name = "Upper Whirlwind"
				description = "This attack is a combination of swift kicks. The first kick is to sweep and send the target airborne. The second kick launches the opponent higher into the air. This technique is good as it keeps close ranged opponents far away to give a little breathing room. It is also helpful if they cannot land afterwards<br><br>\[Damage: Taijutsu Damage +10 vs Durability x2]<br>\[At Medium or higher damage, knocks target up Strength/3 tiles]"
				dran = 1000
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "B"
				ele = "Elementless"
			Double_Kick
				name = "Double Kick"
				description = "The user hook kicks towards the target's head. This would knock them off balance and send their head away from the impact. The second kick would hit the other side of their head, canceling their momentum and making a stronger attack.<br><br>\[Taijutsu Damage vs Durability x2 for first hit]<br>\[Taijutsu Damage +10 vs Durability x2 for second hit]"
				dran = 1200
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "B"
				ele = "Elementless"
			Flying_Uppercut
				name = "Flying Uppercut"
				description = "The user hits the opponent in the chin as hard as they can. This would send them and the user flying higher into the air. This attack is based on raw strength instead of real taijutsu technique. The more force the user can put into the jump, the stronger this technique will be.<br><br>\[Strength x2 vs Durability x2]<br>\[Sends user and target Strength/3 tiles upwards]"
				dran = 1200
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "B"
				ele = "Elementless"
		Arank
			First_Gate_Gate_of_Opening
				icon='Skillcard.dmi'
				icon_state="Hachimon 1"
				name = "First Gate: Gate of Opening"
				description = "This gate removes the restraints of the brain on the muscles so 100% of their strength can be used whereas normally, a person can only use 20% of their muscles' strength to keep them from disintegrating. Unlocking this gate allows the user to use the Front Lotus."
				dran = 350
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "A"
				cd = 3
				ele = "Elementless"
			Heavy_Hand_Mountain_Crusher
				name = "The Heaviest Hand: Mountain Crusher"
				description = "'I fear not the man who has practiced 10,000 kicks once, but I fear the man who has practiced one kick 10,000 times.' That is the saying this person has internalized and turned into this technique. The amount of force that is carried by this fist sends a shockwave strong enough to ripple through massive bodies of stone and break through to the other end.<br><br>\[Punch: Taijutsu Damage +20 vs Durability x2]<br>\[Speed: Attack Speed]<br>\[Shockwave: Strength x2 vs Dura x2]<br>\[Shockwave Range: 5x5, straight line in the direction of the punch]<br>\[Shockwave Speed: Strength]"
				dran = 2400
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "A"
				cd = 3
				ele = "Elementless"
			Heavy_Hand_Earth_Shaker
				name = "The Heaviest Hand: Earth Shaker"
				description = "Muscle is heavier than fat, and the wielder of this technique has found a way to contract their muscles even further contract their on command. By using this concentrated weight to their advantage, the wielder can further strengthen a strike to  effectively cause an earthquake on contact. Using this skill, the user strikes a floor, surface or a prone target violently while releasing the power of their contracted muscles to cause a deadly and destructive quake. This quake is released from their strike leaving them unaffected.<br><br>\[Range: 11x11 quake centered on the point of contact.]<br>\[Must have Anatomy perk to use]<br>\[Each level of mastery = 1 weight tier]<br>\[Each weight tier = -5 attack speed]<br>\[Damage: Strength +10 + (10*weight tier) vs Durability x1.5]<br>\[Speed of quake= User’s Strength]"
				dran = 2400
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "A"
				cd = 3
				ele = "Elementless"
		Srank
			Second_Gate_Gate_of_Healing
				icon='Skillcard.dmi'
				icon_state="Hachimon 2"
				name = "Second Gate: Gate of Healing"
				description = "Forcibly increases one's physical strength and temporarily re-energises the body."
				dran = 450
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				cd = 4
				ele = "Elementless"
			Third_Gate_Gate_of_Life
				icon='Skillcard.dmi'
				icon_state="Hachimon 3"
				name = "Third Gate: Gate of Life"
				description = "Allows the user to use the Reverse Lotus. The increased blood flow turns the skin red."
				dran = 550
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Fourth_Gate_Gate_of_Pain
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Fourth Gate: Gate of Pain"
				description = "Increases the user's speed and power. May cause muscle tissue to tear on use."
				dran = 600
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Fifth_Gate_Gate_of_Limit
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Fifth Gate: Gate of Limit"
				description = "Increases the user's speed and power."
				dran = 700
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Sixth_Gate_Gate_of_View
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Sixth Gate: Gate of View"
				description = "Increases the user's speed and power. Allows the user to perform the Morning Peacock. Opening of this gate releases such enormous amounts of chakra that it can cause nearby water bodies to form a vortex around the user."
				dran = 700
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Morning_Peacock
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Morning Peacock"
				description = "The technique is started by kicking the enemy into the air, which for most would be an instant kill. The user then jumps into the air in a distinctive stance and begins punching the enemy repeatedly. The speed of the punches is so fast that they are set ablaze by sheer speed and friction. This creates a peacock-like fan of flames around the opponent. Once the attack is finished, the enemy will be sent crashing back to the ground, covered with the attack's aura. The technique is also strong enough to briefly stun a tailed beast"
				dran = 1000
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Seventh_Gate_Gate_of_Wonder
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Seventh Gate: Gate of Wonder"
				description = "Further increases the user's speed and power. Allows the user to perform the Daytime Tiger. Those who open this gate will pour glowing green sweat from every inch of their body, blue in the anime, which immediately evaporates from their own heat energy, creating an aura which people would mistake as a chakra coating. Unfortunately, the side effects of opening the gate are that the user's muscle fibers are ripped to shreds, causing intense pain if anything or anyone touches them."
				dran = 700
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Daytime_Tiger
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Daytime Tiger"
				description = "After opening the seventh of the Eight Gates, the user places a palm facing forward in front of their face with one hand and then taps it with his other hand, formed into a fist, which creates a massive amount of air pressure. Next, the user forms a unique hand seal resembling a tiger, which launches the air pressure at the opponent in the shape of a tiger, by leaving a gigantic tiger-shaped impression into the initially built-up air pressure with the hand seal. The air pressure will condense as it's moving and be focused into a single point. The technique then explodes on command, releasing the built up air pressure in an instant. A massive concussive explosion is created which can be felt a significant distance away."
				dran = 900
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Eighth_Gate_Gate_of_Death
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Eighth Gate: Gate of Death"
				description = "Releasing this gate uses up all of the body's energy. It makes the heart pump at maximum power and exceeds the power of every other gate. Opening this gate gives the user power that is even beyond the five Kage, but comes at the expense of the user's life shortly after."
				dran = 1000
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Evening_Elephant
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Evening Elephant"
				description = "This technique is a continuous assault of five punches, with each 'foot'  as they are referred to being performed faster than the one before. It creates a vacuum of pressurized air which bears the appearance of an elephant's leg, causing devastating damage to the opponent. One punch alone was capable of creating a massive and deep tunnel in the ground. The final punch is strong enough to defy physics and all manner of defenses."
				dran = 2000
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"





	Katon
		icon = 'SkillCard.dmi'
		icon_state="Katon"
		Drank
			cd = 0
			Ninja_Art_Fire_Run// - D-Rank 100 RPP <br>
				name = "Ninja Art: Fire Run"
				description = "This technique creates a stream of fire that can be manipulated into several forms (so far, rings of fire that run on the ground or a circle of fire flying through the air) before striking the target. It can also be used in combination with Wind Release: Divine Wind to create a tornado of flames, or with Wind Release: Godly Wind from the Mountains to release a massive inferno.<br>\[Speed:Con]<br>\[5 tiles long]<br>\[Damage Cap: Minor]"
				dran = 250
				RPPCost = 100
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Fire"
				idran = "Chakra"
				hseal = 1
			Fire_Shot
				name = "Ninja Art: Flamethrower"
				description = "The user fires a stream of fire from their mouth. This is the most basic fire style technique.<br>\[Speed:Con]<br>\[Damage Cap:Minor]"
				dran = 275
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Fire"
				idran = "Chakra"
				hseal = 3
		Crank
			cd = 1
			FireDragonBullet
				name = "Fire Style: Fire Dragon Bullet"
				description = " basic Fire Release technique, where the use exhales a flame breath from their mouth. This technique can be used in conjunction with Earth Release: Earth Dragon Bullet to ignite the projectiles fired by the latter technique, making it more devastating.<br><br>\[Speed: Control]<Br>\[Projectiles produced:Control/5 to a cap of 12]<br>\[Damage:Ninjutsu Offensive Power]<br>\[Damage Cap=Medium]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
				hseal = 8
			Fire_Style_Fireball_Jutsu// - C-Rank 450 <br>
				name = "Fire Style: Fireball Jutsu"
				description = "A technique where chakra kneaded inside the body is converted into fire and expelled from the mouth either as a massive orb of roaring flame or as a continuous flame-thrower. The scope of the attack is altered by controlling the volume of chakra that is mustered. The released flames will engulf their target, and leave a crater on the ground's surface. This technique apparently requires more than average chakra reserves and most genin should not be able to do this technique.<br><br>\[Orb Style: 3x3 orb of flame]<br>\[Flamethrower:2x5]<br>\[Damage: Nin Offensive Power + 5]<br>\[Damage Cap: Medium]"
				dran = 500
				RPPCost = 450
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
				hseal = 6
			Exploding_Flame
				name = "Exploding Flame Shot"
				description = "By creating a spark from their hands, this technique allows the user to throw multiple balls of flames, which are able to either cause fiery explosions on impact or set the target on fire.<br><br>\[Speed=Control]<br>\[Damage: Ninjutsu Offensive Power+5]<br>\[ When the flame make contact with a solid object, they explode into flames covering a 3x3 area]<Br>\[Projectiles produced:Control/3 to a cap of 4]<br>\[Damage Cap=Medium]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
			Fire_Style_Phoenix_Flower_Jutsu // - C-Rank 400<br>
				name = "Fire Style: Phoenix Flower Jutsu"
				description = "This technique creates a volley of small fireballs, which are sent flying in an unpredictable manner assaulting the enemy. In addition, the flames are controlled one by one with chakra, so avoiding them all is extremely difficult.<br><br>\[Can fire up to Con/5 orbs of flame to a cap of 10.]<br>\[Speed: Control + 5)<br>\[Damage:Ninjutsu Offensive Power)<br>\[Damage Cap=Medium]"
				dran = 550
				RPPCost = 400
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
				hseal = 6
			Fire_Style_Misty_Flames_Dance_Jutsu// - C-Rank 300 <br>
				name = "Fire Style: Misty Flames Dance Jutsu"
				description = "The user is able to create and blow a flammable gas from their lungs. Once it comes in contact with fire or spark, the gas ignites into a large fireball.<br><br>\[9x9 AOE]<br>\[Ignition speed: Con]<br>\[Damage: Ninjutsu Offensive Power]"
				dran =500
				RPPCost = 300
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				idran = "Chakra"
				ele = "Fire"
				hseal = 4
			Fire_Style_Dragon_Fire_Jutsu// - C-Rank 500 <br>
				name = "Fire Style: Dragon Fire Jutsu"
				description = "The user breathes fire along a cord or any other type of long object, which rushes forward in a straight line catching the enemy on fire. A line of enemies can be used as the conductor as well.<Br>\[Speed=: Control + 5)<br>\[Fires a straight line of flame up to 8 tiles long]<br>\[Range can be extended an extra 1 tile per body or object struck so long as they are in a linear form]<br>\[Damage cap=Medium]"
				dran = 500
				RPPCost = 500
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				hseal = 4
			Fire_Style_Phoenix_Flower_Shuriken_Jutsu// - C-Rank 450 <br>
				name = "Fire Style: Phoenix Flower Shuriken Jutsu"
				description = "The user unleashes a volley of shuriken with one hand, and at the same time, exhales fire-infused chakra onto them in order to increase the weapons' destructive potential by making them capable of inflicting severe burns upon direct contact with either the intended victim, or any other object caught within their trajectories.<br>\[Speed=Throwing Calculation]<br>\[Damage=Weapon calcs + Ninjutsu/5]"
				dran = 500
				RPPCost = 450
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				hseal = 6
			Chakra_Flow_Fire
				name = "Chakra Flow: Fire"
				description = "This technique allows the user to imbue their weapon with flame natured chakra, further increasing their weapons damage capabilities-inflicting burning wounds upon contact.<br>\[Damage; Strength + Ninjutsu/5]<br>\[Damage Cap:Medium]"
				dran = 550
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
		Brank
			cd = 2
			Fire_Style_Burning_Ash// - B-Rank 600 <br>
				name = "Fire Style: Burning Ash"
				description = "The user spews a stream of chakra infused gun-powder from their mouth, which surrounds the region. As the gunpowder is composed entirely of ash, it stays in the air around the victim like a cloud, which can be used like a smokescreen. After surrounding the enemy with the ash, the user can ignite it with a flint placed on their teeth beforehand to create a spark, resulting in a violent explosion, burning the enemy.<br>\[11x11 AOE]<br>\[The ash cloud can either be immediately ignited or left to linger for a total of three rounds.]<br>\[Sensory perks are required to navigate inside the ash cloud; opponent receives -5 reflex unless T2 hearing or Sight perks are possessed.]<br>\[Damage of explosion=Ninjutsu Offensiver Power]<br>\[Damage Cap: Major]"
				dran = 1650
				RPPCost = 600
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Fire"
				hseal = 4
			Fire_Style_Dragon_Flame_Jutsu// - B-Rank 650 <br><br>
				name = "Fire Style: Great Dragon Flame Jutsu"
				description = "The user compresses a large amount of chakra built up inside their body and changes it into a dragon head-shaped fireball. The user then skilfully manipulates that great fire, and attacks their opponent. Even outside of the attack range, its power and reliability are stressed. The flames have a high temperature, as they can create an upward movement of air currents which in turn can give rise to thunder clouds. A master of this technique can fire off several flames in succession and anyone caught in the technique could potentially be reduced to ashes.<br>\[Number of dragons produced= Con/4 up to a cap of 7]<br>\[Speed: Control]<br>\[Damage=Ninjutsu Offensive Power + 10]<br>\[Damage Cap:Major]"
				dran = 1700
				RPPCost = 700
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Fire"
				hseal = 1
		Arank
			cd = 3
			Fire_Style_Dragon_Flame_Bomb// - B-Rank 650 <br>
				name = "Fire Style: Dragon Flame Bomb"
				description = "The user kneads their chakra into flames, which are then manipulated into a genuine-looking dragon. Since the art of having the flames obey the user's will is outrageously difficult, its mastery is restricted to a limited number of skilful shinobi. The flames are divided to launch a left side, right side, and frontal assault in all three directions at once, turning the enemy into ash in a matter of seconds.<br>\[Damage=Ninjutsu Offensive Power + 10]<br>\[Speed=Control]<br>\[The target’s reflex is considered -10 for the sake of reacting to each dragon after the first.]<br>\[Each dragon that strikes a target after the first adds 10 to the damage calculation.]<br>\[The above effect stacks with normal multihit technique calculations.]<<br>\[Damage Cap: Lethal]"
				dran = 2080
				idran = "Chakra"
				RPPCost = 650
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				ele = "Fire"
				hseal = 7
			Fire_Style_Giant_Flame_Bombs// - B-Rank<br>
				name = "Fire Style: Giant Flame Bombs"
				description = "The user creates fire in their gullet before releasing it in a large burst. It is capable of destroying buildings, burning them down to nothing in no time.<br>\[Creates a 11x11 ball of flame in front of the user]<br>\[Speed:Control]<br>\[Damage:Ninjutsu Offensive Power + 15]<br>\[Damage Cap: Lethal]"
				dran = 2500
				idran = "Chakra"
				RPPCost = 700
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				ele = "Fire"
				hseal = 1
		Srank

	Blank_Fire_Jutsu
		name = "Blank Fire Jutsu"
		description = ""
		dran = 0
		idran = "Chakra"
		skil = "New"
		jut = "Ninjutsu"
		ran = "E"
		ele = "Fire"



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Suiton
		icon = 'SkillCard.dmi'
		icon_state="Suiton"
		Drank
			cd = 0
			Ninja_Art_Water_Gun
				name = "Ninja Art: Water Gun"
				description = "The user fires out a stream of water from their mouth. This is the simplest of water release techniques.<br>\[Damage:Ninjutsu]<br>\[Speed:Control]<br>\[Extends up to 5 tiles]<br>\[Damage Cap: Minor]"
				dran = 275
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Water"
				idran = "Chakra"
				hseal = 1
		Crank
			cd = 1
			Water_Style_Syrup_Trap// - C-Rank 350 <br>
				name = "Water Style: Syrup Trap"
				description = "The user spits out high-viscosity, chakra infused water, aimed at a surface of wide scope. This is a stream of sticky liquid which can be used to form an adhesive trap that can inhibit a person's mobility. One can effectively reduce their enemy's area of activity with this technique, and has the effect of being able to take complete control over the battlefield. The normal scope of this technique is normally just a few meters, but if prepared, it is also possible to make an entire pond of starch syrup. Being caught in the technique can be avoided by channeling chakra to one's feet allowing one to walk upon it uninhibited, beforehand.<br>\[Covers a 5x5 area]<br>\[Users Control vs Opponents Strength in order to break free of the trap.]<br>\[Bind strength degrades by 5 points every round.]<br>\[Lasts up to five rounds before becoming a normal puddle of water.]"
				dran = 550
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Water"
				hseal = 2
			Water_Style_Raging_Waves// - C-Rank 299 ( discounted ) <br>
				name = "Water Style: Raging Waves"
				description = "Water gushes out from the mouth like a waterfall and washes away the enemy. One can freely control the power of this technique with the amount of chakra one releases. Having many variations, this is a basic Water Release technique<br>\[3x5 tile wide in front of user]<br>\[Damage=Ninjutsu Offensive Power + 5]<br>\[Speed:Control]<br>\[Damage Cap=Medium]"
				dran = 500
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Water"
				hseal = 3

			Water_Prison_Jutsu// - C-Rank 450 <br>
				name = "Suirou no Jutsu"
				description = "This technique is used to trap a victim inside a virtually inescapable sphere of water. The only downside to this technique is that the user must keep at least one arm inside the sphere at all times in order for the victim to remain imprisoned. This technique requires a sufficient amount of water, which can be provided by expelling it from one's mouth. Once trapped the target is unable to move or breathe while within it due to the heaviness of the water. Because of the density of the water it can be used, to a limited extent, for defensive purposes if performed on oneself. It can also be stored in scrolls as traps.<br>\[Formation Speed=Control]<br>\[Strength of water prison=Ninjutsu Defensive Power + 5]<br>\[Opponents strength vs Ninjutsu Defensive Power to break free]<br>\[Bind Strength degrades by 5 every round]"
				dran = 555
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Water"
				hseal = 7
			Chakra_Flow_Water
				name = "Chakra Flow: Water"
				description = "This technique allows the user to imbue their weapon with water natured chakra, further increasing their weapons damage capabilities. Water can be condensed upon a weapon to add to the blunt power it can produce<br>\[Damage:Strength + Ninjutsu/5)<br>\[Applies Knock Back to strikes at Ninjutsu/6 tiles.]<br>\[Damage Cap: Medium]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Water"
			Water_Release_Wild_Bubble_Wave
				name = "Water Release: Wild Bubble Wave"
				description = "The user spits out a large volume of foam-like bubbles which covers the ground and reduces its friction, considerably limiting the opponents' movements. The bubbles are spit out with violent force that is capable of washing away most attacks, such as oil and fire. This technique can also be used as an effective smokescreen.<br>\[5x5 AOE]<br>\[Speed reduced by 5 inside the techniques range]<br>\[Non-damaging]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Water"
				hseal = 2
		Brank
			cd = 2
			Water_Style_Water_Trumpet// - B-Rank 599 ( discounted ) <br>
				name = "Water Style: Water Trumpet"
				description = "The user launches a large jet of water from their mouth through their hand. This gives the appearance of playing a trumpet, hence the name.<br>\[Speed=Control]<br>\[Damage:Ninjutsu Offensive Power + 10]<br>\[Range:2x11]"
				dran = 1600
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
				hseal = 3
			Water_Style_Water_Wall// - B-Rank 700 <br>
				name = "Water Style: Water Wall"
				description = "This defensive technique creates a wall of water around the user. Enemy attacks are completely intercepted by a fence of water blown out from the mouth, and is raised from below with tremendous might. The water is blown out in the form of a circle around the user, and it makes for a Defense without openings. It is also possible for the user to control the amount of water and duration at will. The wall's strength and resistance change following the quantity of chakra poured down into the water, so a skilful shinobi will be able to build a sturdy one. Furthermore, because the field of vision is maintained even while defending one can easily go on to the next move, which is a great advantage. The wall can also be formed from a pre-existing water source.<br>\[Durability=Ninjutsu Defensive Power + 15]<br>\[Speed=Control]<br>\[Covers an area 5 tiles wide in front of the user 5 tiles tall]"
				dran = 1700
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
				hseal = 5
			Water_Style_Water_Dragon_Jutsu// - B-Rank 699 <br>
				name = "Water Style: Water Dragon Jutsu"
				description = "This technique shapes a large amount of water into a giant, powerful dragon, which hits the opponent with formidable might, dealing physical damage. The ideal place to use it is near a body of water, but if the user's skill allows it, it is possible to use it even in a place where there is none. The amount of water used will be in proportion with the user's skill.<br>\[Damage:Ninjutsu Offensive Power + 15]<br>\[Speed:Control + 10]<br>\[Damage Cap: Major]"
				dran = 1850
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
				hseal = 44
			Water_Style_Water_Shockwave// - B-Rank 650 <br>
				name = "Water Style: Water Shockwave"
				description = "This technique allows the user to make a spiraling vortex of water. The vortex then proceeds to explode from the top in the form of a wave. The user can also control the direction the wave goes with hand movements.<br>\[Damage:Ninjutsu Offensive Power + 15]<br>\[11x11 sized wave released from the user’s front.]<br>\[The technique can be sustained for one turn after casting.]<br>\[Speed:Control]<br>\[Damage Cap: Major]"
				dran = 1500
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
				hseal = 1
			Water_Style_Exploding_Water_Shock_Wave//- B-Rank 600 <br>
				name = "Water Style: Exploding Water Shock Wave"
				description = "The user spits out a great volume of water from their mouth, swallowing up and crushing the enemy with the advancing surge. The user can ride the wave, allowing them to move at high speed, and attack the enemy, now swept off their feet, without fear of counter-attacks. The amount of water created is proportional to the amount of chakra used; when used with Kisame's enormous chakra, even a dry wasteland can become a small ocean. Afterwards, the excess water can be used for additional Water Release techniques.<br><br>\[Speed:Control]<br>\[Damage:Ninjutsu Offensive Power]<br>\[Covers a 15x15]<br>\[Damage Cap:Major]"
				dran = 1200
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
				hseal = 1
		Arank
			cd = 3
			Water_Style_Giant_Vortex_Jutsu// - A-Rank 900 <br><br>
				name = "Water Style: Giant Vortex Jutsu"
				description = "This technique extends water over a large scale, surges and rises up to several dozens of meters high. Then it streams down to the ground in one big cascade, much like a gigantic waterfall. In doing so, it resembles a huge wave, with tremendous power that can hollow out the ground. What remains after that technique's utilization is reminiscent of no less than the aftermath of a natural disaster. This is a considerably advanced ninjutsu, and activating this technique requires a fair amount of chakra.<br>\[Damage=Ninjutsu Offensive Power + 20]<br>\[speed=Con]<br>\[Covers a 15x15 area]<br>\[Damage Cap: Lethal]"
				dran = 2300
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
				hseal = 18
		Srank
	Blank_Water_Jutsu
		name = "Blank Water Jutsu"
		description = ""
		dran = 0
		idran = "Chakra"
		skil = "New"
		jut = "Ninjutsu"
		ran = "E"
		ele = "Water"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	Raiton
		icon = 'SkillCard.dmi'
		icon_state="Raiton"
		Drank
			cd = 0
			Ninja_Art_Raiton_Flash// - D-Rank 350
				name = "Ninja Art: Raiton Flash"
				description = "The user surges their chakra for a moment. The air directly around their body surges with raiton chakra shocking their opponents, numbing them for a moment.<br>\[Damage=Ninjutsu Offensive Power]<br>\[Speed=Control]<br>\[3x3 range around the user.]<br>\[Struck targets receive -3 reflex.]<br>\[Damage Cap: Minor]"
				dran = 250
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Lightning"
		Crank
			cd = 1
			Lightning_Style_Earth_Flash// - C-Rank 500 <br>
				name = "Lightning Style: Earth Flash"
				description = "This technique allows the user to create a wave of electricity from their hands. The user can vary its power from a small surge to shock an opponent to a powerful stream of lightning capable of ripping through solid rock. It is ideal to use in conjunction with a water technique.<br>\[Damage=Ninjutsu Offensive Power]<br>\[Speed=Control]<br>\[1x3 in front of user]<br>\[If used on top of the water, the area is extended, now becoming 3x5]<br>\[Damage Cap: Medium]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Lightning"
				hseal = 5
			Ninja_Art_Lightning_Ball// - C-Rank 450 <br>
				name = "Ninja Art: Lighting Ball"
				description = "By gathering lightning chakra between their hands or two chakra flow weapons, the user creates a ball of lightning that they then shoot.<br><br>\[Damage=Ninjutsu Offensive Power]<br>\[Speed: Con + 5]<br>\[Damage Cap: Medium]<br>\[This projectile fills one tile of space.]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Lightning"
				hseal = 1
			Chakra_Flow_Raiton
				name = "Chakra Flow: Lightning"
				description = "This technique allows the user to imbue their weapon with lightning natured chakra, further adding to their damaging capabilities. Lightning natured chakra vibrates at such high intensity it adds to the sharpness of a weapon<br>(Damage:Strength+Control/5)<br>\[Strikes performed now ignore 3 points of durability]<br>\[Damage Cap: Medium]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Lightning"
			Lightning_Release_Spider_Web
				name = "Lightning Release: Spider Web"
				description = "After kneading chakra in the body and converting it to lightning, the user places their hand on the ground, releasing a surge of electricity around them in the form of a web, which electrocutes anyone caught in its vicinity.<br>\[User is ROOTED during technique]<br>\[Casts a 5x5 web of electricity on the ground using caster as the center]<br>\[Speed: Control + 7]<br>\[Damage=Ninjutsu Offensive Power]<br>\[Damage Cap=Medium]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Lightning"
				hseal = 4
		Brank
			cd = 2
			Ninja_Art_Lightning_Fangs// - B-Rank 650 <br>
				name = "Ninja Art: Lightning Fangs"
				description = "The user flows their lightning chakra through their chakra flow weapon in order to send bolts of lightning towards their opponent.<br><br>\[Must be used with a weapon]<br>\[Speed: Con + 8]<br>\[Damage: Ninjutsu Offensive Power + 8]<br>\[Damage Cap: Major]<br>\[Can fire up to Con/5 lightning bolts to a cap of 10.]"
				dran = 1500
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Lightning"
			Lightning_Style_Electric_Needle_Spark// - B-Rank 599 ( discounted ) <br>
				name = "Lightning Style: Electric Needle Spark"
				description = "After coming into physical contact with the opponent, the user raises their arm into the air, generating a powerful bolt of electricity which travels through their body into the body of the opponent.<br>\[Damage:Ninjutsu Offensive Power]<br>\[Speed:Control+5]<br>\[Reduces opponent’s attack speed by 10 for one round.]<br>\[Damage Cap:Medium]"
				dran = 1650
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Lightning"
			Lightning_Release_Beast_Tracking_Fang
				name = "Lightning Release: Lightning Beast Tracking Fang"
				description = "The user forms lightning in their hand and launches it at the opponent in the form of a hound to attack them. As the hound is highly fast and its movements are unpredictable, it is very difficult to avoid. The user's hand remains connected to the hound by a cord of lightning, allowing them to freely manipulate the speed and range of the technique.<br>\[Speed=Control+15]<br>\[Damage: Ninjutsu Offensive Power]<br>\[Range: Ninjutsu/4]<br>\[Lasts a total of two rounds before needing to recast]"
				dran = 1650
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Lightning"
		Arank
		Srank
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Doton
		icon = 'SkillCard.dmi'
		icon_state="Doton"
		Drank
			cd = 0
			Earth_Style_Mud_Silhouette// - D-Rank 250 <br>
				name = "Earth Style: Mud Silhouette"
				description = "This technique lets the user summon a small wave of mud. This technique can have water added to it to speed up the flow and increase its power.<br>\[River spans 4 tiles and travels 5 tiles]<br>\[When used on or from a water source, the damage cap is increased to Medium.]<br>\[Minor Damage Cap]"
				dran = 300
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "D"
				ele= "Earth"
				hseal = 1
			Earth_Style_Headhunter_Jutsu// - D-Rank 150 <br>
				name = "Earth Style: Headhunter Jutsu"
				description = "This technique conceals the user underground and drags the object of their attack down into the earth, robbing them of their freedom. In addition, they can start another attack.<br>\[Speed while underground:User’s Speed - depth in tiles.]<br>\[Speed of grab=Attack speed]<br>\[The user’s depth is limited to Strength/5 tiles; maxed at 5 tiles deep.]<br>\[Lowers opponents reflex to the user’s emergence  by 3 if they lack hearing or sensing perks.]"
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "D"
				ele = "Earth"
				hseal = 1
		Crank
			cd = 1
			Earth_Style_Hidden_Mole_Jutsu// - C-Rank 450 <br>
				name = "Earth Style: Hiding like a Mole Jutsu"
				description = "This technique changes earth into fine sand by channeling chakra into it, allowing the user to dig through it like a mole. This effect goes around the body (not just the hands), making it just large enough for a person to move through. The user can pinpoint where they are, despite being underground, by feeling their chakra move the nearby soil. They can also sense what is happening on the surface and use that information to launch a surprise attack on the enemy. One can also hide deep in the ground, escaping to a depth where the enemy can't reach. It also appears that after digging, the ground can be returned to its original state, leaving no trace of where the user entered the earth..<br>\[Speed while underground:User’s speed]<br>\[The user’s depth is limited to control/5 tiles; maxed at 10 tiles deep.]<br>\[Lowers opponent's reflex to the user’s emergence  by 5 if they lack hearing or sensing perks.]"
				dran = 500
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Earth"
				hseal = 1
			Earth_Shore_Return
				name = "Earth Shore Return"
				description = "The user slams their hand into the ground,causing the earth before them to rip open. The user then leverages the earth up to form a wall which acts as a shield for the user alone.<br>\[Speed: Control]<br>\[Durability: Ninjutsu Defensive Power + 10]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Earth"
			Earthquake_Slam
				name = "Earthquake Slam"
				description = ". By placing the palm of their hand on the ground, the user breaks up and shifts the local earth. The better the user's chakra control, the greater the amount of earth that will be broken up.<br><br>\[Damage:Ninjutsu+5]<br>\[Speed:Control]<br>\[Covers a 5x5 area, becomes 8x8 at T3 Chakra control]<br>\[Lowers opponents speed by 5 within its area of effect]<br>\[Damage Cap:Medium]"
				dran = 550
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Earth"

		Brank
			cd = 2
			Earth_Style_Mud_Wall// - B-Rank 650 <br>
				name = "Earth Style: Mud Wall"
				description = "The user creates a solid wall of earth as a form of Defense. Chakra is either converted to earth within the body and then spat out to form the wall or the user can manipulate pre-existing earth to form the wall. The earth then instantly rises up and takes form. The barrier itself is also coated with chakra, making its strength incomparable to that of a normal mud wall. Because of the earth's special characteristics, the wall is highly resistant against, for instance, fire and water.<Br>\[Creates a wall of earth 7 tiles high and 3 tiles wide in front of the user]<br>\[Durability=Ninjutsu Defensive Power + 20]<br>\[Speed=Control]"
				dran = 1650
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
				hseal = 4
			Earth_Style_Earth_Dragon_Bomb// - B-Rank 799 <br>
				name = "Earth Style: Earth Dragon Bomb"
				description = "When used with Earth Release: Earth Flow River, this technique can create a dragon-like head to fire balls of mud at an opponent. This can also be combined with a fire technique to shoot searing hot rock towards an opponent.<br><br>\[Damage:Ninjutsu+10]<br>\[Speed:Control]<br>\[Number of projectiles:6]<br>\[Every two projectiles from the Fire Style: Fire Dragon Bullet technique combined with a single projectile of this technique increases the multihit calculation of this technique by 5.]<br>\[Damage Cap:Major]"
				dran = 1600
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
				hseal = 3
			Earth_Style_Earthen_Corridor// - B-Rank 699 <br>
				name = "Earth Style: Earthen Corridor"
				description = "This technique causes the earth in the surrounding area to rise up and over a target and create a cavern, imprisoning the target. The user can leave an opening to allow attacks to go in to strike down the trapped adversaries, or close it up completely to prevent escape.<br><br>\[Speed : Control]<br>\[Durability:Ninjutsu Defensive Power + 15]"
				dran = 1650
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
				hseal = 1
			Earth_Style_Iron_Skin// - B-Rank// 799 <br>
				name = "Earth Style: Iron Skin"
				description = "The user flows chakra through all parts of their body causing it to become noticeably darker, which increases their defensive power to its utmost limits by making the skin as hard as diamond. Furthermore, the destructive power of physical attacks is increased, making this a great all-purpose technique. The amount of techniques that can break through the areas hardened by the Earth Spear are close to zero, excluding its undeniable weak point: Lightning Release ninjutsu.<br>\[Changes the user’s basic attack calculation to the ninjutsu calculation for the duration of its use.]<br>\[Increases durability and ninjutsu defense by Ninjutsu/3]<br>\[Lightning Release attacks ignore increase.]\[Lasts for three turns.]"
				dran = 1700
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
			Earth_Release_Earth_Flow_Divide
				name = "Earth Style: Earth Flow Divide"
				description = "By flowing concentrated chakra from one's palms into the ground, one can tear the earth apart, creating large chasms. The length, width, direction, and curve of the chasm are shaped and fashioned by the user. Manipulating the earth requires fine chakra control, but if one has such skill, they can use this technique to divide the space between the enemy and their own team in two, destroy enemy camps or defenses, and even to attack.<br>\[Splits the earth 10 tiles high and 10 tiles long to the  left and right of the caster’s front.]<br>\[The earth can be moved together to capture an opponent in the middle.]<br>\[Speed: Control]<br>\[Speed when moved :Control -5]<br>\[Damage=Ninjutsu Offensive Power + 10]"
				dran = 1700
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
				hseal = 6
			Earth_Release_Barrier_Earth_Prison_Dome_of_Magnificent_Nothingness
				name = "Earth Release Barrier: Earth Prison Dome of Magnificent Nothingness"
				description = "The user creates a dome of earth around a target or targets, trapping them inside. The walls of the dome have chakra flowing within, which quickly repairs any damage that its prisoners may do to it. If the user remains in contact with the dome, they are able to absorb the chakra of those who are imprisoned, making them weaker over tim<br>\[Dome forms at users Control speed]<br>\[5% of each individuals chakra is siphoned and added to the user’s pools every round they are trapped inside.]<br>\[Outside Durability=Ninjutsu Defensive Power + 15)<br>\[Inside Durability = Ninjutsu Defensive Power]"
				dran = 1950
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
				hseal = 1
			Earth_Release_Opening_Earth_Rising_Excavation
				name = "Earth Style: Opening Earth Rising Excavation"
				description = "With this technique, the user can bring up on the surface something that is deep underground. The targets are launched in air with great strength and speed, the result of which has the appearance and nearly size of a miniature erupting volcano. It can force either a single target or a large number of soldiers hidden underground to resurface all at once.<br>\[Damage=Ninjutsu+10]<br>\[Speed=Control]<br>\[9x9 aoe centered on the target.]<br>\[Targets are ejected out of/off of the ground at users Control speed to a maximum of Ninjutsu/4 tiles high.]"
				dran = 1800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
				hseal = 4
		Arank
			cd = 3
			Earth_Style_Dark_Swamp// - A-Rank// 900 <br>
				name = "Earth Release: Swamp of the Underworld"
				description = "By changing the surface of an object beneath an enemy into mud and creating a swamp, the user can sink his enemy into the mud. The adhesive, chakra-infused mud ensnares the enemy's body, making it almost impossible to recover one's strength and escape from the swamp. The size and depth of the created swamp depends on the user's skill and the amount of chakra used, but if the user is an expert in this technique, it will always be possible to make a fair-sized swamp which is extremely effective against a great number of enemies or when having to face gigantic creatures.<br><br>\[Speed=Control]<br>\[Note: For every boost in size, use the technique once more. One use is the size of a single.]<br>\[1 use:9x9 area]<br>\[2 uses:15x15]<br>\[3 uses: 21x21]<br>\[Users can augment the size of the swamp to their liking for certain situations-without the need for amplifier]<br>\[Strength of the swamp:Ninjutsu + 15 vs Opponents Strength]"
				dran = 2900
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Earth"
				hseal = 2
			Earth_Style_Earth_Golem_Jutsu // - A-Rank 1200 <br><br>
				name = "Earth Style: Earth Golem Jutsu"
				description = "This technique allows the user to create a large, humanoid creature composed of rock that can either be expelled from the user's mouth or formed from a nearby, pre-existing source of earth. Depending on the user, the golem can be formed instantly<br>\[Size: 15x15x20]<br>\[Durability&Strength:Ninjutsu Defensive Power + 20)<br>\[Attack Speed:Control/2]<br>\[Golem Strength:User’s Ninjutsu]"
				dran = 2850
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Earth"
				hseal = 1
		Srank

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Aburame
		icon = 'SkillCard.dmi'
		icon_state = "Aburame"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Erank
			ran = "E"
			Insect_Tracking_Technique
				name = "Insect Tracking Technique"
				description = "The user sends a tiny female kikaichuu to land on their opponent. The female releases a scent that draws in the rest of their bugs making all of the user's parasitic insect attacks homing even if the user cannot see/sense their target.<br>\[Speed:Control]<br>\[Increases the speed of Parasitic Insects Jutsu by 5.]"
				dran = 20
		Drank
			ran = "D"
			Parasitic_Insects_Jutsu
				name = "Parasitic Insects Jutsu"
				description = "The user manipulates their gathered bugs using a sort of Hive Mind effect which gives them control over the insect swarms.<br>\[Speed:Control]<br>\[The user can release two swarms per use of this technique.]<br>\[Once struck by an aburames bugs, they remain on the opponents body for 2 rounds.]<br>\[Bugs drain 50 chakra per round per stack]<br>\[User can stack parasitic insects up to four stacks.]<br>\[Bugs can be swatted off of a target at a rate of one swarms per basic attack action. Attacks that engulf a target will remove all swarms.]"
				dran = 260

		Crank
			cd = 1
			ran = "C"
			Insect_Summoning_Jutsu
				name = "Insect Summoning Jutsu"
				description = "The user summons a large hive of their Parasitic Destruction Insects to fight alongside them.<br>\[Increases the quantity of bugs user can stick to opponent for one round.]<br>\[Increases total number of stacks from parasitic insect jutsu by +4]<br>\[Speed=Control/2]"
				dran = 555
			Insect_Coffin
				name = "Insect Coffin"
				description = "The user manipulates a large gathering of bugs to swarm around their desired target and cover them head to toe. The insects gather in such density that the opponent is bound in place and sucked dry<br>\[Strength of bind: Control]<br>\[Strength vs Bind Strength to break free]<br>\[Bind loses 4 strength per round.]\[Parasitic insect technique’s total possible chakra drain per turn is increased by 100 against the bound target.]"
				dran = 500
			Insect_Jar
				name = "Insect Jar"
				description = "A technique capable of protecting against attacks by using kikaichu to fly in a dome shape at high speed, similar to the Eight Trigrams Palms Revolving Heaven. While proving defensive, a sufficient amount of explosive force can break through it.<br>\[Durability: Control + 5]"
				dran = 550
			Buggy_Board
				name = "Buggy Board"
				description = "After extensive training on how to shape chakra and command swarms the Aburame clan member shapes their a single swarm into something reminiscent of a surfboard.  With them riding upon it the bugs soar through the air or skim upon the ground increasing mobility within three dimensions.<br>\[Speed:Control-10]<br>\[Tile Movement:Control/2]<br>\[Note:Must be used each turn to maintain]"
				dran = 500
		Brank
			cd = 2
			ran = "B"
			Insect_Sphere
				name = "Mushidama"
				description = "The user creates a large orb of their insects which fly towards the target. If even a portion makes contact, the bugs quickly swarm the target's body, quickly drinking their chakra.<br>\[Speed: Control]<br>\[5x5 tiles]<br>\[Drains 500 chakra from all those caught within its radius]<br>\[3 round duration]<br>\[The Aburame is capable of moving the insect sphere should they so desire]"
				dran = 1960
		Arank
			cd = 3
			ran = "A"
			Insect_Tornado
				name = "Insect Tornado"
				description = " Insect Tornado is the pinnacle of the Aburame clan's techniques, this jutsu was created by Aburame, Ikina.  The technique covers the enemy's entire body with the insects living inside the Aburame clan member's body.  The insects spread over a wide range, and the moment they locate the enemy, the insects, following the user's orders, gather at once completely surrounding the target and knocking them into the air, creating a fast-moving tornado.  The Aburame's bugs seek to disintegrate their target, leaving those who survive airborne.<br>]\[11x11 aoe]<br>\[Applies maximum parasitic insect effects to struck targets two times.]<br>\[Speed:Control]<br>\[Damage:Ninjutsu+20]"
				dran = 1500
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*	Lyzerg
		icon = 'SkillCard.dmi'
		icon_state = "Illusion"
		skil = "New"
		jut = "Genjutsu"
		idran = "Chakra"
		ele = "Illusion"
		Drank
			ran = "D"
			Genjutsu_Cancel
				name = "Illusion Release: Genjutsu Cancel"
				description = "The user causes their chakra network to automatically disrupt its flow periodically. During these disruptions their jutsu often fails or waver. After mastering this technique, the wavers and failures stop occurring."
				dran = 100
			Kuchiyose1
				jut = "Ninjutsu"
				ele = "Elementless"
				name = "Personal Summon"
				description = "The user summons their personal summon. The summon cannot be larger than a normal sized dog."
				dran = 250
			ShadowBlink
				name = "Shadow Blink"
				description = "The user makes eye contact with their target, causing them to go blind for a moment. It lasts for the duration of two blinks."
				dran = 175
			SilentFlash
				name = "Silent Flash"
				description = "The user sings or plays a singular note which causes anyone who hears it to go deaf for half of a turn."
				dran = 180
		Crank
			ran = "C"
			Kuchiyose2
				jut = "Ninjutsu"
				ele = "Elementless"
				name = "Combat Summon"
				description = "The user summons either their Medium sized Personal summon or the small version of their Combat Summon."
				dran = 375
			ShadowSight
				name = "Shadow Sight"
				description = "The user makes eye contact with their target, causing them to go blind for the entire duration of a single turn."
				dran = 450
			SilentNight
				name = "Silent Night"
				description = "The user sings a series of three notes which causes anyone who hears it to go deaf for the duration of a single turn."
				dran = 445
			TerrorOfTheNight
				name = "Terror of the Night"
				description = "The user pulses their chakra outwards from their body in a three by three area. Anyone caught within is plunged into a shadowy realm and forced to relive their darkest fears, the greater the fear caused, the greater the shock."
				dran = 450
			IllusionBlade
				name = "Illusion Blade"
				description = "The user flows their Illusion chakra through a weapon, anyone who is struck with the weapon, or if it's an instrument, hears it, is struck by any Genjutsu that the user knows. This can be used as a way of activated a Genjutsu via different means than what is intrisic to the jutu itself."
				dran = 475
		Brank
			ran = "B"
			EternalShadowSight
				name = "Eternal Shadow Sight"
				description = "The user's eyes turn pitch black. Anyone who they make eye contact with after activating this jutsu goes blind until they turn it off. For every person after the first the user's chakra is strained and their body is stressed. If they hold more than three people for longer than one turn they become irrevocably blind."
				dran = 700
			WorldOfMadness
				name = "The World of Madness"
				description = "The user releases a pulse of chakra outwards in a five by five area. Anyone caught in this pulse is plunged into a shadowy realm of darkness where they relive their darkest fears. This lasts for two turns and cannot be countered by Kai. Anyone who's Genjutsu Resistance + Intelligence is less than 1/2 of the user's is left incapacitated and unconscious."
				dran = 750
			PsychicStrike
				name = "Psychic Strike"
				description = "The user molds their Illusion Chakra around their limbs. When they strike the chakra flows into their target and causes them a small amount of physical discomfort even if they miss the actual attack. Damage uses the user's Genjutsu / 2 compared to target's durability."
				dran = 475
		Arank
			ran = "A"
			EternalSilence
				name = "Eternal Silence"
				description = "The user plays/sings a song that takes an entire turn to play. If successfully performed, anyone within the influence of the song will go permanently deaf."
				dran = 950
			ShadowRealm
				name = "The Shadow Realm"
				description = "The user releases a pulse of chakra outwards in a five by five area. Anyone caught in this pulse is plunged into a shadowy realm of darkness where they relive their darkest fears. This lasts for two turns and cannot be countered by Kai. Anyone who's Genjutsu Resistance + Intelligence is less than the user's is left incapacitated and unconscious."

		Srank
			ran = "S"
			PsychoBreaker
				name = "Psycho Breaker"
				description = "The user releases a burst of chakra into their target. If their Genjutsu Resistance + Intelligence is lower than the user's, then their mind is broken, they lose all of their memories and have their personality wiped and are left unconscious after a short period."
				dran = 1500

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Houkyakyu
		icon = 'SkillCard.dmi'
		icon_state = "Houkyakyu"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Kekkei = 1
		Drank
			ran = "D"
			Hinder_Bomb
				name = "Hinder Bomb"
				description = "The user's wrist rings extend, they are able to fire a small orb of chakra that, upon contact with anything solid, explodes with concussive force to knock back and possibly incapacitate their target."
				dran = 375

		Crank
			ran = "C"
			Accela_Flash
				name = "Accela Flash"
				description = "The blue rings around the user's legs expand, increasing their speed and movement. When they make a leap, a minor, mild, shock-less wave appears the moment their feet hit the ground. From Veteran onward, the user leaves afterimages which makes it seem as if they had not yet moved. Can only be used Once a turn at New. Twice at Novice. Three times at Expert. Four times at Veteran. and Five at Master."
				dran = 450
			Text_Weapon
				name = "Text Weapon"
				description = "The user's hands glow bright red. By touching the surface of something solid, they are capable of creating a weapon from that contact, however the weapon's durability will be as strong as the material used to make it."
				dran = 250

		Brank
			ran = "B"
			Aegis
				name = "Aegis"
				description = "The blue rings around the user's wrist extend outwards. The user is able to completely negate an elemental jutsu and draw it into one of the eight diamonds upon their back. Depending on the element of the technique, the color of the diamond will change."
				dran = 450
			Strife
				name = "Strife"
				description = "The user fires one of the stored jutsu from their diamonds by placing their hands together and linking their fingers into a single fist. The two blue rings around their arms link together and create a sort of cannon from which the jutsu is fired as a beam of its elemental chakra."
				dran = 500

		Arank
			ran = "A"
			Angelica
				name = "Angelica"
				description = "The user forces a massive amount of chakra into the diamonds on their back. The chakra is jettisoned outwards in the form of angelic wings. The user gains the ability to fly around. The blue rings around their arms and legs extend. They are able to fire blasts of non-elemented chakra from the rings on their arms and fire bursts of chakra from the ones around their legs to propel themselves. After using this technique, the user's chakra is sealed away temporarily, leaving them incapacitated and drained."
				dran = 1200


*/




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Akimichi
		icon = 'SkillCard.dmi'
		icon_state = "Akimichi"
		skil = "New"
		jut = "Ninjutsu"
		ele = "Elementless"
		idran = "Stamina"
		Drank
			ran = "D"
		Crank
			cd = 1
			ran = "C"
			Human_Boulder
				name = "Human Boulder"
				description = "The user's body expands rapidly and they take on a large orb shape. After tucking in their head and limbs, the user rolls around like a boulder, crushing anything in their path.<br><br>\[Speed: Strength]<br\[Damage:Taijutsu Damage + 5]<br>\[Damage Cap: Medium]"
				dran = 600
				CalDran = 300
			Expansion_Jutsu
				name = "Expansion Jutsu"
				description = "The user, manipulating their calories into chakra, increases their size by large multiples increasing their power and durability.<br>\[User’s strength +10 and durability +5.]<br>\[User’s tile movement begins at the front of the user’s AOE size.]<br>\[Possible sizes per technique mastery are as follows; New = +3x3, Novice = 5x5, Expert = 7x7, Veteran = 9x9, Master = 11x11]<br>\[Sustained per turn without the need for dual caster when used with Akimichi clan techniques.]"
				dran = 650
				CalDran = 300
			Partial_Expansion
				name = "Partial Expansion Jutsu"
				description = "The user changes the	size of just a portion of their body as opposed to their entire body using the process of the Baika no Jutsu. <br>\[Damage:Taijutsu Damage + 5]<br>\[+2 to damage for every stage of technique mastery the user has. Example: New = +2, Novice = +4, Expert = +6, Veteran = +8, Master = +10]<br>\[Users physical reach during techniques activation is extended up to 5 tiles]"
				dran = 550
				CalDran = 300
			Spiked_Meat_Tank
				name = "Spiked Meat Tank"
				description = "The user puts on a roped jacket covered in kunai before using the Human Boulder technique. This technique has increased lethality and danger for possible targets. Not only crushing, but impaling them.<br><br>\[Speed: Strength]<br>\[Damage: Strength+Kenjutsu+5 vs Durabilityx2]<br>\[Damage Cap: Medium]"
				dran = 600
				CalDran = 300

		Brank
			cd = 2
			ran = "B"
			Butterfly_Bomb
				name = "Butterfly Bomb"
				description = "The user, after eating the third of the Akimichi Pills, or after having mastered the technique without them, sprouts a pair of Butterfly Wings made of chakra and draws the entirety of this chakra into their fist and performs a massive chakra enhanced strike.<br>\[Damage:Strength+15]<br>\[The user has the option of concentrating their chakra for one full round in order to amplify the damage of the resulting strike by an additional 10 points]<br>\[Speed=Users attack speed]<br>\[Damage Cap:Major]"
				dran = 1700
				CalDran = 500
			Earthquake_Slam
				name = "Earthquake Slam"
				description = "The user, after using the Super Expansion Jutsu, channels their chakra to their hands before slamming them into the ground. This creates a massive tremor in the ground as well as cleaving it in two in a straight line away from the epicenter, leaving a crater at the center of the attack.<br>\[Damage: Taijutsu damage+15 at epicenter.]<br>\[concussive tremor radiates outward in a 11x11 aoe around the user, dealing Taijutsu damage+7]<br>\[Knocks those within the aoe prone if they do not have the solid feet or free-runner perks.]<br>\[Damage Cap:Major]"
				jut = "Taijutsu"
				dran = 1775
				CalDran = 500
			BallisticWaterwheel
				name = "Ballistic Waterwheel"
				description = "DELETE THIS]"
				jut = "Taijutsu"
				dran = 1500
				CalDran = 500
			SuperOpenHandSlap
				name = "Super Open Hand Slap"
				description = "After using the Multi-Size Technique to increase their size, the user funnels chakra into their hands, which causes special markings to appear in them. The weight and power of the hands are greatly increased because of the larger size, the muscles are activated with concentrated chakra, and the thickness is also increased. With so much chakra that it becomes visible, the user's palms become like an iron hammer. This gives this attack the power to even cave in the earth, causing extensive crushing damage to anything that may be caught beneath them. This attack is also shown to have a wide range due to the increased size of his palms.<br><br>\[Damage: Taijutsu damage+15 vs Durabilityx2]<br>\[Width of the attack is the user’s Expansion Jutsu width.]<br>\[Damage Cap: Major]"
				dran = 1500
				CalDran = 500


		Arank
			ran = "A"
		Srank
			ran = "S"




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Yamanaka
		icon = 'SkillCard.dmi'
		icon_state = "Kawarimi"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
		Crank
			cd = 1
			ran = "C"
			SensingTransmission
				name = "Sensing Transmission"
				description = "By making physical contact with another individual, the user is able to transmit what they are currently sensing directly into the said target's mind.<br><br>\[Requires T1 Sensing]<br>\[Via touch a yamanaka is able to temporarily give another benefits akin to that of t1 sensing]"
				dran = 550
			MindBodySwitchTechnique
				name = "Mind Body Switch Technique"
				description = "With this technique, a ninja sends their mind as spiritual energy into a target's body supplanting the target's mind with their own. The user transfers their consciousness to the target, giving them complete control of the body for a short period of time. While in control of the body, the user is able to communicate with the target. Since the user is in another body, they are also able to use that body's chakra. It is also possible for the user to switch bodies with the target. This has great strategic value when used on a team-mate as neither body is left incapacitated and they may also make use of the user's abilities as well as their own while doing this. To remain inconspicuous when spying, the user can perform this technique on an animal, such as a hawk, which they can use to do aerial reconnaissance. It is generally used on immobilized targets. Conversely however, the user's original body is left defenseless while this technique is active, leaving it susceptible to attack until they return. The mind transfer moves slowly in a straight direction and takes some time to return to the user's body if it misses. Similarly, if the opponent's will is strong enough, they can force the user from their body. Also, if the user's chakra level is low, the technique will be harder to maintain. Furthermore, should any physical injury befall the victim's body while the mind link is active, it would cause the user's body to also receive those same injuries. This can be rectified if user cancels the technique before the victim's body receives the damage.<br><br>\[Speed= Control -5]<br>\<br>\[The technique flies in a straight path to a given target.]<br>\[Without chakra sensing or doujutsu the technique is unseen.]<br>\[Con vs Intel+nin defense]<br>\[If the opponent possesses a will perk add +10 to defense calculations.]<br>\[Any damage taken while possessing a body is transferred back to user’s body.]<br>\[2 round maximum duration]"
				dran = 	550
				hseal = 1
		Brank
			cd = 2
			ran = "B"
			MindBodyDisturbanceTechnique
				name = "Mind Body Disturbance Technique"
				description = "A ninjutsu where one sends their chakra into the subject's nervous system, thus gaining complete control of the target's body. The enemies this technique is cast upon are completely under the user's control, as their bodies become disconnected from their will. The difference between this and the Mind Body Switch Technique is that the caster doesn't project their consciousness into the enemies' bodies. Situations of numerical superiority for the adversary are precisely where this technique, which freely manipulates human beings, will display its efficiency, by getting the enemies to turn on one another. Control can be exerted even from long distances.<br><br>\[Speed=User’s Control]<br>\[The technique flies in a straight path to a given target.]<br>\[Without chakra sensing or doujutsu the technique is unseen.]<br>\[Maximum number of targets= User’s control/10]<br>\[When used against one target: Con+5 vs Int+Ninjutsu defense]<br>\[When used against two or more: Con -5 for every target after the first vs Int+Nin defense]<br>\[If caught by this technique they are forced to do the users bidding for up to a max of two turns.]<br>\[If a will perk is possessed, increase user’s defensive calculation by 10]"
				dran = 1800
				hseal = 1
			MindBodyTransmissionTechnique
				name = "Mind Body Transmission Technique"
				description = "The Mind Body Transmission Technique allows the user to telepathically communicate with other people. Using this technique, the Yamanaka may also act as a medium for persons to communicate with one another telepathically; this is done through establishing physical contact with the person. The user can communicate with multiple people at once and the targets can also communicate with one another while the technique is in effect. This technique is not limited to just transmitting thoughts, and images such as memories or even strong feelings can be conveyed through this method. The more people that are connection through this technique however, the more a physical strain is put on the user, forcing them to keep the connection going for shorter periods to otherwise avoid sustaining injuries.<br><br>\[Strain is considered genjutsu effect severity per person per round; 2 targets =Minor Severity per round. 3 targets =Low severity per round. 4 targets = Medium Severity per round. 5 targets = High Severity per round]"
				dran = 1800
				hseal = 1
			MindCloneSwitchTechnique
				name = "Mind Clone Switch Technique"
				description = "This technique allows the user to transfer their consciousness into more than one target by cloning their consciousness, giving them complete control of the bodies for a short period of time. Like the Mind Body Switch Technique, the user's body is left defenseless while the technique is in use. Unlike the Mind Body Switch, this technique can travel in a curved line.<br><br>\[Con+5 vs Int+Ninjutsu defense(Calculated individually for each target)]<br>\[The path of each individual consciousness clone can change direction mid-flight once this must be specified.]<br>\[Number of possible Clones= 2 at New, 4 at Expert, 6 at Mastered]"
				dran = 1500
				hseal = 4
		Arank
			cd = 3
			ran = "A"
			MindDisturbanceDancePerformanceTechnique
				name = "Mind Disturbance Dance Performance Technique"
				description = "This is simply a large-scale version of the Mind Body Disturbance Technique, where the sheer volume of people affected in a given area is much greater. Like its parent technique, it causes the user to gain complete control of the target's body, often forcing allies to attack each other.<br><br>\[Speed=User’s Control]<br>\[The technique flies in a straight path to a given target area.]<br>\[Without chakra sensing or doujutsu the technique is unseen<br>\[Con+10 vs Int+Ninjutsu defense(Calculated individually for each target)]]<br>\[When used against two or more: Con -5 for every target after the first vs Int+Nin defense]<br>\[If caught by this technique they are forced to do the users bidding for up to a max of two turns.]<br>\<br>\[Attempts possession of all targets within a AOE of 9x9 tiles.]<br>\[Maximum range of 20 tiles.(From target to the AoE’s center.)]"
				dran = 3000
				hseal = 1
			MindPuppetSwitchCursedSealTechnique
				name = "Mind Puppet Switch Cursed Seal Technique"
				description = "The user of this technique firstly transfers their mind into a puppet laid somewhere in advance, near the vicinity of an enemy's predicted path, before manipulating it to attack an intended opponent. When the opponent counters and inflicts damage upon the puppet or the puppet inflicts damage on the enemy, the cursed seal will take effect, causing the kanji 'curse' to disappear from the puppet's forehead and the two consciousness (that of the user's inside the puppet and that of the victim who countered) to switch. Consequently, the user will gain full control of the opponent's body, while the victim's mind remains trapped within the immobile puppet. Like the original technique, the user's body is left defenseless while the ability is active and any injury done to the victim's body is also reflected upon their true body, but this can be rectified if the user cancels the technique just before any damage is received. Unlike the original, the user does not have to worry about the target's will overpowering their own, as it is sealed in the puppet.<br><br>\[Doll's Speed & Attack Speed= User's Control-5]<br>\<br>\[Doll's Reflex = User's Control]<br>\[Without chakra sensing or doujutsu the doll's possessed status is unseen.]<br>\[Striking or being struck by the doll circumvents the typical possession calculation.]<br>\[Any damage taken while possessing a body is transferred back to user’s body.]<br>\[If caught by this technique they are forced to do the users bidding for up to a max of ten turns.]<br>\[If a will perk is possessed, increase user’s defensive calculation by 10]<br>\[The victim's possession is contested with the base possession calculation which increases by 5 per turn of the possession.]<br>\[The user and their target take one turn to return to their own bodies after this technique ends.]"
				dran = 1800
				hseal = 4
		Srank
			ran = "S"
			MindFuckeryNoJutsu
				name = "Mind Fuck Jutsu"
				description = "Fuck u bitch"
				dran = 4000

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Hyuuga
		icon = 'SkillCard.dmi'
		icon_state = "Hyuuga"
		skil = "New"
		jut = "Taijutsu"
		ele = "Elementless"
		Drank
			ran = "D"
			Palm_Heel_Strike
				name = "Palm Heel Strike"
				description = "The user strikes an opponents chakra pathway with a palm heel strike causing both internal and external damage.<br>\[Inflicts a single round of stun]<br>\[5 true damage]"
				jut = "Taijutsu"
				idran = "Stamina"
				dran = 100
		Crank
			ran = "C"
			cd = 1
			Rotations
				name = "Eight Trigrams: Heavenly Rotation"
				description = "The user expels chakra from every one of their chakra points while at the same time rotating. This technique acts as both offense and Defense in most situations. It cannot be used if the user cannot spin properly.<br>\[Durability:Taijutsu]<br>\[Speed=Reflex]<br>\[Requires mid-air combatant to use mid-air]"
				dran = 575
				idran = "Chakra"
			Protection
				name = "Eight Trigrams: Protection of the Holy Eight Trigrams"
				description = "The user makes several dozen strikes in the air around them creating a slicing, protective, sphere of chakra which upon completion, the user expels outwards to attack anyone within the near vicinity of the attack.<br>\[Strength of protection:Control/2+Attack Speed]"
				dran = 600
				idran = "Chakra"
			ThirtyTwoPalms
				name = "Eight Trigrams Thirty-Two Palms"
				description = "The Eight Trigrams Thirty-Two Palms is a maneuver of the Gentle Fist fighting style. It is essentially a halved version of the Eight Trigrams Sixty-Four Palms, but seems to be no less effective. This technique is used to close off the flow of chakra through thirty-two chakra points of an opponent's chakra pathway system. This eliminates their ability to use chakra for quite some time and makes it difficult for them to move.<br><br>\[Calculated 5 individual strikes. Each hit does 1 true damage and 50 chakra damage. Gentle Fist bonuses do not apply to this attack.]<br>\[Each consecutive attack gains +3 AS]<br>\[First Strike: 2 Hits]<br>\[Second Strike: 2 hits]<br>\[Third Strike: 4 Hits]<br>\[Fourth Strike: 8 Hits]<br>\[Fifth Strike: 16 Hits]<br>\[If at least 16 hits connect, target's chakra flow is halted for 1 rounds.]"
				jut = "Taijutsu"
				idran = "Chakra"
				dran = 600
		Brank
			cd = 2
			ran = "B"
			SixtyFourPalms
				name = "Eight Trigrams: Sixty Four Palms"
				description = "After the user catches their target within the range of this technique, their strike at 64 of the targets chakra points, causing massive internal damage to both their chakra system and their organs.<br><br>\[Calculates 6 individual strikes. Each hit deals 1 true damage and 50 chakra damage. Gentle Fist bonuses do not apply to these hits.]<br>\[Each consecutive strike gains +3 AS]<br>\[First Strike: 2 Hits]<br>\[Second Strike: 2 Hits]<br>\[Third Strike: 4 Hits]<br>\[Fourth Strike: 8 Hits]<br>\[fifth Strike: 16 Hits]<br>\[Sixth Strike: 32 Hits]<br>\[If at least 32 hits occured, target's chakra flow is halted for 3 turns.]"
				dran = 1800
				idran = "Stamina"
			AirPalm
				name = "Eight Trigrams: Air Palm"
				description = "The user releases a burst of chakra directly from their hand which strikes their target from a distance causing internal damage.<br><br>\[Speed: Control +10]<br>\[Deals 5 true damage]<br>\[Knockback: Control vs Dura]"
				dran = 1450
				idran = "Chakra"
			OneBodyBlow
				name = "Gentle Fist: Body Blow"
				description = "A technique born from their innate ability to expel chakra from every tenketsu on their body, a member of the Hyuuga clan can hit their opponent with a blast of chakra that will send them flying away from the user. It was also shown that this technique can be used with pin-point accuracy to target the weak point of a technique exemplified when Neji Hyuga was trapped by Kisame Hoshigaki's Water Prison Technique, and was able to dispel it.<br><br>\[Knockback: Control vs Durability.]<br>\[Breaking Restraints: Control +10 vs Dura/Power]<br>\[To break a restraining technique in one attempt, you must deal at least Lethal damage on the damage scale. Damage is consecutive and adds up each turn.]<br>\[May be used multiple times to increase the power of this technique. Each use adds +5 power to the technique's calculation.]"
				dran = 1800
				idran = "Chakra"
		Arank
			ran = "A"
			OneTwentyEight_Protection
				name = "Eight Trigrams: One Hundred and Twenty Eight Palm Guard"
				description = "An upgraded version of the Protection of the Holy Eight Trigrams technique. The user makes several dozen strikes in the air around them creating a slicing, protective, sphere of chakra. This creates an 'absolute defense' effect similar to that of the Eight Trigrams Palms Revolving Heaven, though the cutting nature of the chakra prevents any outside force from restricting it. This technique sends out an outward burst of the chakra dome created, deflecting incoming attacks.<br><br>\[7x7 area centered on user]<br>\[To Deflect: Control + Reflex +10 vs Incoming Attack Speed x1.5]<br>\[Durability: Ninjutsu Defensive Power]<br>\[This sphere of chakra can deflect projectiles, techniques, etc while also acting as a barrier against melee attacks.]<br>\[May not perform any other actions when using this technique.]"
				dran = 2500
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Hozuki
		icon = 'SkillCard.dmi'
		icon_state = "Suika"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Water"
		Drank
			ran = "D"
		Crank
			ran = "C"
			Suiga
				name = "Water Transformation Jutsu"
				description = "The user transforms their entire body, or a part of their body, into water in order to avoid taking damage or to sneak up on a target. If they are electrocuted in this form, they will turn into a jelly-like state.<br>\[Takes no damage from physical attacks while in liquified state]<br>\[Damage from fire techniques, wind techniques and explosives are halved(after damage calculations)]<br>\[2x damage from lightning based attacks(after damage calculations).]<br>\[Reflex must be within 10 points of an incoming attack’s speed.]<br>\[Consume’s an action.]"
				dran = 575
				cd = 0
		Brank
			cd = 2
			ran = "B"
			GreatWaterArm
				name = "Water Style: Great Water Arm Jutsu"
				description = "The user increases the size and power of one of their arms, allowing for them to lift larger loads and deal more damage with a single blow.<br><br>\[Physical attack damage+15]<br>\[Lasts for two turns.]"
				dran = 1400
			DemonFish
				name = "Water Style: Demon Fish"
				description = "DELETE THIS"
				dran = 1600
			FangBomb
				name = "Water Style: Water Fang Bomb"
				description = "The user jettisons themself at their target, giving them an increase in speed and ability to deal damage.<br><br>(Speed:Control + 5)<br>(Damage:Ninjutsu Offensive Power + 10)<br>(Damage Cap:Major)"
				dran = 1400
		Arank
			cd = 3
			ran = "B"
			WaterGun
				name = "Water Style: Water Gun no Jutsu"
				description = "The user fires a stream of water from their finger. This bullet is capable of cutting through flesh and bone with ease.<br>\[Damage: Basic Ninjutsu damage calculation]<br>\[Bullet Speed:Control + 10]"
				dran = 700
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Konohagakure
		icon = 'SkillCard.dmi'
		icon_state = "Perk"
		skil = "New"
		Drank
			ran = "D"
			Leaf_Style_Front_Beheading
				name = "Leaf Style: Front Beheading"
				dran = 500
				ele = "Elementless"
				hseal = 0
				cd = 0
				jut = "Taijutsu"
				description = "The user swings their sword in a single quick and powerful cutting motion to attack an enemy in front of them.<br><br>\[Speed=Attack Speed + 3]"
				jut= "Kenjutsu"
			Leaf_Whirlwind
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Konohagakure Style Taijutsu: Leaf Whirlwind"
				dran = 500
				ele = "Elementless"
				hseal = 0
				cd = 0
				jut = "Taijutsu"
				description = "A taijutsu where one launches a succession of high kicks and low kicks. Firstly, the opponent's evasion margin is restrained upon seeing the high kick, thus augmenting the chances for the low kick to hit the mark. So originally the high kick is little more than a feint.<br><br>\[Lowers opponent’s reflex by 3 until their next turn.]"

		Crank
			ran = "C"
			Leaf_Great_Whirlwind
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Konohagakure Style Taijutsu: Leaf Great Whirlwind"
				dran = 500
				ele = "Elementless"
				hseal = 0
				cd = 1
				idran = "Stamina"
				jut = "Taijutsu"
				description = "This technique is a series of kicking attacks, starting from a low kick and linking into a middle kick and high kick then finishing off with a heel drop. As the rotation speed picks up the user gains buoyancy, which they use to shift into gradually higher attacks.<br><br>\[Damage: Taijutsu Damage vs Dura x2]<br>\[Lowers opponents reflex by 5 until their next turn.]"
			Creeping_Leaf_Shadow
				icon='Skillcard.dmi'
				description = "A technique where one follows the opponent, closely matching his or her body's movement, just like a leaf that dances in the air is followed by its shadow. The technique is usually preceded by a swift upper kick that will launch the target into the air. It is mainly used to position an opponent into a vulnerable aerial position. This move by itself is relatively harmless, but it is usable as a stepping stone for a great many powerful techniques like Front Lotus and the Lion Combo. That being said, it also has a rather high degree of difficulty.<br><br>\[No damage]<br>\[May be used to follow up launching attacks without transitionist.]<br>\[Increases speed by 5 while attempting a back flank]"
				icon_state="Run"
				name = "Konohagakure Style Taijutsu: Creeping Leaf Shadow"
				dran = 550
				ele = "Elementless"
				hseal = 0
				cd = 1
				idran = "Stamina"
				jut = "Taijutsu"
			Leaf_Style_Crescent_Beheading
				name = "Leaf Style Crescent Beheading"
				dran = 550
				jut = "Kenjutsu"
				ele = "Elementless"
				idran = "Stamina"
				hseal = 0
				cd = 1
				description = "The user swings their sword in a single, large, crescent moon-shaped arc, which occurs with such ferocious velocity that the technique can be employed in situations where only a very limited time to react is available. The swing can be used to counter attacks from multiple opponents simultaneously.<br>\[Speed=Attack Speed + 5]<br>\[Attack covers 1x3 in front of the user]"
			Leaf_Style_Reverse_Beheading
				name = "Leaf Style Reverse Beheading"
				dran = 550
				jut = "Kenjutsu"
				ele = "Elementless"
				idran = "Stamina"
				jut = "Kenjutsu"
				hseal = 0
				cd = 1
				description = "The user does a powerful spin, generating the momentum needed to slash at any opponents behind them. The user can also utilize this spinning motion to trick an enemy that's in front of them. The enemy is fooled into thinking the user will attack them, but instead the user attacks the targets behind the user.<br><br>\[Speed=Attack Speed + 5]<br>\[Attack covers 1x3 behind the user]"

		Brank
			ran = "B"
			KageBunshinNoJutsu
				name = "Shadow Clone Jutsu"
				description = "Similar to the basic Clone Technique, this technique creates copies of the user.  However, these clones are corporeal instead of illusions.  The user's chakra is evenly distributed among every clone, giving each clone an equal fraction of the user's overall power.  The clones are capable of performing techniques on their own and can even bleed, but will usually disperse after being hit by a strong enough force.  The clones can also disperse on their own or be dispelled by the user of the technique.  Shadow clones can't be distinguished from the original with Sharingan, Byakugan, Rinnegan or Rinne Sharingan.<br>(Creates up to a max of con/4 clones)<br>(Clones are capable of performing any technique the user is capable of)<br>(Clones stats=Users stats)<br>(Durability and nin defense are 3)<br>(Entire chakra pool is evenly distributed amongst clones, meaning if you make two clones, your chakra will be divided three ways in between you, and your two clones, etc etc. You must manually subtract the chakra, so use 0 times and then use the Set-chakra function to determine cost)"
				dran = 1000
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ele = "Elementless"
				hseal = 1
				cd = 0
		Arank
			ran = "A"
		Srank
			ran = "S"

	Kuraigakure
		icon = 'SkillCard.dmi'
		icon_state = "Perk"
		skil = "New"
		Drank
			ran = "D"
			KuraigakureStyleShadowStrike
				name = "Kuraigakure Style: Shadow Strike"
				description = "The Shadow Strike is a repeated motion of an already performed strike. After doing a strike, the user pivots on their back foot, reversing their momentum before pushing forward again and following up their attack with the same strike.<br>\[This technique links from a Basic Attack as a Free Action.]<br>\[Strikes at Attack Speed, dealing Kenjutsu Damage vs Durability x 2]<br>\[If the user possesses a T2 Weapon Perk, this technique's cap raises to Medium.]"
				dran = 500
				hseal = 0
				cd = 3
				idran = "Stamina"
				jut = "Kenjutsu"

			KuraigakureStylePassingMoon
				name = "Kuraigakure Style: Passing Moon"
				description = "This technique is a palm heel strike toward their enemy's center of gravity. Pushing off of their heel, they put their weight behind the strike to push the opponent backward and away from them.<br>\[Strikes at Attack Speed + 3]<br>\[Deals Taijutsu Damage vs Durability x 2]<br>\[Knockback Tiles: 3]"
				dran = 500
				ele = "Elementless"
				idran = "Stamina"
				jut = "Kenjutsu"
				hseal = 0
				cd = 2
		Crank
			ran = "C"
			KuraigakureStyleCrossingLight
				name = "Kuraigakure Style: Crossing Light"
				description = "As an attack is aimed towards the weaponist, they do not veer to the side or move with fear – they step forward, rotating to the outside of the strike, fearlessly facing the attack and moving around it elegantly. This action requires great speed, but if performed correctly it permits a powerful blow to be delivered at the apex of the evasive spin.<br>\[Increases the user's Reflex by their highest Weapon Perk Tier x 1.5 to Graze.]<br>\[Excess Reflex over an Attack is converted to Attack Speed for this technique. Capped at +5]<br>\[Strikes at Attack Speed]<br>\[Deals Kenjutsu Damage vs Durability x 2]"
				dran = 800
				ele = "Elementless"
				idran = "Stamina"
				jut = "Kenjutsu"
				hseal = 0
				cd = 3
			KuraigakureStyleSweepingDusk
				name= "Kuraigakure Style: Sweeping Dusk"
				description = "A technique that could be considered Kuraigakure's version of Leaf Whirlwind. Instead of going up the user crouches downwards, spinning and kicking at the heel of their enemy to sweep them off their feet. Knocking them out of their martial form and straight onto the ground, opening them up to further attacks.<br>\[Strikes at Attack Speed.]<br>\[Deals Taijutsu Damage + 5 vs Durability x 2.]<br>\[Contests Strength vs Strength if it hits. 1/4 of the damage this technique dealt to the opponent is added to the user's Strength for success.]<br>\[Knocks the opponent down on success, and removes them from their stance.]"
				dran = 800
				ele = "Elementless"
				idran = "Stamina"
				jut = "Taijutsu"
				hseal = 0
				cd = 2
			KurakigakureStyleRhythmEcho
				name = "Kuraigakure Style: Rhythm Echo"
				description = "The user breaks their movement up into fragments, slowing themselves to dizzy the opponent. Despite the name, the technique relies on a lack of any predictable rhythm. They move in a varying cadence of steps that confuse enemies trying to anticipate motions in the instants of combat. If the user is capable of moving silently, their movements are all the more effective at it.<br>\[Lowers the user's Speed by up to -6 to reduce the opponent's Reflex by half that amount toward user’s next Action.]<br>\[If the user possesses Lightfoot, the Reflex debuff becomes equal to the Speed reduction,]<br>\[This technique can link into another 'Kuraigakure Style' technique.]"
				dran = 750
				ele = "Elementless"
				idran = "Stamina"
				jut = "Taijutsu"
				hseal = 0
				cd = 2
			KuraigakureStyleEncroach
				name = "Kuraigakure Style: Encroach"
				description = "A simple movement technique used to approach a nearby enemy. The user lowers their center of gravity and kicks off of the ground, dashing at an accelerated pace a short distance to their target, their momentum carrying to their immediate strike upon reaching them.<br>\[Increases the user's Speed by +6 when moving towards a target within 5 Tiles.]<br>\[Half of that is added to the user's Attack Speed to their next action.]"
				dran = 750
				ele = "Elementless"
				idran = "Stamina"
				jut = "Taijutsu"
				hseal = 0
				cd = 2

		Brank
			ran = "B"
		Arank
			ran = "A"
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Kirigakure
		icon = 'SkillCard.dmi'
		icon_state = "Perk"
		Drank
			ran = "D"
			Ninja_Art_Hidden_Mist_Jutsu// - D-Rank(Kirigakure Only) 150 <br>
				name = "Ninja Art: Kirigakure No Jutsu"
				description = "This displacement technique is a speciality of the ninja from Kirigakure, where one causes a mist to spring forth by lifting up some water from either a pre-existing source or expelled from their mouth, then goes in and out of sight at will from within the pearly-white realm. The mist's thickness is controlled by the amount of chakra kneaded into it. It can't fool the Byakugan, but, due to the mist being created with the user's chakra, any Sharingan and Rinnegan-user will see the mist coloured by their opponent's chakra, which will effectively hide the user from the dojutsu.<br>\[Creates a 11x11 aoe mist.]<br>\[Requires Mist fighter to adequately fight within the mist-can be countered with sensory perks i.e hearing, smell, sensing]<br>\[Reflex is the mist is -5 without sensory perks]<br>\[Does Not affect the byakugan]"
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				ele = "Water"
				idran = "Chakra"
			Silent_Killing
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Kirigakure Assassin Technique: Silent Killing"
				dran = 150
				description = "As the name suggests, this technique is simply a very quiet method of killing an opponent, usually from behind with a blade. Additionally, because the user moves silently, it cannot be defended against, because the attack cannot be anticipated.<br><br>(Lowers an opponents reflex by 3 if attacked from behind; negated by sensory perks)"
				skil = "New"
				jut = "Taijutsu"
				idran = "Stamina"
				ele = "Elementless"
		Crank
			ran = "C"
			cd = 1
			Water_Blade
				name = "Water Blade"
				description = "Creates a sharp sword made of solid water within the users hand. Dependent upon the elemental mastery of the user-the swords strength and composition can mirror that of a standard katana. <br>\[Durability=Ninx2]<br>\[Damage=Taijutsu+Strength+Con/4 vs Durability x 2]"
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				ele = "Water"
				idran = "Chakra"
		Brank
			ran = "B"
			cd = 2
			Rising_Water_Slicer
				name = "Rising Water Slicer"
				description = "The user releases a linear wave of water that travels at high speeds to attack the target. It is strong enough to slice clean through rock.<br>(Speed=Con+10)<br>\[Damage=Nin+Con+5]<br>\[Maximum reach=Users Ninjutsu/3]"
				dran = 700
				skil = "New"
				jut = "Ninjutsu"
				ele = "Water"
				idran = "Chakra"

		Arank
			ran = "A"
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Inuzuka
		icon = 'SkillCard.dmi'
		icon_state = "Inuzuka"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Erank
			ran = "E"
			DynamicMarking
				name = "Dynamic Marking"
				description = "This technique involves a NINKEN urinating on a target, marking it with a strong odor that allows both them and their partner to easily track it by scent. The Ninken is able to accurately hit targets. This is a prerequisite for using the Fang Wolf Fang technique unless the user is a sensor.<br>(Piss projectile moves at Attack Speed)<br>(If struck, the odor remains with the opponent for the remainder of battle unless washed away by water or submerged in a water source.]<br>\[A struck target is unable to sneak up on the Inuzuka or their dog, they can fight an opponent struck by this technique while blinded.]"

		Drank
			ran = "D"
			ManBeastClone
				description = "An Imitation Human Ninja Art, this technique transforms a ninken into their Inuzuka partner. By doing this, the Inuzuka gains a copy of themselves that serves the same practical purpose as a shadow clone but without a shadow clone's steep chakra requirement. Even though they look identical, the ninken - because it's an animal - is likely to give away which of the two is which from how it moves and acts. To counteract this, the Inuzuka typically uses an Imitation Beast Ninja Art, causing them to act more feral and thus make it harder to tell them apart. As with any transformation, the ninken will revert to their original form if they're knocked out.<br><br>\[Stats are equal to the user's stats, but damage is halved outside of specific techniques.]<br>\[May utilize any taijutsu technique the user knows.(Technique drain is halved and imparted upon the ninken’s master.)]"
				dran = 100
			TunnellingFang
				name = "Tunneling Fang"
				description = "The user runs while on all fours and rapidly spins, ripping and shredding anything in their way.<br><br>\[Damage: Taijutsu Damage + 2]<br>\[Speed: Speed +5]<br>\[Man Beast Clones suffer no damage penalty when using this technique.]"
				dran = 265
				idran = "Stamina"
				jut = "Taijutsu"
		Crank
			ran = "C"
			cd = 1
			FangOverFang
				name = "Fang Over Fang"
				description = "An Inuzuka and their ninken companion both perform the Passing Fang, whereby they rotate their bodies and deliver a series of rapid body blows to a target. In order to coordinate their attacks, thus ensuring targets have no opportunity to defend themselves, Inuzuka and their ninken synchronize with each other as much as they can: breathing in unison; using the Four Legs Technique; using the Beast Human Clone. As the users cross back and forth for this attack, the surrounding area is damaged as well, crushing rocks and shaving sections off the ground.<br><br>\[Hits select targets within a 5x5 area centered on the user.]<br>\[Damage: Taijutsu Damage]<br>\[Speed: Speed +10]<br>\[Calculates twice, consecutively]<br>\[When using Man-Beast Clone, the user's dog may use this technique alongside them. This does not require Tag Specialist.]<br>\[Man-Beast Clones suffer no damage penalty when using this technique.]"
				dran = 500
				idran = "Stamina"
				jut = "Taijutsu"
		Brank
			ran = "B"
			cd = 2
			Garoga
				name = "Garouga"
				description = "Man and beast transform into a single two-headed, gigantic animal thanks to the Human Beast Combination Transformation: Double-Headed Wolf technique, and have their body spin in a violent assault against the enemy. The ultra-violent rotation creates a vacuum vortex in its surroundings that tears the enemy apart even without touching them directly. The excessively high speed of the rotation strips the user of their field of vision.if the user is skilled enough though this is unnecessary.<br><br>\[Damage: Taijutsu Damage +10]<br>\[Speed: Speed + 10]"
				dran = 1450
		Arank
			ran = "A"
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Sabaku
		icon = 'SkillCard.dmi'
		icon_state = "Sabaku"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Magnetism"
		Drank
			ran = "D"
			SandManipulation
				name = "Sand Manipulation"
				description = "This character possesses the Sabaku clan kekkei genkai, which allows the user to infuse sand with their own chakra and manipulate it as they see fit.<br><br>\[Speed of manipulation: Control]<br>\[Durability: Ninjutsu Defensive Power/2]"
				dran = 50
			Sand_Shuriken
				name = "Sand Shuriken"
				description = "The user creates shuriken out of sand and fires them off at their opponent.<br><br>\[Speed: Control]<Br>\[Projectiles produced:Control/5 to a cap of 5]<br>\[Damage:Ninjutsu Offensive Power]<br>\[Damage Cap=Minor]"
				dran = 200
			Third_Eye
				name = "Third Eye"
				description = "With chakra, the user connects an eye made of sand to their optic nerve, which enables them to know what happens in the artificial eye's field of vision, this is genuinely a third eye for its user. The user can control the size of the eye depending on its use. Its main purpose is spying, since it can form and disperse in any location on command. Gaara also uses it when he completely surrounds himself with his Shield of Sand so he can see what's happening outside of the protective dome. In order to activate it, however, the user must close one of their eyes.<br><br>\[User’s Sight tier is considered one tier higher through the use of this technique.]<br>\[Must be re-cast per turn.]"
		Crank
			ran = "C"
			cd = 1
			Sand_Shield
				icon_state = "Mayu"
				name = "Sand Shield"
				description = "The user creates a dome of sand around them that is nigh impenetrable to most techniques, but just about any raiton technique will tear through it with ease.<br><br>\[Durability: Ninjutsu Defensive Power]<br>\[-10 Dura VS Raiton techniques]<br>\[As the dome surrounds the user, they cannot see or be seen without a suitable sensory perk.]<br>\[Must be used once each turn it is active.]"
				dran = 500
			Sand_Coffin
				icon_state = "Kyuu"
				name = "Sand Coffin"
				description = "The user binds their target within a crushing coffin of sand leaving only their head exposed. This not only deals damage on its own but it takes any chance of their opponents escape away from them.<br><br>\[Binds the target, preventing most movement.]<br>\[Damage: Ninjutsu Offensive Power/2]<br>\[User's Control vs Strength to break out.]<br>\[Must be used once per turn it is active.]<br>\[Bind strength loses 5 points per turn,]"
				dran = 5000
		Brank
			cd = 2
			ran = "B"
			Sand_Burial
				icon_state = "Sousou"
				name = "Sand Burial"
				description = "After encasing a target with sand, such as by using the Sand Binding Coffin, the user clenches their fist to cause the sand to contract. The sand presses in on the target from all directions until they're pulverized, killing them. Although some of the target's remains burst through the sand, scattering around the area similar to rain, most of their blood is absorbed by the sand itself.<br><br>\[Only effective against targets bound by a sand technique such as Sand coffin]<br>\[Damage: Ninjutsu Offensive Power +15 vs Durax2]"
				dran = 1800
			Sand_Tsunami
				icon_state = "Tsunami"
				name = "Sand Tsunami"
				description = "The user creates a massive crushing wave of sand to capture a large group of targets or to simply take away any chance a target has of escaping. Targets are battered multiple times by the waves of sand as it spreads throughout the area. When the sand settles, the landscape is dramatically altered, taking on the appearance of a barren desert.<br><br>\[11 x 11 Aoe centered on user]<br>\[Tsunami Speed: Control]<br>\[Damage: Ninjutsu Offensive Power vs Dura x2]<br>\[Control vs Dura: On successful hit, knocks back 5 tiles.]"
				dran = 1700
			Great_Sand_Pyramid
				icon_state = "Tsunami"
				name = "Great Sand Pyramid"
				description = "The user molds their sand into a large pyramid after using the Sand Tsunami, capturing anyone that was caught in the wave. They then compact the pyramid down into a singular point, crushing everyone caught in the pyramid.<br><br>\[Damage: Ninjutsu Offensive Power + 10]<br>\[User's Con + 10 vs Target strength to break free.]<br>\[Each individual attempt to break free lowers the technique's bind strength by 5]<br>\[Bind strength loses 5 points per turn,]"
				dran = 2400
		Arank
			ran = "A"
			cd = 3
			Giant_Sand_Burial
				name = "Great Desert Burial"
				description = "After multiple targets have been engulfed by sand, the user slams their hands onto the sand and activates this technique. As with the regular Sand Waterfall Funeral, the sand compresses upon and grinds down the target, though on a far greater scale than the regular version. The large volume of sand used in the Quicksand Waterfall Flow is flattened out and the target is repeatedly squeezed, preventing them from moving and ultimately crushing them to death.<br><br>\[Only effective on targets restrained by other sand techniques.]<br>\[Damage: Ninjutsu Offensive Power + 25]"
				dran = 3000
			Imperial_Funeral_Seal
				icon_state = "Tsunami"
				description = "Using a large quantity of sand, the user covers the enemy with several successive layers of the material, before compressing it into the form of a huge pyramid which serves to imprison the target upon its completion.<br><br>\[Speed: Control +5]<br>\[User's Con + 20 vs Target’s Strength]<br>\[Each individual attempt to break out lowers  the technique's bind strength by 5]<br>\[Bind strength loses 5 points per turn,]"
				dran = 3500
		Srank
			ran = "S"


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Kaguya
		icon = 'SkillCard.dmi'
		icon_state = "Karamatsu no Mai"
		idran = "Stamina"
		Drank
			ran = "D"
			BoneBullets
				name = "Digital Shrapnel"
				description = "The user fires off small missiles from their fingers, causing blunt damage to anything that they hit. When mastered, the bone bullets gain a piercing element.<br>\[Durability vs Ninjutsu Defense.]<br>\[Speed:Attack Speed]"
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Elementless"
				idran = "Chakra"
		Crank
			ran ="C"
			DanceOfTheCamelia
				name = "Dance of the Camelia"
				description = "The second of the Kaguya's five dances, which they perform by modifying one of their upper arm bones to create a short, bone-hilted bone sword. They then stabs chaotically and continuously which causes the opponents eyes to lag behind.  The speed resembles afterimages, the hand with the sword is again and again visibly projected.<br>\[Weapon’s hp is equal to the user’s durability.]<br>\[Lowers opponents reflex by 5 during attacks]<br>\[Damage cap=Medium]"
				dran = 550
				skil = "New"
				jut = "Taijutsu"
		Brank
			ran = "B"
			ele = "Elementless"
			DanceOfTheClematisFlower
				name = "Dance of the Clematis: Flower"
				description = "The user concentrates all their Shikotsumyaku powers into the creation of a single bone weapon, which is made as hard as possible with a considerable amount of chakra.The bone weapon can be incredibly destructive, wielded as a sort of battering ram or lance. But a philosophy of the Kaguya clan is that even the deadliest weapon is useless if it can't hit its target. As such, Dance of the Clematis: Flower is usually first preceded by Dance of the Clematis: Vine, which is used to immobilize targets<br>Weapon’s hp is equal to the user’s durability.+10]\<br>\[Damage:Strength+Durability/4 vs Durability x 1]<br>\[Damage cap=Major]"
				dran = 1800
				skil = "New"
				jut = "Taijutsu"
			DanceOfTheClematisVine
				name = "Dance of the Clematis: Vine"
				description = "Cartilage between the individual vertebrae makes the spine flexible for use as a whip, and the cartilage can be stretched further to increase the whip's range. The vertebrae are also modified to have spikes, making it easier for them to hook into targets.<br>\[Whip can travel up to 10 tiles from the user]<br>\[Damage=Durability+Taijutsu+10]<br>\[Bind Strength=Durability+15]<br>\[Strength vs bind strength to escape]<br>\[Bind strength loses 5 points per turn,]<br>\[Damage cap=Major]"
				dran = 1800
				skil = "New"
				jut = "Taijutsu"
		Arank
			ran = "A"
			ele = "Elementless"
			DanceoftheSeedlingFern
				name = "Dance Of The Seedling Fern"
				description = "The user produces as many as ten thousand blades of bone that sprout from the earth. Because of how quickly the bones appear from the ground, how wide an area they cover, and how high into the air they extend, this technique can do extensive amounts of damage, killing indiscriminately. If any targets should somehow avoid this technique, The user is able to merge with the bone blades. They can then appear from any of them.<br>(15x15 aoe)<br>(Damage=Durability+Taijutsu+15)<br>(Speed when merged with bone AoE=Attack Speed)<br>(Opponents speed reduced by 10)<br>(Opponents take 5 true damage per turn within techniques aoe without free-runner.)<br>(Damage Cap=Lethal)"
				dran = 2000
				skil = "New"
				jut = "Taijutsu"
		Srank






//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/*	Kyokugi
		icon = 'Bat.dmi'
		icon_state = "Skill"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
		Crank
			ran = "C"
		Brank
			ran = "B"
		Arank
			ran = "A"
		Srank
			ran = "S" */

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Nara
		icon = 'SkillCard.dmi'
		icon_state = "Nara"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			cd = 0
			ran = "D"
			ShadowImitationShuriken
				name = "Shadow Imitation Shuriken"
				description = "By infusing the blades with his own chakra beforehand, they are given the effect of his shadow techniques. By using these weapons to pierce the enemies' shadows, they are paralyzed in place.<br><br>\[Bind Strength: Control vs Strength]<br>\[Requires Marksman to use on moving targets.]<br>\[Bind strength loses 5 points per turn,]"
				dran = 200

		Crank
			ran = "C"
			cd = 1
			ShadowImitate
				name = "Shadow Imitation Technique"
				description = "The user extends their shadow on any surface (even water) and as far as they want as long as there is a sufficient area. Once it comes into contact with a target's shadow, the two merge and the target is forced to imitate the user's movements. Therefore, the two can throw shuriken at each other at the same time if the user desires that (of course, to prevent hurting themselves, the user just has to have the shuriken holster in a place where you don't normally have it, like the back, so that the opponent draws nothing when the user draws a shuriken). If the target is out of range, the user can produce a better light source to increase their shadow's size or rely on pre-existing shadows for their shadow to freely travel through. It's also possible to split one's shadow, either to trap more opponents at once, or to create a distraction.<br><br>\[Speed of Shadow: Control]<br>\[Bind Strength: Control +5 vs Strength]<br>\[Total number of targets increases with technique mastery rank; 1 target at New, 2 targets at Experienced, 3 Targets at mastered]<br>\[May be linked directly into the use of the Shadow Neck Binding Technique.]<br>\[Bind strength loses 4 points per turn]"
				dran = 650
				hseal = 1


		Brank
			ran = "B"
			cd = 2
			ShadowStitching
				name = "Shadow Sewing Technique"
				description = "This is a ninjutsu from among the Nara clan's secret techniques that uses materialized shadows to attack and bind, instead of merely immobilizing and controlling like the Shadow Imitation Technique. The user changes the shape of their shadow into several sharp needles and controls each separately. They can then attack several targets simultaneously and at the same time snatch away their ability to move by sewing them stuck with the shadow threads. Because it is a physical attack, it is impossible to capture someone without harming them, but on the other hand, since the speed of invocation and the time of duration are excellent, it can be used when urgent restraint is required.<br><br>\[Creates 2 tendrils per rank of mastery]<br>\[Damage: Ninjutsu Offensive Power + 10 vs Nin Def x2]<br>\[Can be linked into the use of the Shadow Imitation Technique if a target is struck.]<br>\[For every Shadow Sewing needle that strikes a given target, the bind strength of a linked Shadow Imitation Technique used against them is increased by 1]"
				dran = 1600
				hseal = 2
			ShadowBind
				name = "Shadow Imitation Shadow Bind Technique"
				description = "The user attaches their shadow to a target without restricting the target's movements. When the target's shadow comes into contact with a third party's, the user's shadow attaches to theirs instead, allowing them to be bound with the Shadow Imitation Technique.<br><br>\[Speed: Control]<br>\[Range: Con/2]<br>\[Bind Strength: User’s Control + 10 vs Strength]<br>\[Bind strength loses 4 points per turn,]"
				dran = 1575
				hseal = 1
			ShadowNeckBind
				name = "Shadow-Neck Binding Technique"
				description = "It is possible to attack body parts like fingers and such by turning the shadow slender and to bind the opponent's body in order to restrain them. It was given its name because, above all else, strangulation is the most efficient method. The smaller the distance to the target, the greater the power of the shadow. This technique cannot be used for an extended period of time, as it weakens with each passing minute.<br><br>\[Speed: Control]<br>\[Damage: Ninjutsu Offensive Power + 15 vs Dura x2]<br>\[Target may expend twice the chakra cost of the jutsu to prevent it from strangling]<br>\[Must be used in conjunction with the Shadow Imitation Technique.]"
				dran = 1750
				hseal = 3
			BlackSpiderLily
				name = "Black Spider Lily"
				description = "After trapping the target with the Shadow Sewing Technique, the user can then manipulate the shadow to bring them closer to themselves. This technique can be used to draw multiple enemies in.<br><br>\[Strength: User's Control vs Strength+5]<br>\[Only effective against targets previously hit by Shadow Sewing.]"
				dran = 1000
				hseal = 1


		Arank
			ShadowClutch
				name = "Shadow Clutch"
				description = "The user materializes their shadow and increases its power, becoming like steel. The user then captures the target's shadow and forcibly moves them about. The techniques strength is proportional to the chakra put into it, with enough strength even giants can be moved. When used together with the Akimichi's Human Bullet Tank, it turns it into a weapon. This simple application makes it useful in a number of emergency situations. Unlike with the Shadow Imitation Technique, though the two shadows are connected, the target is not forced to copy the user's movements, allowing them to retain their own range of motion.<br><br>\[Speed of Shadow: Control+5]<br>\[Bind Strength: Control +15 vs Strength]<br>\[Total number of targets increases with technique mastery rank; 1 target at New, 2 targets at Experienced, 3 Targets at mastered]<br>\[Can be used to manipulate targets and/or objects up to a size of 11x11.]<br>\[Bind strength loses 4 points per turn]"
				dran = 2200
				hseal = 1
			ShadowGathering
				name = "Shadow Gathering Technique"
				description = "This is a ninjutsu using materialized shadows, but compared to the Shadow Sewing Technique from the same line, this technique places emphasis on the minute control of the shadow's movements. It is accurate enough to even make the tentacles go through tiny holes. Basically, this technique takes the user's own shadow and transforms and stretches it into countless thin tentacles, which are then used to grab objects and pull them in. Also, one can skilfully make use of the tentacle-shaped shadow tendrils by using them to lift up and throw weapons like kunai and such. This technique has many possible applications and uses. There are no hand seals used for this technique, but the hand movements resemble that of Sand Manipulators.<br><br>\[Speed of Shadow: Control]<br>\[Bind/Manipulation Strength: Control +15 vs Strength]<br>\[Total number of targets increases with technique mastery rank; 3 targets at New, 6 targets at Experienced, 9 Targets at mastered(Doubled for Objects of medium size or lower)]<br>\[May be linked directly into the use of either the Shadow Imitation Technique, Shadow Neck Binding Technique, Shadow Imitation Shadow Bind Technique, Black Spider Lily, or Shadow Sewing Technique.]<br>\[Bind strength loses 4 points per turn]"
				dran = 2150
				hseal = 1
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Yuki
		icon = 'Yuki1.dmi'
		icon_state = "Mirror"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
			Ice_Senbon
				name = "Ice Release: Ice Senbon"
				description = "A simple technique that utilizes Ice Release to create several senbon out of ice before firing them at the target.<br><br>\[Number of senbon made: Control/5 capped at 5]<br>\[Speed: User's Control]<br>\[Damage: Ninjutsu power vs Nindef x 2]"
				dran = 500
		Crank
			cd = 1
			ran = "C"
			Crystal_Wall
				name = "Ice Release: Crystal Wall"
				description = "The user creates walls out of ice crystals to detain their opponents. The reflective surfaces of ice can serve as mirrors for certain genjutsu that requires mirrors to work.<br><br>\[Durability: Ninjutsu Defensive Power]<br>\[Creates a wall up to 8 tiles long or wide. This may be in a straight line or any shape, so long as each tile of 'wall' is adjacent to another wall tile.]"
				dran = 800
				hseal = 2
			Frozen_Capturing_Field
				name = "Ice Release: Frozen Capturing Field"
				description = "Upon making a one-handed hand seal, the user freezes the ground underneath a target to immobilize and freeze their feet, rendering them motionless for a period of time. This can also be used to freeze large areas in order to hinder movement.<br><br>\[5x5 AoE around target]<br>\[Breaking Out: Strength vs User's Control]<br>\[Binds for one turn]"
				dran = 800
				hseal = 1
			Ice_Sword_Technique
				name = "Ice Release: Ice Sword Technique"
				description = "The user condenses the moisture in the atmosphere into swords of ice that can then be used for close-range combat or shot at a target. The swords can be formed from great distances away.<br><br>\[Sword Durability: Ninjutsu Defensive Power/2]<br>\[Speed if shot: Control]<br>\[Damage: Ninjutsu Offensive Power VS Nin Def + Dura]"
				dran = 700
			Certain_Kill_Ice_Spears
				name = "Ice Release: Certain-Kill Ice Spears"
				description = "A technique in which several large ice spikes emerge from below to impale anyone in its vicinity. The rate at which this occurs is so sudden, that it's considered to be a certain kill. When used inside an enclosed area like a cottage, it leaves very little room for escape.<br><br>\[Creates up to three spikes in a 5x5 area around the user, at three different tiles.]<br>\[-3 Reflex when dodging without some form of chakra sensing]<br>\[Damage: Ninjutsu Offensive Power vs Dura x2]"
				dran = 700
			Swallow_Snow_Storm
				name = "Ice Release: Swallow Snow Storm"
				description = "This technique creates a cluster of ice needles in the shape of miniature swallows out of preexisting ice, which the user then launches at the opponent. These needles can change direction in midair and will maim the opponent with their sharp wings. This technique can be countered by Fire Release techniques, which in turn melts the ice.<br><br>\[-3 Reflex against this technique for each tier of Marksman the user has.]<br>\[Damage: Ninjutsu Offensive Power + 5]"
				dran = 800
		Brank
			cd = 2
			ran = "B"
			Ice_Prison_Technique
				name = "Ice Release: Ice Prison Technique"
				description = "This technique allows the user to infuse their chakra with ice on the ground and bring it to the surface. The user can then trap their opponent within the ice by controlling its movements and completely surrounding them in the ice. It is strong enough to withstand basic Fire Release techniques, because the ice has already been infused with the user's chakra. The user can also surround themselves with the ice prison to act as a shield.<br><br>\[Durability: Ninjutsu Defensive Power + 10]<br>\[Formation Speed:User’s Control]"
				dran = 1000
			Ice_Breaking_Sledgehammer
				name = "Ice Release: Ice-Breaking Sledgehammer"
				description = "The user surrounds their fists with ice, increasing their striking power or, alternatively, allowing them to use their fists to block stronger attacks than they would be able to otherwise.<br><br>\[Adds Ninjutsu power/2 to taijutsu Damage]<br>\[Adds Ninjutsu Defensive/2 to hand Durability]<br>\[Lasts three rounds.]"
				dran = 1700
			Ten_Thousand_Petals
				name = "Ice Release: Ten Thousand Ice Petals"
				description = "The user unleashes a barrage of ice darts. The intensity of the cold is so great, that should a person attempt to block them, it will cause severe damage to the afflicted limb. The user can also use this defensively by creating a wall of ice to create distance between the user and their combatant.<br><br>\[Speed: User’s Control+10]<br>\[Amount of Darts: Control/5 capped at 10]<br>\[Damage: Ninjutsu offensive power + 5 vs NinDefense x 2]"
				dran = 1800
				hseal = 1
			Consecutive_Ice_Chains
				name = "Ice Release: Consecutive Ice Chains"
				description = "The user, either through physical contact or remotely, causes ice particles to form on a target. If used on a living creature, the target will begin to freeze and become immobilized, potentially leading to death due to the low temperature, unless they are able to mold chakra. By coating themselves with chakra and dedicating all their energy to keeping themselves warm, they can avoid death; if they use their chakra to perform a technique, they will start to rapidly freeze again.<br><br>\[Damage: Ninjutsu Offensive Power +10 vs Ninjutsu Defense x2]<br>\[Control vs Strength to immobilize a target.]<br>\[Can be sustained for two turns.]<br>\[User’s control is considered -5 for each turn sustained until the end of this technique.]"
				dran = 1700
			Ice_Rock_Dome
				name = "Ice Release: Ice Rock Dome"
				description = "The user quickly freezes the surrounding air and creates an ice dome around themselves and/or allies to act as a defense. It is strong enough to withstand the assault of many explosive tags at once, remaining almost undamaged.<br><br>\[Formation Speed = User’s Control]<br>\[Durability = Ninjutsu Defensive Power + 10]<br>\[Max Dome Size: 5x5]"
				dran = 1500
		Arank
			ran = "A"
			cd = 3
			Demonic_Mirroring_Ice_Crystals
				name = "Ice Release: Demonic Mirroring Ice Crystals"
				description = "An abominable and tremendous Ice Release technique, which is passed down only within the Yuki clan. In an instant, the user can form floating mirrors out of ice, which they can enter and launch out of at exceedingly high speed levels. If the mirror the user is in is broken, they can leap out of one of the fragments and continue his attack or move to another mirror. The technique requires a large amount of chakra to maintain, so the user's movement becomes progressively slower the longer they maintain the mirrors.<br><br>\[Creates 21 mirrors in a 7x7 dome around the target]<br>\[User may freely move between mirrors at control speed]<br>\[Capable of using Ice Release techniques from any of the mirrors.]<br>\[Durability = Ninjutsu Defensive Power + 10]\[Must be used each turn it remains active.]"
				dran = 2800
			One_Horned_White_Whale
				name = "Ice Release: One-Horned White Whale"
				description = "This technique allows the user to create a humongous whale with a long narwhal horn out of preexisting ice to attack their opponent. The user needs a source of ice in order to use this technique. The large bulk of this technique is capable of creating great destruction upon landing. However, due to it's size and lack of speed, this technique is used more as a distraction, or to block an opponent's movements rather than attack.<br><br>\[Attack Speed: Control]<br>\[Damage: Ninjutsu Offensive Power +10]<br>\[Durability: Ninjutsu Defensive Power + 15]"
				dran = 2500
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Hoshigaki
		icon = 'Perks.dmi'
		icon_state="Perk"
		Drank
			ran = "D"
		Crank
			ran = "C"
			FrenziedChomp
				name = "Frenzied Chomp"
				description = "The user lingess forth in a state of frenzy with their jaws snapped open and teeth sharpened and elongated. Should they make contact with their target, the Hoshigaki bites into their victim, tearing away any piece of flesh they latch onto.<br>(Speed=Strength-5)<br>(Damage=Taijutsu Offensive Power)<br>(Damage Cap=Medium)<br>(The user can only move linearly during this maneuver)"
				dran = 300
				skil = "New"
				idran = "Stamina"
				jut = "Taijutsu"
				ele = "Elementless"
		Brank
			ran = "B"
			WaterReleaseWaterSharkBulletTechnique
				name = "Water Release: Water Shark Bullet Technique"
				description = "The user manipulates a volume of water with their hand; by thrusting their hand in a direction, the manipulated water is sent in that direction. As it moves, the body of water takes the shape of a shark, with additional water following in its wake for as long as the user keeps their hand thrust out. Because of how quickly the shark moves and because of how much water there is, it does extensive damage when it impacts something. Users can also ride within the water shark as it moves, allowing them to travel faster than they're able to swim<br>(Speed=Control+10)<br>(Damage=Ninjutsu Offensive Power)<br>(Damage Cap=Major)<br>(User can ride the shark, using the techniques speed as movement speed)"
				dran = 1800
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ele = "Water"
			WaterReleaseFiveFeedingSharks
				name = "Water Release Five Feeding Sharks"
				description = "The user puts their hand on the surface of a body of water and from the tips of five fingers, chakra is released into the water, changing it into the form of five ferocious sharks. The sharks circle the target with high speed, creating a raging stream that takes away their prey's freedom of movement and their sharp teeth tear into the enemy with each consecutive attack. In the anime, these sharks can regenerate from surrounding water, making them difficult to destroy.<br>(Requires existing water source)<br>(Damage=Nin+Con)<br>(Speed=Con+15)<br>(Damage Cap=Major)"
				dran = 1900
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ele = "Water"
		Arank
			ran = "A"
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Chinoike
		icon = 'Perks.dmi'
		icon_state= "Perk"
		Drank
			ran = "D"
		Crank
			cd = 1
			ran = "C"
			Bladesofblood
				name = "Blades of blood"
				description = "The user first scrapes their arms, causing blood to run down the length of their forearms. With a swipe of either arm, they are able to manipulate and launch projectiles composed of bloods at their opponents. These blood projectiles are fast, and sharp-making them deadly weapons in long or short ranged combat. <br>(Speed=Control+5)<br>\[Damage=Ninjutsu Offensive Power vs Nin Defx2]<br>\[Maximum reach=Ninjutsu/2]<br>\[Creates up to four weapons of blood at New and up to eight at Mastered.]\[Damage cap=Medium]"
				dran = 600
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ele = "Elementless"
			BloodShield
				name = "Blood Shield"
				description = "The user produces a shield composed of their own blood to protect them or allies from an oncoming attack. The solidified, chakra enhanced blood acts as an impressive barrier against a plethora of techniques and can be regenerated should its supply of blood be renewed.<br>(5x5 around the user)<br>(Durability=Control+5)<br>(Can be regenerated every 3 rounds it is sustained by using the technique at half its original cost)"
				dran = 500
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ele = "Elementless"

		Brank
			ran = "B"
		Arank
			ran = "A"
			cd = 3
			BloodDragonAscension
				name = "Blood Dragon Ascension"
				description = "Blood Dragon Ascension is a technique that involves the ability of manipulating blood, exclusive of the members of the Chinoike Clan. Through this ability, the user forms a dragon of blood with eight heads similar to the Yamata no Orochi, which all have the ability to regenerate. In addition to the regeneration, the heads of the dragon also have the capacity to release steam after biting a target.<br>(Each had moves at Control+15 speed)<br>(Damage calculates per head)<br>(Damage=Ninjutsu Offensive Power+5 vs Nin defx2)<br>(If a head is destroyed, user can regenerate it by applying a full use of the technique once again)"
				dran = 1800
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ele = "Elementless"

		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Uchiha
		icon = 'Perks.dmi'
		icon_state= "Perk"
		Drank
			ran = "D"
		Crank
			ran = "C"
			cd = 1
			ManipulatingWindmillTripleBlades
				name = "Manipulating Windmill Triple Blades"
				description = "The user attaches one end of a wire string to a shuriken and the other end to a kunai. The user throws the shuriken at a target, expecting that the target will dodge it. The user then loops the kunai around a tree (or something similar) and throws the kunai, which the target will also dodge. When the kunai reaches the end of the string's length, it pulls the shuriken back towards the target, striking them from behind; Rin no Sho compares the action to a yo-yo. Because the maneuver's effectiveness relies on anticipating the target's movements, having the Sharingan is invaluable to its success<br>(Two turn setup; the first round the opponents reflex is lowered by -5, should they fail to interrupt the technique by the second round the thrown weaponry gains +5 to speed)<br>(Hearing T2 nullifies the reflex nerf)"
				dran = 550
				skil = "New"
				idran = "Stamina"
				jut = "Shurikenjutsu"
				ele = "Elementless"
			SharinganT1
				icon_state = "Sharingan1"
				GChak = -50
				Gnin = 2.0
				Ggen = 2.0
				Gcon = 1
				name = "Sharingan"
				description = "This person have achieved the first stage of Sharingan, tomoe 1. The user can see chakra, giving it color in order to distinguish it by its composition and source Though not as capable in this regard as the Byakugan, it can see chakra through some (but not all) obstructions and detect irregularities in a person's chakra flow, such as those caused by genjutsu influence. " //more to add later.
				jut = "Doujutsu"
			Fire_Style_Uchiha_Style_Fireball_Jutsu// - C-Rank 450 <br>
				name = "Fire Style: Fireball Jutsu"
				description = "A technique where chakra kneaded inside the body is converted into fire and expelled from the mouth either as a massive orb of roaring flame or as a continuous flame-thrower. The scope of the attack is altered by controlling the volume of chakra that is mustered. The released flames will engulf their target, and leave a crater on the ground's surface. This technique apparently requires more than average chakra reserves and most genin should not be able to do this technique.<br><br>\[5x5 orb of flame]<br>\[At the cost of 200 more chakra the user can opt to use flamethrower style instead.]\<br>\[Flamethrower:3x9 in front of the user]<br>\[Damage:Ninjutsu Offensive Power+10 vs Nin def x2]<br>\[Damage Cap=Medium]"
				dran = 750
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
		Brank
			ran = "B"
			cd = 2
			GenjutsuSharingan
				name = "Genjutsu Sharingan"
				description = "By establishing eye contact with a target, the Sharingan user traps them within a genjutsu which can be exploited for one of various purposes, such as: causing instantaneous — but temporary — loss of consciousness or paralysis in the target, forceful extraction of information, relaying memories, removing genjutsu placed on the target by others, and controlling a target's actions.<br><br>\[The user can choose one of various effects to apply to a target upon successfully landing this technique.]<br>\[Only one effect from this technique’s use can affect a target in a single round, and only on one target may be targeted in a round unless the user possesses perks that allow them to do otherwise.]<br>\[Paralysis: Renders the target immobile for one turn unless they can break free Genjutsu+Intel+10 vs Con+Int)<br>(Suggestion: The user tricks the opponent into falsely performing a single action during their turn; the severity of which is determined by the user of this technique; it additionally lowers the target’s reflex by 10]<br>\[Interrogate: Allows the Uchiha to forcefully draw information, a character MUST divulge the information.]<br>\[Targets in possession of a will perk, gain a +10 to their defensive calculation against the Interrogate and Suggestion abilities of this technique.]<br>\[As the target must see the user’s eyes, proactive use of Indirect fighter or Blind Fighter can nullify this jutsu’s targeting completely.]"
				dran = 1800
				skil = "New"
				idran = "Chakra"
				jut = "Genjutsu"
				ele = "Elementless"
		Arank
			ran = "A"
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Explosion
		icon = 'Perks.dmi'
		icon_state= "Perk"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Explosion"
		Drank
			ran = "D"
			Explosion_Release_Exploding_Palm
				name= "Explosion Release: Exploding Palm"
				description = "The user creates a small explosion in their palm. If properly timed and angled, it can be used to send thrown kunai back at the enemy.<br>\[To reflect small weaponry, users Control must at-least equal the thrown projectiles speed, the then reflected weapon would move at users Control as speed.]<br>(Damage:Ninjutsu Offensive Power +7)<br>(Knockback=Ninjutsu/4)"
				dran = 200
		Crank
			ran = "C"
			Explosion_Style_Grenade
				name= "Explosion Style: Grenade"
				description = "The user gathers explosive natured chakra in the form of an orb blistering white light within the palm of their hand. Once the chakra Is gathered, the user tosses the orb of explosion chakra at their enemy where it subsequently violently explodes. The technique is versatile, as the user can set up a trigger for its detonation whether it be a command or a handseal.<br>(Projectile Speed=Control)<br>(9x9 aoe)<br>(Damage=Ninjutsu Offensive Power+10)"
				dran = 400
		Brank
			ran = "B"
			Explosion_Style_Explosive_Wave
				name= "Explosion Style: Explosive Wave"
				description = "A truly frightening technique wherein the user takes time to generate a vast amount of explosive-style chakra within their bodies, building it until the point where it yearns for escape. Once the volume of explosion-nature chakra reaches a point where it can be contained no longer, the user releases it all at once, resulting in a massive explosion that radiates outward from their being. The resulting damage, wide-scale and devastating. This move has been frowned upon and not recommended for team battles.<br>\[Eruption moves at the user’s Control]<br>\[Damage=Ninjutsu Offensive Power+15]<br>\[15x15 aoe]"
				dran = 900
		Arank
			ran = "A"
			Explosion_Style_Landmine_Fist
				name= "Explosion Style Landmine Fist"
				description = "After establishing direct contact with their opponent through a simple punch, the user utilizes Explosion Release to subsequently generate an enormous explosion from the opponent's insides. This explosion is powerful enough to completely obliterate an opponent far larger than the user.Due to the directionality of the blast, the user minimizes any potential repercussions, such as being struck by resultant debris and even recoil appears to be completely negated.<br>\[Activated on-contact with target.]<br>\[Damage=Ninjutsu Offensive Power+30]<br>\[Anyone caught behind or beside the explosion within a three tile radius of the victim will take 3/4ths the damage-anyone caught within 6 tiles behind or beside the explosion will be met with half the damage.]"
				dran = 1200
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Lava
		icon = 'Perks.dmi'
		icon_state= "Perk"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Lava"
		Drank
			ran = "D"
		Crank
			ran = "C"
			Lava_Style_Lava_Globs
				name="Lava Style Lava Globs"
				description = "The user launches balls of incredibly hot, dense, lava from their mouth at their opponent. These balls of lava strike with tremendous force-and in addition melt whatever they touch.<br>\[Number of lava balls produced: Nin/4 Capped at 10]<br>(Speed=Con-5)<br>(Damage=Nin+Con+10)"
				dran = 350
		Brank
			ran = "B"
			Lava_Style_Quicklime
				name="Lava Style Quicklime"
				description = "This technique makes use of the Lava Release kekkei genkai where the user expels a large quantity of quicklime from their mouth, capable of inflicting damage to an opponent. This ability can also be manipulated in order to restrict the intended target's movements, as after the initial blast the remnants of the substance can act in a similar manner to quick-drying cement. However, the technique requires the addition of water to set off the necessary reaction to make the substance harden. This can be easily achieved through the use of a Water Release technique, which can also serve to increase the area covered by the substance, thus further increasing the potential range of the technique.<br>(Speed=Con+5)<br>(Damage=Nin+Con+10)<br>(5x5 aoe)<br>(Maximum tile reach from user=Nin/4)<br>(If opponent is struck with quicklime, and then struck with a water release technique they are then bound; Strengthx2 vs Users Conx2+10)"
				dran = 750
			Lava_Style_Planet_Branding_Blast
				name="Lava Style Planet Branding Blast"
				description = "Using Lava Release, the user can either expel lava from their mouth as a projectile, or create the substance from beneath the ground to erupt as a massive explosion. <br>\[Projectile: Speed=Con-5 Damage=Nin+Con+20]<br>\[Explosion: Speed=Con+5 Damage=Nin+Con+10]<br>\[19x19 aoe]<br>\[Maximum activation distance from user=Nin/4]"
				dran = 800
		Arank
			ran = "A"
		Srank
			ran = "S"

	Steam
		icon = 'Perks.dmi'
		icon_state= "Perk"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Steam"
		Drank
			ran = "D"
		Crank
			ran = "C"
			SteamDash
				name ="Steam Dash"
				description = "After increasing their chakra temperature to its boiling point, the user releases boiling steam from their body, after which, they dash straight at the opponent in a straight line, taking the similar approach to a locomotive and creating sounds, which are similar to the ones made by a steam whistle.<br>(Movement speed becomes Con+5  capped at User’s speed+5 in tiles.)<br>(Can only move linearly.)"
				dran = 350
			EruptingFist
				name = "Erupting Propulsion Fist"
				description = "After increasing their chakra temperature to the boiling point, the user releases boiling steams from his body and delivers a steam-enhanced punch that sends their opponent flying away.<br>\[Speed= Users Con/2+Attack Speed/2]<br>\[Damage=Ninjutsu+Tai+5 vs Nin Def + Durability]<br>\[Knockback distance=Nin/4]"
				dran = 350
		Brank
			ran = "B"
		Arank
			ran = "A"
			SkilledMistTechnique
				name="Boil Release: Skilled Mist Technique"
				description = "The user creates a cloud of mist which they release from their mouth. This mist is highly acidic in nature, capable of melting bodies, and even chakra-based defenses and barriers, nullifying them.The technique has an inherent disadvantage in that its effects are indiscriminate, limiting its usage to areas that do not contain allies. In the event that the mist escapes the containment area, the user can adjust the pH level of the mist to safer levels.<br>\[Covers a 23x23 area)<br>\[All caught within the mist besides caster take 100 health points per round as their skin literally begins to slowly melt away)<br>\[Damage against barriers=Nin+Con+15 vs Durability-5 per round]"
				dran = 1000
		Srank
			ran = "S"



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Fuuton
		icon = 'SkillCard.dmi'
		icon_state="Fuuton"
		Drank
			cd = 0
			Wind_Style_Divine_Wind// - D-Rank 350 <br>
				name="Divine Wind"
				description = "The user releases a gust of wind that forms several small tornadoes. Combined with Fire Release: Running Fire that forms a circle on ground level, this creates a massive flaming hurricane.<br><br>(max tornadoes produced:Con/4)<br>(Damage:Con+nin vs nin def x 2)<br>(Speed:Con)<br>(Damage Cap:Minor)"
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "D"
				ele = "Wind"
		Crank
			cd = 1
			Wind_Style_Great_Breakthrough// - C-Rank 475 <br>
				name="Wind Style: Great Breakthrough"
				description = "This is a relatively simple technique that creates a sudden gust of wind, but its scale varies greatly depending on the user. If used by a superior shinobi, it has enough destructive power to knock down a large tree. The wind from the squall can blow away all things in the user's line of sight. A variation of the technique involves a smaller blast of wind which gets ignited with flame.<br>\[Damage: Ninjutsu Offensive Power]<br>\[5x5 in front of user]<br>\[Speed:Con+5]<br>\[When combined with the use of a fire release technique, the range becomes 3x3 while the damage becomes increased by 5]"
				dran = 450
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Wind_Scythe_Jutsu// - C-Rank(Giant Folding Fan Required) 450 <br>
				name="Sickle Weasel Technique"
				description = "This bold move is Temari's speciality. By freely manipulating the gale brought forth by her Giant Folding Fan, the many air currents collide and create vacuum pockets. The person enveloped by this gale is assaulted by countless invisible blades, carving up their body. Also, the strong wind power will blow away all incoming projectile weapons and will even make the opponent unable to stay on their feet.<br><br>\[Creates a 3x3 cyclone of slicing winds around opponent]<br>\[Speed: Con]<br>\[Lifts struck targets into the air if they lack solid feet.]<br>\[Damage: Ninjutsu Offensive Power+5]<br>\[Considered a B rank for the sake of clashing weapon-based attacks.]<br>\[Damage cap:Medium]"
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Wind_Style_Air_Bullet// - C-Rank 400 <br>
				name="Wind Style: Air Bullet"
				description = "This technique shoots multiple bullets of air at the victim with intense speed. The bullets also have great power, enough to subdue a whole group of shinobi.<br><br>(Maximum bullets fired:8)<br>(Speed:Con+5)<br>(Damage:Ninjutsu Offensive Power vs Nin def x 2)"
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Wind_Style_Gale_Palm// - C-Rank 400 <br>
				name = "Wind Style: Gale Palm"
				description = "A simple technique that when the users hands are clapped together, wind is compressed and transformed into a powerful gale. This technique, when used as an isolated attack has the power to easily knock over a human. Though the true value comes from using it together with projectile weapons like shuriken or kunai. Their speed, power, and ability to wound or even kill are all increased several times.<br>\[Speed: User’s Control]<br>\[Damage:Ninjutsu Offensive Power vs Nin def x 2]<br>\[When used in conjunction with a ranged weapon-based attack or technique, that technique gains +10 speed.]<br>(Damage cap: Medium)"
				dran = 300
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Chakra_Flow_Wind
				name = "Chakra Flow: Wind"
				description = "This technique allows the user to imbue their weapon with wind natured chakra.<br>(Damage: Strength+Taijutsu+Con/5)<br>(Ignores up to -3 durability)<br>(Damage cap: Medium)"
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
		Brank
			cd = 2
			Wind_Style_Jade_Hurricane// - B-Rank 650 <br>
				name="Wind Style: Jade Hurricane"
				description = "By using wind-based chakra, the user can infuse their bladed weapons with it from a distance and manipulate them. <br>\[Can control weapons with wind up to a max distance of con/2 tiles]<br>\[Weapon Speed: Control + 10]<br>\[Max number of weapons manipulated: 5]<br>\[Ninjutsu Offensive Power vs nin defx2]<br>\[Damage Cap:Major]"
				dran = 750
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
			Cyclone_Scythe_Jutsu// - B-Rank(Giant Folding Fan Required) 750 <br>
				name="Great Sickle Weasel Technique"
				description = "This technique is a more powerful version of the Sickle Weasel Technique: many air currents collide to create vacuum pockets that slashes the opponents, with enough power to slice down many trees in a forest. This technique can deflect both physical and sound wave attacks and attack at the same time, making it both an offensive and defensive technique.<br>(10x10 aoe)<br>\[Speed:Control]<br>\[Damage: Ninjutsu Offensive Power + 10]<br>\[Capable of reflecting weapons so long as the jutsu damage equals oncoming damage]"
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
			Wind_Style_Wind_Blade_Jutsu// - B-Rank 699 <br>
				name="Wind Style: Blade of Wind"
				description = "Using their chakra or a tool such as a war fan to manipulate or else create an external source of wind, the user can create a single, or several blades of wind which are capable of slicing through their target with ease..<br>(Maximum number of wind blades produced: 5)<br>(Speed:Con)<br>(Damage: Ninjutsu Offensive Power + 10)<br>(Damage cap:Major)"
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
			Wind_Release_Vacuum_Sphere
				name = "Wind Release: Vacuum Sphere"
				description = "The user takes a deep breath and then exhales several small blasts of wind chakra in such a manner that they are dispersed over an expansive range, enough to make it difficult to avoid them entirely without taking any damage. Due to the properties of this technique, the expelled blasts are capable of piercing into and potentially through an opponent's flesh when they collide, in a similar manner to how bullets function.<br>(Maximum number of projectiles produced: 7)<br>(Speed:Con + 10)<br>(Damage:Ninjutsu Offensive Power)<br>(Damage Cap:Major)"
				dran = 850
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
			Wind_Style_Vacuum_Wave
				name="Wind Style: Vacuum Wave"
				description = "The user takes a deep breath and spins while exhaling, compressing the released air into a solitary blade of wind that covers a substantial area around the user, due to their circular motion. The resulting sharpened blast is large enough to slice through multiple targets located a significant distance from the user, causing grievous injuries to those hit.<br><br>(Blades of wind surround the user 5 tiles in each direction)<br>(Damage: Ninjutsu Offensive Power)<br>(Speed: Con+5)<br>(Damage Cap:Major)"
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
		Arank
			cd = 3
			Wind_Sword_Jutsu// - A-Rank 1200 <br>
				name="Wind Style: Blade of Wind"
				description = "This technique is a pinpoint slashing strike, where the user emits chakra from their fingertips and materializes it into an near invisible weapon that assaults the enemy in a gust of wind. If the Sickle Weasel Technique can be regarded as a swarm of wind kunai, then this technique is akin to an unavoidable longsword which can leave the target's body mutilated. The wind blades can be created and thrown, like projectiles, in rapid succession.<br>(speed:Con)<br>(Damage:Nin+Con+15)<br>(Number of wind blades produced is equal to Con/2 capped at 10)<br>(Requires at least T2 sensing perk to detect.)<br>(Damage Cap: Lethal)"
				dran = 1100
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Wind"
			Wind_Style_Vacuum_Serial_Waves// - B-Rank 650 <br>
				name="Wind Style: Vacuum Serial Waves"
				description = "The user takes a deep breath and exhales several blades of wind at different angles, by rapidly moving their head in various directions. The power of this technique can be dramatically enhanced when utilized in conjunction with the effects of extreme suction, such as that generated by Baku, where the augmented attack proved effective enough to even slice through the Defenses of a complete Susanoo<br>(speed:Con)<br>(Damage:Nin+Con+15)<br>(Number of wind blades produced is equal to Con/2 capped at 20)<br>(The multihit calculation of this technique is increased by +6 against living targets and further increased by another +6 against defensive techniques and inanimate objects.)<br>(Damage Cap: Lethal)."
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Wind"
			Wind_Style_Shadow_Clone
				name = "Wind Style: Shadow Clone"
				description = "This technique allows the user to make a shadow clone infused with wind. Because it is a shadow clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural wind-state, at the same time pushing whatever it is touching. <br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 1000
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Wind"
		Srank

	Medic
		idran = "Chakra"
		skil = "New"
		jut = "Medical"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Shunshin"
		Drank
			ran = "D"
			BasicHealing
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Basic Healing Jutsu"
				dran = 450
				description = "The user focuses their chakra to their hands and uses it to heal their target. This technique sanitizes wounds, halts bleeding, and in the case of very minor injuries, fully heals them.<br>\[Heals 10 health per use on-contact.]<br>\[Can only heal minor injuries.]<br>\[Can only be applied once per round]"

		Crank
			cd = 1
			ran = "C"
			NoviceHealing
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Novice Healing Jutsu"
				dran = 800
				description = "The user places their palms upon a wound inflicted upon their target, healing it. This santizes wounds and stops bleeding. It is capable of completely healing minor to moderate wounds such as sword-inflicted stab wounds.<br>(Heals 25 health per use, can only heal up to medium injuries)"
			PreparedNeedleShot
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Prepared Needle Shot"
				dran = 500
				description = "Using a wrist-mounted device, the user can launch senbon at their opponent. The device is usually used to surprise the enemy, as it may be concealed under long sleeves. The needles can also be dipped in a deadly poison, increasing their lethality. The user can also spit these needles out of their mouth but not as many and not nearly as precise.<br>\[Damage uses the typical thrown weapon calculation with the user’s control instead of strength.]<br>\[Speed=con/2 without device, Speed= Con with device.]<br>\[Lowers a target’s reflex by -5 when they are reacting to this technique.]<br>\[Capped at minor damage.]"
		Brank
			cd = 2
			ran = "B"
			DeadSoulTechnique
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Dead Soul Technique"
				dran = 2050
				description = "The user performs surgery on a corpse to temporarily make its heart beat again. The user then uses their chakra to both control the body's movements and to hide all signs of the surgery, creating the appearance that the body is a live person.<br><br>\[Allows the practitioner to control a deceased individuals body at half their full capacity.]<br>\[One full turn is required to prepare a corpse mid-combat.<br>\[User can control the deceased individual so long as they are visible on their screen]<br>\[The technique drains every turn at half its initial drain whenever the prepared corpse is active.]<br>\[The corpse uses half of the deceased character’s physical stats capped at the user’s control.]<br>\[Unless completely destroyed or de-limbed, the corpse is not considered incapacitated.]"
			ChakraScalpel
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Chakra Scalpel"
				dran = 200
				description = "This medical technique forms one's chakra into a small, sharp blade. This can then be used for highly accurate incisions necessary for surgeries and anatomical dissections. Unlike regular scalpels, the chakra scalpel can make cuts inside the body without actually creating an open wound, limiting the risks of an infection. The chakra scalpel can also be used offensively, although it requires great precision to be effective.<br>\<br>\[Causes 10 true damage]<br>\[Without anatomy, chakra scalpel can't be used effectively in combat, a 6 sided die must be rolled to determine if a successful attack is landed or not;odds or evens will determine a successful attack at the user’s discretion(Pick one).]"
			PoisonFog
				icon = 'Skillcard.dmi'
				icon_state = "Kawarmi"
				name = "Poison Fog"
				dran = 100
				description = "This technique combines ninjutsu, chemistry, and medical knowledge, thus requiring fine chakra control and advanced ability in medical ninjutsu. The user converts chakra in their body into a special chemical that they then exhale from their mouth. When the chemical comes into contact with the air, it becomes a cloud of poison. Breathing in even a small amount of the poison will cause immediate death<br><br>(Con flat for fog cast speed)<br>(Covers a 11x11 area)<br>(Those caught within the poison fog will immediately feel its effects; reflex -5 the following turn; additional reflex and speed -2 each turn spent inside the fog up to a maximum of 10; in addition, 5 true damage per turn spent in fog)<br>(Fog dissipates after 5 turns, effects apply the remainder of the battle if untreated.)"
			ExpertHealing
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Expert Healing"
				dran = 1700
				description = "A more advanced variant of the healing technique. The user places their palms upon a wound inflicted upon their target, healing it. This santizes wounds and stops bleeding. It is capable of completely healing moderate to major wounds such as deep sword-inflicted stab wounds.<br>(Can heal up to 40 health per use)<br>(Its capable of completely healing minor to moderate wounds and dampening the severity of major wounds)"
			DelicateIllnessExtraction
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Delicate Illness Extraction"
				dran = 2000
				description = "When a person has been afflicted by a pathogen or toxin, this medical ninjutsu can be used to draw out the agent and heal the damage. The cause of the illness is first determined by perceiving disturbances in the patient's chakra. Then, using a chakra scalpel, an incision is made near the affected part. Using their chakra, the medical-nin pushes a large volume of a medicinal fluid through the incision. The fluid then draws the poison out of the affected part(s) and serves as a medium through which the poison is suspended and then forced out of the person's body. This technique thus removes the poison, while simultaneously repairing the damage caused by the poison. The process itself is extremely painful and requires the subject to be restrained in order for the process to work. As such, it is considered a rather crude method to deal with pathogens and toxins, and only used in emergencies. This technique only draws out most of the poison, not all of it, so the subject can potentially still be in danger, albeit not immediate. To fully treat the subject, an antidote is needed.<br>(Cannot be used in combat)<br>\[Completely negates poisons of B-rank or lower; allows reduced rps needed for creation of antidote If the toxins are successfully removed.]<br>\[A-rank or higher toxins have their severity reduced by half.]"
		Arank
			ran = "A"
			cd = 3
			YinHealingWoundDestruction
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Yin Wound Healing Destruction"
				dran = 3000
				description = "The user gathers chakra to an area where they perceive they will take damage, preemptively starting medical treatment in order to minimize damage received. The more extensive the damage taken, the more chakra it will take to heal. This technique requires fine tuned reflexes, and the ability to discern an opponents next move. <br>\[Must possess reflex within 8 points of their attackers attack speed in order to utilize.]<br>\[Links into any known healing technique they’re capable of.(I.e.Novice healing technique, Delicate illness extraction etc.) without dual caster.]"
			MysticalPalmTechnique
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Mystical Palm Technique"
				dran = 2200
				description = "The user applies their hand to the afflicted or wounded part of the body and sends chakra into it, accelerating the body's natural healing abilities. Although its most obvious use is as a way of treating external wounds, it can also be used for internal illnesses. Users must be careful to only use as much chakra as is needed for the specific injury. If too much chakra is sent into the body, this can disrupt the body's circulation, putting it into a comatose state.<br>(Can heal up to 75 health per use.)<br>(This technique is capable of healing minor to major wounds-and even keeping people on the brink should lethal damage be treated on time.)<br>(If treating a lethal wound beyond the health range of a target’s health pool, the user most roll a D6 every turn spent healing-Evens the healing sustains the target, odds they succumb to injury)"
			Nervous_System_Rupture //(Medical Ninja Only)-A-Rank 1150 <br>
				name = "Nervous System Rupture"
				description = "An extremely high-level technique, used as a medical ninjutsu. The human body is controlled with electrical signals from the brain, but a person who had those electrical signals cut off with this technique will become unable to make their body move as they want. By transforming the chakra within one's body and giving it the properties of electricity, one creates an electric field. As soon as a strike of the hand lands, electricity is poured into the enemy's nervous system, severing the signals and deranging their body control. The target's body moves in any way, except how they want it to move. For the common shinobi, battle, not to mention even just walking, will become impossible.<br><br>\[Damage:Strength+Control/4<br>\[<br>(Completely rearranges the opponents nervous system, making them temporarily incapable of moving for 4 rounds)<br>\[If flexibility is possessed, movement is allowed after 2 rounds albeit sparse.(All stats reduced by 30%)]<br>\[Possession of studious 3 and flexibility allows total control after 3 rounds.]"
				dran = 3750
				skil = "New"

/*
	Prepared Needle Shot - C-Rank  450<br>
			Ninja Art: Poison Fog - B-Rank 650 <br>
			Chakra Scalpel - B-Rank 650 <br>
			Poison Extraction Jutsu - B-Rank 600 <br>
			Dead Soul Jutsu - B-Rank 799 <br>
			Healing Jutsu - A-Rank 1000 <br>
			Pre-Healing Jutsu - A-Rank<br>
			Regenerative Healing Jutsu - A-Rank 1300
			*/

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	Elementless
//		Drank
//			Shadow Clone Jutsu - A-Rank 1400 <br>
//			Clone Jutsu - E-Rank <i>Starter</i> <br>
//			Substitution Jutsu - E-Rank <i>Starter</i> <br>
//			Transformation Jutsu - E-Rank <i>Starter</i> <br>
//			Body Flicker-D-Rank 150 <br>
//			Manipulated Shuriken Technique - D-Rank 250 <br>
//			Shadow Shuriken Jutsu - D-Rank 300 <br>
//			Crystal Ball Jutsu - (Kage Exclusive) <i>Starter</i> <br>
//			Kagura: The Mind's Eye - C-rank(Sensory Only) 450 <br>
//			Shadow Clone Explosion - A-Rank(Shadow Clone Mastery Required) 1350 <br>
//			Rasengan - A-rank 1450 <br>

