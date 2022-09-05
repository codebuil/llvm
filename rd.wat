; ModuleID = 'rd.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@"SSS$" = internal unnamed_addr global i32 0, align 4

; Function Attrs: norecurse nounwind
define i32 @rad(i32 %"A$1") #0 {
  %1 = load i32, i32* @"SSS$", align 4, !tbaa !3
  %2 = icmp slt i32 %1, 81
  %not. = icmp ne i32 %"A$1", 0
  %3 = and i1 %not., %2
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  store i32 0, i32* @"SSS$", align 4, !tbaa !3
  br label %5

; <label>:5                                       ; preds = %4, %0
  %6 = phi i32 [ 0, %4 ], [ %1, %0 ]
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* @"SSS$", align 4, !tbaa !3
  %8 = add i32 %6, add (i32 ptrtoint (i32 (i32)* @rad to i32), i32 1)
  %9 = inttoptr i32 %8 to i8*
  %10 = load i8, i8* %9, align 1, !tbaa !7
  %11 = zext i8 %10 to i32
  ret i32 %11
}

attributes #0 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
