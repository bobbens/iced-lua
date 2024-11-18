pub fn main () {
    let lua = mlua::Lua::new();
    iced_lua::open_iced( &lua ).unwrap();
    lua.load( include_str!("counter.lua")).exec().unwrap_or_else(|err| panic!("{}",err));
}
