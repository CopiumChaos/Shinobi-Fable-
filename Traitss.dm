mob/proc
	Traitsss()
		if(src.key in OP)
			var/A = input("Pick your trait.")as text
			src.Trait = A
			src.Racelol()
			return
		if(prob(AvgChnce))
			usr.Trait="Average"
			usr.StaminaGain = rand(11.5,18.5)/10
			usr.ChakraGain = rand(11.5,18.5)/10
			usr.StrengthGain = rand(11.5,18.5)/10
			usr.AgilityGain = rand(11.5,18.5)/10
			usr.OffenceGain = rand(11.5,18.5)/10
			usr.DefenseGain = rand(11.5,18.5)/10
			usr.ControlGain = rand(11.5,18.5)/10
			usr.ResistanceGain = rand(11.5,18.5)/10
			usr.TaijutsuGain = rand(11.5,18.5)/10
			usr.NinjutsuGain = rand(11.5,18.5)/10
			usr.GenjutsuGain = rand(11.5,18.5)/10
			usr.Racelol()
		else
			var/random=rand(1,9)
			if(random==1)
				usr.Trait="Hardworker"
				usr.StaminaGain = rand(18,22)/10
				usr.ChakraGain = rand(11,16)/10
				usr.StrengthGain = rand(12,19)/10
				usr.AgilityGain = rand(11,15)/10
				usr.OffenceGain = rand(15,2)/10
				usr.DefenseGain = rand(12,19)/10
				usr.ControlGain = rand(12,16)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(15,20)/10
				usr.NinjutsuGain = rand(9,15)/10
				usr.GenjutsuGain = rand(9,15)/10
/*			if(random==2)
				usr.Trait="Slacker"
				usr.StaminaGain = rand(9,13)/10
				usr.ChakraGain = rand(11.5,18.5)/10
				usr.StrengthGain = rand(11.5,18.5)/10
				usr.AgilityGain = rand(9,14)/10
				usr.OffenceGain = rand(6,15.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(18,21.5)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(9,16)/10
				usr.NinjutsuGain = rand(18,21)/10
				usr.GenjutsuGain = rand(11.5,18.5)/10*/
			if(random==2)
				usr.Trait="Genius"
				usr.StaminaGain = rand(21.5,26)/10
				usr.ChakraGain = rand(21.5,25)/10
				usr.StrengthGain = rand(21.5,26)/10
				usr.AgilityGain = rand(21.5,26)/10
				usr.OffenceGain = rand(21.5,25)/10
				usr.DefenseGain = rand(7,11.5)/10
				usr.ControlGain = rand(11.5,18.5)/10
				usr.ResistanceGain = rand(7,11.5)/10
				usr.TaijutsuGain = rand(18,22)/10
				usr.NinjutsuGain = rand(18,22)/10
				usr.GenjutsuGain = rand(18,22)/10
			if(random==3)
				usr.Trait="Pacifist"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.OffenceGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(1.15,1.85)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10
/*			if(random==5)
				usr.Trait="Insomniac"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10*/
			if(random==4)
				usr.Trait="Sadist"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10
			if(random==5)
				usr.Trait="Masochist"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10
			if(random==6)
				usr.Trait = "Sadomasochist"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10
			if(random==7)
				usr.Trait="Prodigy"
				usr.contents += new/obj/Perk/Prodigy
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10
			if(random==8)
				usr.Trait="Berserker"
				usr.contents += new/obj/Perk/Berserker
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10
/*			if(random==11)
				usr.Trait="Insane"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10*/
			if(random==9)
				usr.Trait="Strategist"
				usr.contents += new/obj/Perk/Strategist
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10
/*			if(random==13)
				usr.Trait="Zealot"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10*/
/*			if(random==14)
				usr.Trait="Neutral"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10*/
/*			if(random==15)
				usr.Trait="Jashinist"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10*/
/*			if(random==16)
				usr.Trait="Nymphomaniac"
				usr.StaminaGain = rand(11.5,18.5)/10
				usr.ChakraGain = rand(11.5,25)/10
				usr.StrengthGain = rand(6,12)/10
				usr.OffenceGain = rand(11.5,21)/10
				usr.AgilityGain = rand(11.5,18.5)/10
				usr.DefenseGain = rand(11.5,18.5)/10
				usr.ControlGain = rand(11.5,25)/10
				usr.ResistanceGain = rand(11.5,18.5)/10
				usr.TaijutsuGain = rand(11.5,18.5)/10
				usr.NinjutsuGain = rand(11.5,25)/10
				usr.GenjutsuGain = rand(11.5,25.5)/10*/
			usr.Racelol()








