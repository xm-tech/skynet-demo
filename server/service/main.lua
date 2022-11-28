local skynet = require "skynet"
local conf = require "system"

skynet.start(function ()
	skynet.error("service main start")

	-- start debug_console service
	skynet.newservice("debug_console", conf.debug_console_port)

	skynet.exit()

end)
