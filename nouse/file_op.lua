--file operation
local file_op = {};

--return all content or nil
function file_op.readfile(filepath)
  local content = nil;
  local rfile = io.open(filepath, 'r');
  if rfile ~= nil then
  	content = rfile:read('*all');
  	rfile:close();
  end
  return content;
end

--write success , return 0;
--write failed, return 1;
function file_op.writefile(filepath,strs)
  local wfile=io.open(filepath, "w");
  if wfile ~= nil then
    wfile:write(strs);
  	wfile:flush();
  	wfile:close();
  	return 0;
  else
  	return 1;
  end
end

--readfile line by line 1
function file_op.readfile_by_lines1(filepath)
  local rfile = io.open(filepath, 'r');
  if rfile == nil then
  	return 1, nil;
  end
  local content = "";
  for line in rfile:lines() do
  	content = content..line.."\n";
  end
  return 0, content;
end

--readfile line by line 2
function file_op.readfile_by_lines2(filepath)
  local content = file_op.readfile(filepath);
  if rfile == nil then
  	return 1, nil;
  end
  --content尾部不一定有换行符，记得加上一个，否则会漏掉最后一行
  content = content.."\n";
  local text = "";
  for line in string.gmatch(content, '.-\n') do
  	text = text..line;
  end
  return 0, text;
end