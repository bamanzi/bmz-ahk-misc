
#IfWinActive ahk_class EVERYTHING

!g::
	global FavMenu_dlgHWND
	WinGet,FavMenu_dlgHWND,ID,A

	selpath := FavMenu_DialogGetPath_Everything()
	if selpath<>
	{
		OutputDebug,found Everything selected row: %selpath%
		Run,D:\wintools\doublecmd\doublecmd.exe --client "%selpath%"
	}
	return

FavMenu_DialogGetPath_Everything()
{
	global FavMenu_dlgHWND
	ControlGet,rows,List,Focused,SysListView321, ahk_id %FavMenu_dlgHWND%
	;OutputDebug,found Everything selected row(s): %rows%

	Loop Parse, rows, `n
	{
		cols := StrSplit(A_LoopField, A_Tab)
		Loop % cols.Length()
		{
			path := cols[A_Index]
			if SubStr(path, 2, 1)=":"
			{
				OutputDebug,found Everything column: COL%A_Index%: %path%
				return path
			}
		}
	}
	;TrayTip, "Could not get the folder name. Make sure you haven't hide the statusbar of Everything, and have ONE select in the list."
}