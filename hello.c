typedef   signed char       int8;
typedef unsigned char      uint8;
typedef   signed short      int16;
typedef unsigned short     uint16;
typedef   signed int        int32;
typedef unsigned int       uint32;
typedef   signed long long  int64;
typedef unsigned long long uint64;
typedef struct { char *data; int32 len; int32 size; } FBSTRING;
typedef int8 boolean;
int32 fb_Color( int32, int32, int32 );
void fb_PrintString( int32, FBSTRING*, int32 );
FBSTRING* fb_StrInit( void*, int32, void*, int32, int32 );
void fb_StrDelete( FBSTRING* );
FBSTRING* fb_StrAllocTempResult( FBSTRING* );
static void fb_ctor__hello( void ) __attribute__(( constructor ));
FBSTRING* HELLO( void );
int32 main( void );

FBSTRING* HELLO( void )
{
	FBSTRING fb$result$1;
	__builtin_memset( &fb$result$1, 0, 12 );
	label$2:;
	FBSTRING S$1;
	fb_StrInit( (void*)&S$1, -1, (void*)"hello word", 11, 0 );
	fb_StrInit( (void*)&fb$result$1, -1, (void*)&S$1, -1, 0 );
	fb_StrDelete( (FBSTRING*)&S$1 );
	goto label$3;
	fb_StrDelete( (FBSTRING*)&S$1 );
	label$3:;
	FBSTRING* vr$7 = fb_StrAllocTempResult( (FBSTRING*)&fb$result$1 );
	return vr$7;
}

int32 main( void )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$4:;
	fb_Color( 2, 0, 2 );
	FBSTRING* vr$1 = HELLO(  );
	fb_PrintString( 0, (FBSTRING*)vr$1, 1 );
	fb$result$1 = 0;
	goto label$5;
	label$5:;
	return fb$result$1;
}

__attribute__(( constructor )) static void fb_ctor__hello( void )
{
	label$0:;
	main(  );
	label$1:;
}
