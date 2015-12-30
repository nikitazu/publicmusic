% LilyBin

leftHand = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "treble"
	\key c \major
	\repeat volta 2 {
		g4 e8 e
		g4 e8 e
		g8 f e d
		c2

		f4 c'8 a
		g4 e8 e
		g8 f e d
	}
	\alternative {
		{ c2 }
		{ c2 }
	}
}

rightHand = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "bass"
	\key c \major
	\repeat volta 2 {
		c4 <e g>
		c <e g>
		g, <b d>
		c <e g>

		f,4 <a c>
		c <e g>
		g, <b d>
	}
	\alternative {
		{ c4 <e g> }
		{ <c e g>2 }
	}
}

main = {
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
