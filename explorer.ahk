;; Windows Explorer

#IfWinActive ahk_class CabinetWClass

explorer_get_current_path(hwnd_explorer)
{
	for _instance in ComObjCreate("Shell.Application").Windows
	{
		hwnd1 := _instance.hwnd
		path1 := _instance.Document.Folder.Self.Path
		OutputDebug, ComObjCreate("Shell.Application"): [%hwnd1%] %path1%

		;; we need to convert hwnd to int before comparing
		if (hwnd_explorer + 0 == hwnd1) {
			if FileExist(path1)
				return path1
			else
				MsgBox,Sorry, not a valid path: `n`n%path1%
		}
	}
}


;; find files with Everything
^f::
	WinGet, hwnd_explorer, ID, A
	curpath := explorer_get_current_path(hwnd_explorer)
	if curpath<>
		Run,"C:\Program Files\Everything\Everything.exe" -path "%curpath%"
	return

;; grep text with dnGrep
!F7::
	WinGet, hwnd_explorer, ID, A
	curpath := explorer_get_current_path(hwnd_explorer)

	if curpath
		Run,D:\wintools\dngrep\dngrep.exe /f "%curpath%"
	return
#IfWinActive