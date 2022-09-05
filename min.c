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
void fb_PrintInt( int32, int32, int32 );
static void fb_ctor__min( void ) __attribute__(( constructor ));
int32 MIN( int32, int32 );
int32 MAIN( void );

int32 MIN( int32 A$1, int32 B$1 )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$2:;
	if( A$1 <= B$1 ) goto label$5;
	{
		fb$result$1 = B$1;
		goto label$3;
	}
	goto label$4;
	label$5:;
	{
		fb$result$1 = A$1;
		goto label$3;
	}
	label$4:;
	fb$result$1 = A$1;
	goto label$3;
	label$3:;
	return fb$result$1;
}

int32 MAIN( void )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$6:;
	fb_Color( 0, 2, 0 );
	int32 vr$1 = MIN( 20, 30 );
	fb_PrintInt( 0, vr$1, 1 );
	fb$result$1 = 0;
	goto label$7;
	label$7:;
	return fb$result$1;
}

__attribute__(( constructor )) static void fb_ctor__min( void )
{
	label$0:;
	MAIN(  );
	label$1:;
}
