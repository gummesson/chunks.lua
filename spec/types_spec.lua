-- Modules

local Chunks = require('chunks')

-- Tests

describe('Chunks', function()
  describe('#.isArray()', function()
    it('should return true if the table is an array', function()
      local results = Chunks.isArray({1, 2, 3})
      assert.True(results)
    end)

    it('should return false if the table isn\'t an array', function()
      local results = Chunks.isArray({one = 1, two = 2, three = 3})
      assert.False(results)
    end)
  end)

  describe('#.isDict()', function()
    it('should return true if the table is a dictionary', function()
      local results = Chunks.isDict({one = 1, two = 2, three = 3})
      assert.True(results)
    end)

    it('should return false if the table isn\'t a dictionary', function()
      local results = Chunks.isDict({1, 2, 3})
      assert.False(results)
    end)
  end)
end)
