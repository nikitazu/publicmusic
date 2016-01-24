% LilyBin
% Период
% Простая мелодия с аккордами
% Финальный аккорд сделан "картошкой", для придания ему "финальности"
% Последний аккорд первого повтора сделан мощнее
% Простейшая барабанная дорожка
% T S T D T S D T

\version "2.18.2"

myMelody = \new Staff {
	\time 2/4
	\tempo "Allegro" 4 = 140
	\clef "treble"
	\key c \major
    
    \set Staff.midiInstrument = #"pad 1 (new age)"
    \set Staff.midiMinimumVolume = #0.5
    \set Staff.midiMaximumVolume = #0.9
    
	\repeat volta 2 {
		c8 c' r4         % C
        c8 f, r4         % F
        r g8 e8          % C
        g8 b g b         % G
        
        c4 r             % C
        f, r             % F
	}
	\alternative {
		{ r4 g8 e8       % G
          c8 g c e       % C
        }
		{ g8 g8 r4       % G
          c4 c           % C
        }
	}
}

myAcc = \new Staff {
	\time 2/4
	\tempo "Allegro" 4 = 140
	\clef "bass"
	\key c \major
    
    \set Staff.midiInstrument = #"pad 3 (polysynth)"
    %\set Staff.midiInstrument = #"pizzicato strings"
    \set Staff.midiMinimumVolume = #0.5
    \set Staff.midiMaximumVolume = #0.8
    
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

drumsMain = \drummode {
    \repeat volta 2 {
        bd4 sn         % C
        bd4 sn         % F
        bd4 sn8 sn     % C
        bd4 sn         % G
                         
        bd4 sn8 sn     % C
        bd4 sn         % F
    }
    \alternative {
        { sn8 sn sn r  % G
          bd4 bd       % C
        }
        { bd8 bd r4    % G
          bd4 r        % C
        }
    }
}

drumsAcc = \drummode {
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
        { r2                 % G
          r2                 % C
        }
    }
}


drumsTrack = \new DrumStaff {
	\time 2/4
	\tempo "Allegro" 4 = 140
    
    \set DrumStaff.midiMinimumVolume = #0.2
    \set DrumStaff.midiMaximumVolume = #0.5
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


