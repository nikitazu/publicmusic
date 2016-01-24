% LilyBin
% Простейшая барабанная дорожка
% T S T D T S D T

\version "2.18.2"

drumsA = \drummode {
    \repeat volta 4 {
        bd2
        bd2
    }
}

drumsB = \drummode {
    \repeat volta 4 {
        sn4
        sn4
        sn4
        sn4
    }
}

drumsC = \drummode {
    \repeat volta 4 {
        hh8 hh 
        hh8 hh
        hh8 hh
        hh8 hh
    }
}


drumsTrack = \new DrumStaff {
	\time 4/4
	\tempo "Allegro" 4 = 120
    
    \set DrumStaff.midiMinimumVolume = #0.5
    \set DrumStaff.midiMaximumVolume = #0.9
    <<
        \new DrumVoice { \stemUp \drumsC }
        \new DrumVoice { \stemDown \drumsB }
        \new DrumVoice { \stemDown \drumsA }
    >>
}

main =  {
    { \drumsTrack }
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


