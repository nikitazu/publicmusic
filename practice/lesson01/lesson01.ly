% LilyBin
% Период
% T S T D T S D T

leftHand = \new Staff {
	\time 2/4
	\tempo "Allegro" 4 = 100
	\clef "treble"
	\key c \major
	\repeat volta 2 {
		c2 f c g
        c f
	}
	\alternative {
		{ g c }
		{ g c, }
	}
}

rightHand = \new Staff {
	\time 2/4
	\tempo "Allegro" 4 = 100
	\clef "bass"
	\key c \major
	\repeat volta 2 {
		c4 <e g> f <a c> c, <e g> g, <b d>
        c  <e g> f <a c>
	}
	\alternative {
		{ g  <b d> c  <e g> }
		{ g, <b d> c, <e g> }
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


