//atom/var/Savable
mob/var/tmp/Savable=0

mob
	proc
		Save() // This is the proc that saves the player
			if(src.Savable==1 && src.loaded==1)
				if(src.loc == null)
					return
				if(src.loc == locate(220,293,20))
					return
				if(src.loc == locate(258,290,20))
					return
				if(src.loc == locate(258,290,20))
					return
				if(src.loc == locate(145,284,20))
					return
				if(src.loc==locate(1,1,1))
					return
				if(src.loc==locate(9,9,21))
					return
				var/savefile/F = new("Save/[src.ckey]")
				F["x"] << src.x
				F["y"] << src.y
				F["z"] << src.z
				Write(F)

		AutoSave()
			if(src.Savable==1 && src.loaded==1)
				Save()
				spawn(3000)
				AutoSave()
			else
				spawn(3000)
				AutoSave()

		Load()
			if(client)
				if(fexists("Save/[src.ckey]"))
					var/savefile/F = new("Save/[src.ckey]")
					Read(F)
					F["x"] >> src.x
					F["y"] >> src.y
					F["z"] >> src.z
					src.loc = locate(src.x,src.y,src.z)



				else
					alert("You do not have any characters on this server. Create one.")
					usr.Start()
					winshow(usr,"World",1)
					winset(usr,null,"World.is-default=true;Login.is-default=false")
					winshow(usr,"Login",0)


		Load2()
			if(client)
				if(fexists("Save2/[src.ckey]"))
					var/savefile/F=new("Save2/[src.ckey]")
					Read(F)
					F["x"]>>src.x
					F["y"]>>src.y
					F["z"]>>src.z
					src.loc = locate(src.x,src.y,src.z)
					src.SalaryPay()



				else
					alert("You do not have any characters on this server. Create one.")
					usr.Start()
					winshow(usr,"World",1)
					winset(usr,null,"World.is-default=true;Login.is-default=false")
					winshow(usr,"Login",0)

		Load3()
			if(client)
				if(fexists("Save3/[src.ckey]"))
					var/savefile/F=new("Save3/[src.ckey]")
					Read(F)
					F["x"]>>src.x
					F["y"]>>src.y
					F["z"]>>src.z
					src.loc = locate(src.x,src.y,src.z)
					src.SalaryPay()



				else
					alert("You do not have any characters on this server. Create one.")
					usr.Start()
					winshow(usr,"World",1)
					winset(usr,null,"World.is-default=true;Login.is-default=false")
					winshow(usr,"Login",0)



mob
	proc
		Save2()
			if(Savable && loaded)
				if(src.loc == null)
					return
				if(src.loc == locate(220,293,20))
					return
				if(src.loc == locate(258,290,20))
					return
				if(src.loc == locate(258,290,20))
					return
				if(src.loc == locate(145,284,20))
					return
				if(src.loc == locate(180,289,20))
					return
				var/savefile/F = new("Save2/[src.ckey]")
				F["x"] << src.x
				F["y"] << src.y
				F["z"] << src.z
				Write(F)


mob
	proc
		Save3()
			if(Savable && loaded)
				if(src.loc == null)
					return
				if(src.loc == locate(220,293,20))
					return
				if(src.loc == locate(258,290,20))
					return
				if(src.loc == locate(258,290,20))
					return
				if(src.loc == locate(145,284,20))
					return
				if(src.loc == locate(180,289,20))
					return
				var/savefile/F = new("Save3/[src.ckey]")
				F["x"] << src.x
				F["y"] << src.y
				F["z"] << src.z
				Write(F)



/*mob
	proc
		Save()
			if(Savable)
				var/savefile/F=new("Save/[key]")
				Write(F)

		AutoSave()
			Save()
			spawn(3000)
			AutoSave()

		Load()
			if(client)
				if(fexists("Save/[key]"))
					var/savefile/F=new("Save/[key]")
					Read(F)
					x=returnx
					y=returny
					z=returnz
				else
					alert("You do not have any characters on this server.")
					usr.Start()*/


/*mob
	proc
		Save() // This is the proc that saves the player
			if(src.Savable==1)
				var/savefile/F = new("Save/[src.ckey]") // This creates a new file called your key.sav in the file Save
				F["last_x"] << src.x// This stuff saves the players location
				F["last_y"] << src.y
				F["last_z"] << src.z
				Write(F) // This Writes the file

		AutoSave()
			Save()
			spawn(3000)
			AutoSave()

		Load()
			if(fexists("Save/[src.ckey]")) // This checks if they player has a savfile
				var/savefile/F = new("Save/[src.ckey]")
				Read(F) // This reads the file!
				F["last_x"] >> src.x
				F["last_y"] >> src.y
				F["last_z"] >> src.z
			else
				alert("You do not have any characters on this server.")
				usr.Start()*/
