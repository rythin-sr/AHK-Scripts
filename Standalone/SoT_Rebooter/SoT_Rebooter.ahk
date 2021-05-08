#NoEnv
SendMode Input 

Up::
	Process, Exist, PrinceOfPersia.EXE
	if ErrorLevel 
		Process, Close, POP.EXE
		HasClosed = 1
	
	loop {
		Process, Exist, PrinceOfPersia.EXE
		if (ErrorLevel = 0) { 
			Run, D:\Steam\steamapps\common\Prince of Persia The Sands of Time\PrinceOfPersia.EXE
			HasClosed = 0
			continue
		} else if (%HasClosed% = 0) {
			Process, Exist, POP.EXE
			if (ErrorLevel and WinExist("Prince of Persia" "ahk_class #32770")) {
				WinActivate
				WinGetPos,,,,h,
				if (%h% < 200) {
					Send {Right}
					Send {Enter}
					return
				} else {
					return
				}
			}
		}
	}
