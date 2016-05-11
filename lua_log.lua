--
-- Created by IntelliJ IDEA.
-- User: zeroknight
-- Date: 2016/5/11
-- Time: 20:58
-- Description: this module is used to show log.

lua_log = {};


lua_log.level = 0;    --log level, more bigger, less print; when 0, print all.
lua_log.filepath = nil;   --output log file, need set.
lua_log.logfile = nil;

lua_log.ERROR = 1;
lua_log.WARN = 2;
lua_log.DEBUG = 3;
lua_log.VERBOSE = 4;
lua_log.INFO = 5;

local function log_write(...)
  if lua_log.filepath == nil or lua_log.logfile == nil then
    io.stderr:write(...)
    return ;
  end
  lua_log.logfile:write(...);
end

local function log_print(logtype, str)
  local time = os.date("[%Y-%m-%d %H:%M:%S] ");
  log_write(time, logtype, str);
  log_write('\n');
end

function lua_log.setOutputFile(filepath)
  lua_log.filepath = filepath;
  lua_log.logfile = io.open(lua_log.filepath, 'w');
end

function lua_log.closeOutputFile()
  if lua_log.logfile ~= nil then
    lua_log.logfile:close();
  end
end

function lua_log.setLevel(level)
  lua_log.level = level;
end

function lua_log.info(...)
  log_print('[INFO]: ', ...);
end

function lua_log.verbose(...)
  if lua_log.level > lua_log.VERBOSE then
    return ;
  end
  log_print('[VERBOSE]: ', ...);
end

function lua_log.debug(...)
  if lua_log.level > lua_log.DEBUG then
    return
  end
  log_print('[DEBUG]: ', ...);
end

function lua_log.warn(...)
  if lua_log.level > lua_log.WARN then
    return
  end
  log_print('[WARN]: ', ...);
end

function lua_log.error(...)
  if lua_log.level > lua_log.ERROR then
    return
  end
  log_print('[ERROR]: ', ...);
end

return lua_log;


