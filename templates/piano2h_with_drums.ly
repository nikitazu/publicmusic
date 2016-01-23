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

drumsMain = \drummode {
    \repeat volta 2 {
        bd
    }
    \alternative {
        { sn
        }
        { bd
        }
    }
}

drumsAcc = \drummode {
    \repeat volta 2 {
        hh
    }
    \alternative {
        { hh
        }
        { hh
        }
    }
}

drumsTrack = \new DrumStaff {
	\time 4/4
	\tempo "Allegro" 4 = 120
    
    \set Staff.midiMinimumVolume = #0.2
    \set Staff.midiMaximumVolume = #0.6
    <<
        \new DrumVoice { \voiceTwo \drumsAcc }
        \new DrumVoice { \voiceOne \drumsMain }
    >>
}

main =  {
	<<
	\relative c'' { \myMelody }
	\relative c { \myAcc }
    { \drumsTrack }
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


