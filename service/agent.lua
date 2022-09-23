local skynet = require "skynet"
local socket = require "skynet.socket"


local clientfd, addr = ...


local function dispatch_msg(data)

end

-- agent 是玩家的代理服务，可以处理玩家收到的网络数据，心跳，玩家登录消息, 当然具体的可以自己选择
skynet.start(function ()
	skynet.error("recv player msg")
	clientfd = tonumber(clientfd)
	socket.start(clientfd)
	skynet.fork(function ()
		while true do
			local data = socket.readline(clientfd)
			dispatch_msg(data)
		end
	end)
end)
