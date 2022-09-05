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
static void fb_ctor__power( void ) __attribute__(( constructor ));
int32 POWER( int32, int32 );
int32 MAIN( void );

int32 POWER( int32 A$1, int32 B$1 )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$2:;
	int32 C$1;
	__builtin_memset( &C$1, 0, 4 );
	int32 D$1;
	__builtin_memset( &D$1, 0, 4 );
	D$1 = A$1;
	if( B$1 != 0 ) goto label$5;
	{
		fb$result$1 = 1;
		goto label$3;
		label$5:;
	}
	if( B$1 != 1 ) goto label$7;
	{
		fb$result$1 = A$1;
		goto label$3;
		label$7:;
	}
	{
		C$1 = 0;
		int32 TMP$2$2;
		TMP$2$2 = B$1 + -2;
		goto label$8;
		label$11:;
		{
			D$1 = D$1 * A$1;
		}
		label$9:;
		C$1 = C$1 + 1;
		label$8:;
		if( C$1 <= TMP$2$2 ) goto label$11;
		label$10:;
	}
	fb$result$1 = D$1;
	goto label$3;
	label$3:;
	return fb$result$1;
}

int32 MAIN( void )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$12:;
	int32 A$1;
	__builtin_memset( &A$1, 0, 4 );
	fb_Color( 0, 2, 0 );
	{
		A$1 = 0;
		label$17:;
		{
			int32 vr$2 = POWER( 2, A$1 );
			fb_PrintInt( 0, vr$2, 1 );
		}
		label$15:;
		A$1 = A$1 + 1;
		label$14:;
		if( A$1 <= 8 ) goto label$17;
		label$16:;
	}
	fb$result$1 = 0;
	goto label$13;
	label$13:;
	return fb$result$1;
}

__attribute__(( constructor )) static void fb_ctor__power( void )
{
	label$0:;
	MAIN(  );
	label$1:;
}
