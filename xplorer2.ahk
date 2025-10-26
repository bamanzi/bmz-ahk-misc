;; xplorer2 (lite)

#include _utils.ahk

#IfWinActive ahk_class ATL:ExplorerFrame

;; find text with dnGrep
!F7::
   WinGet, hwnd_x2, ID, A
   rebar := Favmenu_FindWindowExId(hwnd_x2,  "ReBarWindow32", 0)
   toolwin := Favmenu_FindWindowExID(rebar, "ToolbarWindow32", 60160)
   combo := Favmenu_FindWindowExID(toolwin, "ComboBox", 0)

	if (combo)
	{
		ControlGetText, curpath, ComboBox1, ahk_id %hwnd_x2%
		;MsgBox,%curpath%
		Run,D:\wintools\dngrep\dngrep.exe /f "%curpath%"
	} else {
		MsgBox,Failed to get current path of xplorer2!
	}
return

;; find files with Everything
^f::
	WinGet, hwnd_x2, ID, A
	ControlGetText, curpath, ComboBox1, ahk_id %hwnd_x2%
	if curpath<>
		Run,"C:\Program Files\Everything\Everything.exe" -path "%curpath%"
return


;;
F3::
	;; set focus to address bar
	Send,{F10}

	Send,{Backspace}{Backspace}

	SendInput,> D:\wintools\UniversalViewer\Viewer.exe $F

	Send,{Enter}
return

F4::
	;; set focus to address bar
	Send,{F10}

	Send,{Backspace}{Backspace}

	SendInput,> D:\wintools\BowPad.exe $F

	Send,{Enter}
return
#IfWinActive