rem Creates PDFs and MIDIs for every lilypond file (*.ly) in the current folder
set lily="%PROGRAMFILES(X86)%\LilyPond\usr\bin\lilypond.exe"
%lily% --pdf *.ly > work.log 2>&1
