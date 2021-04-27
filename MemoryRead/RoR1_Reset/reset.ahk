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

; read a pointer - mem.BaseAddress is automatically set to the base address.
zoom := floor(mem.read(mem.BaseAddress + 0x02BED7E4, "Double", 0x80, 0x0, 0x520, 0x8, 0x510))
res := floor(mem.read(mem.BaseAddress + 0x02BED7E4, "Double", 0x80, 0x0, 0x520, 0x8, 0x1F00))

PauseGame()
ChangeZoom(res, zoom)
QuitToMenu(res)
HostGame(res)
PickBandit(res)
StartRun(res)

return

CustomClick(x, y, d:=65) {
	Send {Click %x% %y% D}
	Sleep, d
	Send {Click U}
}

PauseGame() {
	Send {Esc Down} ;open menu
	Sleep, 65
	Send {Esc Up}
}

ChangeZoom(r, z) { ; if zoom > 1 change the zoom to 1 and return to first menu page
	if (z > 1) {
		if (r = 768) {
			CustomClick(683, 313) ; go to settings
			CustomClick(683, 267) ; zoom 2 -> 1
			CustomClick(683, 502) ; back
		} else if (r = 900) {
			CustomClick(800, 380) ; go to settings
			CustomClick(800, 335) ; zoom 2 -> 1
			CustomClick(800, 568) ; back
		} else if (r = 1080) {    
			if (z = 2) {
				CustomClick(960, 465) ; go to settings
				CustomClick(960, 418) ; zoom 2 -> 3
				CustomClick(960, 350) ; zoom 3 -> 1
				CustomClick(960, 652) ; back
			} else if (z = 3) {
				CustomClick(960, 415) ; go to settings
				CustomClick(960, 350) ; zoom 3 -> 1
				CustomClick(960, 652) ; back
			}
		}
	}
}

QuitToMenu(r) {
	if (r = 768) {
		CustomClick(683, 459) ; quit to menu
		CustomClick(683, 390) ; yes
	} else if (r = 900) {
		CustomClick(800, 524) ; quit to menu
		CustomClick(800, 455) ; yes
	} else if (r = 1080) {
		CustomClick(960, 610) ; quit to menu
		CustomClick(960, 541) ; yes
	}
}

HostGame(r) {
	if (r = 768) {
		CustomClick(683, 235) ; start online game
		CustomClick(683, 161) ; host
	} else if (r = 900) {
		CustomClick(800, 235) ; start online game
		CustomClick(800, 177) ; host
	} else if (r = 1080) {
		CustomClick(960, 235) ; start online game
		CustomClick(960, 193) ; host
	}
}

JoinGame(r) {
	if (r = 768) {
		CustomClick(683, 235) ; start online game
		Sleep, 3000           ; wait 3s
		CustomClick(683, 274) ; join game
	} else if (r = 900) {
		CustomClick(800, 235) ; start online game
		Sleep, 3000           ; wait 3s
		CustomClick(800, 290) ; join game
	} else if (r = 1080) {
		CustomClick(960, 235) ; start online game
		Sleep, 3000           ; wait 3s
		CustomClick(960, 299) ; join game
	}
}

PickBandit(r) {
	if (r = 768) {
		CustomClick(629, 417) ; pick bandit
	} else if (r = 900) {
		CustomClick(746, 480) ; pick bandit
	} else if (r = 1080) {
		CustomClick(906, 565) ; pick bandit
	}
}
PickSniper(r) {
	if (r = 768) {
		CustomClick(775, 417) ; pick sniper
	} else if (r = 900) {
		CustomClick(892, 1051) ; pick sniper
	} else if (r = 1080) {
		CustomClick(906, 565) ; pick sniper
	}
}

PickChef(r) {
	if (r = 768) {
		CustomClick(870, 417) ; pick chef
	} else if (r = 900) {
		CustomClick(988, 480) ; pick chef
	} else if (r = 1080) {
		CustomClick(1148, 565) ; pick chef
	}
}

PickHAND(r) {
	if (r = 768) {
		CustomClick(687, 417) ; pick han-d
	} else if (r = 900) {
		CustomClick(807, 480) ; pick han-d
	} else if (r = 1080) {
		CustomClick(966, 565) ; pick han-d
	}
}

StartRun(r) {
	if (r = 768) {
		CustomClick(683, 508) ; ready
		CustomClick(683, 508) ; needs to be clicked twice
	} else if (r = 900) {
		CustomClick(800, 570) ; ready
		CustomClick(800, 570) ; needs to be clicked twice
	} else if (r = 1080) {
		CustomClick(960, 670) ; ready
		CustomClick(960, 670) ; needs to be clicked twice
	}
}

StartCoopRun(r) {
	if (r = 768) {
		CustomClick(683, 508) ; ready
		Sleep, 3000           ; wait 3s (co-op partner should have joined by then, adjust if necessary)
		CustomClick(683, 508) ; click ready again to start the game
	} else if (r = 900) {
		CustomClick(800, 570) ; ready
		Sleep, 3000           ; wait 3s (co-op partner should have joined by then, adjust if necessary)
		CustomClick(800, 570) ; click ready again to start the game
	} else if (r = 1080) {
		CustomClick(960, 670) ; ready
		Sleep, 3000           ; wait 3s (co-op partner should have joined by then, adjust if necessary)
		CustomClick(960, 670) ; click ready again to start the game
	}
}
