;; xplorer2 (lite)

#IfWinActive ahk_class ATL:ExplorerFrame
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

^f::
    ; ....
    Run,"C:\Program Files\Everything\Everything.exe" -path "%curpath%"
return

#IfWinActive