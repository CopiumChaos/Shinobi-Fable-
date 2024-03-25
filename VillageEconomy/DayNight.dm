
/*

		kii_daynight   12/15/2018


	A friend asked about making a simple and lightweight day/night mechanic that looked nice so i threw this together. It's
		super lightweight and can easily make beautiful day/night cycles! I might update this in the future, although I'm
		not exactly sure what else i would add, honestly.


		Everyone is welcomed to use this in their games so long as credit is given where appropriate!

									HAPPY DEVELOPING!!!

											-Kumo


					Check out Dream Makers Discord --- https://discord.gg/THbhxc
								*/
	//    times of day definitions.


#define DAY 1
#define NIGHT 2



var
	obj/screen_fx/day_night/DAY_NIGHT		= new	// since day/night should be the same for all players at a time, \
													we can just draw/animate a single day/night object and display it to \
											each client/player as needed. (as opposed to running a daynight loop on every player)
	time_of_day		= NIGHT		// This is used to determine what the lighting should cycle/change to.
									// you can set this variable directly at any time or.....

	auto_daynight	= 1			// you can toggle this to true (it is by default) to make day/night cycle automatically on it's own.





client
	proc
		toggle_daynight(i = 0)
			/* Call this proc to either remove or add day/night rendering across the player's screen.
				[i]		- 1 to show day/night effect to the client.
						- 0 to remove/hide the day/night effect from the client.
			*/
			if(i)	// if we want the day/night lighting to be displayed..
				if(!(DAY_NIGHT in screen))	// if it's already drawn, we can just ignore the proc altogether.
					screen += DAY_NIGHT		// adds the global day/night effect across the screen.
			//		src << "debug: day_night was toggled <b>ON</b>."

			else	// if we're trying to remove day/night rendering from a player..
				if(DAY_NIGHT in screen)
					screen -= DAY_NIGHT
			//		src << "debug: day_night was toggled <b>OFF</b>."



/*////////////////////////////////////////////////////////////////////////////////////

Now below is the fun part!

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/



obj
	screen_fx
		// i encourage you to keep your object tree pretty organized if you don't already. Try to group objects that do \
			functionally similar things together.
		day_night
			icon			= 'daynight.dmi'
			icon_state		= "daynight"
			screen_loc		= "NORTHWEST to SOUTHEAST"
			mouse_opacity	= 0
			layer			= EFFECTS_LAYER+5
			plane			= 1
			alpha			= 0
			color			= "#febe29"		// by default the day/night system will start at mid-day and immediately start changing to night.
			appearance_flags	= RESET_COLOR

			New()
				..()
				// when a day_night render is created (there should only ever be one) it starts itself up.
				day_night_loop()

			proc
				day_night_loop()
					set waitfor = 0
					/* Okay, so this is where the magic happens!
						The day is animated in two cycles; noon to midnight -> midnight to noon.

						noon is max "brightness"; midnight is max darkness.
						[alpha] to will determine how 'dark' or saturating the ambient lighting will be.
						[color] is to set an ambient lighting color as to better indicate time of day.
						[time] is how long the transition from the current time of day to the desired time of day should be.
							currently each half of the day is one minute.
					*/
					while(1)
						switch(time_of_day)	// this will give you more control over various times of day and their lighting.

							if(NIGHT)	// if the [time_of_day] is set to night, let's start changing it to night time!
								animate(src, alpha = 177, color = "#04062b", time = 600, loop = 1, easing = QUAD_EASING) //darken to midnight.
								sleep 600//600 // make sure this matches the time var here^^
								if(auto_daynight) time_of_day = DAY	// audio_daynight can be toggled to make the daynight cycle autonomously.

							if(DAY)
								animate(src, alpha = 0, color = "#febe29", time = 100, loop = 1, easing = QUAD_EASING) // brighten to noon.
								sleep 600
								if(auto_daynight) time_of_day = NIGHT

						sleep 5


		//	you can add more 'times of days' for more dynamic day lighting by using this and just keeping the \
				pattern going as desired.





