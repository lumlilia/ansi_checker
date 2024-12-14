#include <stdio.h>


void printDecorations(){
  puts( "------------------------------ 装飾 ------------------------------" );

  int nums[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 21, 53 };
  int nums_len = sizeof( nums ) / sizeof( int );
  char* descriptions[] = {
    /*0 */ "全ての装飾を解除(色も含む)",
    /*1 */ "強調",
    /*2 */ "薄い文字色",
    /*3 */ "斜体",
    /*4 */ "下線",
    /*5 */ "点滅",
    /*6 */ "速い点滅",
    /*7 */ "文字・背景色を反転",
    /*8 */ "文字を背景と同色に",
    /*9 */ "削除線",
    /*21*/ "二重下線",
    /*53*/ "上線"
  };

  for( int i = 0; i < nums_len; i++ ){
    printf(
      "%d%c [\e[%dmexample\e[0m] : %s\n",
      nums[ i ],
      (( nums[ i ] - 9  > 0 ) ? 0 : ' ' ),
      nums[ i ],
      descriptions[ i ]
    );
  }

  puts( "\n\n" );
}


void printBasicColors(){
  puts( "------------------------------ 色 ------------------------------" );
  puts( "【基本色】" );

  printf( "     " );
  for( int i = 0; i < 8; i++ ){
    printf( "   %d ", i );
  }
  
  puts( "" );

  int category_nums[ 4 ] = { 30, 90, 40, 100 };

  for( int i = 0; i < 4; i++ ){
    char s = (( category_nums[ i ] < 100 ) ? ' ' : 0 );
    printf( "%d%c: ", category_nums[ i ], s );

    for( int color_num = 0; color_num < 8; color_num++ ){
      int n = category_nums[ i ] + color_num;

      printf( "\e[%dm %c%d \e[0m", n, s, n );
    }
    puts( "" );
  }

  printf( "\n39 : デフォルトの文字色\n49 : デフォルトの背景色" );

  puts( "\n\n" );
}


void print256Colors(){
  puts( "【拡張色(256色)】" );
  puts( "文字: ESC[38;5;nm\n背景: ESC[48;5;nm\n(nに数値を入れる)\n" );

  printf( "     " );

  for( int i = 0; i < 10; i++ ){
    printf( "   %d ", i );
  }

  puts( "" );

  for( int i = 0; i < 256; i++ ){
    char* s = (( i < 10 ) ? "  " : (( i < 100 ) ? " " : "" ));
    if( !( i % 10 ) ){
      printf( "%d%s: ", i, s );
    }

    printf( "\e[48;5;%dm %s%d \e[0m", i, s, i );
    if( i % 10 == 9 ){
      puts( "" );
    }
  }
  puts( "\n\n" );
}


int printRGBColors(){
  puts( "【拡張色(RGB)】" );
  puts( "文字: ESC[38;2;r;g;bm\n背景: ESC[48;2;r;g;bm\n(r,g,bに数値を入れる)\n" );

  for( int i = 0; i < 3; i++ ){
    for( int c = 255; c > 127; c -= 2 ){
      printf(
        "\e[48;2;%d;%d;%dm \e[0m",
        (( i == 0 ) ? c : 0 ),
        ((i == 1) ? c : 0 ),
        (( i == 2 ) ? c : 0 )
      );
    }

    puts( "" );
  }

  puts( "" );
}


int main(){
  printDecorations();
  printBasicColors();
  print256Colors();
  printRGBColors();

  return 0;
}
