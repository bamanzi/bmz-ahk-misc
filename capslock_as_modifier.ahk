

;; https://www.autohotkey.com/board/topic/51959-using-capslock-as-another-modifier-key/
$*Capslock::
Gui, 99:+ToolWindow
Gui, 99:Show, x-1 w1 NoActivate, Capslock Is Down
keywait, Capslock
Gui, 99:Destroy
return

#If WinExist("Capslock Is Down") ;;and (GetKeyState("ScrollLock", "T")==1)
	/::CapsLock

;; --8< --   mimic some readline keys
	a::Home
	e::End

	b::Send,^{Left}
	f::Send,^{Right}

	;; delete a word
	d::
		Send,+^{Right}
		Send,{Delete}
		return
	;; kill-line
	k::
		Send,+{End}
		Send,{Delete}
		return
	u::
		Send,+{Home}
		Send,{Delete}
		return
;; -->8 --

	;; copy (Ctrl+Insert)
	c::Send,^{Insert}
	;; paste (Shift+Insert)
	v::Send,+{Insert}


    1::F11
	2::F12
	3::F13
	4::F14
	5::F15
	6::F16
	7::F17
	8::F18
	9::F19
	0::F20
	F1::F21
	F2::F22
	F3::F23
	F4::F24


	;; shorthands for Win+Ctrl+Alt+?
	q::>!^#q
	s::>!^#s
	w::>!^#w
	z::>!^#z
	x::>!^#x

	Tab::AppsKey

`::ScrollLock

;#If
;#If WinExist("Capslock Is Down") and (GetKeyState("ScrollLock", "T")==0)

+e::
	WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe msedge.exe,,独立翻译窗口
	return

+w::
	WinActivate, ahk_class MozillaWindowClass ahk_exe waterfox.exe
	return

+c::
	WinActivate, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	return

+d::
	WinActivate, ahk_class TTOTAL_CMD ahk_exe doublecmd.exe
	return

;`::ScrollLock
+`::
	spec = ahk_class AutoHotkeyGUI ahk_exe winspy64.exe
	if not WinExist(spec)
		Run,D:\devtools\winspy\winspy-ahk\WinSpy64.exe
	else
		WinActivate,%spec%
	return
#If
