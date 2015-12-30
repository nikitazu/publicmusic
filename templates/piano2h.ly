% LilyBin

leftHand = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "treble"
	\key c \major
	\repeat volta 2 {
		c
	}
	\alternative {
		{ d }
		{ e }
	}
}

rightHand = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "bass"
	\key c \major
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
	\relative c'' { \leftHand }
	\relative c { \rightHand }
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


