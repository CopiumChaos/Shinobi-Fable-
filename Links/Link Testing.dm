mob/Topic(href,href_list[],hsrc)
	switch(href_list["action"])
		if("start")
			usr<< "Starting the game..."
		if("checkclan")
			usr<<browse(src.ClanSubmit,"window=Clan Submit;size=450x400")
		if("checkjutsu")
			usr<<browse(src.JutsuSubmit,"window=Clan Submit;size=450x400")
		if("reply")
			var/msg = input("What is the message?") as text
			usr << "[msg] - [name]"
			for(var/mob/M in world)
				if(M.Admin)
					M<< output("From [usr]([usr.displaykey]): [msg]", "AdminPanel.AC")
					M << output("<font color=[usr.OOCFont]>><a href=?src=\ref[src];action=respond>Respond</a>","AdminPanel.AC")
		if("respond")
			var/msg = input("What is the message?") as text
			src << "[msg] - [usr.displaykey]"
			winset(src, "World","flash=-1")
			src << output("<font color=Red>><a href=?src=\ref[src];action=reply>Reply</a>","World.OOC")
			for(var/mob/M in world)
				if(M.Admin)
					M<< output("To [src]([src.displaykey]): [msg] <br> From: [usr.displaykey]", "AdminPanel.AC")
		if("readsuggestion")
			usr<<browse(Suggestions,"window=Suggestions;size=500x350")
		else
			return ..()