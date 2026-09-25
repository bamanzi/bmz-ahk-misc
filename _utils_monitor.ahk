;; move active window to current monitor (where mouse cursor is)
;; by send Win+Shift+Left/Right
MoveWindowToCurrentMonitor()
{
	;state := GetKeyState("ScrollLock", "T")
	;if (state>0)
	;{
		Sleep,500
		OutputDebug,scrolllock on - move target window to current monitor
		monitors := GetMonitorRects()
		WinGetPos, X, Y, W, H, A
		x1 := x + W / 2
		y1 := y + H / 2
		winMon := PointInWhichMonitor(x1, y1, monitors)
		OutputDebug,window monitor: %winMon%

		MouseGetPos, xpos, ypos
		mouseMon := PointInWhichMonitor(xpos, ypos, monitors)
		OutputDebug,mouse monitor: %mouseMon% (xpos=%xpos%, ypos=%ypos%)
		if (mouseMon == winMon)
		{
			return
		}
		else if (mouseMon < winMon)
		{
			Send,+#{Left}
			;; in case: mouseMon=1, winMon=4
			MoveWindowToCurrentMonitor()
		}
		else
		{
			Send,+#{Right}
			;; in case: mouseMon=4, winMon=1
			MoveWindowToCurrentMonitor()
		}
	;}
}

GetMonitorRects()
{
    monitors := []

    SysGet, count, MonitorCount
	Loop %count%
    {
        SysGet, rect, Monitor, %A_Index%
        OutputDebug, Monitor %A_Index%: top=%rectTop%, right=%rectRight%, bottom=%rectBottom%
        monitor := {}
        monitor.Left := rectLeft
        monitor.Top := rectTop
        monitor.Right := rectRight
        monitor.Bottom := rectBottom
        monitors.Push(monitor)
    }
    return monitors
}

IsPointInMonitor(ptX, ptY, monitor)
{
	return (ptX >= monitor.Left && ptX <= monitor.Right && ptY >= monitor.Top && ptY <= monitor.Bottom)
}

PointInWhichMonitor(ptX, ptY, monitors)
{
	for index, monitor in monitors
	{
		if IsPointInMonitor(ptX, ptY, monitor)
			return index
	}

	return -1
}

