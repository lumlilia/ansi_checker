local decoration = function()
  local output_str = ''
  local descriptions = {
    {
      num = 0,
      text = '全ての装飾を解除(色も含む)'
    },
    {
      num = 1,
      text = '強調'
    },
    {
      num = 2,
      text = '薄い文字色'
    },
    {
      num = 3,
      text = '斜体'
    },
    {
      num = 4,
      text = '下線'
    },
    {
      num = 5,
      text = '点滅'
    },
    {
      num = 6,
      text = '速い点滅'
    },
    {
      num = 7,
      text = '文字・背景色を反転'
    },
    {
      num = 8,
      text = '文字を背景と同色に'
    },
    {
      num = 9,
      text = '削除線'
    },
    {
      num = 21,
      text = '二重下線'
    },
    {
      num = 53,
      text = '上線'
    }
  }

  for k, v in pairs( descriptions ) do
    local num_str = tostring( v.num )
    output_str = (
      output_str ..
      string.sub( num_str .. '  ', -2 ) ..
      ' [\x1b[' ..
      num_str ..
      'mexample\x1b[0m] : ' ..
      v.text ..
      '\n'
    )
  end

  print( output_str .. '\n\n' )
end


return {
  decoration = decoration
}
