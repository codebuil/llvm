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
static void fb_ctor__drd( void ) __attribute__(( constructor ));
int32 RAD( int32 );
int32 MAIN( void );
static int32 I$;
static int32* P$;
static int32 SSS$ = 0;

int32 RAD( int32 A$1 )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$2:;
	if( (-(A$1 == 0) | -(SSS$ > 80)) == 0 ) goto label$5;
	{
		SSS$ = 0;
		*P$ = (int32)&RAD + SSS$;
	}
	label$5:;
	label$4:;
	SSS$ = SSS$ + 1;
	fb$result$1 = *P$;
	goto label$3;
	label$3:;
	return fb$result$1;
}

int32 MAIN( void )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$6:;
	int32 A$1;
	__builtin_memset( &A$1, 0, 4 );
	RAD( 0 );
	fb_Color( 0, 2, 0 );
	{
		A$1 = 0;
		label$11:;
		{
			int32 vr$2 = RAD( 1 );
			fb_PrintInt( 0, vr$2, 1 );
		}
		label$9:;
		A$1 = A$1 + 1;
		label$8:;
		if( A$1 <= 50 ) goto label$11;
		label$10:;
	}
	fb$result$1 = 0;
	goto label$7;
	label$7:;
	return fb$result$1;
}

__attribute__(( constructor )) static void fb_ctor__drd( void )
{
	label$0:;
	MAIN(  );
	label$1:;
}
