-- UserLuaScript.lua
-- =================

-- This file contains user-defined Lua functions
-- You are encouraged to add your own custom functions here!

function CloseRightTabs()
	local file_cur=props["FilePath"]
	scite.MenuCommand(IDM_NEXTFILE)

	while props["FilePath"]~=file_cur do
		scite.MenuCommand(IDM_CLOSE)
	end
end