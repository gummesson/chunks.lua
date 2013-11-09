# Chunks

[![Build Status](https://travis-ci.org/gummesson/chunks.lua.png?branch=master)](https://travis-ci.org/gummesson/chunks.lua)

A super duper, teeny tiny functional library for Lua, and a port of the original [Chunks](https://github.com/gummesson/chunks) library written in JavaScript.

## Installation

~~~
luarocks build https://raw.github.com/gummesson/chunks.lua/master/chunks-dev-1.rockspec
~~~

## Functions

### Collections

- `Chunks.each`
- `Chunks.map`
- `Chunks.filter`
- `Chunks.reduce`
- `Chunks.some`
- `Chunks.every`
- `Chunks.index`
- `Chunks.contains`
- `Chunks.size`
- `Chunks.clone`
- `Chunks.sort`

### Types

- `Chunks.isArray`
- `Chunks.isObject`

### Arrays

- `Chunks.first`
- `Chunks.last`
- `Chunks.flatten`

### Objects

- `Chunks.keys`
- `Chunks.values`
- `Chunks.has`
- `Chunks.extend`

Check out the [API documentation](https://github.com/gummesson/chunks.lua/blob/master/API.md), which includes examples, for more information.

## Should I use this instead of X, Y or Z?

It depends. `Chunks` is primarily designed to be lightweight and small and thus there's currently only 20 functions available. If you need more functions than those listed in the above list I'd suggest you to use [underscore-lua](https://github.com/jtarchie/underscore-lua) or [Moses](https://github.com/Yonaba/Moses) instead.

## License

The MIT License (MIT)

Copyright (c) 2013 Ellen Gummesson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
