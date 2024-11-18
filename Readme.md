# iced-lua

[Lua](https://www.lua.org/) bindings for [iced](https://iced.rs/) using [mlua](https://github.com/mlua-rs/mlua).
The goal is to create a Lua package that can use most of the iced API and be either run sandalone or embedded into another rust application.

**This is currently very much WIP, however, it is working as a proof of concept. Help is very much welcome.**

## Usage

Example of the counter example from iced in Lua.

```lua
local value = 0

local function update( message )
   if message=="increment" then
      value = value + 1
   elseif message=="decrement" then
      value = value - 1
   end
end

local function view ()
   return iced.column{
      iced.button("Increment"):on_press("increment"),
      iced.text(value):size(50),
      iced.button("Decrement"):on_press("decrement"),
   }
   :padding(20)
   :align_x(iced.Center())
end

iced.run( "A cooler counter", update, view )
```

See [examples/counter](examples/counter) for the full example of embedding into a rust application.

## TODO

- [x] Proof of concept.
- [ ] Finish implementing the API.
- [ ] Try to fix the Send issues.
- [ ] Maybe figure out how to use with [love2d](https://www.love2d.org/) if possible?
