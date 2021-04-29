; The contents of this file can be copied directly into your script. Alternately, you can copy the classMemory.ahk file into your library folder,
; in which case you will need to use the #include directive in your script i.e. 
#Include classMemory.ahk

; You can use this code to check if you have installed the class correctly.
if (_ClassMemory.__Class != "_ClassMemory")
{
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
    ExitApp
}

; Open a process with sufficient access to read and write memory addresses (this is required before you can use the other functions)
; You only need to do this once. But if the process closes/restarts, then you will need to perform this step again.
; .isHandleValid() can be used to check if program has restarted.
; Note: The program identifier can be any AHK windowTitle i.e.ahk_exe, ahk_class, ahk_pid, or simply the window title. 
; Unlike AHK this defaults to an exact match, but this can be changed via the passed parameter.
; hProcessCopy is an optional variable in which the opened handled is stored. 


mem := new _ClassMemory("ahk_exe CrazyMachines.exe", "", hProcessCopy) ; *****

; Check if the above method was successful.
if !isObject(mem) 
{
    msgbox failed to open a handle
    if (hProcessCopy = 0)
        msgbox The program isn't running (not found) or you passed an incorrect program identifier parameter. 
    else if (hProcessCopy = "")
        msgbox OpenProcess failed. If the target process has admin rights, then the script also needs to be ran as admin. Consult A_LastError for more information.
    ExitApp
}

oldWin := 0
oldmen := 0

#Persistent
SetTimer, Update, 16
RShift:: ExitApp

Update:

win := mem.read(mem.BaseAddress + 0x0010F344, "Int", 0xE0, 0xC, 0x4, 0x4, 0x8, 0x50)
men := mem.read(mem.BaseAddress + 0x0010F344, "Int", 0x28C, 0x1F0, 0x9C, 0xF30)

if (oldWin < win) {
	Send {Numpad0 Down}
	oldWin := win
	Sleep, 20
	Send {Numpad0 Up}
} else {
	oldWin := win
}

if (oldmen < men) {
	Send {Numpad4 Down}
	oldmen := men
	Sleep, 20
	Send {Numpad4 Up}
} else if (oldmen > men) {
	Send {Numpad0 Down}
	oldmen := men
	Sleep, 20
	Send {Numpad0 Up}
}
return
