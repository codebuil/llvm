%FBSTRING = type { i8*, i32, i32 }

declare void @fb_PrintString( i32, %FBSTRING*, i32 ) nounwind
declare %FBSTRING* @fb_StrAllocTempDescZEx( i8*, i32 ) nounwind

%fb_RTTI$ = type { i8*, i8*, %fb_RTTI$* }
@__fb_ZTS6Object = global %fb_RTTI$ zeroinitializer
@Lt_0006 = private constant [23 x i8] c"\1B[42;30m\5Cnhello word\5Cn\00"
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 0, void ()* @fb_ctor__hello }]

define private void @fb_ctor__hello(  ) nounwind
{

	; label .L_0002
	br label %.L_0002
.L_0002:

	; call fb_StrAllocTempDescZEx()
	; arg Lt_0006
	%vr1 = bitcast i8* bitcast ([23 x i8]* @Lt_0006 to i8*) to i8*
	; arg 22
	%vr0 = call %FBSTRING* @fb_StrAllocTempDescZEx( i8* %vr1, i32 22 )

	; call fb_PrintString()
	; arg 0
	; arg vr0
	%vr4 = bitcast %FBSTRING* %vr0 to %FBSTRING*
	; arg 1
	call void @fb_PrintString( i32 0, %FBSTRING* %vr4, i32 1 )

	; label .L_0003
	br label %.L_0003
.L_0003:
	ret void
}
