; AutoHotKey Script for Sending Barcodes to EHR
; Chris Liston, Parkview Health, 2020
; CHANGEGLOG
; *CSL	05.14.20	Initial work
;
#SingleInstance Force

; User Variables: Edit to customize
barcodelist = barcodelist.txt
MainImageFile = mw.png

; Tray Icon
Menu, Tray, Icon, mw.ico                        ; Sets icon for system tray and menu

; Create var (list) of open windows
WinGet,WinList,List,,,Program Manager
List=
    loop,%WinList%
    {
        Current:=WinList%A_Index%
        WinGetTitle,WinTitle,ahk_id %Current%
        If WinTitle AND !InStr(List,WinTitle)
        List.="`n"WinTitle
    }

; Begin GUI
Gui, Add, Picture, vMainImg ,%MainImageFile%
Gui, Font, bold
Gui, Add, Text, vSelectApp, Select open application:
Gui, Add, DropDownList,vWinList w400 ,%List%
Gui +Delimiter`n
GuiControl,,WinList,%List%                      ; End droplist of open windows

Gui, Add, Text,,
Gui, Add, Text,, Choose barcode to send:

; Loop to create buttons based on file
Loop, read, %barcodelist%
    {
        lineAry := StrSplit(A_LoopReadLine, "|")
        dispVar := lineAry[1]
        Gui, Add, Button, w400 gButtonLabel, %dispVar%
    }

Gui, Show
Return

ButtonLabel:
Gui, Submit, NoHide
If WinList = 
    {
        ;Msgbox, Select open application before sending barcode
        Gui, Font,cRed Bold
        GuiControl, Font, SelectApp
        Return
    }
Else
    {
        Gui, Font,cBlack Regular
        GuiControl, Font, SelectApp
    }

Loop, read, %barcodelist%
{
    lineAry := StrSplit(A_LoopReadLine, "|")
    dispVar := lineAry[1]
    codeVar := lineAry[2]
    if (dispVar = A_GuiControl)
    {
       CurrentWin := WinTitle
       WinActivate, %WinList%
       Sleep 50
       SoundBeep, 750, 500
       Send, %codeVar%
       Sleep 400
       WinActivate, %CurrentWin%
    }
}
Return

GuiClose:
ExitApp
