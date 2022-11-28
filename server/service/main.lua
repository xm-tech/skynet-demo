local skynet = require "skynet"
-- will search system.lua in the config.lua_path
local sys_conf = require "system"

skynet.start(function ()
	skynet.error("service main start")

	-- start debug_console service
	skynet.newservice("debug_console", sys_conf.debug_console_port)

end)
