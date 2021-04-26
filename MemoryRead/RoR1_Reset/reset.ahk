; The contents of this file can be copied directly into your script. Alternately, you can copy the classMemory.ahk file into your library folder,
; in which case you will need to use the #include directive in your script i.e. 
#Include classMemory.ahk

; You can use this code to check if you have installed the class correctly.
if (_ClassMemory.__Class != "_ClassMemory")
{
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
    ExitApp
}

f1::

mem := new _ClassMemory("ahk_exe ROR_GMS_controller.exe", "", hProcessCopy) ; *****

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

zoom := floor(mem.read(mem.BaseAddress + 0x02BED7E4, "Double", 0x80, 0x0, 0x520, 0x8, 0x510))
res := floor(mem.read(mem.BaseAddress + 0x02BED7E4, "Double", 0x80, 0x0, 0x520, 0x8, 0x1F00))

DoInputs(res, zoom)
return

CustomClick(x, y, d:=100) {
	Send {Click %x% %y% D}
	Sleep, d
	Send {Click U}
}

DoInputs(r, z) {
	if (r = 768) {
		if (z = 2) {
			Send {Esc Down}       ;open menu
			Sleep, 100
			Send {Esc Up}
			CustomClick(683, 313) ;click video settings
			CustomClick(683, 267) ;click zoom scale		
			CustomClick(683, 502) ;click back
			CustomClick(683, 459) ;click quit to menu
			CustomClick(683, 390) ;click yes
			CustomClick(683, 235) ;click start online game
			CustomClick(683, 161) ;click host
			CustomClick(629, 417) ;click bandit
			CustomClick(683, 508) ;click ready
			CustomClick(683, 508) ;twice
			
			
		} else if (z = 1) {
			Send {Esc Down}       ;open menu
			Sleep, 100
			Send {Esc Up}
			CustomClick(683, 459) ;click quit to menu
			CustomClick(683, 390) ;click yes
			CustomClick(683, 235) ;click start online game
			CustomClick(683, 161) ;click host
			CustomClick(629, 417) ;click bandit
			CustomClick(683, 508) ;click ready
			CustomClick(683, 508) ;twice
		}
	}
	if (r = 900) {
		if (z = 2) {
			Send {Esc Down}       ;open menu
			Sleep, 100
			Send {Esc Up}
			CustomClick(800, 380) ;click video settings
			CustomClick(800, 335) ;click zoom scale
			CustomClick(800, 568) ;click back
			CustomClick(800, 524) ;click quit to menu
			CustomClick(800, 455) ;click yes
			CustomClick(800, 235) ;click start online game
			CustomClick(800, 177) ;click host
			CustomClick(746, 480) ;click bandit
			CustomClick(800, 570) ;click ready
			CustomClick(800, 570) ;twice
			
		} else if (z = 1) {
			Send {Esc Down}       ;open menu
			Sleep, 100
			Send {Esc Up}
			CustomClick(800, 524) ;click quit to menu
			CustomClick(800, 455) ;click yes
			CustomClick(800, 235) ;click start online game
			CustomClick(800, 177) ;click host
			CustomClick(746, 480) ;click bandit
			CustomClick(800, 570) ;click ready
			CustomClick(800, 570) ;twice
		}
	}
	if (r = 1080) {
		if (z = 2) {
			Send {Esc Down}       ;open menu
			Sleep, 100
			Send {Esc Up}
			CustomClick(960, 465) ;click video settings
			CustomClick(960, 418) ;click zoom scale (2x)
			CustomClick(960, 350) ;click zoom scale (3x)
			CustomClick(960, 652) ;click back
			CustomClick(960, 610) ;click quit to menu
			CustomClick(960, 541) ;click yes
			CustomClick(960, 235) ;click start online game
			CustomClick(960, 193) ;click host
			CustomClick(906, 565) ;click bandit
			CustomClick(960, 670) ;click ready
			CustomClick(960, 670) ;twice
		} else if (z = 3) {
			Send {Esc Down}       ;open menu
			Sleep, 100
			Send {Esc Up}
			CustomClick(960, 415) ;click video settings
			CustomClick(960, 350) ;click zoom scale (3x)
			CustomClick(960, 652) ;click back
			CustomClick(960, 610) ;click quit to menu
			CustomClick(960, 541) ;click yes
			CustomClick(960, 235) ;click start online game
			CustomClick(960, 193) ;click host
			CustomClick(906, 565) ;click bandit
			CustomClick(960, 670) ;click ready
			CustomClick(960, 670) ;twice
		} else if (z = 1) {
			Send {Esc Down}       ;open menu
			Sleep, 100
			Send {Esc Up}
			CustomClick(960, 610) ;click quit to menu
			CustomClick(960, 541) ;click yes
			CustomClick(960, 235) ;click start online game
			CustomClick(960, 193) ;click host
			CustomClick(906, 565) ;click bandit
			CustomClick(960, 670) ;click ready
			CustomClick(960, 670) ;twice
		}
	}
}
