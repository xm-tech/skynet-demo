local skynet = require "skynet"

local function dump(res)
    local getIndent, quoteStr, wrapKey, wrapVal, dumpObj
    getIndent = function(level)
        return string.rep("\t", level)
    end
    quoteStr = function(str)
        return '"' .. string.gsub(str, '"', '\\"') .. '"'
    end
    wrapKey = function(val)
        if type(val) == "number" then
            return "[" .. val .. "]"
        elseif type(val) == "string" then
            return "[" .. quoteStr(val) .. "]"
        else
            return "[" .. tostring(val) .. "]"
        end
    end
    wrapVal = function(val, level)
        if type(val) == "table" then
            return dumpObj(val, level)
        elseif type(val) == "number" then
            return val
        elseif type(val) == "string" then
            return quoteStr(val)
        else
            return tostring(val)
        end
    end
    dumpObj = function(_res, level)
        if type(_res) ~= "table" then
            return wrapVal(_res)
        end
        level = level + 1
        local tokens = {}
        tokens[#tokens + 1] = "{"
        for k, v in pairs(_res) do
            tokens[#tokens + 1] = getIndent(level) .. wrapKey(k) .. " = " .. wrapVal(v, level) .. ","
        end
        tokens[#tokens + 1] = getIndent(level - 1) .. "}"
        return table.concat(tokens, "\n")
    end
    return dumpObj(res, 0)
end



skynet.start(function ()
	local mysql_conf = require "mysql_conf"
	local mysql = require "skynet.db.mysql"
	print(mysql_conf.host, mysql_conf.user, mysql_conf.password, mysql_conf.port, mysql_conf.db, mysql_conf.charset)

	local function on_connect(db)
		print("on_connect exec")
		db:query("set charset " .. mysql_conf.charset)
	end
	local db = mysql.connect({
		host=mysql_conf.host,
		port=mysql_conf.port,
		database=mysql_conf.db,
		user=mysql_conf.user,
		password=mysql_conf.password,
                charset=mysql_conf.charset,
		max_packet_size = 1024 * 1024,
		on_connect = on_connect
	})

	if not db then
		print("failed to conn mysql")
	end
	print("conn to mysql succ")
	local cats = db:query("select id,name from cats")
	print("cats:\n")
	print(dump(cats))

	db:query("delete from cats where name is NULL")
	local stmp_insert = db:prepare("insert into cats(`id`,`name`) values(?,?)")
	local r = db:execute(stmp_insert, 4, 'guagua')
	print("insert cats, res:", r.insert_id, r.affected_rows, r.server_status, r.warning_count)
end)
