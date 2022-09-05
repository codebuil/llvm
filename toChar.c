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
int32 fb_ConsoleInput( FBSTRING*, int32, int32 );
int32 fb_InputString( void*, int32, int32 );
void fb_PrintVoid( int32, int32 );
void fb_PrintUInt( int32, uint32, int32 );
void fb_PrintString( int32, FBSTRING*, int32 );
void fb_StrDelete( FBSTRING* );
FBSTRING* fb_StrAllocTempDescZEx( uint8*, int32 );
FBSTRING* fb_StrMid( FBSTRING*, int32, int32 );
int32 fb_StrLen( void*, int32 );
uint32 fb_ASC( FBSTRING*, int32 );
static void fb_ctor__toChar( void ) __attribute__(( constructor ));

__attribute__(( constructor )) static void fb_ctor__toChar( void )
{
	label$0:;
	int32 A$0;
	__builtin_memset( &A$0, 0, 4 );
	int32 B$0;
	__builtin_memset( &B$0, 0, 4 );
	FBSTRING S$0;
	__builtin_memset( &S$0, 0, 12 );
	fb_Color( 0, 2, 0 );
	FBSTRING* vr$3 = fb_StrAllocTempDescZEx( (uint8*)"string to convert to char? : ", 29 );
	fb_PrintString( 0, (FBSTRING*)vr$3, 0 );
	FBSTRING* vr$4 = fb_StrAllocTempDescZEx( (uint8*)"", 0 );
	fb_ConsoleInput( (FBSTRING*)vr$4, -1, -1 );
	fb_InputString( (void*)&S$0, -1, 0 );
	A$0 = 0;
	{
		B$0 = 0;
		int32 TMP$3$1;
		int32 vr$7 = fb_StrLen( (void*)&S$0, -1 );
		TMP$3$1 = vr$7 + -1;
		goto label$2;
		label$5:;
		{
			A$0 = A$0 + 1;
			if( A$0 != 5 ) goto label$7;
			{
				A$0 = 0;
				fb_PrintVoid( 0, 1 );
			}
			label$7:;
			label$6:;
			FBSTRING* vr$12 = fb_StrMid( (FBSTRING*)&S$0, B$0 + 1, 1 );
			uint32 vr$13 = fb_ASC( (FBSTRING*)vr$12, 1 );
			fb_PrintUInt( 0, vr$13, 0 );
			FBSTRING* vr$14 = fb_StrAllocTempDescZEx( (uint8*)",", 1 );
			fb_PrintString( 0, (FBSTRING*)vr$14, 0 );
		}
		label$3:;
		B$0 = B$0 + 1;
		label$2:;
		if( B$0 <= TMP$3$1 ) goto label$5;
		label$4:;
	}
	fb_StrDelete( (FBSTRING*)&S$0 );
	label$1:;
}
