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

iced.application( "A cooler counter", update, view ):run()
