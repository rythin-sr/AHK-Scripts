#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

SetKeyDelay,, 50
SetTitleMatchMode, 2
#SingleInstance Force

f1::
	ControlSend, FoxitDocWnd1, ^{PgDn}, Foxit Reader
	return

f2::
	ControlSend, FoxitDocWnd1, ^{PgUp}, Foxit Reader
	return
