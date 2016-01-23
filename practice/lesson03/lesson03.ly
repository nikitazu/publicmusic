% LilyBin
% Период
% Простая мелодия с аккордами
% Финальный аккорд сделан "картошкой", для придания ему "финальности"
% Последний аккорд первого повтора сделан мощнее
% Простейшая барабанная дорожка
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
		{ g,4 <b d>        % G
          <c e g>4 <c e g> % C
        }
		{ <g  b d>2      % G
          <c, e g>2      % C
        }
	}
}

drumsLeftLeg = \drummode {
    \repeat volta 2 {
        bd4 sn         % C
        bd4 sn         % F
        bd4 sn         % C
        bd4 sn         % G
                         
        bd4 sn         % C
        bd4 sn         % F
    }
    \alternative {
        { bd4 sn       % G
          bd4 sn       % C
        }
        { bd4 sn       % G
          bd4 sn       % C
        }
    }
}

drumsRightLeg = \drummode {
    \repeat volta 2 {
        hh8 hh hh hh         % C
        hh8 hh hh hh         % F
        hh8 hh hh hh         % C
        hh8 hh hh hh         % G
                         
        hh8 hh hh hh         % C
        hh8 hh hh hh         % F
    }
    \alternative {
        { hh8 hh hh hh       % G
          hh8 hh hh hh       % C
        }
        { hh8 hh hh hh       % G
          hh8 hh hh hh       % C
        }
    }
}


drumsLeg = \new DrumStaff {
	\time 2/4
	\tempo "Andante" 4 = 100
    
    \set Staff.midiMinimumVolume = #0.3
    \set Staff.midiMaximumVolume = #0.7
    <<
        \new DrumVoice { \voiceTwo \drumsRightLeg }
        \new DrumVoice { \voiceOne \drumsLeftLeg }
    >>
}

main =  {
	<<
	\relative c'' { \leftHand }
	\relative c { \rightHand }
    { \drumsLeg }
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


