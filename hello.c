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
void* malloc( uint32 );
void fb_PrintString( int32, FBSTRING*, int32 );
FBSTRING* fb_StrAssign( void*, int32, void*, int32, int32 );
FBSTRING* fb_StrAllocTempDescZ( uint8* );
static void fb_ctor__hello( void ) __attribute__(( constructor ));
uint8* HELLO( void );
void MAIN( void );

uint8* HELLO( void )
{
	uint8* fb$result$1;
	__builtin_memset( &fb$result$1, 0, 4 );
	label$2:;
	uint8* S$1;
	__builtin_memset( &S$1, 0, 4 );
	void* vr$2 = malloc( 50u );
	S$1 = (uint8*)vr$2;
	fb_StrAssign( (void*)S$1, 0, (void*)"hello word", 11, 0 );
	fb$result$1 = S$1;
	goto label$3;
	label$3:;
	return fb$result$1;
}

int main( void )
{
	label$4:;
	fb_Color( 2, 0, 2 );
	uint8* vr$0 = HELLO(  );
	FBSTRING* vr$1 = fb_StrAllocTempDescZ( (uint8*)vr$0 );
	fb_PrintString( 0, (FBSTRING*)vr$1, 1 );
	label$5:;
}

