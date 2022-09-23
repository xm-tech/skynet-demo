local skynet = require "skynet"
local socket = require "skynet.socket"

skynet.start(function ()
	skynet.error("service main start")

	-- start debug_console service
	local debug_console_port = skynet.getenv("debug_console_port")
	skynet.error("debug_console_port", debug_console_port)
	if debug_console_port then
		skynet.newservice("debug_console", tonumber(debug_console_port))
	end

	-- 监听 9999 端口, 返回服务端 fd
	local fd = socket.listen("127.0.0.1", 9999)
	-- 注册监听到的客户端连接的回调函数
	socket.start(fd, function (clientfd, addr)
		-- 每收到1个客户端连接， 开启一个 agent 服务，去处理该客户端网络数据包
		skynet.newservice("agent", clientfd, addr)
	end)

	skynet.exit()

end)
