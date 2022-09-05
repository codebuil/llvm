; ModuleID = 'drd.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@"SSS$" = internal unnamed_addr global i32 0, align 4
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @fb_ctor__drd, i8* null }]

; Function Attrs: norecurse nounwind
define i32 @RAD(i32 %"A$1") #0 {
  %1 = load i32, i32* @"SSS$", align 4, !tbaa !3
  %2 = icmp slt i32 %1, 81
  %not. = icmp ne i32 %"A$1", 0
  %3 = and i1 %not., %2
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  store i32 0, i32* @"SSS$", align 4, !tbaa !3
  tail call void @llvm.trap()
  unreachable

; <label>:5                                       ; preds = %0
  %6 = add nsw i32 %1, 1
  store i32 %6, i32* @"SSS$", align 4, !tbaa !3
  ret i32 undef
}

; Function Attrs: nounwind
define i32 @MAIN() #1 {
  store i32 0, i32* @"SSS$", align 4, !tbaa !3
  tail call void @llvm.trap() #3
  unreachable
}

; Function Attrs: norecurse nounwind
define internal void @fb_ctor__drd() #0 {
  store i32 0, i32* @"SSS$", align 4, !tbaa !3
  tail call void @llvm.trap() #3
  unreachable
}

; Function Attrs: noreturn nounwind
declare void @llvm.trap() #2

attributes #0 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
