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
static void fb_ctor__rd( void ) __attribute__(( constructor ));
int32 rad( int32 );
static int32 I$;
static int32 SSS$ = 0;

int32 rad( int32 A$1 )
{
	int32 fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$2:;
	if( (-(A$1 == 0) | -(SSS$ > 80)) == 0 ) goto label$5;
	{
		SSS$ = 0;
	}
	label$5:;
	label$4:;
	SSS$ = SSS$ + 1;
	fb$result$1 = (int32)*(uint8*)((int32)&rad + SSS$);
	goto label$3;
	label$3:;
	return fb$result$1;
}
