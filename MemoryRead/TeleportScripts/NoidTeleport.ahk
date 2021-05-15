#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Include classMemory.ahk

loop {
	if (mem.isHandleValid()) {
		Sleep, 1000
		continue
	} else {
		mem := new _ClassMemory("ahk_exe noid.exe", "", hProcessCopy) ; *****
		moduleBase := mem.getModuleBaseAddress("UnityPlayer.dll")
		Sleep, 1000
		continue
	}
}

f1::
x := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x90)
y := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x94)
z := mem.read(moduleBase + 0x13D07F0, "Float", 0x0, 0x10, 0x30, 0xF8, 0x98)
;MsgBox X = %x%`nY = %y%`nZ = %z%`nmoduleBase = %moduleBase%
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

f5::
if (mem.isHandleValid()) {
	msgbox Hooked into noid.exe!`nMsgBox X = %x%`nY = %y%`nZ = %z%`nmoduleBase = %moduleBase%
} else {
	msgbox Can't find noid.exe

}
return
