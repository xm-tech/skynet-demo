local skynet = require "skynet"

skynet.start(function ()
	skynet.error("service main start")

	-- start debug_console service
	local debug_console_port = skynet.getenv("debug_console_port")
	skynet.error("debug_console_port", debug_console_port)
	if debug_console_port then
		skynet.newservice("debug_console", tonumber(debug_console_port))
	end
end)
