; module: fibonacci
; input: 10
; output: 55

target triple = "x86_64-pc-linux-gnu"

@.str_input = constant [3 x i8] c"%d\00", align 1
@.str_output = constant [4 x i8] c"%d\0A\00", align 1

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)

define i32 @fibonacci(i32 %n) {
entry:
    ; if n <= 1
    %0 = icmp sle i32 %n, 1
    br i1 %0, label %end, label %recur

end:
    ret i32 %n

recur:
    ; fibonacci(n-1)
    %1 = sub i32 %n, 1
    %2 = call i32 @fibonacci(i32 %1)

    ; fibonacci(n-2)
    %3 = sub i32 %n, 2
    %4 = call i32 @fibonacci(i32 %3)

    ; fibonacci(n-1) + fibonacci(n-2)
    %5 = add i32 %2, %4
    ret i32 %5
}


define i32 @main() {
entry:
    %n = alloca i32, align 4

    %call_scanf = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str_input, i32 0, i32 0), i32* %n)

    %0 = load i32, i32* %n, align 4

    %1 = call i32 @fibonacci(i32 %0)

    %call_printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_output, i32 0, i32 0), i32 %1)

    ret i32 0
}