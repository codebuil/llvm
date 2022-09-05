; ModuleID = 'cls.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@.str = private unnamed_addr constant [11 x i8] c"\1Bc\1B[42;30m\00", align 1

; Function Attrs: nounwind
define void @clss() #0 {
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #0

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0)) #1
  ret i32 0
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
