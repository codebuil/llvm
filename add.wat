; ModuleID = 'add.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @fb_ctor__add, i8* null }]

; Function Attrs: norecurse nounwind readnone
define i32 @ADD(i32 %"A$1", i32 %"B$1") #0 {
  %1 = add nsw i32 %"B$1", %"A$1"
  ret i32 %1
}

; Function Attrs: nounwind
define i32 @MAIN() #1 {
  %1 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  tail call void @fb_PrintInt(i32 0, i32 40, i32 1) #3
  ret i32 0
}

declare i32 @fb_Color(i32, i32, i32) #2

declare void @fb_PrintInt(i32, i32, i32) #2

; Function Attrs: nounwind
define internal void @fb_ctor__add() #1 {
  %1 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  tail call void @fb_PrintInt(i32 0, i32 40, i32 1) #3
  ret void
}

attributes #0 = { norecurse nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
