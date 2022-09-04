; ModuleID = 'hello.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

%struct.FBSTRING = type { i8*, i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"hello word\00", align 1

; Function Attrs: nounwind
define i8* @HELLO() #0 {
  %1 = tail call i8* @malloc(i32 50)
  %2 = tail call %struct.FBSTRING* @fb_StrAssign(i8* %1, i32 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 11, i32 0) #2
  ret i8* %1
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) #0

declare %struct.FBSTRING* @fb_StrAssign(i8*, i32, i8*, i32, i32) #1

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = tail call i32 @fb_Color(i32 2, i32 0, i32 2) #2
  %2 = tail call i8* @malloc(i32 50) #2
  %3 = tail call %struct.FBSTRING* @fb_StrAssign(i8* %2, i32 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 11, i32 0) #2
  %4 = tail call %struct.FBSTRING* @fb_StrAllocTempDescZ(i8* %2) #2
  tail call void @fb_PrintString(i32 0, %struct.FBSTRING* %4, i32 1) #2
  ret i32 0
}

declare i32 @fb_Color(i32, i32, i32) #1

declare %struct.FBSTRING* @fb_StrAllocTempDescZ(i8*) #1

declare void @fb_PrintString(i32, %struct.FBSTRING*, i32) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
