def colorBasic()
  puts '【基本色】'

  output_str = '     '

  for i in 0 .. 7 do
    output_str += "   #{ i.to_s } "
  end

  puts output_str

  category_nums = [ 30, 90, 40, 100 ]

  for item in category_nums do
    output_str = "#{ item.to_s.ljust( 3 ) }: "

    for i in 0 .. 7 do
      s = ( item + i ).to_s

      output_str += "\x1b[#{ s }m #{ s.rjust( 3 ) } \x1b[0m"
    end

    puts output_str
  end

  puts "\n39 : デフォルトの文字色\n49 : デフォルトの背景色"
  puts "\n\n"
end


def colorExtend256()
  puts '【拡張色(256色)】'
  puts (
    "文字: ESC[38;5;nm\n" +
    "背景: ESC[48;5;nm\n" +
    "(nに数値を入れる)\n\n"
  )

  output_str = '     '
  for i in 0 .. 9 do
    output_str += "   #{ i.to_s } "
  end

  puts output_str

  for i in 0 .. 255 do
    s = i.to_s
    r = i % 10

    if r == 0 then
      output_str = "#{ s.ljust( 3 ) }: "
    end

    output_str += "\x1b[48;5;#{ s }m #{ s.rjust( 3 ) } \x1b[0m"

    if r == 9 then
      puts output_str
    end
  end

  puts output_str
  puts "\n\n"
end


def colorExtendRGB()
  puts '【拡張色(RGB)】'
  puts (
    "文字: ESC[38;2;r;g;bm\n" +
    "背景: ESC[48;2;r;g;bm\n" +
    "(r,g,bに数値を入れる)\n\n"
  )

  for i in 0 .. 2 do
    output_str = ""

    255.step( 128, -2 ) do | c |
      rgb = [ 0, 0, 0 ]
      rgb[ i ] = c

      output_str += "\x1b[48;2;#{ rgb[ 0 ].to_s };#{ rgb[ 1 ].to_s };#{ rgb[ 2 ].to_s }m \x1b[0m"
    end

    puts output_str
  end

  puts "\n\n"
end
