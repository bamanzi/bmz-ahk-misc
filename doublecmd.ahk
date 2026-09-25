
#IfWinActive ahk_class TTOTAL_CMD ahk_exe doublecmd.exe

;; NOTE: Command Line should be visible on Double Commander UI
doublecmd_get_path_of_selected_item(includeFilename=false)
{
	;; clean command line
	ControlSetText,Edit1

	if includeFilename
		;; default keybinding for cm_AddPathAndFilenameToCmdLine
		Send,^+{Enter}
	else
		Send,^p

	ControlGetText,selpath,Edit1

	;; remove trailing space
	selpath := RTrim(selpath)
	if includeFilename
		OutputDebug,[doublecmd] selected file: %selpath%
	else
		OutputDebug,[doublecmd] current path: %selpath%

	;; clean command line
	;;ControlSetText,Edit1

	if FileExist(selpath)
		return selpath
	else
		OutputDebug,[doublecmd] not an existing file: %selpath%
}

doublecmd_open_selected_file_with(cmdline)
{
	selpath := doublecmd_get_path_of_selected_item(true)

	OutputDebug,try to launching: %cmdline% "%selpath%"
	Run,%cmdline% "%selpath%
}

^F4::
	doublecmd_open_selected_file_with("D:\wintools\F4Menu.exe")
	return

F12 & n::
	doublecmd_open_selected_file_with("D:\wintools\notepad++\notepad++.exe")
	return

F12 & c::
	doublecmd_open_selected_file_with("D:\Programs\CudaText\cudatext.exe")
	return

F12 & g::
	doublecmd_open_selected_file_with("D:\Programs\geany\geany.exe")
	return

F12 & e::
	doublecmd_open_selected_file_with("emacsclient.exe")
	return

#IfWinActive