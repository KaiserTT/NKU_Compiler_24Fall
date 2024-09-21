; hello world
; output: Hello, world

target triple = "x86_64-pc-linux-gnu"

declare i32 @printf(i8*, ...)

@.str = constant [14 x i8] c"Hello, world\0A\00", align 1

define i32 @main() {
entry:
    %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0))

    ret i32 0
}
