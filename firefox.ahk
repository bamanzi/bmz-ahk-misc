;; Firefox


#IfWinActive ahk_class MozillaWindowClass

;; show 'List all tabs' menu (invoke Ctrl+Shift+Tab)
;; (you need to turn on 'Ctrl+Tab cycles through tabs in recently used order'
;; in Settings > General > Tabs, otherwise it just switch tab backwards)
^`::
	Send,^+{Tab}
	return

#IfWinActive