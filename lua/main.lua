local Decoration = require( "Decoration" )
local Color = require( "Color" )


local main = function()
  print( '------------------------------ 装飾 ------------------------------' )
  Decoration.decoration()

  print( '------------------------------ 色 ------------------------------' )
  Color.basic()
  Color.extend256()
  Color.extendRGB()
end


main()
