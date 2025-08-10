; Iterate through controls with the same class, find the one with ctrlID and return its handle
; Used for finding a specific control on a dialog
FavMenu_FindWindowExID(dlg, className, ctrlId)
{
	local ctrl, id

	ctrl = 0
	Loop
	{
		ctrl := DllCall("FindWindowEx", "uint", dlg, "uint", ctrl, "str", className, "uint", 0 )
		if (ctrlId = "0")
		{
			return ctrl
		}

		if (ctrl != "0")
		{
			id := DllCall( "GetDlgCtrlID", "uint", ctrl )
			if (id = ctrlId)
				return ctrl
		}
		else
			return 0
	}
}


;; Different from WinActivate, activate_or_launch_app would:
;; - launch application if window not found,
;; - switch between multiple windows

;; if window not exist, launch it (run 'launchCmd' or 'appExe';
;; if window exist
;;     if multiple window found, switch between them;
;;     if only one window, activate it

;; turn on this to make windows on other Virtual Desktop visible to WinExist/WinGet/WinActivate
DetectHiddenWindows,On

activate_or_launch_app(wndTitle, wndClass:="", appExe:="", launchCmd:="nircmd wait 50", excludeTitle:="")
{
	wnd_spec := wndTitle
	if wndClass
		wnd_spec := wnd_spec . " ahk_class " . wndClass
	if appExe
		wnd_spec := wnd_spec . " ahk_exe " . appExe

	if not wnd_spec
	{
		OutputDebug,activate_or_launch_app(): error: no argument given for window
		return
	}

	if not WinExist(wnd_spec, ,excludeTitle)
	{
		if not launchCmd
			launchCmd := appExe

		if launchCmd
		{
			Run,%launchCmd%
		}
		else
			OutputDebug,activate_or_launch_app(): error: At lease one argument of 'appExe' or 'launchCmd' should be given.

	} else
	{
		WinGet,allHwnds,List,%wnd_spec%
		if (allHwnds>1)
		{
			;; switch between multiple windows of same application
			curHwnd := WinActive("A")

			Loop, %allHwnds%
			{
				thisHwnd := allHwnds%A_Index%

				if (curHwnd == thisHwnd)
				{
					OutputDebug,current window belongs to target, we'll activate other window.
					WinActivateBottom, %wnd_spec%, %excludeTitle%
					return
				}
			}
		}
		WinActivate, %wnd_spec%, %excludeTitle%
	}
}