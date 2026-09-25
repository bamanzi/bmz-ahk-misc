
#IfWinActive ahk_class EVERYTHING

!g::
	WinGet,dlgHWND,ID,A

	selpath := Everything_get_path_of_selected_item(dlgHWND, true)
	if selpath<>
	{
		OutputDebug,found Everything selected row: %selpath%
		Run,D:\wintools\doublecmd\doublecmd.exe --client "%selpath%"
	}
	return

^g::
	WinGet,dlgHWND,ID,A

	selpath := Everything_get_path_of_selected_item(dlgHWND, true)
	if selpath<>
	{
		OutputDebug,found Everything selected row: %selpath%
		if InStr(FileExist(selpath), "D")
			Run,D:\wintools\xplorer2\xplorer2_lite.exe /1 "%selpath%"
		else {
			SplitPath,selpath, namepart, dirpart
			Run,D:\wintools\xplorer2\xplorer2_lite.exe /1 "%dirpart%"
		}

	}
	return

Everything_get_path_of_selected_item(dlgHWND, includeFilename=false)
{
	ControlGet,rows,List,Focused,SysListView321, ahk_id %dlgHWND%
	;OutputDebug,found Everything selected row(s): %rows%

	Loop Parse, rows, `n
	{
		cols := StrSplit(A_LoopField, A_Tab)
		Loop % cols.Length()
		{
			selpath := cols[A_Index]
			if SubStr(selpath, 2, 1)=":"
			{
				fname := cols[1]
				OutputDebug,found Everything column: COL%A_Index%: %selpath%
				if includeFilename
					;; FIXME: this only works when FILENAME is the first column
					return selpath . "/" . cols[1]
				else
					return selpath
			}
		}
	}
	;TrayTip, "Could not get the folder name. Make sure you haven't hide the statusbar of Everything, and have ONE select in the list."
}


everything_open_selected_file_with(cmdline)
{
	WinGet,dlgHWND,ID,A
	selpath := Everything_get_path_of_selected_item(dlgHWND, true)

	if selpath<>
	{
		OutputDebug,try to launching: %cmdline% "%selpath%"
		Run,%cmdline% "%selpath%"
	}
}


F3::
	everything_open_selected_file_with("D:\wintools\UniversalViewer\Viewer.exe")
	return

F4::
	everything_open_selected_file_with("D:\wintools\F4Menu.exe -d")
	return

^F4::
	everything_open_selected_file_with("D:\wintools\F4Menu.exe")
	return

F12 & n::
	everything_open_selected_file_with("D:\wintools\notepad++\notepad++.exe")
	return

F12 & c::
	everything_open_selected_file_with("D:\Programs\CudaText\cudatext.exe")
	return

F12 & g::
	everything_open_selected_file_with("D:\Programs\geany\geany.exe")
	return

F12 & e::
	everything_open_selected_file_with("emacsclient.exe")
	return
#IfWinActive