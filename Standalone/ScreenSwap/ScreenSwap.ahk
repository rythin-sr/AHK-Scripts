#NoEnv
SendMode Input
CurrentScreen := -1

#Persistent
SetTimer, FindScreen, 100
CoordMode, Mouse, Screen
F12:: ExitApp
return

FindScreen:
MouseGetPos, x

if (x <= 1920) and (CurrentScreen != 0) {
    CurrentScreen := 0
    Send {F23 Down}
    Sleep, 50
    Send {F23 Up}
} else if (x > 1920) and (CurrentScreen != 1) {
    CurrentScreen := 1
    Send {F24 Down}
    Sleep, 50
    Send {F24 Up}
}
