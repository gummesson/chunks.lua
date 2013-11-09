-- Modules

local Chunks = require('chunks')

-- Tests

describe('Chunks', function()
  describe('#.first()', function()
    it('should return the first item in the array', function()
      local results = Chunks.first({1, 2, 3})
      assert.equals(results, 1)
    end)
  end)

  describe('#.last()', function()
    it('should return the last item in the array', function()
      local results = Chunks.last({1, 2, 3})
      assert.equals(results, 3)
    end)
  end)

  describe('#.flatten()', function()
    it('should return a new array by flattening the nested arrays', function()
      local results = Chunks.flatten({{1}, {{2}, {3}}})
      assert.same(results, {1, 2, 3})
    end)

    it('should return a new array by merging another array with the flattened, nested arrays', function()
      local results = Chunks.flatten({{2}, {{3}, {4}}}, {1})
      assert.same(results, {1, 2, 3, 4})
    end)
  end)
end)
