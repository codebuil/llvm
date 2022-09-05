; ModuleID = 'list.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

%struct.FBSTRING = type { i8*, i32, i32 }

@.str = private unnamed_addr constant [2 x i8] c",\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @fb_ctor__list, i8* null }]

; Function Attrs: nounwind
define internal void @fb_ctor__list() #0 {
  %1 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  br label %2

; <label>:2                                       ; preds = %13, %0
  %"B$0.0" = phi i32 [ 0, %0 ], [ %14, %13 ]
  br label %3

; <label>:3                                       ; preds = %3, %2
  %"A$0.0" = phi i32 [ 0, %2 ], [ %12, %3 ]
  %4 = tail call double @fb_Rnd(float 1.000000e+00) #3
  %5 = fmul double %4, 5.000000e+02
  %6 = tail call double @floor(double %5) #4
  tail call void @fb_PrintDouble(i32 0, double %6, i32 0) #3
  %7 = tail call %struct.FBSTRING* @fb_StrAllocTempDescZEx(i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i32 1) #3
  tail call void @fb_PrintString(i32 0, %struct.FBSTRING* %7, i32 0) #3
  %8 = tail call double @fb_Rnd(float 1.000000e+00) #3
  %9 = fmul double %8, 3.000000e+02
  %10 = tail call double @floor(double %9) #4
  tail call void @fb_PrintDouble(i32 0, double %10, i32 0) #3
  %11 = tail call %struct.FBSTRING* @fb_StrAllocTempDescZEx(i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i32 1) #3
  tail call void @fb_PrintString(i32 0, %struct.FBSTRING* %11, i32 0) #3
  %12 = add nuw nsw i32 %"A$0.0", 1
  %exitcond = icmp eq i32 %12, 6
  br i1 %exitcond, label %13, label %3

; <label>:13                                      ; preds = %3
  tail call void @fb_PrintVoid(i32 0, i32 1) #3
  %14 = add nuw nsw i32 %"B$0.0", 1
  %exitcond1 = icmp eq i32 %14, 51
  br i1 %exitcond1, label %15, label %2

; <label>:15                                      ; preds = %13
  ret void
}

declare i32 @fb_Color(i32, i32, i32) #1

declare double @fb_Rnd(float) #1

declare void @fb_PrintDouble(i32, double, i32) #1

; Function Attrs: nounwind readnone
declare double @floor(double) #2

declare %struct.FBSTRING* @fb_StrAllocTempDescZEx(i8*, i32) #1

declare void @fb_PrintString(i32, %struct.FBSTRING*, i32) #1

declare void @fb_PrintVoid(i32, i32) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
