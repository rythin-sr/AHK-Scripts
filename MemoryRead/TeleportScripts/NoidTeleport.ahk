#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Include classMemory.ahk

mem := new _ClassMemory("ahk_exe noid.exe", "", hProcessCopy) ; *****

; Check if the above method was successful.
if !isObject(mem) 
{
    msgbox failed to open a handle
    if (hProcessCopy = 0)
        msgbox The program isn't running (not found). 
    else if (hProcessCopy = "")
        msgbox OpenProcess failed. If the target process has admin rights, then the script also needs to be ran as admin.
    ExitApp
}

moduleBase := mem.getModuleBaseAddress("UnityPlayer.dll")

f1::
x := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x90)
y := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x94)
z := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x98)
;MsgBox X = %x%`nY = %y%`nZ = %z%
return

f2::
x2 := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x90)
y2 := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x94)
z2 := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x98)
;MsgBox X = %x%`nY = %y%`nZ = %z%
return

f3::
mem.write(moduleBase + 0x13D07F0, x, "Float", 0x0, 0x10, 0x30, 0xF8, 0x90)
mem.write(moduleBase + 0x13D07F0, y, "Float", 0x0, 0x10, 0x30, 0xF8, 0x94)
mem.write(moduleBase + 0x13D07F0, z, "Float", 0x0, 0x10, 0x30, 0xF8, 0x98)
return 

f4::
mem.write(moduleBase + 0x13D07F0, x2, "Float", 0x0, 0x10, 0x30, 0xF8, 0x90)
mem.write(moduleBase + 0x13D07F0, y2, "Float", 0x0, 0x10, 0x30, 0xF8, 0x94)
mem.write(moduleBase + 0x13D07F0, z2, "Float", 0x0, 0x10, 0x30, 0xF8, 0x98)
return 
