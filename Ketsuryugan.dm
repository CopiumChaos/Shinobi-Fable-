mob/var/Ketsuryugan=0
obj/Doujutsu/Ketsuryugan
	icon='Skillcard.dmi'
	icon_state="Byakugan"
	var/skill=1
	Click()
		if(src in usr.contents)
			if(!usr.Chinoike)
				return
			if(!usr.Ketsuryugan&&usr.Chinoike)
				if(prob(25/skill/skill/skill))
					if(skill>10)
						return
					skill+=1
				usr.Byakugan=1
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes redden and bleed as they activate Ketsuryugan!<font color = white>*)"
				usr.overlays += 'Sharingan.dmi'
				usr.Taijutsu *= 1.18*(skill/2)
				usr.Agility *= 1.20*(skill/2)
				usr.drain5=1
				usr.drain5()



			else
				usr.Ketsuryugan=0
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal<font color = white>*)"
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.drain5=0
				if(!usr.Chinoike)
					usr.overlays -= 'Sharingan.dmi'