; ModuleID = 'power.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @fb_ctor__power, i8* null }]

; Function Attrs: norecurse nounwind readnone
define i32 @POWER(i32 %"A$1", i32 %"B$1") #0 {
  switch i32 %"B$1", label %2 [
    i32 0, label %.loopexit
    i32 1, label %1
  ]

; <label>:1                                       ; preds = %0
  br label %.loopexit

; <label>:2                                       ; preds = %0
  %3 = icmp slt i32 %"B$1", 2
  br i1 %3, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %4 = add i32 %"B$1", -1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %"D$1.02" = phi i32 [ %5, %.lr.ph ], [ %"A$1", %.lr.ph.preheader ]
  %"C$1.01" = phi i32 [ %6, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %5 = mul nsw i32 %"D$1.02", %"A$1"
  %6 = add nuw nsw i32 %"C$1.01", 1
  %exitcond = icmp eq i32 %6, %4
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph
  %.lcssa = phi i32 [ %5, %.lr.ph ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2, %0, %1
  %"fb$result$1.0" = phi i32 [ %"A$1", %1 ], [ 1, %0 ], [ %"A$1", %2 ], [ %.lcssa, %.loopexit.loopexit ]
  ret i32 %"fb$result$1.0"
}

; Function Attrs: nounwind
define i32 @MAIN() #1 {
  %1 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %0
  %"A$1.0" = phi i32 [ 0, %0 ], [ %"A$1.0.be", %.backedge.backedge ]
  switch i32 %"A$1.0", label %3 [
    i32 0, label %POWER.exit.thread
    i32 1, label %2
  ]

; <label>:2                                       ; preds = %.backedge
  br label %POWER.exit.thread

; <label>:3                                       ; preds = %.backedge
  %4 = icmp slt i32 %"A$1.0", 2
  br i1 %4, label %POWER.exit, label %.lr.ph.preheader.i

.lr.ph.preheader.i:                               ; preds = %3
  %5 = add i32 %"A$1.0", -1
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.lr.ph.preheader.i
  %"D$1.02.i" = phi i32 [ %6, %.lr.ph.i ], [ 2, %.lr.ph.preheader.i ]
  %"C$1.01.i" = phi i32 [ %7, %.lr.ph.i ], [ 0, %.lr.ph.preheader.i ]
  %6 = shl nsw i32 %"D$1.02.i", 1
  %7 = add nuw nsw i32 %"C$1.01.i", 1
  %exitcond.i = icmp eq i32 %7, %5
  br i1 %exitcond.i, label %POWER.exit.loopexit, label %.lr.ph.i

POWER.exit.thread:                                ; preds = %.backedge, %2
  %"fb$result$1.0.i.ph" = phi i32 [ 1, %.backedge ], [ 2, %2 ]
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i.ph", i32 1) #3
  %8 = add nsw i32 %"A$1.0", 1
  br label %.backedge.backedge

POWER.exit.loopexit:                              ; preds = %.lr.ph.i
  %.lcssa = phi i32 [ %6, %.lr.ph.i ]
  br label %POWER.exit

POWER.exit:                                       ; preds = %POWER.exit.loopexit, %3
  %"fb$result$1.0.i" = phi i32 [ 2, %3 ], [ %.lcssa, %POWER.exit.loopexit ]
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i", i32 1) #3
  %9 = add nsw i32 %"A$1.0", 1
  %10 = icmp slt i32 %9, 9
  br i1 %10, label %.backedge.backedge, label %11

.backedge.backedge:                               ; preds = %POWER.exit, %POWER.exit.thread
  %"A$1.0.be" = phi i32 [ %9, %POWER.exit ], [ %8, %POWER.exit.thread ]
  br label %.backedge

; <label>:11                                      ; preds = %POWER.exit
  ret i32 0
}

declare i32 @fb_Color(i32, i32, i32) #2

declare void @fb_PrintInt(i32, i32, i32) #2

; Function Attrs: nounwind
define internal void @fb_ctor__power() #1 {
  %1 = tail call i32 @fb_Color(i32 0, i32 2, i32 0) #3
  br label %.backedge.i

.backedge.i:                                      ; preds = %.backedge.i.backedge, %0
  %"A$1.0.i" = phi i32 [ 0, %0 ], [ %"A$1.0.i.be", %.backedge.i.backedge ]
  switch i32 %"A$1.0.i", label %3 [
    i32 0, label %POWER.exit.thread.i
    i32 1, label %2
  ]

; <label>:2                                       ; preds = %.backedge.i
  br label %POWER.exit.thread.i

; <label>:3                                       ; preds = %.backedge.i
  %4 = icmp slt i32 %"A$1.0.i", 2
  br i1 %4, label %POWER.exit.i, label %.lr.ph.preheader.i.i

.lr.ph.preheader.i.i:                             ; preds = %3
  %5 = add i32 %"A$1.0.i", -1
  br label %.lr.ph.i.i

.lr.ph.i.i:                                       ; preds = %.lr.ph.i.i, %.lr.ph.preheader.i.i
  %"D$1.02.i.i" = phi i32 [ %6, %.lr.ph.i.i ], [ 2, %.lr.ph.preheader.i.i ]
  %"C$1.01.i.i" = phi i32 [ %7, %.lr.ph.i.i ], [ 0, %.lr.ph.preheader.i.i ]
  %6 = shl nsw i32 %"D$1.02.i.i", 1
  %7 = add nuw nsw i32 %"C$1.01.i.i", 1
  %exitcond.i.i = icmp eq i32 %7, %5
  br i1 %exitcond.i.i, label %POWER.exit.i.loopexit, label %.lr.ph.i.i

POWER.exit.thread.i:                              ; preds = %2, %.backedge.i
  %"fb$result$1.0.i.ph.i" = phi i32 [ 1, %.backedge.i ], [ 2, %2 ]
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i.ph.i", i32 1) #3
  %8 = add nsw i32 %"A$1.0.i", 1
  br label %.backedge.i.backedge

.backedge.i.backedge:                             ; preds = %POWER.exit.thread.i, %POWER.exit.i
  %"A$1.0.i.be" = phi i32 [ %9, %POWER.exit.i ], [ %8, %POWER.exit.thread.i ]
  br label %.backedge.i

POWER.exit.i.loopexit:                            ; preds = %.lr.ph.i.i
  %.lcssa = phi i32 [ %6, %.lr.ph.i.i ]
  br label %POWER.exit.i

POWER.exit.i:                                     ; preds = %POWER.exit.i.loopexit, %3
  %"fb$result$1.0.i.i" = phi i32 [ 2, %3 ], [ %.lcssa, %POWER.exit.i.loopexit ]
  tail call void @fb_PrintInt(i32 0, i32 %"fb$result$1.0.i.i", i32 1) #3
  %9 = add nsw i32 %"A$1.0.i", 1
  %10 = icmp slt i32 %9, 9
  br i1 %10, label %.backedge.i.backedge, label %MAIN.exit

MAIN.exit:                                        ; preds = %POWER.exit.i
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
