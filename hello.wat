; ModuleID = 'hello.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

%struct.FBSTRING = type { i8*, i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"hello word\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @fb_ctor__hello, i8* null }]

; Function Attrs: nounwind
define %struct.FBSTRING* @HELLO() #0 {
  %"fb$result$1" = alloca %struct.FBSTRING, align 4
  %"S$1" = alloca %struct.FBSTRING, align 4
  %1 = bitcast %struct.FBSTRING* %"fb$result$1" to i8*
  call void @llvm.lifetime.start(i64 12, i8* %1) #3
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 12, i32 4, i1 false)
  %2 = bitcast %struct.FBSTRING* %"S$1" to i8*
  call void @llvm.lifetime.start(i64 12, i8* %2) #3
  %3 = call %struct.FBSTRING* @fb_StrInit(i8* %2, i32 -1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 11, i32 0) #3
  %4 = call %struct.FBSTRING* @fb_StrInit(i8* %1, i32 -1, i8* %2, i32 -1, i32 0) #3
  call void @fb_StrDelete(%struct.FBSTRING* nonnull %"S$1") #3
  %5 = call %struct.FBSTRING* @fb_StrAllocTempResult(%struct.FBSTRING* nonnull %"fb$result$1") #3
  call void @llvm.lifetime.end(i64 12, i8* %2) #3
  call void @llvm.lifetime.end(i64 12, i8* %1) #3
  ret %struct.FBSTRING* %5
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #1

declare %struct.FBSTRING* @fb_StrInit(i8*, i32, i8*, i32, i32) #2

declare void @fb_StrDelete(%struct.FBSTRING*) #2

declare %struct.FBSTRING* @fb_StrAllocTempResult(%struct.FBSTRING*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
define i32 @main() #0 {
  %"fb$result$1.i" = alloca %struct.FBSTRING, align 4
  %"S$1.i" = alloca %struct.FBSTRING, align 4
  %1 = tail call i32 @fb_Color(i32 2, i32 0, i32 2) #3
  %2 = bitcast %struct.FBSTRING* %"fb$result$1.i" to i8*
  call void @llvm.lifetime.start(i64 12, i8* %2) #3
  call void @llvm.memset.p0i8.i32(i8* %2, i8 0, i32 12, i32 4, i1 false) #3
  %3 = bitcast %struct.FBSTRING* %"S$1.i" to i8*
  call void @llvm.lifetime.start(i64 12, i8* %3) #3
  %4 = call %struct.FBSTRING* @fb_StrInit(i8* %3, i32 -1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 11, i32 0) #3
  %5 = call %struct.FBSTRING* @fb_StrInit(i8* %2, i32 -1, i8* %3, i32 -1, i32 0) #3
  call void @fb_StrDelete(%struct.FBSTRING* nonnull %"S$1.i") #3
  %6 = call %struct.FBSTRING* @fb_StrAllocTempResult(%struct.FBSTRING* nonnull %"fb$result$1.i") #3
  call void @llvm.lifetime.end(i64 12, i8* %3) #3
  call void @llvm.lifetime.end(i64 12, i8* %2) #3
  call void @fb_PrintString(i32 0, %struct.FBSTRING* %6, i32 1) #3
  ret i32 0
}

declare i32 @fb_Color(i32, i32, i32) #2

declare void @fb_PrintString(i32, %struct.FBSTRING*, i32) #2

; Function Attrs: nounwind
define internal void @fb_ctor__hello() #0 {
  %"fb$result$1.i.i" = alloca %struct.FBSTRING, align 4
  %"S$1.i.i" = alloca %struct.FBSTRING, align 4
  %1 = tail call i32 @fb_Color(i32 2, i32 0, i32 2) #3
  %2 = bitcast %struct.FBSTRING* %"fb$result$1.i.i" to i8*
  call void @llvm.lifetime.start(i64 12, i8* %2) #3
  call void @llvm.memset.p0i8.i32(i8* %2, i8 0, i32 12, i32 4, i1 false) #3
  %3 = bitcast %struct.FBSTRING* %"S$1.i.i" to i8*
  call void @llvm.lifetime.start(i64 12, i8* %3) #3
  %4 = call %struct.FBSTRING* @fb_StrInit(i8* %3, i32 -1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 11, i32 0) #3
  %5 = call %struct.FBSTRING* @fb_StrInit(i8* %2, i32 -1, i8* %3, i32 -1, i32 0) #3
  call void @fb_StrDelete(%struct.FBSTRING* nonnull %"S$1.i.i") #3
  %6 = call %struct.FBSTRING* @fb_StrAllocTempResult(%struct.FBSTRING* nonnull %"fb$result$1.i.i") #3
  call void @llvm.lifetime.end(i64 12, i8* %3) #3
  call void @llvm.lifetime.end(i64 12, i8* %2) #3
  call void @fb_PrintString(i32 0, %struct.FBSTRING* %6, i32 1) #3
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
