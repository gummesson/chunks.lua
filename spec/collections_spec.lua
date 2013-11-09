-- Modules

local Chunks = require('chunks')

-- Tests
--
-- 1. Sort the table for easier assertions.

describe('Chunks', function()
  describe('#.each()', function()
    it('should iterate over the array', function()
      local results = {}
      Chunks.each({1, 2, 3}, function(v, k)
        table.insert(results, v)
      end)
      assert.same(results, {1, 2, 3})
    end)

    it('should iterate over the dictionary', function()
      local results = {}
      Chunks.each({one = 1, two = 2, three = 3}, function(v, k)
        table.insert(results, v)
      end)
      table.sort(results) -- [1]
      assert.same(results, {1, 2, 3})
    end)
  end)

  describe('#.map()', function()
    it('should return a new and transformed array from the array', function()
      local results = Chunks.map({1, 2, 3}, function(v, k)
        return v + 1
      end)
      assert.same(results, {2, 3, 4})
    end)

    it('should return a new and transformed array from the dictionary', function()
      local results = Chunks.map({one = 1, two = 2, three = 3}, function(v, k)
        return v + 1
      end)
      table.sort(results) -- [1]
      assert.same(results, {2, 3, 4})
    end)
  end)

  describe('#.filter()', function()
    it('should return a new array with the items that return true in the array', function()
      local results = Chunks.filter({1, 2, 3}, function(v, k)
        return v > 1
      end)
      assert.same(results, {2, 3})
    end)

    it('should return a new array with the items that return true in the dictionary', function()
      local results = Chunks.filter({one = 1, two = 2, three = 3}, function(v, k)
        return v > 1
      end)
      table.sort(results) -- [1]
      assert.same(results, {2, 3})
    end)
  end)

  describe('#.reduce()', function()
    it('should return a single value by combining the items in the array', function()
      local results = Chunks.reduce({1, 2, 3}, function(m, v)
        return m + v
      end)
      assert.same(results, 6)
    end)

    it('should return a single value by combining the items in the dictionary', function()
      local results = Chunks.reduce({one = 1, two = 2, three = 3}, function(m, v)
        return m + v
      end, 1)
      assert.same(results, 7)
    end)
  end)

  describe('#.some()', function()
    it('should return true if an item in the array matches the iterator', function()
      local results = Chunks.some({1, 2, 3}, function(v, k)
        return v == 3
      end)
      assert.True(results)
    end)

    it('should return false if all items in the dictionary doesn\'t match the iterator', function()
      local results = Chunks.some({1, 2, 3}, function(v, k)
        return v == 4
      end)
      assert.False(results)
    end)

    it('should return true if an item in the dictionary matches the iterator', function()
      local results = Chunks.some({one = 1, two = 2, three = 3}, function(v, k)
        return v == 3
      end)
      assert.True(results)
    end)

    it('should return false if all items in the dictionary doesn\'t match the iterator', function()
      local results = Chunks.some({one = 1, two = 2, three = 3}, function(v, k)
        return v == 4
      end)
      assert.False(results)
    end)
  end)

  describe('#.every()', function()
    it('should return true if all items in the array matches the iterator', function()
      local results = Chunks.every({1, 2, 3}, function(v, k)
        return v < 5
      end)
      assert.True(results)
    end)

    it('should return false if an item in the array doesn\'t match the iterator', function()
      local results = Chunks.every({1, 2, 3}, function(v, k)
        return v > 5
      end)
      assert.False(results)
    end)

    it('should return true if all items in the dictionary matches the iterator', function()
      local results = Chunks.every({one = 1, two = 2, three = 3}, function(v, k)
        return v < 5
      end)
      assert.True(results)
    end)

    it('should return false if an item in the dictionary doesn\'t match the iterator', function()
      local results = Chunks.every({one = 1, two = 2, three = 3}, function(v, k)
        return v > 5
      end)
      assert.False(results)
    end)
  end)

  describe('#.index()', function()
    it('should return the index of an item in the array', function()
      local results = Chunks.index({1, 2, 3}, 2)
      assert.equals(results, 2)
    end)

    it('should return nil if an item can\'t be found in the array', function()
      local results = Chunks.index({1, 2, 3}, 4)
      assert.equals(results, nil)
    end)

    it('should return the index of an item in the dictionary', function()
      local results = Chunks.index({one = 1, two = 2, three = 3}, 2)
      assert.equals(results, 'two')
    end)

    it('should return nil if an item can\'t be found in the dictionary', function()
      local results = Chunks.index({one = 1, two = 2, three = 3}, 4)
      assert.equals(results, nil)
    end)
  end)

  describe('#.contains()', function()
    it('should return true if the array contains an item', function()
      local results = Chunks.contains({1, 2, 3}, 2)
      assert.True(results)
    end)

    it('should return false if the array doesn\'t contain an item', function()
      local results = Chunks.contains({1, 2, 3}, 4)
      assert.False(results)
    end)

    it('should return true if the dictionary contains an item', function()
      local results = Chunks.contains({one = 1, two = 2, three = 3}, 2)
      assert.True(results)
    end)

    it('should return false if the dictionary doesn\'t contain an item', function()
      local results = Chunks.contains({one = 1, two = 2, three = 3}, 4)
      assert.False(results)
    end)
  end)

  describe('#.size()', function()
    it('should return the size of the array', function()
      local results = Chunks.size({1, 2, 3})
      assert.equals(results, 3)
    end)

    it('should return the size of the dictionary', function()
      local results = Chunks.size({one = 1, two = 2, three = 3})
      assert.equals(results, 3)
    end)

    it('should return zero if the table doesn\'t have any items', function()
      local results = Chunks.size({})
      assert.equals(results, 0)
    end)
  end)

  describe('#.clone()', function()
    it('should return a clone of the array', function()
      local results = Chunks.clone({1, 2, 3})
      assert.same(results, {1, 2, 3})
    end)

    it('should return a clone of the dictionary', function()
      local results = Chunks.clone({one = 1, two = 2, three = 3})
      assert.same(results, {one = 1, two = 2, three = 3})
    end)
  end)

  describe('#.sort()', function()
    it('should return a new sorted array from the array', function()
      local results = Chunks.sort({1, 3, 2})
      assert.same(results, {1, 2, 3})
    end)

    it('should return a new array from the array sorted by the compare function', function()
      local results = Chunks.sort({1, 3, 2}, function(a, b) 
        return a > b
      end)
      assert.same(results, {3, 2, 1})
    end)

    it('should return a new sorted array from the dictionary', function()
      local results = Chunks.sort({one = 1, three = 3, two = 2})
      assert.same(results, {1, 2, 3})
    end)

    it('should return a new sorted array from the dictionary sorted by the compare function', function()
      local results = Chunks.sort({one = 1, three = 3, two = 2}, function(a, b) 
        return a > b
      end)
      assert.same(results, {3, 2, 1})
    end)
  end)
end)
