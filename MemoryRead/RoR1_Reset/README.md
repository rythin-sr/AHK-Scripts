# RoR1 Reset
An AHK script that will automatically change your zoom to x1 and start a new Bandit run in Online Multiplayer

## Currently supported resolutions:
 - 1360x768
 - 1366x768
 - 1440x900 (?) (Bandit selection might missclick, not tested)
 - 1600x900
 - 1920x1080* (Only with 3 levels of zoom, my monitor doesn't do 4)
 
## Usage:
 - Make sure you keep classMemory.ahk and reset.ahk in the same directory
 - Run reset.ahk, then press F1 in game to reset
 
Note: Pressing F1 when the game is not running will throw a couple errors and exit the script.


## Editing:
The script executes a set of actions in order. You can change these actions themselves or reorder them
to your liking. These actions are listed in lines 38-43 in reset.ahk

Alternatively instead of changing the actions you can add a new hotkey for a new set of actions.
If you do that, copy-paste everything from "f1::" at line 19 to "return" at line 45, then change the 
hotkey and actions.

The currently supported actions are as follows:

PauseGame() - just presses esc to bring up the menu
 - ChangeZoom(res, zoom) - changes your zoom back to 1x if you are on a higher setting
 - QuitToMenu(res) - quits to menu
 - HostGame(res) - starts a new online game from the main menu
 - JoinGame(res) - waits 3s, then joins a multiplayer game
 - PickBandit(res) - these are pretty self-explainatory
 - PickHAND(res)
 - PickSniper(res)
 - PickChef(res)
 - StartRun(res) - double-clicks Ready to start a run
 - StartCoopRun(res) - waits 3s between clicks to give time for the other person to join

Currently all of these except ChangeZoom() work only in 1x zoom.
