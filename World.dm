client/script="<STYLE>BODY {background: #e3bc93; color:#323232; font-size: 2; font-weight: bold; font-family: 'Calibri'}</STYLE>"
world
	hub= "Chopius_Chaos.ShinobiFable"
	hub_password="Naruto12"
	view = "32x32"
	name = "Shinobi Fable"
	status = "Main Server - New Wipe"
	tick_lag=1
	cache_lifespan=0
//	loop_checks=0
	turf=/turf/Blah
	New()
		generate_perk_database()
		..()
		log=file("Runtimes.log")
//		DayCycle()
//		Years()
		SaveObjects()
		save_archive()
		Save_Admins()

	Del()
		..()



world/IsBanned(key,address)
	. = ..() //check the ban lists
	if(istype(., /list))
		if(key==""||key==""||key==""||key=="")
			.["Login"] = 1 //allow banned user to login



proc/Begin()
	Load_Admins()
	LoadRanks()
//	LoadChronicle()
	Load_Ban()
	LoadLogs()
	LoadVillageNotes()
	LoadJutsu()
//	TimePassage()
//	LoadRules()
//	LoadYear()

//	spawn() Add_Builds()
var/WritingRumors = 0

/*mob/Admin3/verb/Edit_Rumors()
	set category="Admin"
	if(!WritingRumors)
		WritingRumors=1
		for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Rumors..."
		Rumors=input(usr,"Edit","Edit Rumors",Rumors) as message
		for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Rumors..."
		WritingRumors=0
	else usr<<"<b>Someone is already editing the Rumors." */

mob/verb/View_Updates()
	set category="Commands"
	usr<<browse("[Updates]","window=Updates;size=400x500")

/*mob/verb/View_Rumors()
	set category="Commands"
	usr<<browse("[Rumors]","window=Rumors and Common Knowledge;size=400x200;can_resize=0;can_minimize=0")

var
	Rumors={"<html><body bgcolor = grey><center><font size = 3.5 color=black>
A single letter is sent to the Leader of each major faction, it states simply: 'She left behind a treasure, and the Desert Ocean holds its secret. Seek out the Deep Thinker to find out the truth.'<br><br>
For the past year, every three months; a bright light shines in the western sky on the Full Moon.<br><br>
There is an intense drought currently damaging an area just outside of Kirigakure no Sato.<br><br>


	 </font</html></body></center>"}*/
var
	Admin_Logs="<html><body><center>"
	Updates={"<html><head><title>Updates</title><body><body bgcolor="#000000">
<font color=red><font size=4>2019 Updates</font><br><br><font size=2>
<b><center><u><font color=silver><font size=3>Thus Far</font></font></u></center></b><br>
<li> Aint shit here to look at, keep limpin pimpin</font>
"}

proc/SaveLogs()
	var/savefile/S=new("SSO/AdminLogs")
	S["Admin Logs"]<<Admin_Logs
proc/LoadLogs() if(fexists("SSO/AdminLogs"))
	var/savefile/S=new("SSO/AdminLogs")
	S["Admin Logs"]>>Admin_Logs

proc/SaveBan()
	var/savefile/S=new("SSO/Ban")
	S["Bans"]<<Bans
proc/LoadBan() if(fexists("SSO/Ban"))
	var/savefile/S=new("SSO/Ban")
	S["Bans"]>>Bans







atom/var
	saved_x;saved_y;saved_z

proc/LoadObjects()

	if(fexists("Map.sav"))
		var/savefile/F = new ("Map.sav")
		var/list/M = new
		F["Doors"]>> M
		if(!M) return
		for(var/obj/Prison_Door/S in world) if(S.loc) del(S)
		for(var/obj/Prison_Door/Q in M)
			Q.loc = locate(Q.saved_x,Q.saved_y,Q.saved_z)

		var/list/L = new
		F["FailTurfs"] >> L
		if(!L) return
		for(var/obj/build/O in world) if(O.loc) del(O)
		for(var/obj/build/O in L)
			O.loc = locate(O.saved_x,O.saved_y,O.saved_z)

		var/list/WTF = new
		F["Stuff"] >> WTF
		if(!WTF) return
		//for(var/obj/Prison_Door/S in world) if(S.loc) del(S)
		for(var/obj/items/Z in WTF)
			Z.loc = locate(Z.saved_x,Z.saved_y,Z.saved_z)
		for(var/mob/T in WTF)
			T.loc = locate(T.saved_x,T.saved_y,T.saved_z)

proc
	SaveObjects()
		var/savefile/F = new ("Map.sav")
		var/list/L = new
		var/list/M = new
		var/list/WTF=new
		for(var/obj/Prison_Door/Z in world)
			Z.saved_x = Z.x
			Z.saved_y = Z.y
			Z.saved_z = Z.z
			M += Z
		F["Doors"] << M
		for(var/obj/build/O in world)
			O.saved_x = O.x
			O.saved_y = O.y
			O.saved_z = O.z//Ok how do I crack it open? open the folderit saves in.
			L += O
		F["FailTurfs"] << L
		for(var/mob/Guard/G in world)
			G.saved_x=G.x
			G.saved_y=G.y
			G.saved_z=G.z
			WTF+=G
		for(var/mob/Villager/V in world)
			V.saved_x=V.x
			V.saved_y=V.y
			V.saved_z=V.z
			WTF+=V
		for(var/obj/items/W in world)
			W.saved_x=W.x
			W.saved_y=W.y
			W.saved_z=W.z
			WTF+=W
		F["Stuff"]<<WTF




/*LagFilter
      var
            def = 75
            lagset = 0
            clag = 0
            tick_mem = 0
            sleep = 50

      New()
            tick_mem = world.tick_lag
            spawn()
                  Lag_Filter()

      proc/Lag_Filter()
            while(1)
                  if(lagset == 0)
                        if(world.cpu >= def)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < def)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  else
                        if(world.cpu >= clag)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < clag)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  sleep(sleep)



var/LagFilter/LagFilter = new()


mob/Admin/verb/Modify_Def(num as num)
      LagFilter.def = num*/