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


xplorer2_open_selected_file_with(exepath)
{
	;; set focus to address bar
	Send,{F10}

	Send,{Backspace}{Backspace}

	SendInput,> %exepath% $F

	Send,{Enter}
}

;;
F3::
	xplorer2_open_selected_file_with("D:\wintools\UniversalViewer\Viewer.exe")
	return

F4::
	xplorer2_open_selected_file_with("D:\wintools\F4Menu.exe -d")
	return

F12 & n::
	xplorer2_open_selected_file_with("D:\wintools\notepad++\notepad++.exe")
	return

F12 & c::
	xplorer2_open_selected_file_with("D:\Programs\CudaText\cudatext.exe")
	return

F12 & g::
	xplorer2_open_selected_file_with("D:\Programs\geany\geany.exe")
	return

F12 & e::
	xplorer2_open_selected_file_with("emacsclient.exe")
	return


#IfWinActive