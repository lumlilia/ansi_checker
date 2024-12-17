local basic = function()
  print( '【基本色】' )

  local output_str = '     '

  for i = 0, 7 do
    output_str = output_str ..  '   ' .. tostring( i ) .. ' '
  end

  print( output_str )

  local category_nums = { 30, 90, 40, 100 }

  for k, v in pairs( category_nums ) do
    output_str = string.sub( tostring( v ) .. '   ', 1, 3 ) .. ': '

    for i = 0, 7 do
      local s = tostring( v + i )

      output_str = (
        output_str ..
        '\x1b[' ..
        s ..
        'm ' ..
        string.sub( '   ' .. s, -3 ) ..
        ' \x1b[0m'
      )
    end

    print( output_str )
  end

  print( '\n39 : デフォルトの文字色\n49 : デフォルトの背景色\n\n' )
end


local extend256 = function()
  print( '【拡張色(256色)】' )
  print(
    '文字: ESC[38;5;nm\n' ..
    '背景: ESC[48;5;nm\n' ..
    '(nに数値を入れる)\n'
  )

  local output_str = '     '
  for i = 0, 9 do
    output_str = output_str .. '   ' .. tostring( i ) .. ' '
  end

  print( output_str )

  for i = 0, 255 do
    local s = tostring( i )
    local r = i % 10

    if r == 0 then
      output_str = string.sub( s .. '   ', 0, 3 ) .. ': '
    end

    output_str = (
      output_str ..
      '\x1b[48;5;' ..
      s ..
      'm ' ..
      string.sub( '   ' .. s, -3 ) ..
      ' \x1b[0m'
    )

    if r == 9 then
      print( output_str )
    end
  end

  print( output_str )
  print( '\n' )
end


local extendRGB = function()
  print( '【拡張色(RGB)】' )
  print(
    '文字: ESC[38;2;r;g;bm\n' ..
    '背景: ESC[48;2;r;g;bm\n' ..
    '(r,g,bに数値を入れる)\n'
  )

  for i = 1, 3 do
    local output_str = ""

    for c = 255, 128, -2 do
      local rgb = { 0, 0, 0 }
      rgb[ i ] = c

      output_str = (
        output_str ..
        '\x1b[48;2;' ..
        tostring( rgb[ 1 ] ) ..
        ';' ..
        tostring( rgb[ 2 ] ) ..
        ';' ..
        tostring( rgb[ 3 ] ) ..
        'm \x1b[0m'
      )
    end

    print( output_str )
  end

  print( '\n' )
end


return {
  basic = basic,
  extend256 = extend256,
  extendRGB = extendRGB
}
