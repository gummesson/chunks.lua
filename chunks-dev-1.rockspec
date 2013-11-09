package = "chunks"
version = "dev-1"

source = {
  url = "git://github.com/gummesson/chunks.lua.git"
}

description = {
  summary = "A super duper, teeny tiny functional library for Lua.",
  homepage = "http://ellengummesson.com/chunks.lua/",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1"
}

build = {
  type = "builtin",
  modules = {
    chunks = "src/chunks.lua"
  }
}
