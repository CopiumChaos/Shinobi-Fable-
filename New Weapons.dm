obj/items/Weapon
	Gem_Weapon
		icon = 'Zanbatou.dmi'
		icon_state=""
		var/WeaponSet = 0
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			Set_Form()
				if(src.WeaponSet)
					usr<<"Your weapon form has already been chosen."
					return
				var/Form = input("What form do you want the weapon to take?") in list("Katana","Bow Sword","Chained Scythes","Cross Blade","Battle Gauntlets","Glaive","Spear","Tanto","Cleaver","Other","Cancel")
				if(Form=="Katana")
					src.icon = 'Katana.dmi'
					src.WeaponSet=1
				if(Form=="Bow Sword")
					src.icon = 'Bow Sword right.dmi'
					src.WeaponSet=1
				if(Form=="Chained Scythes")
					src.icon = 'Black Star Chained Scythe.dmi'
					src.WeaponSet=1
				if(Form=="Cross Blade")
					src.icon = 'Sword_Sheathed.dmi'
					src.WeaponSet=1
				if(Form=="Battle Gauntlets")
					src.icon = 'Demon Bro Arm.dmi'
					src.WeaponSet=1
					var/obj/items/Weapon/Gem_Weapon/B = new
					usr.contents+= B
					B.WeaponSet=1
					B.icon = 'Demon Bro Arm 2.dmi'
				if(Form=="Glaive")
					src.icon = 'Hand Blade.dmi'
					src.WeaponSet=1
				if(Form=="Spear")
					src.icon = 'Spear.dmi'
					src.WeaponSet=1
				if(Form=="Tanto")
					src.icon = 'Tanto.dmi'
					src.WeaponSet=1
				if(Form=="Cleaver")
					src.WeaponSet=1
				if(Form=="Other")
					usr<<"Alert an Admin."





obj/items/New_Weapon/Sword
	Custom_Katana
		icon='Katana.dmi'
		icon_state=""
		description=""
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon

				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon

		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=white>[usr] shows off <u>[src.name]</u><br>[src.description]"

		verb
			Color()
				switch(input("Add, Subtract, or Multiply color?", "", text) in list ("Add", "Subtract","Multiply","Cancel"))
					if("Add")
						var/rred=input("How much red?") as num
						var/ggreen=input("How much green?") as num
						var/bblue=input("How much blue?") as num
						src.icon=src.icon
						src.icon+=rgb(rred,ggreen,bblue)
					if("Subtract")
						var/rred=input("How much red?") as num
						var/ggreen=input("How much green?") as num
						var/bblue=input("How much blue?") as num
						src.icon=src.icon
						src.icon-=rgb(rred,ggreen,bblue)
					if("Multiply")
						var/colorz=input("Multiply") as color
						var/icon/I=new(src.icon)
						I.Blend((colorz),ICON_MULTIPLY)
						src.icon=I
					if("Cancel")
						return
			Name()
				switch(input("Will you name your weapon?") in list ("Yes","No"))
					if("Yes")
						var/B = input("Enter its new name") as text
						src.name = B
					if("No")
						return

obj/items/New_Weapon
	Windmill
		icon='Windmill.dmi'
		description="A large, four-bladed projectile weapon which can be folded up for easy storage. The shuriken can be used in melee combat by spinning the blade in one's hand to slash and stab the opponent directly or thrown as a projectile.<br>(Damage +5 as melee weapon)<br>(Projectile Speed=Str/2)<br>(Projectile Damage increased by 3)<br>(Durability=25)<br>(Hit Points=35)"

		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=white>[usr] shows off <u>[src.name]</u><br>[src.description]"


obj/items/New_Weapon
	Poison_Bomb
		icon='Poison.dmi'
		icon_state="Inv"
		description="This is a basic poison bomb that comes standard with my shinobi kits. The bomb is thrown to the ground or at a solid surface where it then explodes to cover an area. Those caught within the poison fogs range are subject to its ailing effects<br>(Covers a 10x10 area)<br>(Those caught within its range suffer an immediate -2 to reflex and speed)<br>(Remaining in the gas cloud continues to lower reflex and speed -2 each round to a maximum of -10)."

		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=white>[usr] shows off <u>[src.name]</u><br>[src.description]"


obj/items/New_Weapon
	Explosive_Tag
		icon='Explosive tag.dmi'
		icon_state=""
		description="This is a standard explosive tag. Infused with chakra, they will explode after a set amount of time, remotely, or after being ignited by flame.<br>(3x3 aoe)<br>(15 damage against Nindefx1)."

		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=white>[usr] shows off <u>[src.name]</u><br>[src.description]"
obj/items/New_Weapon/SSOM
	Executioners_Blade
		icon='Kubiriki.dmi'
		icon_state="Inv"
		description="Executioner's Blade: The Executioners blade(Kubikiribōchō) is a large broadsword, as tall as a full-grown man, shaped like a butcher knife. The blade itself has two cut outs, a circle close to the top and a semi-circular one nearer to the handle, the former of which is aptly fitting the sword's purpose of decapitation. Like the other weapons employed by the Seven Ninja Swordsmen of the Mist, the sword possesses a unique power, this being its ability to reform itself using the iron harvested from the blood of its victims. This regenerative process takes place almost instantaneously and is capable of bringing the weapon back to its original condition no matter how severe the damage is, from a simple chip or nick to a complete separation of over half the blade. The sword also possesses high durability and is quite strong, able to cut through almost anything. However, due to its considerable weight, only especially strong and resilient individuals can handle wielding it for long durations; otherwise they will tire quickly.<font color=red><br>(Durability: 55)<br>(Hit Points: 55)<br>(Adds +15 to damage)<br>(Once in contact with an opponents blood, the blades hit points can restored by 20-every two rounds.)<br>(Feeding the blade the wielders blood is only half as effective, only allowing for a regeneration of 10 points every four rounds)<br>(The users attacking range is extending by 1 tile)"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"

obj/items/New_Weapon/SSOM
	Sewing_Death_Needle
		icon='Katana.dmi'
		icon_state=""
		description="The blade itself assumes the form of a narrow longsword (長刀, chōtō) that greatly resembles a large needle, with a long length of thin wire, mirroring thread, tied through the eye located at the base of its hilt. This sword is said to possess the ability to pierce all and stitch them together, demonstrated through its ability to effortlessly penetrate multiple targets in a single thrust, and then quite literally stitch them together in substantial bundles by simply pulling the attached wire taut. A capable user can even throw the sword with the intent of piercing a line of multiple enemies, before catching the needle at the other side and repeating the process at different angles, in order to create knots of corpses with the wire passing through the entirety, effectively creating bundles of bodies at various points along the length of the thread.<br>(Durability: 60)<br>(Hit points: 50)<br>(Adds +5 to close range damage)<br>(When thrown-Sewing Needle adds +15 to speed and damage ontop of throwing calculation)<br>(If damage dealt by thrown sewing needle calculates as major, target is “pierced” lowering their speed and reflex by 5 points.)<br>(Each subsequent stack of pierce stacks an additional -5 to speed and reflex)"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"

obj/items/New_Weapon/SSOM
	Great_Twin_Blades
		icon='Hiramekarei.dmi'
		icon_state="Inv"
		description="Hiramekarei features a wide, flat blade with two curved indentations near its base, creating a sort of cross-guard. Two handles are connected to one another by a short length of cord, earning it the title of twinsword (双刀, sōtō). The overall sword looks like a flounder fish in shape. When not in use, Hiramekarei is wrapped in bandages. Hiramekarei is capable of storing chakra. With the command Hiramekarei Release), the stored chakra is emitted from the holes at the tip of the blade.The chakra rapidly coats the sword and can be shaped into various weapons, such as a hammer or a long-sword. The more chakra that is stored in Hiramekarei, the larger the size of the manifested weapon.This discharge of chakra causes the bandages it is typically wrapped with to unravel.<br><br><font color=teal>(The user can choose how much chakra to store into the weapon, up to a maximum of 5000-<i>The instances of storing must be recorded and stored in a scroll in the instance the user is questioned about it</i>(The user can call upon various ‘Releases’ each having their own requirement of stored chakra. <br><b><u>(Hammer</u> At the cost of 1000 stored chakra, the user can manifest a viel of chakra in the shape of a hammer around their blade. <i>Their attack range is widened, allowing them to consecutively strike two tiles via a swing of the blade ; Adds +10 to damage; Strikes from Hammer-form induce a knockback of Tai+Con/5)</b><br><b><u>(Long sword:</u> At the cost of 2000 stored chakra, the user can manifest a viewl of chakra in the shape of a long blade.<i>Range is vastly extended, allowing the user to strike up to 5 tiles away; Adds +15 to damage)"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"

obj/items/New_Weapon/SSOM
	Shark_Skin
		icon='Samehada.dmi'
		icon_state="Inv"
		description="Samehada (鮫肌, literally meaning: Shark Skin) is a sentient sword utilised by the Seven Ninja Swordsmen of the Mist, and is regarded as the most terrifying out of all the Seven Swordsmen's blades. Samehada is a large sword, roughly as tall as a full-grown man and comparable in size to the Kubikiribōchō. Though usually wrapped in bandages, Samehada's construction is atypical in that its actual blade is comprised from a series of downward-facing scales running along the entirety of its length until its hilt, at the base of which is a small skull. Samehada grows larger in proportion to the amount of chakra it absorbs, causing its scales to become so long that they ultimately resemble shark fins and its mouth, located at the tip of the blade, to become even more pronounced with visible teeth. Keeping Samehada wrapped in bandages apparently helps to inhibit this growth to a certain extent. As the blade is made up of scales, it inflicts injuries through shredding or shaving what it comes into contact with, rather than just cutting the object in question. This flaying effect is similar to a shark's skin, hence the sword's name. While it ordinarily remains rigid, Samehada's hilt is able to stretch and bend to great extent, allowing the weapon to be used like a flail. To supplement the blade's offensive capabilities, it is able to extend its scales to spikes, and protrude spikes from its handle. Samehada shares a symbiotic relationship with its wielder, similar to that of the kikaichū. Although it continually consumes the chakra of its owner, its largest meals come from fights, where it absorbs the chakra of the opponent by slicing through it, preventing them from performing the technique in question<br><font color=Aqua)(Durability:65)<br>(Hit points:65)<br>(Adds +12 to damage)<br>(Passively absorbs 450 chakra for every round its wielded)<br>(Full contact Strikes dealt by Samehada rob opponents of 600 chakra and syphons ½ of it back into the users reserves, grazes sap half.)<br>(Shred: Wielders of samehada can shred their opponent, inflicting gnarly bleeding wounds(Induces a “bleed” effect, subtracting 15 health each round for the remainder of battle)"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"
obj/items/New_Weapon/SSOM
	Lightning_Blades
		icon='Raiga.dmi'
		icon_state="Inv"
		description="Kiba: It is a pair of swords, each with slim and straight double-edged blades. Both blades also have an upward-curved bladed prong near the tip of one side of the blade and another one near the base of the blade's other side. At their bases are smooth brown hilts with a round grey hilt. The swords have been imbued with lightning, granting enhanced cutting power in a manner similar to the high-frequency vibrations of lightning-based chakra flow. It is this capability that has resulted in these thunderswords(雷刀, raitō) being claimed as the sharpest swords in existence. Even without lightning, they are very dangerous in battle, able to be used in combination with agile spinning movements, sweeping through the targets while the user also rotates. This, combined with the jagged nature of the blades, allows for more damaging wounds inflicted.<br>(Durability:40)<br>(Hit points: 40)<br>(Adds +15 to damage)<br>(Enhanced lightning chakra flow: Lightning flow damage calculation altered to Strength+Taijutsu+Con/2)<br>(Lightning Jutsu birthed from this blade receive an additional +10 to speed and damage)"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"
obj/items/New_Weapon/SSOM
	Blast_Sword
		icon='Katana.dmi'
		icon_state=""
		description="The blade utilises various explosive tags, contained within a substantial scroll, in order to incorporate explosions into the user's own swordsmanship, earning it the title of blastsword (爆刀, bakutō). The sword itself features two distinct sides, with a narrow cutting edge located down the entirety of one length and a wide platform section on the other. The aforementioned scroll unrolls along this latter side, sliding downwards and resting atop its surface to form an individual segment comprised from numerous explosive tags, which separates from the remainder upon detonation. Only once the desired opponent comes into contact with the platform do the explosive tags finally ignite and then detach, providing a small opportunity for the user to escape the devastating blast radius, while simultaneously compensating for any resultant recoil. The sword is seemingly able to reload another segment of tags onto the platform automatically after each strike.<br>(Durability:50)<br>(Hit points: 55)<br>(Adds +15 to damage)<br>(When the blade makes contact with a person or object, its wielder can ignite the tags to envelope the struck object or person in an explosion; explosion covers a 5x5 area before the user from the point of swords contact and deals 40 true damage)"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"
obj/items/New_Weapon/Misc
	War_Fan
		icon='madara.dmi'
		description="A gunbai (軍配, Gunbai, literally meaning: army arrangement), or Gunbai Uchiwa (軍配団扇, Gunbai Uchiwa, literally meaning: army arrangement fan), is a non-folding fan, carved from a unique spirit tree from which only ritualistic instruments are made. This Gunbai has been passed down between Uchiha clansmen for generations <br>(Durability:45)<br>(Hitpoints:40)<br> (+15 damage and speed to wind techniques cast via the gunbai)<br>(The gunbai can also be used to fan flames in order to increase their potency; +10 to damage and speed to fire based techniques) "
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"
obj/items/New_Weapon/Sword
	Katana
		icon='Katana.dmi'
		icon_state=""
		description="This is a standard steel katana, when in the right hands it becomes a valuable weapon.<br>\[+10 damage]<br>\[Hit Points:35]<br>\[Durability:25]"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon

				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon

		verb
			ShowDescription()
				if(src in usr.contents)
					viewers()<<"<font color=[usr.SayFont]>[usr] shows off <u><font color=maroon>[src.name]</font color></u><br>[src.description]"


		verb
			Color()
				switch(input("Add, Subtract, or Multiply color?", "", text) in list ("Add", "Subtract","Multiply","Cancel"))
					if("Add")
						var/rred=input("How much red?") as num
						var/ggreen=input("How much green?") as num
						var/bblue=input("How much blue?") as num
						src.icon=src.icon
						src.icon+=rgb(rred,ggreen,bblue)
					if("Subtract")
						var/rred=input("How much red?") as num
						var/ggreen=input("How much green?") as num
						var/bblue=input("How much blue?") as num
						src.icon=src.icon
						src.icon-=rgb(rred,ggreen,bblue)
					if("Multiply")
						var/colorz=input("Multiply") as color
						var/icon/I=new(src.icon)
						I.Blend((colorz),ICON_MULTIPLY)
						src.icon=I
					if("Cancel")
						return
			Name()
				switch(input("Will you name your weapon?") in list ("Yes","No"))
					if("Yes")
						var/B = input("Enter its new name") as text
						src.name = B
					if("No")
						return



obj/items/New_Weapon/Misc
	Bow_Sword
		icon='Bow Sword right.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon

		verb
			Switch_Hands()
				if(src.icon=='Bow Sword right.dmi')
					usr.overlays -= src.icon
					src.icon = 'Bow Sword left.dmi'
					usr.overlays += src.icon
				else
					if(src.icon=='Bow Sword left.dmi')
						usr.overlays -= src.icon
						src.icon = 'Bow Sword right.dmi'
						usr.overlays += src.icon