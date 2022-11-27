local skynet = require "skynet"
local system_conf = require "conf.system"

skynet.start(function ()
	skynet.error("service main start")

	-- start debug_console service
	skynet.newservice("debug_console", system_conf.debug_console_port)

	skynet.exit()

end)
