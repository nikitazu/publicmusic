#!/bin/sh
/Volumes/extrafat/apps/LilyPond.app/Contents/Resources/bin/lilypond --pdf *.ly &&
/opt/timidity-2.13.2/bin/timidity --output-stereo -Ow *.midi &&
echo OK &&
exit 0
