% LilyBin

\version "2.18.2"

myMelody = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "treble"
	\key c \major
    
    \set Staff.midiMinimumVolume = #0.5
    \set Staff.midiMaximumVolume = #0.9
    
	\repeat volta 2 {
		c
	}
	\alternative {
		{ d }
		{ e }
	}
}

myAcc = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "bass"
	\key c \major
    
    \set Staff.midiMinimumVolume = #0.2
    \set Staff.midiMaximumVolume = #0.6
    
	\repeat volta 2 {
		c
	}
	\alternative {
		{ d }
		{ e }
	}
}

main =  {
	<<
	\relative c'' { \myMelody }
	\relative c { \myAcc }
	>>
}

\score{
	\main
	\layout{ }
}

\score{
	\unfoldRepeats
	\main
	\midi{ }
}


