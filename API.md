# Chunks

## API

### Collections

#### Chunks.each

~~~ lua
Chunks.each(tbl, iterator)
~~~

Executes the `iterator` on every item in the `tbl`.

##### Examples

~~~ lua
local results = {}
Chunks.each({1, 2, 3}, function(v, k)
  table.insert(results, v)
end)
--- {1, 2, 3}
~~~

~~~ lua
local results = {}
Chunks.each({one = 1, two = 2, three = 3}, function(v, k)
  table.insert(results, v)
end)
--- {1, 2, 3}
~~~

#### Chunks.map

~~~ lua
Chunks.map(tbl, iterator)
~~~

Returns a new and transformed table by executing the `iterator` on every item in the `tbl`.

##### Examples

~~~ lua
Chunks.map({1, 2, 3}, function(v, k)
  return v + 1
end)
-- {2, 3, 4}
~~~

~~~ lua
Chunks.map({one = 1, two = 2, three = 3}, function(v, k)
  return v + 1
end)
-- {2, 3, 4}
~~~

#### Chunks.filter

~~~ lua
Chunks.filter(tbl, iterator)
~~~

Returns a new table by executing the `iterator` on every item in the `tbl`. Only the items that evalute to `true` in the `iterator` will be added to the table.

##### Examples

~~~ lua
Chunks.filter({1, 2, 3}, function(v, k)
  return v > 1
end)
-- {2, 3}
~~~

~~~ lua
Chunks.filter({one = 1, two = 2, three = 3}, function(v, k)
  return v > 1
end)
-- {2, 3}
~~~

#### Chunks.reduce

~~~ lua
Chunks.reduce(tbl, iterator[, memo])
~~~

Returns a single value by executing the `iterator` on every item in the `tbl` and passing the previous value, `memo`, to the `iterator`.

##### Examples

~~~ lua
Chunks.reduce({1, 2, 3}, function(m, v)
  return m + v
end)
-- 6
~~~

~~~ lua
Chunks.reduce({one = 1, two = 2, three = 3}, function(m, v)
  return m + v
end, 1)
-- 7
~~~

#### Chunks.some

~~~ lua
Chunks.some(tbl, iterator)
~~~

Returns either `true` or `false` by executing the `iterator` on every item in the `tbl`. It'll return `true` if one of the items in the `tbl` matches the `iterator`.

##### Examples

~~~ lua
Chunks.some({1, 2, 3}, function(v, k)
  return v == 3
end)
-- true
~~~

~~~ lua
Chunks.some({one = 1, two = 2, three = 3}, function(v, k)
  return v > 4
end)
-- false
~~~

#### Chunks.every

~~~ lua
Chunks.every(tbl, iterator)
~~~

Returns either `true` or `false` by executing the `iterator` on every item in the `tbl`. It'll return `true` if all of the items in the `tbl` matches the `iterator`.

##### Examples

~~~ lua
Chunks.every({1, 2, 3}, function(v, k)
  return v < 5
end)
-- true
~~~

~~~ lua
Chunks.every({one = 1, two = 2, three = 3}, function(v, k)
  return v > 2
end)
-- false
~~~

#### Chunks.index

~~~ lua
Chunks.index(tbl, item)
~~~

Returns the index of the `item` in the `tbl`.

##### Examples

~~~ lua
Chunks.index({1, 2, 3}, 2)
-- 2
~~~

~~~ lua
Chunks.index({one = 1, two = 2, three = 3}, 4)
-- nil
~~~

#### Chunks.contains

~~~ lua
Chunks.contains(tbl, item)
~~~

Determines if the `tbl` contains the `item`. Returns either `true` or `false`.

##### Examples

~~~ lua
Chunks.contains({1, 2, 3}, 2)
-- true
~~~

~~~ lua
Chunks.contains({one = 1, two = 2, three = 3}, 4)
-- false
~~~

#### Chunks.size

~~~ lua
Chunks.size(tbl)
~~~

Returns the size of the `tbl`.

##### Examples

~~~ lua
Chunks.size({1, 2, 3})
-- 3
~~~

~~~ lua
Chunks.size({one = 1, two = 2, three = 3})
-- 3
~~~

#### Chunks.clone

~~~ lua
Chunks.clone(tbl)
~~~

Returns a clone of the `tbl`.

##### Examples

~~~ lua
Chunks.clone({1, 2, 3})
-- {1, 2, 3}
~~~

~~~ lua
Chunks.clone({one = 1, two = 2, three = 3})
-- {one = 1, two = 2, three = 3}
~~~

#### Chunks.sort

~~~ lua
Chunks.sort(tbl[, comp])
~~~

Returns a new table with the values from the `tbl` sorted, either by the default order or the `comp` function.

##### Examples

~~~ lua
Chunks.sort({1, 3, 2})
-- {1, 2, 3}
~~~

~~~ lua
Chunks.sort({one = 1, two = 2, three = 3}, function(a, b) 
  return a > b
end)
-- {3, 2, 1}
~~~

### Types

#### Chunks.isArray

~~~ lua
Chunks.isArray(tbl)
~~~

Determines if the `tbl` is array-like. Returns either `true` or `false`.

##### Examples

~~~ lua
Chunks.isArray({1, 2, 3})
-- true
~~~

~~~ lua
Chunks.isArray({one = 1, two = 2, three = 3})
-- false
~~~

#### Chunks.isDict

~~~ lua
Chunks.isDict(tbl)
~~~

Determines if the `tbl` is dictionary-like. Returns either `true` or `false`.

##### Examples

~~~ lua
Chunks.isDict({one = 1, two = 2, three = 3})
-- true
~~~

~~~ lua
Chunks.isDict({1, 2, 3})
-- false
~~~

### Arrays

#### Chunks.first

~~~ lua
Chunks.first(tbl)
~~~

Returns the first item in the `tbl`.

##### Example

~~~ lua
Chunks.first({1, 2, 3})
-- 1
~~~

#### Chunks.last

~~~ lua
Chunks.last(tbl)
~~~

Returns the last item in the `tbl`.

##### Example

~~~ lua
Chunks.last({1, 2, 3})
-- 3
~~~

#### Chunks.flatten

~~~ lua
Chunks.flatten(tbl[, memo])
~~~

Returns a new table by flattening the nested tables in the `tbl`. If the `memo` is provided it'll get used as a starting point for the new table.

##### Examples

~~~ lua
Chunks.flatten({{1}, {{2}, {3}}})
-- {1, 2, 3}
~~~

~~~ lua
Chunks.flatten({{2}, {{3}, {4}}}, {1})
-- {1, 2, 3, 4}
~~~

### Dictionaries

#### Chunks.keys

~~~ lua
Chunks.keys(tbl)
~~~

Returns a new table with keys from the `tbl`.

##### Example

~~~ lua
Chunks.keys({one = 1, two = 2, three = 3})
-- {'one', 'two', 'three'}
~~~

#### Chunks.values

~~~ lua
Chunks.values(tbl)
~~~

Returns a new table with values from the `tbl`.

##### Example

~~~ lua
Chunks.values({one = 1, two = 2, three = 3})
-- {1, 2, 3}
~~~

#### Chunks.has

~~~ lua
Chunks.has(tbl, key)
~~~

Determines if the `tbl` has the `key`. Returns either `true` or `false`.

##### Example

~~~ lua
Chunks.has({one = 1, two = 2, three = 3}, 'two')
-- true
~~~

#### Chunks.extend

~~~ lua
Chunks.extend(tbl, src)
~~~

Merges the properties in the `tbl` together with the properties in the `src`.

##### Example

~~~ lua
Chunks.extend({one = 1, two = 2, three = 3}, {three = 4})
-- {one = 1, two = 2, three = 4}
~~~
