# iced-lua

[Lua](https://www.lua.org/) bindings for [iced](https://iced.rs/) using [mlua](https://github.com/mlua-rs/mlua).
The goal is to create a Lua package that can use most of the iced API and be either run sandalone or embedded into another rust application.

**This is currently very much WIP, however, it is working as a proof of concept. Help is very much welcome.**

## Module Usage

Install using luarocks with:

```bash
$ luarocks install iced-lua
```

You should now be able to `require "iced-lua"` from Lua.
With this, we can now reproduce the counter example from iced in Lua.

```lua
local iced = require "iced_lua"

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

## Embedding Usage

You will have to add the following dependencies.
Note that there is no restriction on the version of Lua, so you are able to use any Lua feature version supported by mlua.

```toml
[dependencies]
iced_lua = { path = "../..", features = ["lua51"] }
mlua = { version = "0.10", features = ["lua51","vendored"] }
```

Afterwards, you can simply use the following to load the library into a `mlua::Lua` environment:

```rust
    iced_lua::open_iced(&lua).unwrap();
```

You will then be able to use the API from the `iced` global variable.
If you instead wish to set the global yourself, you can access all the exports with `iced_lua::exports_table`.

See [examples/counter](examples/counter) for the full example of embedding into a rust application.

## TODO

- [x] Proof of concept.
- [ ] Finish implementing the API.
- [ ] Try to fix the Send issues.
- [ ] Maybe figure out how to use with [love2d](https://www.love2d.org/) if possible?
