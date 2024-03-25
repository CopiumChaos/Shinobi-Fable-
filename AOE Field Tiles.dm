obj/AoeFlag
	icon = 'AOETILE.dmi'
	var
		descr = "Enter a brief summary of the jutsu"
		owntBy = null
	Click()
		usr<<"[descr]."
	DblClick()
		if(usr == src.owntBy)
			del src

mob/verb/Set_AOE_Field()
	var/B = input("What size AOE?") in list("3x3","5x5")
	if(B=="3x3")
		var/obj/AoeFlag/A = new
		A.loc = usr.loc
		A.descr = text
		A.owntBy = usr
		usr<<"Double Click to Remove."