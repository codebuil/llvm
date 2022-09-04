; ModuleID = 'float.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@.str.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@str = private unnamed_addr constant [9 x i8] c"\1B[42;30m\00"

; Function Attrs: norecurse nounwind readnone
define float @floats(float %f1, float %f2) #0 {
  %1 = fadd float %f1, %f2
  ret float %1
}

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str, i32 0, i32 0))
  %1 = icmp sgt i32 %argc, 2
  br i1 %1, label %2, label %14

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8*, i8** %argv, i32 1
  %4 = load i8*, i8** %3, align 4, !tbaa !3
  %5 = tail call double @strtod(i8* nocapture nonnull %4, i8** null) #2
  %6 = fptrunc double %5 to float
  %7 = getelementptr inbounds i8*, i8** %argv, i32 2
  %8 = load i8*, i8** %7, align 4, !tbaa !3
  %9 = tail call double @strtod(i8* nocapture nonnull %8, i8** null) #2
  %10 = fptrunc double %9 to float
  %11 = fadd float %6, %10
  %12 = fpext float %11 to double
  %13 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), double %12)
  br label %14

; <label>:14                                      ; preds = %2, %0
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare double @strtod(i8* readonly, i8** nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #2

attributes #0 = { norecurse nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
