# Creates PDFs and MIDIs for every lilypond file (*.ly) in the current folder

function Process-Kill ($names)
{
    ps | foreach {
        $proc = $_
        $names | foreach {
            if ($proc.ProcessName -eq $_) {
                kill $proc
            }
        }
    }
}

function Log ($message)
{
    "### $message" | Add-Content work.log
}

function Test-ProgramFiles-App ($appName, $relativePath)
{
    $programPath = "${Env:ProgramFiles}\$relativePath"
    $programPath32 = "${Env:ProgramFiles(x86)}\$relativePath"
    if (Test-Path $programPath) {
        "Found $appName at $programPath" | Add-Content work.log
        return $programPath
    } else {
        if (Test-Path $programPath32) {
            "Found $appName 32-bit at $programPath32" | Add-Content work.log
            return $programPath32
        } else {
            "ERROR: Not found $appName at $programPath nor $programPath32" | Add-Content work.log
            Exit
        }
    }
}

function Test-Custom-App ($appName, $path)
{
    if (Test-Path $path) {
        "Found $appName at $path" | Add-Content work.log
        return $path
    } else {
        "ERROR: Not found $appName at $path" | Add-Content work.log
        Exit
    }
}

"### START" | Out-File work.log

$lily = Test-ProgramFiles-App "LilyPond" "LilyPond\usr\bin\lilypond.exe"
$timidity = Test-Custom-App "Timidity++" "D:\apps\mus\timidity213\timidity.exe"

Log "CLEANUP"
Process-Kill "AcroRd32", "wmplayer"
rm *.mid,*.pdf,*.wav

Log "LILYPOND"
& $lily --pdf *.ly *>&1 | Add-Content work.log

Log "TIMIDITY"
& $timidity --output-stereo -Ow *.mid *>&1 | Add-Content work.log

Log "DONE"
