RoR1 Auto-Reset script.
Will automatically change your zoom to x1 and start a new Bandit run in Online Multiplayer

Currently supported resolutions:
 - 1360x768
 - 1366x768
 - 1440x900 (?) (Bandit selection might missclick, not tested)
 - 1600x900
 - 1920x1080* (Only with 3 levels of zoom, my monitor doesn't do 4)
 
Usage:
 - Make sure you keep classMemory.ahk and reset.ahk in the same directory
 - Run reset.ahk, then press F1 in game to reset
 
Note: Pressing F1 when the game is not running will throw a couple errors and exit the script.


Editing:
You can edit the way the script works by simply replacing the coordinates in the correct CustomClick.
All of them have comments next to them so it should be fairly easy to know which ones to replace.
Generally what you might be replacing:

  | Bandit | Sniper | Chef 
---|---|---|---
 x (768p) | 629 | 775 | 870 
 y (768p) | 417 | 417 | 417 
 x (900p) | 746 | 892 | 988 
 y (900p) | 480 | 480 | 480 
 x (1080p) | 906 | 1051 | 1148 
 y (1080p) | 565 | 565 | 565 
 
(I cba looking for the coords of the join game button do it yourself)
