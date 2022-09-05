; ModuleID = 'random.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @fb_ctor__random, i8* null }]

; Function Attrs: nounwind
define i32 @RAD(i32 %"A$1") #0 {
  %1 = icmp eq i32 %"A$1", 0
  %2 = tail call double @fb_Rnd(float 1.000000e+00) #3
  %.sink3.v = select i1 %1, double 5.000000e+02, double 3.000000e+02
  %.sink3 = fmul double %.sink3.v, %2
  %3 = tail call double @floor(double %.sink3) #4
  %4 = tail call double @nearbyint(double %3) #4
  %"fb$result$1.0" = fptosi double %4 to i32
  ret i32 %"fb$result$1.0"
}

declare double @fb_Rnd(float) #1

; Function Attrs: nounwind readnone
declare double @nearbyint(double) #2

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: nounwind
define i32 @MAIN() #0 {
  %1 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  %2 = tail call double @fb_Rnd(float 1.000000e+00) #3
  %.sink3.i = fmul double %2, 5.000000e+02
  %3 = tail call double @floor(double %.sink3.i) #4
  %4 = tail call double @nearbyint(double %3) #4
  %"fb$result$1.0.i" = fptosi double %4 to i32
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i", i32 1) #3
  %5 = tail call double @fb_Rnd(float 1.000000e+00) #3
  %.sink3.i1 = fmul double %5, 3.000000e+02
  %6 = tail call double @floor(double %.sink3.i1) #4
  %7 = tail call double @nearbyint(double %6) #4
  %"fb$result$1.0.i2" = fptosi double %7 to i32
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i2", i32 1) #3
  ret i32 0
}

declare i32 @fb_Color(i32, i32, i32) #1

declare void @fb_PrintInt(i32, i32, i32) #1

; Function Attrs: nounwind
define internal void @fb_ctor__random() #0 {
  %1 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  %2 = tail call double @fb_Rnd(float 1.000000e+00) #3
  %.sink3.i.i = fmul double %2, 5.000000e+02
  %3 = tail call double @floor(double %.sink3.i.i) #4
  %4 = tail call double @nearbyint(double %3) #4
  %"fb$result$1.0.i.i" = fptosi double %4 to i32
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i.i", i32 1) #3
  %5 = tail call double @fb_Rnd(float 1.000000e+00) #3
  %.sink3.i1.i = fmul double %5, 3.000000e+02
  %6 = tail call double @floor(double %.sink3.i1.i) #4
  %7 = tail call double @nearbyint(double %6) #4
  %"fb$result$1.0.i2.i" = fptosi double %7 to i32
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i2.i", i32 1) #3
  ret void
}

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
