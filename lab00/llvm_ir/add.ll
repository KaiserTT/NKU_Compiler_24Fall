; add.ll
; input: 1 2
; output: 3

target triple = "x86_64-pc-linux-gnu"

define i32 @add(i32 %a, i32 %b) {
entry:
    %0 = add i32 %a, %b
    ret i32 %0
}

@.str_input = private constant [6 x i8] c"%d %d\00", align 1
@.str_output = private constant [4 x i8] c"%d\0A\00", align 1

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
    %a = alloca i32, align 4
    %b = alloca i32, align 4

    %call0 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str_input, i32 0, i32 0), i32* %a, i32* %b)

    %0 = load i32, i32* %a, align 4
    %1 = load i32, i32* %b, align 4

    %2 = call i32 @add(i32 %0, i32 %1)

    %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_output, i32 0, i32 0), i32 %2)

    ret i32 0
}