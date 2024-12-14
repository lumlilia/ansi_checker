def basic():
  print( '【基本色】' )

  output_str = '     '
  for i in range( 8 ):
    output_str +=  '   ' + str( i ) + ' '

  print( output_str )

  category_nums = [ 30, 90, 40, 100 ]

  for c in category_nums:
    output_str = str( c ).ljust( 3, ' ' ) + ': '

    for i in range( 8 ):
      s = str( c + i )

      output_str += (
        '\x1b[' +
        s +
        'm ' +
        s.rjust( 3, ' ' ) +
        ' \x1b[0m'
      )

    print( output_str )

  print( '\n39 : デフォルトの文字色\n49 : デフォルトの背景色\n\n' )


def extend256():
  print( '【拡張色(256色)】' )
  print(
    '文字: ESC[38;5;nm\n' + 
    '背景: ESC[48;5;nm\n' + 
    '(nに数値を入れる)\n'
  )

  output_str = '     '
  for i in range( 10 ):
    output_str += '   ' + str( i ) + ' '

  print( output_str )

  for i in range( 256 ):
    s = str( i )
    r = i % 10

    if r == 0:
      output_str = s.ljust( 3, ' ' ) + ': '

    output_str += (
      '\x1b[48;5;' + 
      s +
      'm ' +
      s.rjust( 3, ' ' ) +
      ' \x1b[0m'
    )

    if r == 9:
      print( output_str )

  print( output_str )
  print( '\n' )


def extendRGB():
  print( '【拡張色(RGB)】' )
  print(
    '文字: ESC[38;2;r;g;bm\n' + 
    '背景: ESC[48;2;r;g;bm\n' + 
    '(r,g,bに数値を入れる)\n'
  )

  for i in range( 3 ):
    output_str = ""

    for c in range( 255, 127, -2 ):
      rgb = [ 0, 0, 0 ]
      rgb[ i ] = c
      s = str( c )

      output_str += (
        '\x1b[48;2;' +
        str( rgb[ 0 ] ) +
        ';' +
        str( rgb[ 1 ] ) +
        ';' + 
        str( rgb[ 2 ] ) +
        'm \x1b[0m'
      )

    print( output_str )

  print( '\n' )
