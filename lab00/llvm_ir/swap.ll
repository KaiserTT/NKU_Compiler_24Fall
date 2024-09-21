; swap twp number
; output: 20 10

target triple = "x86_64-pc-linux-gnu"

define void @swap(i32* %a, i32* %b) {
entry:
    %0 = load i32, i32* %a, align 4
    %1 = load i32, i32* %b, align 4

    store i32 %1, i32* %a, align 4
    store i32 %0, i32* %b, align 4

    ret void 
}

declare i32 @printf(i8*, ...)

@.str = constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() {
entry:
    %a = alloca i32, align 4
    %b = alloca i32, align 4

    store i32 10, i32* %a, align 4
    store i32 20, i32* %b, align 4

    %0 = load i32, i32* %a, align 4
    %1 = load i32, i32* %b, align 4

    %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %1)

    call void @swap(i32* %a, i32* %b)

    %3 = load i32, i32* %a, align 4
    %4 = load i32, i32* %b, align 4

    %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %4)

    ret i32 0
}
