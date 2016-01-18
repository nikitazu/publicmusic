echo off
rem Creates PDFs and MIDIs for every lilypond file (*.ly) in the current folder

set lily="%PROGRAMFILES(X86)%\LilyPond\usr\bin\lilypond.exe"
set timidity="D:\apps\mus\timidity213\timidity.exe"

echo ############ LILYPOND >work.log
%lily% --pdf *.ly >>work.log 2>&1

echo ############ TIMIDITY >>work.log
%timidity% --output-stereo -Ow *.mid >> work.log 2>&1

echo ############ DONE >>work.log
