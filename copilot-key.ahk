;; COPILOT key is actually LWin+LShift+F23
;;
;; When any 'F23 & xxx' combination registered with AutoHotkey,
;; COPILOT key then can use recognized with Win+Shift modifier.
;; For example, 'F23 + u' would be 'Win+Shift+U', which would be acceptable in most applications.

F23 & F23::
	;; no actual function, just to change COPILOT into modifier Win+Shift
	MsgBox,%A_ThisHotkey%
	return


