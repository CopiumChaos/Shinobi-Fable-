mob/NPC
	Kumo_Guard
		icon='GuardDuty.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Why are you here?")in list("Visitor","Osama","Cancel"))
				if("Visitor")
					world<<"<font color=red><font size=2><center>Kumogakure has a visitor!"
					Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Kumogakure's NPC!</font>"
				if("Osama")
					usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
				else
					usr<<"Take your leave then.."
					return

	Konoha_Guard
		icon='GuardDuty.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Why are you here?")in list("Visitor","Osama","Cancel"))
				if("Visitor")
					world<<"<font color=red><font size=2><center>Konohagakure has a visitor!"
					Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Konohagakure's NPC!</font>"
				if("Osama")
					usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
				else
					usr<<"Take your leave then.."
					return
	Suna_Guard
		icon='GuardDuty.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Why are you here?")in list("Visitor","Osama","Cancel"))
				if("Visitor")
					world<<"<font color=red><font size=2><center>Sunagakure has a visitor!"
					Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Sunagakure's NPC!</font>"
				if("Osama")
					usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
				else
					usr<<"Take your leave then.."
					return
	Kiri_Guard
		icon='GuardDuty.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Why are you here?")in list("Visitor","Osama","Cancel"))
				if("Visitor")
					world<<"<font color=red><font size=2><center>Kirigakure has a visitor!"
					Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Kirigakure's NPC!</font>"
				if("Osama")
					usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
				else
					usr<<"Take your leave then.."
					return

	Shinko_Guard
		icon='GuardDuty.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Why are you here?")in list("Visitor","Osama","Cancel"))
				if("Visitor")
					world<<"<font color=red><font size=2><center>Shinkogakure has a visitor!"
					Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Shinkogakure's NPC!</font>"
				if("Osama")
					usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
				else
					usr<<"Take your leave then.."
					return