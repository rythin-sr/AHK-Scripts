#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Include classMemory.ahk

f1::

mem := new _ClassMemory("ahk_exe noid.exe", "", hProcessCopy) ; *****

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

moduleBase := mem.getModuleBaseAddress("UnityPlayer.dll")

x := mem.read(moduleBase + 0x1446C88, "Float", 0x58, 0x4C8, 0x90)
y := mem.read(moduleBase + 0x1446C88, "Float", 0x58, 0x4C8, 0x94)
z := mem.read(moduleBase + 0x1446C88, "Float", 0x58, 0x4C8, 0x98)
;MsgBox X = %x%`nY = %y%`nZ = %z%
return

f2::
mem.write(moduleBase + 0x1446C88, x, "Float", 0x58, 0x4C8, 0x90)
mem.write(moduleBase + 0x1446C88, y, "Float", 0x58, 0x4C8, 0x94)
mem.write(moduleBase + 0x1446C88, z, "Float", 0x58, 0x4C8, 0x98)
return 
