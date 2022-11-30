local skynet = require "skynet"
-- will search system.lua in the config.lua_path
local sys_conf = require "system_conf"

skynet.start(function ()
	skynet.error("service main start")

	skynet.newservice("debug_console", sys_conf.debug_console_port)
end)
