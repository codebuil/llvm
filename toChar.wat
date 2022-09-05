; ModuleID = 'toChar.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

%struct.FBSTRING = type { i8*, i32, i32 }

@.str = private unnamed_addr constant [30 x i8] c"string to convert to char? : \00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @fb_ctor__toChar, i8* null }]

; Function Attrs: nounwind
define internal void @fb_ctor__toChar() #0 {
  %"S$0" = alloca %struct.FBSTRING, align 4
  %1 = bitcast %struct.FBSTRING* %"S$0" to i8*
  call void @llvm.lifetime.start(i64 12, i8* %1) #3
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 12, i32 4, i1 false)
  %2 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  %3 = tail call %struct.FBSTRING* @fb_StrAllocTempDescZEx(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i32 0, i32 0), i32 29) #3
  tail call void @fb_PrintString(i32 0, %struct.FBSTRING* %3, i32 0) #3
  %4 = tail call %struct.FBSTRING* @fb_StrAllocTempDescZEx(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), i32 0) #3
  %5 = tail call i32 @fb_ConsoleInput(%struct.FBSTRING* %4, i32 -1, i32 -1) #3
  %6 = call i32 @fb_InputString(i8* %1, i32 -1, i32 0) #3
  %7 = call i32 @fb_StrLen(i8* %1, i32 -1) #3
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

; <label>:9                                       ; preds = %.lr.ph
  call void @fb_PrintVoid(i32 0, i32 1) #3
  br label %10

; <label>:10                                      ; preds = %.lr.ph, %9
  %"A$0.0" = phi i32 [ %15, %.lr.ph ], [ 0, %9 ]
  %11 = add nuw nsw i32 %"B$0.01", 1
  %12 = call %struct.FBSTRING* @fb_StrMid(%struct.FBSTRING* nonnull %"S$0", i32 %11, i32 1) #3
  %13 = call i32 @fb_ASC(%struct.FBSTRING* %12, i32 1) #3
  call void @fb_PrintUInt(i32 0, i32 %13, i32 0) #3
  %14 = call %struct.FBSTRING* @fb_StrAllocTempDescZEx(i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i32 1) #3
  call void @fb_PrintString(i32 0, %struct.FBSTRING* %14, i32 0) #3
  %exitcond = icmp eq i32 %11, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %10
  %"A$0.12" = phi i32 [ %"A$0.0", %10 ], [ 0, %.lr.ph.preheader ]
  %"B$0.01" = phi i32 [ %11, %10 ], [ 0, %.lr.ph.preheader ]
  %15 = add nsw i32 %"A$0.12", 1
  %16 = icmp eq i32 %15, 5
  br i1 %16, label %9, label %10

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  call void @fb_StrDelete(%struct.FBSTRING* nonnull %"S$0") #3
  call void @llvm.lifetime.end(i64 12, i8* %1) #3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #1

declare i32 @fb_Color(i32, i32, i32) #2

declare %struct.FBSTRING* @fb_StrAllocTempDescZEx(i8*, i32) #2

declare void @fb_PrintString(i32, %struct.FBSTRING*, i32) #2

declare i32 @fb_ConsoleInput(%struct.FBSTRING*, i32, i32) #2

declare i32 @fb_InputString(i8*, i32, i32) #2

declare i32 @fb_StrLen(i8*, i32) #2

declare void @fb_PrintVoid(i32, i32) #2

declare %struct.FBSTRING* @fb_StrMid(%struct.FBSTRING*, i32, i32) #2

declare i32 @fb_ASC(%struct.FBSTRING*, i32) #2

declare void @fb_PrintUInt(i32, i32, i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

declare void @fb_StrDelete(%struct.FBSTRING*) #2

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
