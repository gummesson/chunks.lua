--
-- # Chunks
--
-- A super duper, teeny tiny functional library for Lua.
--
-- **License:** MIT  
--  **Source:** [GitHub](https://github.com/gummesson/chunks.lua)
--

-- ## References

local table, pairs, type = table, pairs, type

-- ## Chunks
--
-- The namespace.
--
local Chunks = {}

-- ### Collections

-- #### Chunks.each
--
-- Execute the `iterator` on every item in the `tbl`.
--
-- The base function used in nearly all of `Chunks`'s other functions.
--
-- - `tbl`      is a table.
-- - `iterator` is a function.
--
function Chunks.each(tbl, iterator)
  for key, val in pairs(tbl) do
    iterator(val, key)
  end
end

-- #### Chunks.map
--
-- Return a new and transformed table by executing the `iterator`
-- on every item in the `tbl`.
--
-- - `tbl`      is a table.
-- - `iterator` is a function.
--
function Chunks.map(tbl, iterator)
  local results = {}
  Chunks.each(tbl, function(v, k, t)
    table.insert(results, iterator(v, k, t))
  end)
  return results
end

-- #### Chunks.filter
--
-- Return a new table by executing the `iterator` on every item in
-- the `tbl`. Only the items that evalute to `true` in the `iterator`
-- will be added to the table.
--
-- - `tbl`      is a table.
-- - `iterator` is a function.
--
function Chunks.filter(tbl, iterator)
  local results = {}
  Chunks.each(tbl, function(v, k, t)
    if iterator(v, k, t) then
      table.insert(results, v)
    end
  end)
  return results
end

-- #### Chunks.reduce
--
-- Return a single value by executing the `iterator` on every item
-- in the `tbl` and passing the previous value, `memo`, to the `iterator`.
--
-- - `tbl`      is a table.
-- - `iterator` is a function.
-- - `memo`     is a value.
--
function Chunks.reduce(tbl, iterator, memo)
  memo = memo or 0
  Chunks.each(tbl, function(v, k, t)
    memo = iterator(memo, v, k, t)
  end)
  return memo
end

-- #### Chunks.some
--
-- Return either `true` or `false` by executing the `iterator` on
-- every item in the `tbl`. It'll return `true` if one of the items
-- in the `tbl` matches the `iterator`.
--
-- - `tbl`      is a table.
-- - `iterator` is a function.
--
function Chunks.some(tbl, iterator)
  local results = false
  Chunks.each(tbl, function(v, k, t)
    if iterator(v, k, t) then
      results = true
    end
  end)
  return results
end

-- #### Chunks.every
--
-- Return either `true` or `false` by executing the `iterator` on
-- every item in the `tbl`. It'll return `true` if all of the items
-- in the `tbl` matches the `iterator`.
--
-- - `tbl`      is a table.
-- - `iterator` is a function.
--
function Chunks.every(tbl, iterator)
  local results = true
  Chunks.each(tbl, function(v, k, t)
    if not iterator(v, k, t) then
      results = false
    end
  end)
  return results
end

-- #### Chunks.index
--
-- Return the index of the `item` in the `tbl`.
--
-- - `tbl`  is a table.
-- - `item` is a value.
--
function Chunks.index(tbl, item)
  local results = nil
  Chunks.each(tbl, function(v, k)
    if v == item then
      results = k
    end
  end)
  return results
end

-- #### Chunks.contains
--
-- Determine if the `tbl` contains the `item`.
--
-- - `tbl`  is a table.
-- - `item` is a value.
--
function Chunks.contains(tbl, item)
  local results = Chunks.some(tbl, function(v)
    return v == item
  end)
  return results
end

-- #### Chunks.size
--
-- Return the size of the `tbl`.
--
-- - `tbl`      is a table.
--
function Chunks.size(tbl)
  local results = 0
  if Chunks.isArray(tbl) then
    results = #tbl
  else
    results = #Chunks.keys(tbl)
  end
  return results
end

-- #### Chunks.clone
--
-- Return a clone of the `tbl`.
--
-- - `tbl` is a table.
--
function Chunks.clone(tbl)
  local results = {}
  Chunks.each(tbl, function(v, k)
    results[k] = v
  end)
  return results
end

-- #### Chunks.sort
--
-- Return a new table with the values from the `tbl` sorted, either
-- by the default order or by the `comp`.
--
-- - `tbl`  is a table.
-- - `comp` is a function.
--
function Chunks.sort(tbl, comp)
  local results = {}
  Chunks.each(tbl, function(v, k)
    table.insert(results, v)
  end)
  if comp then
    table.sort(results, comp)
  else
    table.sort(results)
  end
  return results
end

-- ### Types

-- #### Chunks.isArray
--
-- Determine if the `tbl` is array-like.
--
-- - `tbl` is a table.
--
function Chunks.isArray(tbl)
  local results = Chunks.every(tbl, function(v, k)
      return type(k) == 'number'
    end)
  return results
end

-- #### Chunks.isDict
--
-- Determine if the `tbl` is dictionary-like.
--
-- - `tbl` is a table.
--
function Chunks.isDict(tbl)
  local results = Chunks.every(tbl, function(v, k)
      return type(k) ~= 'number'
    end)
  return results
end

-- ### Arrays

-- #### Chunks.first
--
-- Return the first item in the `tbl`.
--
-- - `tbl` is a table.
--
function Chunks.first(tbl)
  return tbl[1]
end

-- #### Chunks.last
--
-- Return the last item in the `tbl`.
--
-- - `tbl` is a table.
--
function Chunks.last(tbl)
  return tbl[#tbl]
end

-- #### Chunks.flatten
--
-- Return a new table by flattening the nested tables in the `tbl`.
-- If the `memo` is provided it'll get used as a starting point
-- for the new table.
--
-- - `tbl`  is a table.
-- - `memo` is a table.
--
function Chunks.flatten(tbl, memo)
  memo = memo or {}
  Chunks.each(tbl, function(v)
    if type(v) == 'table' then
      Chunks.flatten(v, memo)
    else
      table.insert(memo, v)
    end
  end)
  return memo
end

-- ### Dictionaries

-- #### Chunks.keys
--
-- Return a new table with keys from the `tbl`.
--
-- - `tbl` is a table.
--
function Chunks.keys(tbl)
  local results = {}
  Chunks.each(tbl, function(v, k)
    table.insert(results, k)
  end)
  return results
end

-- #### Chunks.values
--
-- Return a new table with values from the `tbl`.
--
-- - `tbl` is a table.
--
function Chunks.values(tbl)
  local results = {}
  Chunks.each(tbl, function(v)
    table.insert(results, v)
  end)
  return results
end

-- #### Chunks.has
--
-- Determine if the `tbl` has the `key`.
--
-- - `tbl` is a table.
-- - `key` is a value.
--
function Chunks.has(tbl, key)
  return tbl[key] ~= nil
end

-- #### Chunks.extend
--
-- Merge the properties in the `tbl` together with the properties
-- in the `src`.
--
-- - `tbl` is a table.
-- - `src` is a table.
--
function Chunks.extend(tbl, src)
  Chunks.each(src, function(v, k)
    tbl[k] = src[k]
  end)
  return tbl
end

-- ## Exports
--
-- Export `Chunks` as a Lua module.
--
return Chunks
