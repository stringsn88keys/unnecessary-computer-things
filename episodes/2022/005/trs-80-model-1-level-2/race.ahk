#InstallKeybdHook
SetTitleMatchMode 3
WinActivate, TRS-80 Model I
;MouseClick, Left, 100, 100
;SendMode Input
SetKeyDelay,0,100
Sleep 100
Send, CLS{Enter}RUN
WinActivate, TRS-80 Model I #2
Sleep 100
Send, CLS{Enter}RUN
WinActivate, TRS-80 Model I 
Send,{Enter}
WinActivate, TRS-80 Model I #2
Send,{Enter}