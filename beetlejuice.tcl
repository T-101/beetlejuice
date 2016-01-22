namespace eval ::beetlejuice:: {

setudef flag beetlejuice

set bjVersion 1.0

bind pubm -|- "*" ::beetlejuice::handler

set bjCounter 0
set fileName "beetlejuice.db"

proc handler { nick mask hand channel args} {
	if {[channel get $channel beetlejuice] && [onchan $nick $channel]} {
		foreach item $args {
			if {[regexp -nocase -- {beetlejuice|betelgeuse} $item]} {
				set ammount [fileHandler $channel]
				if {[expr $ammount % 3] == 0 && $ammount != 0} { output $channel }
}	}	}	}

proc fileHandler {channel} {
	variable fileName
	if {![file exists $fileName]} { close [open $fileName w] }
	set fh [open $fileName r]
	set text [join [read $fh]]
	close $fh
	set ammount 0
	set position [lsearch $text $channel]
	if {$position != -1} {
		set ammount [lindex $text [expr $position +1]]
		set text [join [lreplace $text [expr $position + 1] [expr $position + 1] [incr ammount]]]
	} else { lappend text [join "$channel 1"] }	
	set fh [open $fileName w]
	puts $fh [join $text]
	close $fh
	return $ammount
}

proc output {channel} {
# http://www.rottentomatoes.com/m/beetlejuice/quotes/
	set quotes {
		"Let's turn on the juice and see what shakes loose."
		"It's showtime!"
		"We come for your daughter, Chuck."
		"Whew! Thank you, thank you! That is why I won't do two shows a night any more, babe, I won't, I won't do em."
		"Welcome to Winter River, museum of natural greed; a monument to the bored businessman! Come on a little closer! Step right up! Test your strength!"
		"I'll eat anything you want me to eat, I'll swallow anything you want me to swallow, So, come on down and I'll chew on a dog!"
		"IT'S SHOWTIME!"
		"Ah! Oo, oo, oo, oo, ah, ah, ah! Nobody says the 'B' word!"
		"Ah. Well... I attended Juilliard... I'm a graduate of the Harvard business school. I travel quite extensively. I lived through the Black Plague and had a pretty good time during that. I've seen the EXORCIST ABOUT A HUNDRED AND SIXTY-SEVEN TIMES, AND IT KEEPS GETTING FUNNIER EVERY SINGLE TIME I SEE IT... NOT TO MENTION THE FACT THAT YOU'RE TALKING TO A DEAD GUY... NOW WHAT DO YOU THINK? You think I'm qualified?"
		"Nice fucking model!"
		"The only one I think I can deal with is Edgar Allan Poe's daughter. I think she understands me."
		"Go ahead, make my millenium."
		"Not so fast, round boy. We're gonna have some laughs."
		"I'm the ghost with the most, babe."
	}
	putquick "PRIVMSG $channel :[lindex $quotes [rand [llength $quotes]]]"
}

putlog "Beetlejuice version $bjVersion by T-101/Primitive loaded!"
}
