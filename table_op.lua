--table operation
local table_op = {};

--判断table中知否有某个值
function table_op.contain(table, value)
  for key, val in pairs(table) do
    if val == value then
      return true;
    end
  end
  return false;
end

function table_op.recurse_contain(table, value)
  for key,val in pairs(table) do
    if val == value then
      return true;
    end
    if type(val) == 'table' then
      local result = table_op.recurse_contain(val, value);
      if result ~= false then
        return result;
      end
    end
  end
  return false;
end

--将table转换成字符串，table必须为key value形式，且key和value都必须是字符串<br/>
function table_op.to_str(table)
  local tmp = "";
  for key, val in pairs(table) do
    tmp = tmp..val.." ";
  end
  return tmp;
end

--判断table是否为空
function table_op.table_is_empty(t)
    return _G.next( t ) == nil
end

--获取table元素个数
function table_op.get_length(tb)
  local counter = 0;
  for key, val in pairs(tb) do
    counter = counter+1;
  end
  return counter;
end

-- 获取table的key对应的值 <br/>
-- 如果找到则直接返回,如果没有,返回nil
function table_op.get_table_value(table, m_key)
  for key, val in pairs(table) do
    if key == m_key then
      return val;
    end
    if type(val) == "table" then
      local result = table_op.get_table_value(val, m_key);
      if result ~= nil then
        return result;
      end
    end
  end
  return nil;
end

return table_op;
