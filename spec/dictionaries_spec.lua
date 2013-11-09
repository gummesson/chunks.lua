-- Modules

local Chunks = require('chunks')

-- Tests

describe('Chunks', function()
  describe('#.keys()', function()
    it('should return a new array with the keys from the dictionary', function()
      local results = Chunks.keys({one = 1, two = 2, three = 3})
      assert.same(results, {'one', 'three', 'two'})
    end)
  end)

  describe('#.values()', function()
    it('should return a new array with the values from the dictionary', function()
      local results = Chunks.values({one = 1, two = 2, three = 3})
      assert.same(results, {1, 3, 2})
    end)
  end)

  describe('#.has()', function()
    it('should return true if the dictionary has the key', function()
      local results = Chunks.has({one = 1, two = 2, three = 3}, 'two')
      assert.True(results)
    end)

    it('should return false if the dictionary doesn\'t have the key', function()
      local results = Chunks.has({one = 1, two = 2, three = 3}, 'four')
      assert.False(results)
    end)
  end)

  describe('#.extend()', function()
    it('should merge a dictionary with another dictionary', function()
      local tbl = {one = 1, two = 2, three = 3}
      local src = {four = 4}
      Chunks.extend(tbl, src)
      assert.same(tbl, {one = 1, four = 4, three = 3, two = 2})
    end)

    it('should merge a dictionary with another dictionary and override the properties', function()
      local tbl = {one = 1, two = 2, three = 3}
      local src = {three = 4}
      Chunks.extend(tbl, src)
      assert.same(tbl, {one = 1, three = 4, two = 2})
    end)
  end)
end)
