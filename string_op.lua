--string operation
local string_op = {};

--将字符串分割成字符数组, 这个接口不会保留空白行
--@param s 要分割的字符串
--@param p 用于分割的字符
function string_op.split(s, p)
  local rt= {};
  string.gsub(s, '[^'..p..']+', function(w) table.insert(rt, w) end );
  return rt;
end

--将字符串分割成字符数组, 这个接口会保留空白行
--@param str 要分割的字符串
--@param split_char 用于分割的字符
function string_op.new_split(str, split_char)      
  local sub_str_tab = {};  
  while (true) do          
    local pos = string.find(str, split_char);    
    if (not pos) then              
      local size_t = table.getn(sub_str_tab)  
      table.insert(sub_str_tab, size_t+1, str);  
      break;
    end  
    local sub_str = string.sub(str, 1, pos - 1);                
    local size_t = table.getn(sub_str_tab)  
    table.insert(sub_str_tab, size_t+1, sub_str);  
    local t = string.len(str);  
    str = string.sub(str, pos + 1, t);     
  end      
  return sub_str_tab;
end 

--去掉首尾的空格符
function string_op.trim(str)
  if str == nil then
    return nil;
  end
  local result, _ = string.gsub(str,"^%s*(.-)%s*$","%1");
  return result;
end

--判断字符串是否为空
function string_op.is_empty(str)
  if str == nil or string_op.trim(str) == ''  then
    return true;
  end
  return false;
end

--判断某个字符串是否以某个字符串开头
function string_op.start_with(str, fstr)
  local pstart, pend = string.find(str,fstr..".*");
  return pstart ~= nil;
end

--将nil转为'nil'
function string_op.trans_nil(str)
  if str==nil then return 'nil' end;
  return str;
end

return string_op;
