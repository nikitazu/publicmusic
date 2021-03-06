% LilyBin
% Период
% Простая мелодия с аккордами
% T S T D T S D T

leftHand = \new Staff {
	\time 2/4
	\tempo "Andante" 4 = 100
	\clef "treble"
	\key c \major
    
    \set Staff.midiMinimumVolume = #0.5
    \set Staff.midiMaximumVolume = #0.9
    
	\repeat volta 2 {
		c4 r             % C
        c' r             % F
        r g8 e8          % C
        g4 g4            % G
        
        c4 r             % C
        f, r             % F
	}
	\alternative {
		{ r4 g8 e8       % G
          c4 c           % C
        }
		{ g8 g8 r4       % G
          c4 c           % C
        }
	}
}

rightHand = \new Staff {
	\time 2/4
	\tempo "Andante" 4 = 100
	\clef "bass"
	\key c \major
    
    \set Staff.midiMinimumVolume = #0.3
    \set Staff.midiMaximumVolume = #0.7
    
	\repeat volta 2 {
		c4 <e g>         % C
        f  <a c>         % F
        c, <e g>         % C
        g, <b d>         % G
                         
        c  <e g>         % C
        f  <a c>         % F
	}
	\alternative {
		{ g,4 <b d>      % G
          c4  <e g>      % C
        }
		{ <g, b d>2      % G
          c,4 <e g>      % C
        }
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


