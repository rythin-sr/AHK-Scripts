#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Include classMemory.ahk

loop {
	if (mem.isHandleValid()) {
		Sleep, 1000
		continue
	} else {
		mem := new _ClassMemory("ahk_exe SoulAxiomRebooted.exe", "", hProcessCopy) ; *****
		moduleBase := mem.getModuleBaseAddress("UnityPlayer.dll")
		Sleep, 1000
		continue
	}
}

f1::
x := mem.read(moduleBase + 0x1564B28, "Float", 0x0, 0x180, 0xB0)
y := mem.read(moduleBase + 0x1564B28, "Float", 0x0, 0x180, 0xB4)
z := mem.read(moduleBase + 0x1564B28, "Float", 0x0, 0x180, 0xB8)
;MsgBox X = %x%`nY = %y%`nZ = %z%`nmoduleBase = %moduleBase%
return

f2::
x2 := mem.read(moduleBase + 0x1564B28, "Float", 0x0, 0x180, 0xB0)
y2 := mem.read(moduleBase + 0x1564B28, "Float", 0x0, 0x180, 0xB4)
z2 := mem.read(moduleBase + 0x1564B28, "Float", 0x0, 0x180, 0xB8)
;MsgBox X = %x%`nY = %y%`nZ = %z%
return

f3::
mem.write(moduleBase + 0x1564B28, x, "Float", 0x0, 0x180, 0xB0)
mem.write(moduleBase + 0x1564B28, y, "Float", 0x0, 0x180, 0xB4)
mem.write(moduleBase + 0x1564B28, z, "Float", 0x0, 0x180, 0xB8)
return 

f4::
mem.write(moduleBase + 0x1564B28, x2, "Float", 0x0, 0x180, 0xB0)
mem.write(moduleBase + 0x1564B28, y2, "Float", 0x0, 0x180, 0xB4)
mem.write(moduleBase + 0x1564B28, z2, "Float", 0x0, 0x180, 0xB8)
return 

f5::
if (mem.isHandleValid()) {
	msgbox Hooked into SoulAxiomRebooted.exe!`nmoduleBase = %moduleBase%`nCurrently stored positions:`nX = %x%`nY = %y%`nZ = %z%`nX2 = %x2%`nY2 = %y2%`nZ2 = %z2%
} else {
	msgbox Can't find SoulAxiomRebooted.exe

}
return
