;; dexpot virtual desktop manager
;; https://dexpot.de/index.php?id=download

;; command line options: https://dexpot.de/forum/viewtopic.php?t=1914

<#1::Run,d:\wintools\dexpot\dexpot.exe -w 1
<#2::Run,d:\wintools\dexpot\dexpot.exe -w 2
<#3::Run,d:\wintools\dexpot\dexpot.exe -w 3
<#4::Run,d:\wintools\dexpot\dexpot.exe -w 4

<#Left::Run,d:\wintools\dexpot\dexpot.exe -prev
<#Right::Run,d:\wintools\dexpot\dexpot.exe -next

;; Desktop Windows (switcher)
<#!space::Run,d:\wintools\dexpot\dexpot.exe -f

;; Window catalog (thumbnails of all windows on current desktop)
<#Enter::
    TrayTip,dexpot window catalog, Middle click to switch to show all desktops
	Run,d:\wintools\dexpot\dexpot.exe -d
	return

;; Full-screen preview (show all desktops, each showing current application)
<#!Enter::
	TrayTip,dexpot window catalog, On each desktop`, middle click to switch to show all desktops`, right click to toggle single/all window mode
	Run,d:\wintools\dexpot\dexpot.exe -V
	return


;; configure mywechsel.ini
;; https://dexpot.de/forum/viewtopic.php?f=21&t=1915
;; TODO: generate some examples
#IfWinActive Desktop Rules - Dexpot ahk_class ThunderRT6FormDC
^o::
	Run,notepad.exe d:\wintools\dexpot\mywechsel.ini
	return
#IfWinActive
#IfWinActive Settings - Dexpot ahk_class ThunderRT6FormDC
^o::
	Run,notepad.exe d:\wintools\dexpot\mywechsel.ini
	return
#IfWinActive