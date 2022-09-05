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
double fb_Rnd( float );
void fb_PrintVoid( int32, int32 );
void fb_PrintDouble( int32, double, int32 );
void fb_PrintString( int32, FBSTRING*, int32 );
FBSTRING* fb_StrAllocTempDescZEx( uint8*, int32 );
static void fb_ctor__list( void ) __attribute__(( constructor ));

__attribute__(( constructor )) static void fb_ctor__list( void )
{
	label$0:;
	int32 A$0;
	__builtin_memset( &A$0, 0, 4 );
	int32 B$0;
	__builtin_memset( &B$0, 0, 4 );
	fb_Color( 0, 2, 0 );
	{
		B$0 = 0;
		label$5:;
		{
			{
				A$0 = 0;
				label$9:;
				{
					double vr$2 = fb_Rnd( 0x1.p+0f );
					fb_PrintDouble( 0, __builtin_floor( (vr$2 * 0x1.F4p+8) ), 0 );
					FBSTRING* vr$5 = fb_StrAllocTempDescZEx( (uint8*)",", 1 );
					fb_PrintString( 0, (FBSTRING*)vr$5, 0 );
					double vr$6 = fb_Rnd( 0x1.p+0f );
					fb_PrintDouble( 0, __builtin_floor( (vr$6 * 0x1.2Cp+8) ), 0 );
					FBSTRING* vr$9 = fb_StrAllocTempDescZEx( (uint8*)",", 1 );
					fb_PrintString( 0, (FBSTRING*)vr$9, 0 );
				}
				label$7:;
				A$0 = A$0 + 1;
				label$6:;
				if( A$0 <= 5 ) goto label$9;
				label$8:;
			}
			fb_PrintVoid( 0, 1 );
		}
		label$3:;
		B$0 = B$0 + 1;
		label$2:;
		if( B$0 <= 50 ) goto label$5;
		label$4:;
	}
	label$1:;
}
