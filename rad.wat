; ModuleID = 'rads.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@i = global [2 x i32] [i32 511, i32 255], align 4
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = private unnamed_addr constant [9 x i8] c"\1B[42;30m\00"

; Function Attrs: nounwind
define i32 @rad(i32 %iii) #0 {
  %1 = tail call i32 @time(i32* null) #1
  tail call void @srand(i32 %1) #1
  %2 = and i32 %iii, 1
  %3 = getelementptr inbounds [2 x i32], [2 x i32]* @i, i32 0, i32 %2
  %4 = load i32, i32* %3, align 4, !tbaa !3
  %5 = tail call i32 @rand() #1
  %6 = and i32 %5, %4
  ret i32 %6
}

; Function Attrs: nounwind
declare void @srand(i32) #0

; Function Attrs: nounwind
declare i32 @time(i32*) #0

; Function Attrs: nounwind
declare i32 @rand() #0

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str, i32 0, i32 0))
  %1 = icmp sgt i32 %argc, 1
  br i1 %1, label %2, label %13

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8*, i8** %argv, i32 1
  %4 = load i8*, i8** %3, align 4, !tbaa !7
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #1
  %6 = tail call i32 @time(i32* null) #1
  tail call void @srand(i32 %6) #1
  %7 = and i32 %5, 1
  %8 = getelementptr inbounds [2 x i32], [2 x i32]* @i, i32 0, i32 %7
  %9 = load i32, i32* %8, align 4, !tbaa !3
  %10 = tail call i32 @rand() #1
  %11 = and i32 %10, %9
  %12 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %11)
  br label %13

; <label>:13                                      ; preds = %2, %0
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare i32 @strtol(i8* readonly, i8** nocapture, i32) #0

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
