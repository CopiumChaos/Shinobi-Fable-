mob/var
	learning=0
	teaching=0

mob/verb
	Learning_Mode()
		set category="Combat"
		if(!usr.leeching)
			src << "You are now able to learn from those who can teach."
			usr.leeching=1
		else
			src << "You are no longer paying attention to teachers."
			usr.leeching=0

mob/var/exp = 0


mob/proc
	SkillUp()
		for(var/obj/Perk/A in usr.contents)
			if(A.name == "Prodigy")
				if(prob(50))
					usr.exp += 5
				else
					if(prob(60))
						usr.exp += 4.5
					else
						usr.exp += 4.0
			else
				if(A.name == "Mastery")
					if(prob(50))
						usr.exp += 5
					else
						if(prob(60))
							usr.exp += 4.5
						else
							usr.exp += 4.0
				else
					if(prob(30))
						usr.exp += 1
					else
						if(prob(50))
							usr.exp += 0.1
						else
							usr.exp += 0
			usr.exp+=5

		if(usr.exp > 50)
			var/obj/P = locate(/obj/Student) in usr.contents
			if(!P)
				usr.contents += new/obj/Student
		if(usr.exp > 200)
			var/obj/U = locate(/obj/Teacher) in usr.contents
			if(!U)
				usr.contents += new/obj/Teacher

obj/Custom/proc
	ErpUp()
		for(var/obj/Perk/A in usr.contents)
			if(A.name == "Mastery")
				src.RPPSpent += rand(10,15)
			if(findtext("[A.name]","[src.ele]"))
				if(A.tier==1)
					src.RPPSpent += rand(5,10)
				if(A.tier==2)
					src.RPPSpent += rand(10,15)
				if(A.tier==3)
					src.RPPSpent += rand(15,20)
				if(A.tier==4)
					src.RPPSpent += rand(20,25)
				if(A.tier==5)
					src.RPPSpent += rand(25,30)
				if(A.tier=="Master")
					src.RPPSpent += rand(30,35)
			src.RPPSpend()

mob/var/leeching = 0
mob/var/Training = 0

obj
	Teacher
		verb
			Teach_Jutsu()
				set category = "Jutsu Training"
				var/mob/M
				var/list/L = new/list
				for(var/obj/Custom/B in usr.contents)
					L.Add(B)
				var/obj/Custom/C = input("Which Jutsu would you like to teach?") in L
				var/list/N = new/list
				for(M in view(2))
					N.Add(M)
				var/mob/D = input("Who would you like to teach it to?") in N
				if(D.exp > 50 && D.leeching)
					if(C.skil == "Expert" || C.skil == "Veteran" || C.skil =="Mastered")
						if(C.ele ==D.PrimaryElement || C.ele ==D.SecondaryElement || C.ele ==D.TertiaryElement ||C.ele =="Elementless" || C.ele ==D.QuadranaryElement || C.ele ==D.QuinaryElement)
							var/obj/Custom/Blank_Jutsu/E = new(D)
							E.name= C.name
							E.description= C.description
							E.dran= C.dran + (C.dran*1.1)
							if(E.dran>=C.dran*2.5)
								E.dran = C.dran*2
							E.skil= "New"
							E.jut= C.jut
							E.ran= C.ran
							E.idran= C.idran
							E.ele= C.ele
							usr<<"You have taught [C] to [D]."
						else
							usr<<"They cannot learn a jutsu of that element."
					else
						usr<<"You are not skilled enough to teach this."
				else
					usr<<"They either don't have the experience to learn from watching you or they aren't currently paying attention."

/*			Create_Jutsu_Scroll()
				set category = "Admin"
				usr.contents += new/obj/items/Scrolls/Jutsu_Scroll*/

	Student
		verb
			Practice_Jutsu()
				set category = "Jutsu Training"
				if(usr.Training)
					usr<<"<font color=black>You cannot train right now.."
				else
					usr.Training = 1
					spawn(500)
					usr.Training = 0
					var/list/L = new/list
			//		var/list/O = new/list
					for(var/obj/Custom/B in usr.contents)
						if(B.skil != "Mastered")
							L.Add(B)
					L.Add("Cancel")

					var/obj/Custom/C = input("Which Jutsu would you like to train?") in L
					if(C == null)
						return
					if(C == "Cancel")
						usr.Training = 0
						return
					C.RPPSpent += rand(30,60)
					usr<<"<font color=black>You have successfully increased you skill with this jutsu by a small amount!"
					C.RPPSpend()
					usr.Training = 0
					if(usr.Trait == "Genius")
						C.RPPSpent += rand(70,100)
						usr<<"<font color=black>Your Genius Trait Kicked In!"
					if(usr.Trait == "Hardworker")
						C.RPPSpent += rand (60,80)
						usr<<"<font color=black>Your Hardworker Trait Kicked In!"
					if(usr.Senju==1)
						C.RPPSpent += rand (60,80)
						usr<<"<font color=black>Your exceptional lineage has kicked in!"
					for(var/obj/Perk/Q in usr.contents)
						if(findtext(Q.name,"Elemental Training [C.ele]"))
							if(prob(95))
								C.RPPSpent += 60
								C.RPPSpend()
								usr<<"Elemental Training [C.ele] kicked in!"
								usr.Training = 0
							else
								C.RPPSpent += 5
								C.RPPSpend()
								usr<<"<font color=black>You have successfully increased you skill with this jutsu by a small amount!"
								spawn(100)
								usr.Training = 0
						if(findtext(Q.name, "Innate Talent Taijutsu"))
							if(C.jut == "Taijutsu")
								if(prob(95))
									C.RPPSpent += 60
									usr<<"<font color=black>Innate Training Taijutsu has kicked in!"
									usr.Training = 0
								else
									C.RPPSpent +=5
									C.RPPSpend()
									usr<<"<font color=black>You have succesfully increased your skill with this jutsu by a small amount!"
									spawn(100)
									usr.Training = 0
						if(findtext(Q.name, "Medic"))
							if(C.jut == "Medical")
								if(prob(95))
									C.RPPSpent += 60
									usr<<"<font color=black>Medical Knowledge has kicked in!"
									usr.Training = 0
								else
									C.RPPSpent +=5
									C.RPPSpend()
									usr<<"<font color=black>You have succesfully increased your skill with this jutsu by a small amount!"
									spawn(100)
									usr.Training = 0
						if(findtext(Q.name,"Elemental Mastery [C.ele]"))
							if(prob(75))
								C.RPPSpent += 25
								C.RPPSpend()
								usr<<"Elemental Master [C.ele] kicked in!"
								usr.Training = 0
							else
								C.RPPSpent += 5
								C.RPPSpend()
								usr<<"<font color=black>You have successfully increased you skill with this jutsu by a small amount!"
								spawn(100)
								usr.Training = 0

						if(findtext(Q.name,"Studious 1"))
							if(prob(85))
								C.RPPSpent += rand(20,40)
								C.RPPSpend()
								usr<<"<font color=black>Studious 1 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 2"))
							if(prob(85))
								C.RPPSpent += rand(30,60)
								C.RPPSpend()
								usr<<"<font color=black>Studious 2 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 3"))
							if(prob(85))
								C.RPPSpent += rand(40,80)
								C.RPPSpend()
								usr<<"<font color=black>Studious 3 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 4"))
							if(prob(85))
								C.RPPSpent += rand(50,100)
								C.RPPSpend()
								usr<<"<font color=black>Studious 4 kicked in!"
								usr.Training = 0

						if(Q.name == "Mastery")
							C.RPPSpent += rand(20,80)
							C.RPPSpend()
							usr<<"<font color=black>Your Masterful Skill kicked in."
							usr.Training = 0

						if(Q.name == "Anomaly")
							C.RPPSpent += rand(80, 120)
							C.RPPSpend()
							usr<<"<font color=black>Your freakish aptitude has paid off"
							usr.Training = 0

						if(Q.name == "Prodigy")
							C.RPPSpent += rand(75,100)
							C.RPPSpend()
							usr<<"<font color=black>Your Prodigal skill kicked in."
							usr.Training = 0

						if(Q.name == "Hardworker")
							C.RPPSpent += rand(60,80)
							C.RPPSpend()
							usr<<"<font color=black>Your Hard Work Has Paid Off."
							usr.Training = 0





			Summon_Training()
				set category = "Jutsu Training"
				if(usr.Training)
					usr<<"You cannot train right now.."
				else
					usr.Training = 1
					spawn(500)
					usr.Training = 0
					var/list/L = new/list
			//		var/list/O = new/list
					for(var/obj/SkillCard/S in usr.contents)
						L.Add(S)

					var/obj/SkillCard/C = input("Which Jutsu would you like to train?") in L
					if(C == null)
						return
					C.Experience += rand(2,5)
					usr<<"You have successfully increased you skill with this jutsu by a small amount!"
					C.LevelUp()
					usr.Training = 0
					if(usr.Trait == "Genius")
						C.Experience += rand(5,10)
						usr<<"Your Genius Trait Kicked In!"
					if(usr.Trait == "Hardworker")
						C.Experience += rand (10,25)
						usr<<"Your Hardworker Trait Kicked In!"
					for(var/obj/Perk/Q in usr.contents)
			//			if(findtext(Q.name,"Elemental Training [C.ele]"))
			//				if(prob(95))
			//					C.Experience += 10
			//					C.LevelUp()
			//					usr<<"Elemental Training [C.ele] kicked in!"
			//					usr.Training = 0
			//				else
			//					C.Experience += 5
			//					C.LevelUp()
			//					usr<<"You have successfully increased you skill with this jutsu by a small amount!"
			//					spawn(100)
			//					usr.Training = 0
			//			if(findtext(Q.name,"Elemental Mastery [C.ele]"))
			//				if(prob(75))
			//					C.Experience += 25
			//					C.LevelUp()
			//					usr<<"Elemental Master [C.ele] kicked in!"
			//					usr.Training = 0
			//				else
			//					C.Experience += 5
			//					C.LevelUp()
			//					usr<<"You have successfully increased you skill with this jutsu by a small amount!"
			//					spawn(100)
			//					usr.Training = 0
			//
						if(findtext(Q.name,"Studious 1"))
							if(prob(85))
								C.Experience += rand(5,20)
								C.LevelUp()
								usr<<"Studious 1 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 2"))
							if(prob(85))
								C.Experience += rand(10,40)
								C.LevelUp()
								usr<<"Studious 2 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 3"))
							if(prob(85))
								C.Experience += rand(15,60)
								C.LevelUp()
								usr<<"Studious 3 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 4"))
							if(prob(85))
								C.Experience += rand(20,80)
								C.LevelUp()
								usr<<"Studious 4 kicked in!"
								usr.Training = 0

						if(Q.name == "Mastery")
							C.Experience += rand(20,80)
							C.LevelUp()
							usr<<"Your Masterful Skill kicked in."
							usr.Training = 0

						if(Q.name == "Prodigy")
							C.Experience += rand(20,80)
							C.LevelUp()
							usr<<"Your Prodigal skill kicked in."
							usr.Training = 0

						if(Q.name == "Hardworker")
							C.Experience += rand(20,80)
							C.LevelUp()
							usr<<"Your Hard Work Has Paid Off."
							usr.Training = 0






obj/SkillCard
	var/Experience = 0
	var/NeedExperience = 1000
	var/DevPoints = 0
	var/DevPointGain = 0

	var/ninjutsuDefense
	var/taijutsu
	var/strength
	var/endurance
	var/reflex
	var/genjutsu
	var/intelligence
	var/speed
	var/attackSpeed
	var/ninjutsu
	var/control


	proc/LevelUp()

		if(src.Experience >= src.NeedExperience)
			src.DevPoints += src.DevPointGain
			src.Experience = 0


	verb/UseSkills(obj/Custom/A in src)
		var/mob/M
		for(M in range(10))


			M<< output("<font color=[usr.SayFont]>[src] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [A.description]<hr><br>Chakra Drain: [A.dran] / Skill Rank: [A.skil] / Jutsu Rank: [A.ran] / Element: [A.ele]","World.OOC")

	verb/DisplayStats()
		var/T = input("Which stat will you show off?") in list ("Ninjutsu", "Control", "Strength", "Ninjutsu Defense", "Durability","Speed", "Taijutsu",  "Reflex","Genjutsu", "Intelligence", "All", "Cancel")
		for(var/M in view())
			if(T == "Ninjutsu")
				M << "[src]'s Ninjutsu: [src.ninjutsu]"
			else if(T == "Control")
				M << "[src]'s Control: [src.control]"

			else if(T == "Taijutsu")
				M << "[src]'s Taijutsu: [src.taijutsu]"

			else if(T == "Strength")
				M << "[src]'s Strength: [src.strength]"


			else if(T == "Ninjutsu Defense")
				M << "[src]'s Nin Def: [src.ninjutsuDefense]"

			else if(T == "Durability")
				M << "[src]'s Durability: [src.endurance]"

			else if(T == "Speed")
				M << "[src]'s Speed: [src.speed]"



			else if(T == "Reflex")
				M<< "[src]'s Reflex: [src.speed]"


			else if(T == "Genjutsu")
				M << "[src]'s Genjutsu: [src.genjutsu]"

			else if(T=="Intelligence")
				M << "[src]'s Intelligence: [src.intelligence]"
			else
				return


	verb/SeeDevPoints()
		usr << "[src] has: [src.DevPoints] Points"


mob/Admin3/verb
	Delete_False_Prophets()
		set category = "Admin"
		for(var/obj/Teacher/Q in world)
			del Q

	Delete_False_Worshippers()
		set category = "Admin"
		for(var/obj/Student/Q in world)
			del Q