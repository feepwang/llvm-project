; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=instcombine < %s | FileCheck %s

; (X | C) | Y --> (X | Y) | C

define i32 @test1(i32 %x, i32 %y) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    [[INNER:%.*]] = or disjoint i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[OUTER:%.*]] = or disjoint i32 [[INNER]], 5
; CHECK-NEXT:    ret i32 [[OUTER]]
;
  %inner = or disjoint i32 %x, 5
  %outer = or disjoint i32 %inner, %y
  ret i32 %outer
}

define i32 @test2(i32 %x, i32 %y) {
; CHECK-LABEL: @test2(
; CHECK-NEXT:    [[INNER:%.*]] = or disjoint i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[OUTER:%.*]] = or i32 [[INNER]], 5
; CHECK-NEXT:    ret i32 [[OUTER]]
;
  %inner = or i32 %x, 5
  %outer = or disjoint i32 %inner, %y
  ret i32 %outer
}

define i32 @test3(i32 %x, i32 %y) {
; CHECK-LABEL: @test3(
; CHECK-NEXT:    [[INNER:%.*]] = or i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[OUTER:%.*]] = or i32 [[INNER]], 5
; CHECK-NEXT:    ret i32 [[OUTER]]
;
  %inner = or disjoint i32 %x, 5
  %outer = or i32 %inner, %y
  ret i32 %outer
}

define i32 @test4(i32 %x, i32 %y) {
; CHECK-LABEL: @test4(
; CHECK-NEXT:    [[INNER:%.*]] = or i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[OUTER:%.*]] = or i32 [[INNER]], 5
; CHECK-NEXT:    ret i32 [[OUTER]]
;
  %inner = or i32 %x, 5
  %outer = or i32 %inner, %y
  ret i32 %outer
}
