; ModuleID = 'tree.c'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6--linux-gnueabihf"

%struct.stacksss = type { i32, [2048 x i32] }
%struct.trees = type { i32, i32, [2048 x %struct.node] }
%struct.node = type { [33 x i8], [33 x i8], i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"error no more space for nodes\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%s,%s\0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"%s,%s,%d,%d,%d,%d,%d\0A\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"DELETE NODE****\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"PC\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"pcs\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"ARM\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"arm\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"X86\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"x86\00", align 1
@.str.17 = private unnamed_addr constant [6 x i8] c"APPLE\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"apple\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"ARM6\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"arm6\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"ARM7\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"arm7\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"X8086\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"8086\00", align 1
@.str.25 = private unnamed_addr constant [7 x i8] c"X80186\00", align 1
@.str.26 = private unnamed_addr constant [6 x i8] c"80186\00", align 1
@.str.27 = private unnamed_addr constant [7 x i8] c"X80286\00", align 1
@.str.28 = private unnamed_addr constant [6 x i8] c"80286\00", align 1
@.str.29 = private unnamed_addr constant [7 x i8] c"X80386\00", align 1
@.str.30 = private unnamed_addr constant [6 x i8] c"80386\00", align 1
@.str.31 = private unnamed_addr constant [7 x i8] c"X80486\00", align 1
@.str.32 = private unnamed_addr constant [6 x i8] c"80486\00", align 1
@.str.33 = private unnamed_addr constant [7 x i8] c"X80586\00", align 1
@.str.34 = private unnamed_addr constant [6 x i8] c"80586\00", align 1
@.str.35 = private unnamed_addr constant [4 x i8] c"MAC\00", align 1
@.str.36 = private unnamed_addr constant [4 x i8] c"mac\00", align 1
@.str.39 = private unnamed_addr constant [9 x i8] c"tree.dat\00", align 1
@str = private unnamed_addr constant [13 x i8] c"\1Bc\1B[42;30m\0A\07\00"
@str.40 = private unnamed_addr constant [12 x i8] c"***********\00"

; Function Attrs: norecurse nounwind
define void @startstack(%struct.stacksss* nocapture %stack) #0 {
  %1 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 0
  store i32 0, i32* %1, align 4, !tbaa !3
  ret void
}

; Function Attrs: norecurse nounwind
define i32 @push(%struct.stacksss* nocapture %stack, i32 %value) #0 {
  %1 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 0
  %2 = load i32, i32* %1, align 4, !tbaa !3
  %3 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 1, i32 %2
  store i32 %value, i32* %3, align 4, !tbaa !8
  %4 = load i32, i32* %1, align 4, !tbaa !3
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %1, align 4, !tbaa !3
  ret i32 %2
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind
define i32 @pop(%struct.stacksss* nocapture %stack) #0 {
  %1 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 0
  %2 = load i32, i32* %1, align 4, !tbaa !3
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = add nsw i32 %2, -1
  store i32 %5, i32* %1, align 4, !tbaa !3
  %6 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 1, i32 %5
  %7 = load i32, i32* %6, align 4, !tbaa !8
  br label %8

; <label>:8                                       ; preds = %4, %0
  %i.0 = phi i32 [ %7, %4 ], [ -1, %0 ]
  ret i32 %i.0
}

; Function Attrs: nounwind
define void @reportStack(%struct.stacksss* nocapture readonly %stack) #2 {
  %putchar = tail call i32 @putchar(i32 10) #4
  %1 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 0
  %2 = load i32, i32* %1, align 4, !tbaa !3
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %12
  %i.03 = phi i32 [ %13, %12 ], [ 0, %.lr.ph.preheader ]
  %4 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 1, i32 %i.03
  %5 = load i32, i32* %4, align 4, !tbaa !8
  %6 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %5)
  %7 = load i32, i32* %1, align 4, !tbaa !3
  %8 = add nsw i32 %7, -1
  %9 = icmp eq i32 %i.03, %8
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %.lr.ph
  %putchar2 = tail call i32 @putchar(i32 44) #4
  br label %12

; <label>:11                                      ; preds = %.lr.ph
  %putchar1 = tail call i32 @putchar(i32 10) #4
  br label %12

; <label>:12                                      ; preds = %10, %11
  %13 = add nuw nsw i32 %i.03, 1
  %14 = load i32, i32* %1, align 4, !tbaa !3
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %12
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: norecurse nounwind
define i32 @starttree(%struct.trees* nocapture %tree1) #0 {
  %1 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 0
  store i32 0, i32* %1, align 4, !tbaa !9
  %2 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 1
  store i32 -1, i32* %2, align 4, !tbaa !11
  ret i32 undef
}

; Function Attrs: nounwind
define i32 @newnode(%struct.trees* %tree1, i8* nocapture readonly %caption, i8* nocapture readonly %text) #2 {
  %1 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 0
  %2 = load i32, i32* %1, align 4, !tbaa !9
  %3 = tail call i32 @strlen(i8* %caption) #5
  %4 = add nsw i32 %2, 1
  %5 = icmp slt i32 %4, 2048
  br i1 %5, label %11, label %.preheader

.preheader:                                       ; preds = %0
  %6 = icmp sgt i32 %2, -1
  br i1 %6, label %.lr.ph, label %._crit_edge.thread

.lr.ph:                                           ; preds = %.preheader
  %7 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 0, i32 6
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %.lr.ph.split.us, label %._crit_edge

.lr.ph.split.us:                                  ; preds = %.lr.ph
  %10 = icmp sgt i32 %2, 1
  br i1 %10, label %.lr.ph.split.us.split.preheader, label %._crit_edge.thread5

.lr.ph.split.us.split.preheader:                  ; preds = %.lr.ph.split.us
  br label %.lr.ph.split.us.split

.lr.ph.split.us.split:                            ; preds = %.lr.ph.split.us.split.preheader, %.lr.ph.split.us.split
  br label %.lr.ph.split.us.split

; <label>:11                                      ; preds = %0
  %12 = icmp sgt i32 %3, 32
  %.2 = select i1 %12, i32 32, i32 %3
  %13 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %2, i32 0, i32 0
  %14 = tail call i8* @strncpy(i8* %13, i8* %caption, i32 %.2) #4
  %15 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %2, i32 0, i32 32
  store i8 0, i8* %15, align 4, !tbaa !12
  %16 = tail call i32 @strlen(i8* %text) #5
  %17 = icmp sgt i32 %16, 32
  %. = select i1 %17, i32 32, i32 %16
  %18 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %2, i32 1, i32 0
  %19 = tail call i8* @strncpy(i8* %18, i8* %text, i32 %.) #4
  %20 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %2, i32 1, i32 32
  store i8 0, i8* %20, align 1, !tbaa !12
  %21 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %2, i32 2
  %22 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %2, i32 6
  %23 = bitcast i32* %21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %23, i8 -1, i64 16, i32 4, i1 false)
  store i32 0, i32* %22, align 4, !tbaa !13
  %24 = load i32, i32* %1, align 4, !tbaa !9
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %1, align 4, !tbaa !9
  br label %41

._crit_edge:                                      ; preds = %.lr.ph
  %26 = icmp sgt i32 %2, 0
  %smax = select i1 %26, i32 %2, i32 0
  %27 = icmp eq i32 %smax, -1
  br i1 %27, label %._crit_edge.thread, label %._crit_edge.thread5

._crit_edge.thread5:                              ; preds = %.lr.ph.split.us, %._crit_edge
  %i.0.lcssa6 = phi i32 [ %smax, %._crit_edge ], [ 1, %.lr.ph.split.us ]
  %28 = icmp sgt i32 %3, 32
  %.3 = select i1 %28, i32 32, i32 %3
  %29 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.0.lcssa6, i32 0, i32 0
  %30 = tail call i8* @strncpy(i8* %29, i8* %caption, i32 %.3) #4
  %31 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.0.lcssa6, i32 0, i32 32
  store i8 0, i8* %31, align 4, !tbaa !12
  %32 = tail call i32 @strlen(i8* %text) #5
  %33 = icmp sgt i32 %32, 32
  %.1 = select i1 %33, i32 32, i32 %32
  %34 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.0.lcssa6, i32 1, i32 0
  %35 = tail call i8* @strncpy(i8* %34, i8* %text, i32 %.1) #4
  %36 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.0.lcssa6, i32 1, i32 32
  store i8 0, i8* %36, align 1, !tbaa !12
  %37 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.0.lcssa6, i32 2
  %38 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.0.lcssa6, i32 6
  %39 = bitcast i32* %37 to i8*
  call void @llvm.memset.p0i8.i64(i8* %39, i8 -1, i64 16, i32 4, i1 false)
  store i32 0, i32* %38, align 4, !tbaa !13
  br label %41

._crit_edge.thread:                               ; preds = %.preheader, %._crit_edge
  %40 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i32 0, i32 0))
  br label %41

; <label>:41                                      ; preds = %._crit_edge.thread5, %._crit_edge.thread, %11
  %i.2 = phi i32 [ %2, %11 ], [ %i.0.lcssa6, %._crit_edge.thread5 ], [ -1, %._crit_edge.thread ]
  ret i32 %i.2
}

; Function Attrs: nounwind readonly
declare i32 @strlen(i8* nocapture) #3

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i32) #2

; Function Attrs: nounwind
define void @reporttree(%struct.trees* %tree1, i32 %node0) #2 {
  %stack = alloca %struct.stacksss, align 4
  %1 = bitcast %struct.stacksss* %stack to i8*
  call void @llvm.lifetime.start(i64 8196, i8* %1) #4
  %2 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 0
  store i32 0, i32* %2, align 4, !tbaa !3
  %3 = icmp eq i32 %node0, -1
  br i1 %3, label %._crit_edge19, label %.preheader9.preheader

.preheader9.preheader:                            ; preds = %0
  %4 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.preheader, %.backedge
  %5 = phi i32 [ %47, %.backedge ], [ 0, %.preheader9.preheader ]
  %nnode.018 = phi %struct.node* [ %nnode.0.be, %.backedge ], [ %4, %.preheader9.preheader ]
  %current.017 = phi i32 [ %current.0.be, %.backedge ], [ %node0, %.preheader9.preheader ]
  %tabs.016 = phi i32 [ %tabs.0.be, %.backedge ], [ 0, %.preheader9.preheader ]
  %6 = icmp sgt i32 %tabs.016, 0
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader9
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %i.010 = phi i32 [ %8, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %7 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0))
  %8 = add nuw nsw i32 %i.010, 1
  %exitcond = icmp eq i32 %8, %tabs.016
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader9
  %9 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 0, i32 0
  %10 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 1, i32 0
  %11 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* %9, i8* %10)
  %12 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 5
  %13 = load i32, i32* %12, align 4, !tbaa !15
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %21, label %.thread

.thread:                                          ; preds = %._crit_edge
  %15 = add nsw i32 %tabs.016, 1
  %16 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 1, i32 %5
  store i32 %current.017, i32* %16, align 4, !tbaa !8
  %17 = load i32, i32* %2, align 4, !tbaa !3
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %2, align 4, !tbaa !3
  %19 = load i32, i32* %12, align 4, !tbaa !15
  %20 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %19
  br label %.backedge

; <label>:21                                      ; preds = %._crit_edge
  %22 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 3
  %23 = load i32, i32* %22, align 4, !tbaa !16
  %24 = icmp eq i32 %23, -1
  %25 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %23
  %current.1. = select i1 %24, i32 %current.017, i32 %23
  %nnode.1. = select i1 %24, %struct.node* %nnode.018, %struct.node* %25
  %26 = icmp sgt i32 %5, 0
  %or.cond = and i1 %24, %26
  br i1 %or.cond, label %pop.exit.preheader, label %41

pop.exit.preheader:                               ; preds = %21
  br label %pop.exit

pop.exit:                                         ; preds = %pop.exit.preheader, %pop.exit
  %tabs.211 = phi i32 [ %31, %pop.exit ], [ %tabs.016, %pop.exit.preheader ]
  %27 = phi i32 [ %28, %pop.exit ], [ %5, %pop.exit.preheader ]
  %28 = add nsw i32 %27, -1
  store i32 %28, i32* %2, align 4, !tbaa !3
  %29 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 1, i32 %28
  %30 = load i32, i32* %29, align 4, !tbaa !8
  %.phi.trans.insert = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %30, i32 3
  %.pre = load i32, i32* %.phi.trans.insert, align 4, !tbaa !16
  %31 = add nsw i32 %tabs.211, -1
  %32 = icmp sgt i32 %27, 1
  %33 = icmp eq i32 %.pre, -1
  %34 = and i1 %32, %33
  br i1 %34, label %pop.exit, label %35

; <label>:35                                      ; preds = %pop.exit
  %.lcssa28 = phi i32 [ %31, %pop.exit ]
  %.lcssa27 = phi i32 [ %30, %pop.exit ]
  %.lcssa = phi i32 [ %28, %pop.exit ]
  %36 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.lcssa27
  %37 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.lcssa27, i32 3
  %38 = load i32, i32* %37, align 4, !tbaa !16
  %39 = icmp eq i32 %38, -1
  %40 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %38
  %current.3. = select i1 %39, i32 %.lcssa27, i32 %38
  %nnode.3. = select i1 %39, %struct.node* %36, %struct.node* %40
  br label %41

; <label>:41                                      ; preds = %35, %21
  %42 = phi i32 [ %5, %21 ], [ %.lcssa, %35 ]
  %tabs.3 = phi i32 [ %tabs.016, %21 ], [ %.lcssa28, %35 ]
  %current.4 = phi i32 [ %current.1., %21 ], [ %current.3., %35 ]
  %nnode.4 = phi %struct.node* [ %nnode.1., %21 ], [ %nnode.3., %35 ]
  %43 = icmp slt i32 %42, 1
  %or.cond3 = and i1 %24, %43
  br i1 %or.cond3, label %44, label %.backedge

; <label>:44                                      ; preds = %41
  %45 = getelementptr inbounds %struct.node, %struct.node* %nnode.4, i32 0, i32 3
  %46 = load i32, i32* %45, align 4, !tbaa !16
  br label %.backedge

.backedge:                                        ; preds = %44, %41, %.thread
  %47 = phi i32 [ %42, %44 ], [ %42, %41 ], [ %18, %.thread ]
  %b.0.be = phi i32 [ %46, %44 ], [ %current.4, %41 ], [ %19, %.thread ]
  %tabs.0.be = phi i32 [ %tabs.3, %44 ], [ %tabs.3, %41 ], [ %15, %.thread ]
  %current.0.be = phi i32 [ %current.4, %44 ], [ %current.4, %41 ], [ %19, %.thread ]
  %nnode.0.be = phi %struct.node* [ %nnode.4, %44 ], [ %nnode.4, %41 ], [ %20, %.thread ]
  %48 = icmp eq i32 %b.0.be, -1
  br i1 %48, label %._crit_edge19.loopexit, label %.preheader9

._crit_edge19.loopexit:                           ; preds = %.backedge
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %0
  call void @llvm.lifetime.end(i64 8196, i8* %1) #4
  ret void
}

; Function Attrs: norecurse nounwind
define void @setfather(%struct.trees* nocapture %tree1, i32 %node0, i32 %nodeme) #0 {
  %1 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 5
  %2 = load i32, i32* %1, align 4, !tbaa !15
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %4, label %.lr.ph.lr.ph

; <label>:4                                       ; preds = %0
  store i32 %nodeme, i32* %1, align 4, !tbaa !15
  %5 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %nodeme, i32 4
  store i32 %node0, i32* %5, align 4, !tbaa !17
  %6 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %nodeme, i32 3
  store i32 -1, i32* %6, align 4, !tbaa !16
  br label %.loopexit

.lr.ph.lr.ph:                                     ; preds = %0
  %7 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %nodeme, i32 2
  %8 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %nodeme, i32 3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.lr.ph
  %.pn = phi i32 [ %2, %.lr.ph.lr.ph ], [ %10, %.lr.ph ]
  %9 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn, i32 3
  %10 = load i32, i32* %9, align 4, !tbaa !16
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %..loopexit_crit_edge, label %.lr.ph

..loopexit_crit_edge:                             ; preds = %.lr.ph
  %.lcssa = phi i32* [ %9, %.lr.ph ]
  %.pn.lcssa = phi i32 [ %.pn, %.lr.ph ]
  store i32 %nodeme, i32* %.lcssa, align 4, !tbaa !16
  store i32 %.pn.lcssa, i32* %7, align 4, !tbaa !18
  store i32 -1, i32* %8, align 4, !tbaa !16
  br label %.loopexit

.loopexit:                                        ; preds = %..loopexit_crit_edge, %4
  ret void
}

; Function Attrs: norecurse nounwind
define void @settreeRoot(%struct.trees* nocapture %tree1, i32 %node0) #0 {
  %1 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 1
  store i32 %node0, i32* %1, align 4, !tbaa !11
  ret void
}

; Function Attrs: norecurse nounwind
define void @cleartree(%struct.trees* nocapture %tree1) #0 {
  %1 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 0
  store i32 0, i32* %1, align 4, !tbaa !9
  %2 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 1
  store i32 -1, i32* %2, align 4, !tbaa !11
  ret void
}

; Function Attrs: nounwind
define void @savetree(%struct.trees* nocapture %tree1, i8* nocapture readonly %name, i32 %sizes) #2 {
  %1 = tail call %struct._IO_FILE* @fopen(i8* %name, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  %2 = bitcast %struct.trees* %tree1 to i8*
  %3 = tail call i32 @fwrite(i8* %2, i32 %sizes, i32 1, %struct._IO_FILE* %1)
  %4 = tail call i32 @fclose(%struct._IO_FILE* %1)
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @fwrite(i8* nocapture, i32, i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
define void @loadtree(%struct.trees* nocapture %tree1, i8* nocapture readonly %name, i32 %sizes) #2 {
  %1 = tail call %struct._IO_FILE* @fopen(i8* %name, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %2 = bitcast %struct.trees* %tree1 to i8*
  %3 = tail call i32 @fread(i8* %2, i32 %sizes, i32 1, %struct._IO_FILE* %1)
  %4 = tail call i32 @fclose(%struct._IO_FILE* %1)
  ret void
}

; Function Attrs: nounwind
declare i32 @fread(i8* nocapture, i32, i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
define void @reportnode(%struct.trees* %tree1, i32 %node0) #2 {
  %1 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 0, i32 0
  %2 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 1, i32 0
  %3 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 2
  %4 = load i32, i32* %3, align 4, !tbaa !18
  %5 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 3
  %6 = load i32, i32* %5, align 4, !tbaa !16
  %7 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 4
  %8 = load i32, i32* %7, align 4, !tbaa !17
  %9 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 6
  %10 = load i32, i32* %9, align 4, !tbaa !13
  %11 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 5
  %12 = load i32, i32* %11, align 4, !tbaa !15
  %13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0), i8* %1, i8* %2, i32 %4, i32 %6, i32 %8, i32 %10, i32 %12)
  ret void
}

; Function Attrs: nounwind
define void @deletetreenode(%struct.trees* %tree1, i32 %node0) #2 {
  %stack = alloca %struct.stacksss, align 4
  %1 = bitcast %struct.stacksss* %stack to i8*
  call void @llvm.lifetime.start(i64 8196, i8* %1) #4
  %2 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 0
  store i32 0, i32* %2, align 4, !tbaa !3
  %3 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0
  %4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i32 0, i32 0))
  %5 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 6
  store i32 -1, i32* %5, align 4, !tbaa !13
  %6 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 3
  %7 = load i32, i32* %6, align 4, !tbaa !16
  %8 = icmp eq i32 %7, -1
  %9 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 2
  %10 = load i32, i32* %9, align 4, !tbaa !18
  %11 = icmp ne i32 %10, -1
  br i1 %8, label %23, label %12

; <label>:12                                      ; preds = %0
  br i1 %11, label %13, label %17

; <label>:13                                      ; preds = %12
  %14 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %7, i32 2
  store i32 %10, i32* %14, align 4, !tbaa !18
  %15 = load i32, i32* %9, align 4, !tbaa !18
  %16 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %15, i32 3
  store i32 %7, i32* %16, align 4, !tbaa !16
  br label %32

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 4
  %19 = load i32, i32* %18, align 4, !tbaa !17
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %32, label %21

; <label>:21                                      ; preds = %17
  %22 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %19, i32 5
  store i32 %7, i32* %22, align 4, !tbaa !15
  store i32 -1, i32* %18, align 4, !tbaa !17
  br label %32

; <label>:23                                      ; preds = %0
  br i1 %11, label %24, label %26

; <label>:24                                      ; preds = %23
  %25 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %10, i32 3
  store i32 -1, i32* %25, align 4, !tbaa !16
  br label %32

; <label>:26                                      ; preds = %23
  %27 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 4
  %28 = load i32, i32* %27, align 4, !tbaa !17
  %29 = icmp eq i32 %28, -1
  br i1 %29, label %32, label %30

; <label>:30                                      ; preds = %26
  %31 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %28, i32 5
  store i32 -1, i32* %31, align 4, !tbaa !15
  store i32 -1, i32* %27, align 4, !tbaa !17
  br label %32

; <label>:32                                      ; preds = %17, %26, %24, %30, %13, %21
  store i32 -1, i32* %9, align 4, !tbaa !18
  store i32 -1, i32* %6, align 4, !tbaa !16
  %33 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 4
  store i32 -1, i32* %33, align 4, !tbaa !17
  br label %.preheader9

.preheader9:                                      ; preds = %32, %.backedge
  %nnode.018 = phi %struct.node* [ %3, %32 ], [ %nnode.0.be, %.backedge ]
  %current.017 = phi i32 [ %node0, %32 ], [ %current.0.be, %.backedge ]
  %tabs.016 = phi i32 [ 0, %32 ], [ %tabs.0.be, %.backedge ]
  %34 = icmp sgt i32 %tabs.016, 0
  br i1 %34, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader9
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %i.010 = phi i32 [ %36, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %35 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0))
  %36 = add nuw nsw i32 %i.010, 1
  %exitcond = icmp eq i32 %36, %tabs.016
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader9
  %37 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 0, i32 0
  %38 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 1, i32 0
  %39 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* %37, i8* %38)
  %40 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 6
  store i32 -1, i32* %40, align 4, !tbaa !13
  store i8 0, i8* %37, align 4, !tbaa !12
  store i8 0, i8* %38, align 1, !tbaa !12
  %41 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 5
  %42 = load i32, i32* %41, align 4, !tbaa !15
  %43 = icmp eq i32 %42, -1
  br i1 %43, label %51, label %.thread

.thread:                                          ; preds = %._crit_edge
  %44 = add nsw i32 %tabs.016, 1
  %45 = load i32, i32* %2, align 4, !tbaa !3
  %46 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 1, i32 %45
  store i32 %current.017, i32* %46, align 4, !tbaa !8
  %47 = load i32, i32* %2, align 4, !tbaa !3
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %2, align 4, !tbaa !3
  %49 = load i32, i32* %41, align 4, !tbaa !15
  %50 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %49
  br label %.backedge

; <label>:51                                      ; preds = %._crit_edge
  %52 = getelementptr inbounds %struct.node, %struct.node* %nnode.018, i32 0, i32 3
  %53 = load i32, i32* %52, align 4, !tbaa !16
  %54 = icmp eq i32 %53, -1
  %55 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %53
  %current.1. = select i1 %54, i32 %current.017, i32 %53
  %nnode.1. = select i1 %54, %struct.node* %nnode.018, %struct.node* %55
  %56 = load i32, i32* %2, align 4, !tbaa !3
  %57 = icmp sgt i32 %56, 0
  %or.cond = and i1 %54, %57
  br i1 %or.cond, label %pop.exit.preheader, label %72

pop.exit.preheader:                               ; preds = %51
  br label %pop.exit

pop.exit:                                         ; preds = %pop.exit.preheader, %pop.exit
  %tabs.211 = phi i32 [ %62, %pop.exit ], [ %tabs.016, %pop.exit.preheader ]
  %58 = phi i32 [ %59, %pop.exit ], [ %56, %pop.exit.preheader ]
  %59 = add nsw i32 %58, -1
  store i32 %59, i32* %2, align 4, !tbaa !3
  %60 = getelementptr inbounds %struct.stacksss, %struct.stacksss* %stack, i32 0, i32 1, i32 %59
  %61 = load i32, i32* %60, align 4, !tbaa !8
  %.phi.trans.insert = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %61, i32 3
  %.pre = load i32, i32* %.phi.trans.insert, align 4, !tbaa !16
  %62 = add nsw i32 %tabs.211, -1
  %63 = icmp sgt i32 %58, 1
  %64 = icmp eq i32 %.pre, -1
  %65 = and i1 %63, %64
  br i1 %65, label %pop.exit, label %66

; <label>:66                                      ; preds = %pop.exit
  %.lcssa27 = phi i32 [ %62, %pop.exit ]
  %.lcssa26 = phi i32 [ %61, %pop.exit ]
  %.lcssa = phi i32 [ %59, %pop.exit ]
  %67 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.lcssa26
  %68 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.lcssa26, i32 3
  %69 = load i32, i32* %68, align 4, !tbaa !16
  %70 = icmp eq i32 %69, -1
  %71 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %69
  %current.3. = select i1 %70, i32 %.lcssa26, i32 %69
  %nnode.3. = select i1 %70, %struct.node* %67, %struct.node* %71
  br label %72

; <label>:72                                      ; preds = %66, %51
  %73 = phi i32 [ %56, %51 ], [ %.lcssa, %66 ]
  %tabs.3 = phi i32 [ %tabs.016, %51 ], [ %.lcssa27, %66 ]
  %current.4 = phi i32 [ %current.1., %51 ], [ %current.3., %66 ]
  %nnode.4 = phi %struct.node* [ %nnode.1., %51 ], [ %nnode.3., %66 ]
  %74 = icmp slt i32 %73, 1
  %or.cond3 = and i1 %54, %74
  br i1 %or.cond3, label %75, label %.backedge

; <label>:75                                      ; preds = %72
  %76 = getelementptr inbounds %struct.node, %struct.node* %nnode.4, i32 0, i32 3
  %77 = load i32, i32* %76, align 4, !tbaa !16
  br label %.backedge

.backedge:                                        ; preds = %75, %72, %.thread
  %b.0.be = phi i32 [ %77, %75 ], [ %current.4, %72 ], [ %49, %.thread ]
  %tabs.0.be = phi i32 [ %tabs.3, %75 ], [ %tabs.3, %72 ], [ %44, %.thread ]
  %current.0.be = phi i32 [ %current.4, %75 ], [ %current.4, %72 ], [ %49, %.thread ]
  %nnode.0.be = phi %struct.node* [ %nnode.4, %75 ], [ %nnode.4, %72 ], [ %50, %.thread ]
  %78 = icmp eq i32 %b.0.be, -1
  br i1 %78, label %79, label %.preheader9

; <label>:79                                      ; preds = %.backedge
  call void @llvm.lifetime.end(i64 8196, i8* nonnull %1) #4
  ret void
}

; Function Attrs: nounwind
define void @debugtree(%struct.trees* %tree1, i32 %node0, i32 %nodeinto) #2 {
  %1 = icmp slt i32 %node0, %nodeinto
  br i1 %1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %i.01 = phi i32 [ %15, %.lr.ph ], [ %node0, %.lr.ph.preheader ]
  %2 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.01, i32 0, i32 0
  %3 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.01, i32 1, i32 0
  %4 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.01, i32 2
  %5 = load i32, i32* %4, align 4, !tbaa !18
  %6 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.01, i32 3
  %7 = load i32, i32* %6, align 4, !tbaa !16
  %8 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.01, i32 4
  %9 = load i32, i32* %8, align 4, !tbaa !17
  %10 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.01, i32 6
  %11 = load i32, i32* %10, align 4, !tbaa !13
  %12 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %i.01, i32 5
  %13 = load i32, i32* %12, align 4, !tbaa !15
  %14 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0), i8* %2, i8* %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13) #4
  %15 = add nsw i32 %i.01, 1
  %exitcond = icmp eq i32 %15, %nodeinto
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

; Function Attrs: nounwind
define void @settreenodecaption(%struct.trees* %tree1, i32 %node0, i8* nocapture readonly %caption) #2 {
  %1 = tail call i32 @strlen(i8* %caption) #5
  %2 = icmp sgt i32 %1, 32
  %. = select i1 %2, i32 32, i32 %1
  %3 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 0, i32 0
  %4 = tail call i8* @strncpy(i8* %3, i8* %caption, i32 %.) #4
  %5 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 0, i32 32
  store i8 0, i8* %5, align 4, !tbaa !12
  ret void
}

; Function Attrs: nounwind
define void @settreenodetext(%struct.trees* %tree1, i32 %node0, i8* nocapture readonly %txt) #2 {
  %1 = tail call i32 @strlen(i8* %txt) #5
  %2 = icmp sgt i32 %1, 32
  %. = select i1 %2, i32 32, i32 %1
  %3 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 1, i32 0
  %4 = tail call i8* @strncpy(i8* %3, i8* %txt, i32 %.) #4
  %5 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %node0, i32 0, i32 32
  store i8 0, i8* %5, align 4, !tbaa !12
  ret void
}

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #2 {
  %tree1 = alloca %struct.trees, align 4
  %1 = bitcast %struct.trees* %tree1 to i8*
  call void @llvm.lifetime.start(i64 180232, i8* %1) #4
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str, i32 0, i32 0))
  %2 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 0
  store i32 0, i32* %2, align 4, !tbaa !9
  %3 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 1
  store i32 -1, i32* %3, align 4, !tbaa !11
  %4 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0))
  store i32 %4, i32* %3, align 4, !tbaa !11
  %5 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0))
  %6 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0))
  %7 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0))
  %8 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %4, i32 5
  %9 = load i32, i32* %8, align 4, !tbaa !15
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %.lr.ph.lr.ph.i

; <label>:11                                      ; preds = %0
  store i32 %5, i32* %8, align 4, !tbaa !15
  %12 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %5, i32 4
  store i32 %4, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %5, i32 3
  store i32 -1, i32* %13, align 4, !tbaa !16
  br label %setfather.exit

.lr.ph.lr.ph.i:                                   ; preds = %0
  %14 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %5, i32 2
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.lr.ph.lr.ph.i
  %.pn.i = phi i32 [ %9, %.lr.ph.lr.ph.i ], [ %16, %.lr.ph.i ]
  %15 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i, i32 3
  %16 = load i32, i32* %15, align 4, !tbaa !16
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %..loopexit_crit_edge.i, label %.lr.ph.i

..loopexit_crit_edge.i:                           ; preds = %.lr.ph.i
  %.lcssa123 = phi i32* [ %15, %.lr.ph.i ]
  %.pn.i.lcssa = phi i32 [ %.pn.i, %.lr.ph.i ]
  %18 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %5, i32 3
  store i32 %5, i32* %.lcssa123, align 4, !tbaa !16
  store i32 %.pn.i.lcssa, i32* %14, align 4, !tbaa !18
  store i32 -1, i32* %18, align 4, !tbaa !16
  br label %setfather.exit

setfather.exit:                                   ; preds = %11, %..loopexit_crit_edge.i
  %19 = load i32, i32* %8, align 4, !tbaa !15
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %21, label %.lr.ph.lr.ph.i2

; <label>:21                                      ; preds = %setfather.exit
  store i32 %6, i32* %8, align 4, !tbaa !15
  %22 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %6, i32 4
  store i32 %4, i32* %22, align 4, !tbaa !17
  %23 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %6, i32 3
  store i32 -1, i32* %23, align 4, !tbaa !16
  br label %setfather.exit6

.lr.ph.lr.ph.i2:                                  ; preds = %setfather.exit
  %24 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %6, i32 2
  br label %.lr.ph.i4

.lr.ph.i4:                                        ; preds = %.lr.ph.i4, %.lr.ph.lr.ph.i2
  %.pn.i3 = phi i32 [ %19, %.lr.ph.lr.ph.i2 ], [ %26, %.lr.ph.i4 ]
  %25 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i3, i32 3
  %26 = load i32, i32* %25, align 4, !tbaa !16
  %27 = icmp eq i32 %26, -1
  br i1 %27, label %..loopexit_crit_edge.i5, label %.lr.ph.i4

..loopexit_crit_edge.i5:                          ; preds = %.lr.ph.i4
  %.lcssa122 = phi i32* [ %25, %.lr.ph.i4 ]
  %.pn.i3.lcssa = phi i32 [ %.pn.i3, %.lr.ph.i4 ]
  %28 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %6, i32 3
  store i32 %6, i32* %.lcssa122, align 4, !tbaa !16
  store i32 %.pn.i3.lcssa, i32* %24, align 4, !tbaa !18
  store i32 -1, i32* %28, align 4, !tbaa !16
  br label %setfather.exit6

setfather.exit6:                                  ; preds = %21, %..loopexit_crit_edge.i5
  %29 = load i32, i32* %8, align 4, !tbaa !15
  %30 = icmp eq i32 %29, -1
  br i1 %30, label %31, label %.lr.ph.lr.ph.i7

; <label>:31                                      ; preds = %setfather.exit6
  store i32 %7, i32* %8, align 4, !tbaa !15
  %32 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %7, i32 4
  store i32 %4, i32* %32, align 4, !tbaa !17
  %33 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %7, i32 3
  store i32 -1, i32* %33, align 4, !tbaa !16
  br label %setfather.exit11

.lr.ph.lr.ph.i7:                                  ; preds = %setfather.exit6
  %34 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %7, i32 2
  br label %.lr.ph.i9

.lr.ph.i9:                                        ; preds = %.lr.ph.i9, %.lr.ph.lr.ph.i7
  %.pn.i8 = phi i32 [ %29, %.lr.ph.lr.ph.i7 ], [ %36, %.lr.ph.i9 ]
  %35 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i8, i32 3
  %36 = load i32, i32* %35, align 4, !tbaa !16
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %..loopexit_crit_edge.i10, label %.lr.ph.i9

..loopexit_crit_edge.i10:                         ; preds = %.lr.ph.i9
  %.lcssa121 = phi i32* [ %35, %.lr.ph.i9 ]
  %.pn.i8.lcssa = phi i32 [ %.pn.i8, %.lr.ph.i9 ]
  %38 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %7, i32 3
  store i32 %7, i32* %.lcssa121, align 4, !tbaa !16
  store i32 %.pn.i8.lcssa, i32* %34, align 4, !tbaa !18
  store i32 -1, i32* %38, align 4, !tbaa !16
  br label %setfather.exit11

setfather.exit11:                                 ; preds = %31, %..loopexit_crit_edge.i10
  %39 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0), i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i32 0, i32 0))
  %40 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %5, i32 5
  %41 = load i32, i32* %40, align 4, !tbaa !15
  %42 = icmp eq i32 %41, -1
  br i1 %42, label %43, label %.lr.ph.lr.ph.i12

; <label>:43                                      ; preds = %setfather.exit11
  store i32 %39, i32* %40, align 4, !tbaa !15
  %44 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %39, i32 4
  store i32 %5, i32* %44, align 4, !tbaa !17
  %45 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %39, i32 3
  store i32 -1, i32* %45, align 4, !tbaa !16
  br label %setfather.exit16

.lr.ph.lr.ph.i12:                                 ; preds = %setfather.exit11
  %46 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %39, i32 2
  br label %.lr.ph.i14

.lr.ph.i14:                                       ; preds = %.lr.ph.i14, %.lr.ph.lr.ph.i12
  %.pn.i13 = phi i32 [ %41, %.lr.ph.lr.ph.i12 ], [ %48, %.lr.ph.i14 ]
  %47 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i13, i32 3
  %48 = load i32, i32* %47, align 4, !tbaa !16
  %49 = icmp eq i32 %48, -1
  br i1 %49, label %..loopexit_crit_edge.i15, label %.lr.ph.i14

..loopexit_crit_edge.i15:                         ; preds = %.lr.ph.i14
  %.lcssa120 = phi i32* [ %47, %.lr.ph.i14 ]
  %.pn.i13.lcssa = phi i32 [ %.pn.i13, %.lr.ph.i14 ]
  %50 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %39, i32 3
  store i32 %39, i32* %.lcssa120, align 4, !tbaa !16
  store i32 %.pn.i13.lcssa, i32* %46, align 4, !tbaa !18
  store i32 -1, i32* %50, align 4, !tbaa !16
  br label %setfather.exit16

setfather.exit16:                                 ; preds = %43, %..loopexit_crit_edge.i15
  %51 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i32 0, i32 0))
  %52 = load i32, i32* %40, align 4, !tbaa !15
  %53 = icmp eq i32 %52, -1
  br i1 %53, label %54, label %.lr.ph.lr.ph.i17

; <label>:54                                      ; preds = %setfather.exit16
  store i32 %51, i32* %40, align 4, !tbaa !15
  %55 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %51, i32 4
  store i32 %5, i32* %55, align 4, !tbaa !17
  %56 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %51, i32 3
  store i32 -1, i32* %56, align 4, !tbaa !16
  br label %setfather.exit21

.lr.ph.lr.ph.i17:                                 ; preds = %setfather.exit16
  %57 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %51, i32 2
  br label %.lr.ph.i19

.lr.ph.i19:                                       ; preds = %.lr.ph.i19, %.lr.ph.lr.ph.i17
  %.pn.i18 = phi i32 [ %52, %.lr.ph.lr.ph.i17 ], [ %59, %.lr.ph.i19 ]
  %58 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i18, i32 3
  %59 = load i32, i32* %58, align 4, !tbaa !16
  %60 = icmp eq i32 %59, -1
  br i1 %60, label %..loopexit_crit_edge.i20, label %.lr.ph.i19

..loopexit_crit_edge.i20:                         ; preds = %.lr.ph.i19
  %.lcssa119 = phi i32* [ %58, %.lr.ph.i19 ]
  %.pn.i18.lcssa = phi i32 [ %.pn.i18, %.lr.ph.i19 ]
  %61 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %51, i32 3
  store i32 %51, i32* %.lcssa119, align 4, !tbaa !16
  store i32 %.pn.i18.lcssa, i32* %57, align 4, !tbaa !18
  store i32 -1, i32* %61, align 4, !tbaa !16
  br label %setfather.exit21

setfather.exit21:                                 ; preds = %54, %..loopexit_crit_edge.i20
  %62 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.23, i32 0, i32 0), i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0))
  %63 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %6, i32 5
  %64 = load i32, i32* %63, align 4, !tbaa !15
  %65 = icmp eq i32 %64, -1
  br i1 %65, label %66, label %.lr.ph.lr.ph.i23

; <label>:66                                      ; preds = %setfather.exit21
  store i32 %62, i32* %63, align 4, !tbaa !15
  %67 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %62, i32 4
  store i32 %6, i32* %67, align 4, !tbaa !17
  %68 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %62, i32 3
  store i32 -1, i32* %68, align 4, !tbaa !16
  br label %setfather.exit27

.lr.ph.lr.ph.i23:                                 ; preds = %setfather.exit21
  %69 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %62, i32 2
  br label %.lr.ph.i25

.lr.ph.i25:                                       ; preds = %.lr.ph.i25, %.lr.ph.lr.ph.i23
  %.pn.i24 = phi i32 [ %64, %.lr.ph.lr.ph.i23 ], [ %71, %.lr.ph.i25 ]
  %70 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i24, i32 3
  %71 = load i32, i32* %70, align 4, !tbaa !16
  %72 = icmp eq i32 %71, -1
  br i1 %72, label %..loopexit_crit_edge.i26, label %.lr.ph.i25

..loopexit_crit_edge.i26:                         ; preds = %.lr.ph.i25
  %.lcssa118 = phi i32* [ %70, %.lr.ph.i25 ]
  %.pn.i24.lcssa = phi i32 [ %.pn.i24, %.lr.ph.i25 ]
  %73 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %62, i32 3
  store i32 %62, i32* %.lcssa118, align 4, !tbaa !16
  store i32 %.pn.i24.lcssa, i32* %69, align 4, !tbaa !18
  store i32 -1, i32* %73, align 4, !tbaa !16
  br label %setfather.exit27

setfather.exit27:                                 ; preds = %66, %..loopexit_crit_edge.i26
  %74 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.25, i32 0, i32 0), i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.26, i32 0, i32 0))
  %75 = load i32, i32* %63, align 4, !tbaa !15
  %76 = icmp eq i32 %75, -1
  br i1 %76, label %77, label %.lr.ph.lr.ph.i28

; <label>:77                                      ; preds = %setfather.exit27
  store i32 %74, i32* %63, align 4, !tbaa !15
  %78 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %74, i32 4
  store i32 %6, i32* %78, align 4, !tbaa !17
  %79 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %74, i32 3
  store i32 -1, i32* %79, align 4, !tbaa !16
  br label %setfather.exit32

.lr.ph.lr.ph.i28:                                 ; preds = %setfather.exit27
  %80 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %74, i32 2
  br label %.lr.ph.i30

.lr.ph.i30:                                       ; preds = %.lr.ph.i30, %.lr.ph.lr.ph.i28
  %.pn.i29 = phi i32 [ %75, %.lr.ph.lr.ph.i28 ], [ %82, %.lr.ph.i30 ]
  %81 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i29, i32 3
  %82 = load i32, i32* %81, align 4, !tbaa !16
  %83 = icmp eq i32 %82, -1
  br i1 %83, label %..loopexit_crit_edge.i31, label %.lr.ph.i30

..loopexit_crit_edge.i31:                         ; preds = %.lr.ph.i30
  %.lcssa117 = phi i32* [ %81, %.lr.ph.i30 ]
  %.pn.i29.lcssa = phi i32 [ %.pn.i29, %.lr.ph.i30 ]
  %84 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %74, i32 3
  store i32 %74, i32* %.lcssa117, align 4, !tbaa !16
  store i32 %.pn.i29.lcssa, i32* %80, align 4, !tbaa !18
  store i32 -1, i32* %84, align 4, !tbaa !16
  br label %setfather.exit32

setfather.exit32:                                 ; preds = %77, %..loopexit_crit_edge.i31
  %85 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27, i32 0, i32 0), i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.28, i32 0, i32 0))
  %86 = load i32, i32* %63, align 4, !tbaa !15
  %87 = icmp eq i32 %86, -1
  br i1 %87, label %88, label %.lr.ph.lr.ph.i33

; <label>:88                                      ; preds = %setfather.exit32
  store i32 %85, i32* %63, align 4, !tbaa !15
  %89 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %85, i32 4
  store i32 %6, i32* %89, align 4, !tbaa !17
  %90 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %85, i32 3
  store i32 -1, i32* %90, align 4, !tbaa !16
  br label %setfather.exit37

.lr.ph.lr.ph.i33:                                 ; preds = %setfather.exit32
  %91 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %85, i32 2
  br label %.lr.ph.i35

.lr.ph.i35:                                       ; preds = %.lr.ph.i35, %.lr.ph.lr.ph.i33
  %.pn.i34 = phi i32 [ %86, %.lr.ph.lr.ph.i33 ], [ %93, %.lr.ph.i35 ]
  %92 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i34, i32 3
  %93 = load i32, i32* %92, align 4, !tbaa !16
  %94 = icmp eq i32 %93, -1
  br i1 %94, label %..loopexit_crit_edge.i36, label %.lr.ph.i35

..loopexit_crit_edge.i36:                         ; preds = %.lr.ph.i35
  %.lcssa116 = phi i32* [ %92, %.lr.ph.i35 ]
  %.pn.i34.lcssa = phi i32 [ %.pn.i34, %.lr.ph.i35 ]
  %95 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %85, i32 3
  store i32 %85, i32* %.lcssa116, align 4, !tbaa !16
  store i32 %.pn.i34.lcssa, i32* %91, align 4, !tbaa !18
  store i32 -1, i32* %95, align 4, !tbaa !16
  br label %setfather.exit37

setfather.exit37:                                 ; preds = %88, %..loopexit_crit_edge.i36
  %96 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0), i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.30, i32 0, i32 0))
  %97 = load i32, i32* %63, align 4, !tbaa !15
  %98 = icmp eq i32 %97, -1
  br i1 %98, label %99, label %.lr.ph.lr.ph.i43

; <label>:99                                      ; preds = %setfather.exit37
  store i32 %96, i32* %63, align 4, !tbaa !15
  %100 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %96, i32 4
  store i32 %6, i32* %100, align 4, !tbaa !17
  %101 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %96, i32 3
  store i32 -1, i32* %101, align 4, !tbaa !16
  br label %setfather.exit47

.lr.ph.lr.ph.i43:                                 ; preds = %setfather.exit37
  %102 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %96, i32 2
  br label %.lr.ph.i45

.lr.ph.i45:                                       ; preds = %.lr.ph.i45, %.lr.ph.lr.ph.i43
  %.pn.i44 = phi i32 [ %97, %.lr.ph.lr.ph.i43 ], [ %104, %.lr.ph.i45 ]
  %103 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i44, i32 3
  %104 = load i32, i32* %103, align 4, !tbaa !16
  %105 = icmp eq i32 %104, -1
  br i1 %105, label %..loopexit_crit_edge.i46, label %.lr.ph.i45

..loopexit_crit_edge.i46:                         ; preds = %.lr.ph.i45
  %.lcssa115 = phi i32* [ %103, %.lr.ph.i45 ]
  %.pn.i44.lcssa = phi i32 [ %.pn.i44, %.lr.ph.i45 ]
  %106 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %96, i32 3
  store i32 %96, i32* %.lcssa115, align 4, !tbaa !16
  store i32 %.pn.i44.lcssa, i32* %102, align 4, !tbaa !18
  store i32 -1, i32* %106, align 4, !tbaa !16
  br label %setfather.exit47

setfather.exit47:                                 ; preds = %99, %..loopexit_crit_edge.i46
  %107 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.31, i32 0, i32 0), i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i32 0, i32 0))
  %108 = load i32, i32* %63, align 4, !tbaa !15
  %109 = icmp eq i32 %108, -1
  br i1 %109, label %110, label %.lr.ph.lr.ph.i53

; <label>:110                                     ; preds = %setfather.exit47
  store i32 %107, i32* %63, align 4, !tbaa !15
  %111 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %107, i32 4
  store i32 %6, i32* %111, align 4, !tbaa !17
  %112 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %107, i32 3
  store i32 -1, i32* %112, align 4, !tbaa !16
  br label %setfather.exit57

.lr.ph.lr.ph.i53:                                 ; preds = %setfather.exit47
  %113 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %107, i32 2
  br label %.lr.ph.i55

.lr.ph.i55:                                       ; preds = %.lr.ph.i55, %.lr.ph.lr.ph.i53
  %.pn.i54 = phi i32 [ %108, %.lr.ph.lr.ph.i53 ], [ %115, %.lr.ph.i55 ]
  %114 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i54, i32 3
  %115 = load i32, i32* %114, align 4, !tbaa !16
  %116 = icmp eq i32 %115, -1
  br i1 %116, label %..loopexit_crit_edge.i56, label %.lr.ph.i55

..loopexit_crit_edge.i56:                         ; preds = %.lr.ph.i55
  %.lcssa114 = phi i32* [ %114, %.lr.ph.i55 ]
  %.pn.i54.lcssa = phi i32 [ %.pn.i54, %.lr.ph.i55 ]
  %117 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %107, i32 3
  store i32 %107, i32* %.lcssa114, align 4, !tbaa !16
  store i32 %.pn.i54.lcssa, i32* %113, align 4, !tbaa !18
  store i32 -1, i32* %117, align 4, !tbaa !16
  br label %setfather.exit57

setfather.exit57:                                 ; preds = %110, %..loopexit_crit_edge.i56
  %118 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.33, i32 0, i32 0), i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.34, i32 0, i32 0))
  %119 = load i32, i32* %63, align 4, !tbaa !15
  %120 = icmp eq i32 %119, -1
  br i1 %120, label %121, label %.lr.ph.lr.ph.i48

; <label>:121                                     ; preds = %setfather.exit57
  store i32 %118, i32* %63, align 4, !tbaa !15
  %122 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %118, i32 4
  store i32 %6, i32* %122, align 4, !tbaa !17
  %123 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %118, i32 3
  store i32 -1, i32* %123, align 4, !tbaa !16
  br label %setfather.exit52

.lr.ph.lr.ph.i48:                                 ; preds = %setfather.exit57
  %124 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %118, i32 2
  br label %.lr.ph.i50

.lr.ph.i50:                                       ; preds = %.lr.ph.i50, %.lr.ph.lr.ph.i48
  %.pn.i49 = phi i32 [ %119, %.lr.ph.lr.ph.i48 ], [ %126, %.lr.ph.i50 ]
  %125 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i49, i32 3
  %126 = load i32, i32* %125, align 4, !tbaa !16
  %127 = icmp eq i32 %126, -1
  br i1 %127, label %..loopexit_crit_edge.i51, label %.lr.ph.i50

..loopexit_crit_edge.i51:                         ; preds = %.lr.ph.i50
  %.lcssa113 = phi i32* [ %125, %.lr.ph.i50 ]
  %.pn.i49.lcssa = phi i32 [ %.pn.i49, %.lr.ph.i50 ]
  %128 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %118, i32 3
  store i32 %118, i32* %.lcssa113, align 4, !tbaa !16
  store i32 %.pn.i49.lcssa, i32* %124, align 4, !tbaa !18
  store i32 -1, i32* %128, align 4, !tbaa !16
  br label %setfather.exit52

setfather.exit52:                                 ; preds = %121, %..loopexit_crit_edge.i51
  %129 = call i32 @newnode(%struct.trees* nonnull %tree1, i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.35, i32 0, i32 0), i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0))
  %130 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %7, i32 5
  %131 = load i32, i32* %130, align 4, !tbaa !15
  %132 = icmp eq i32 %131, -1
  br i1 %132, label %133, label %.lr.ph.lr.ph.i38

; <label>:133                                     ; preds = %setfather.exit52
  store i32 %129, i32* %130, align 4, !tbaa !15
  %134 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %129, i32 4
  store i32 %7, i32* %134, align 4, !tbaa !17
  %135 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %129, i32 3
  store i32 -1, i32* %135, align 4, !tbaa !16
  br label %setfather.exit42

.lr.ph.lr.ph.i38:                                 ; preds = %setfather.exit52
  %136 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %129, i32 2
  br label %.lr.ph.i40

.lr.ph.i40:                                       ; preds = %.lr.ph.i40, %.lr.ph.lr.ph.i38
  %.pn.i39 = phi i32 [ %131, %.lr.ph.lr.ph.i38 ], [ %138, %.lr.ph.i40 ]
  %137 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %.pn.i39, i32 3
  %138 = load i32, i32* %137, align 4, !tbaa !16
  %139 = icmp eq i32 %138, -1
  br i1 %139, label %..loopexit_crit_edge.i41, label %.lr.ph.i40

..loopexit_crit_edge.i41:                         ; preds = %.lr.ph.i40
  %.lcssa = phi i32* [ %137, %.lr.ph.i40 ]
  %.pn.i39.lcssa = phi i32 [ %.pn.i39, %.lr.ph.i40 ]
  %140 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %129, i32 3
  store i32 %129, i32* %.lcssa, align 4, !tbaa !16
  store i32 %.pn.i39.lcssa, i32* %136, align 4, !tbaa !18
  store i32 -1, i32* %140, align 4, !tbaa !16
  br label %setfather.exit42

setfather.exit42:                                 ; preds = %133, %..loopexit_crit_edge.i41
  call void @deletetreenode(%struct.trees* nonnull %tree1, i32 %7)
  %puts1 = call i32 @puts(i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @str.40, i32 0, i32 0))
  %141 = load i32, i32* %3, align 4, !tbaa !11
  %142 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %141, i32 0, i32 0
  %143 = bitcast i8* %142 to i32*
  store i32 1129339213, i32* %143, align 4
  %144 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %141, i32 0, i32 32
  %145 = getelementptr inbounds %struct.trees, %struct.trees* %tree1, i32 0, i32 2, i32 %141, i32 1, i32 0
  %146 = bitcast i8* %145 to i32*
  store i32 1129339213, i32* %146, align 1
  store i8 0, i8* %144, align 4, !tbaa !12
  %147 = load i32, i32* %3, align 4, !tbaa !11
  call void @reporttree(%struct.trees* nonnull %tree1, i32 %147)
  %148 = call %struct._IO_FILE* @fopen(i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.39, i32 0, i32 0), i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)) #4
  %149 = call i32 @fwrite(i8* nonnull %1, i32 180232, i32 1, %struct._IO_FILE* %148) #4
  %150 = call i32 @fclose(%struct._IO_FILE* %148) #4
  call void @llvm.lifetime.end(i64 180232, i8* nonnull %1) #4
  ret i32 0
}

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="arm1136jf-s" "target-features"="+dsp,+strict-align,+vfp2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{!"clang version 3.8.1-24+rpi1 (tags/RELEASE_381/final)"}
!3 = !{!4, !5, i64 0}
!4 = !{!"stacksss", !5, i64 0, !6, i64 4}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!5, !5, i64 0}
!9 = !{!10, !5, i64 0}
!10 = !{!"trees", !5, i64 0, !5, i64 4, !6, i64 8}
!11 = !{!10, !5, i64 4}
!12 = !{!6, !6, i64 0}
!13 = !{!14, !5, i64 84}
!14 = !{!"node", !6, i64 0, !6, i64 33, !5, i64 68, !5, i64 72, !5, i64 76, !5, i64 80, !5, i64 84}
!15 = !{!14, !5, i64 80}
!16 = !{!14, !5, i64 72}
!17 = !{!14, !5, i64 76}
!18 = !{!14, !5, i64 68}
