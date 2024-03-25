/var/archive/archive = new

/mob/var/view_archived_jutsu = 0
/mob/var/view_archived_perks = 0


/archive
	name = "Jutsu Archive"
	parent_type = /mob

	var/list/remakes = list()
	var/check_jutsu = 0

	proc/SaveJutsu()
		var/savefile/S = new("Archived_Jutsu")
		S["Archived_Jutsu"] << src

/proc/LoadJutsu()
	if(fexists("Archived_Jutsu"))
		var/savefile/S = new("Archived_Jutsu")
		S["Archived_Jutsu"] >> archive
		world.log << "Loaded Technique Archives."

/proc/SaveLoop()
	spawn(36000)
		SaveObjects()
		.()

/world
	New()
		..()
		LoadJutsu()
//		SaveLoop()

/mob/proc/CheckJutsu()

/mob/proc/HasJutsu(name)
	for(var/obj/Custom/Blank_Jutsu/E in src)
		if(E.name == name)
			return 1
	return 0