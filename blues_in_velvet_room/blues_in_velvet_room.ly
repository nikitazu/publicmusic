% LilyBin
% Blues in Velvet Room
% from Persona 3 OST
% by Shouji Meguro

% T S T D  T T S D

leftHand = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "treble"
	\key c \major
	\repeat volta 2 {
		c1 f c g
        c c
	}
	\alternative {
		{ f g }
		{ f g }
	}
}

rightHand = \new Staff {
	\time 4/4
	\tempo "Allegro" 4 = 120
	\clef "bass"
	\key c \major
	\repeat volta 2 {
		c8  <e g>2.. f8 <a c>2.. c,8 <e g>2.. g8 <b d>2..
        c,8 <e g>2.. c8 <e g>2..
	}
	\alternative {
		{ f8 <a c>2.. g8 <b d>2.. }
		{ f8 <a c>2.. g8 <b d>2.. }
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


