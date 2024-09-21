; bubble_sort
; input: 5 1 9 8 6 3
; output: 1 3 6 8 9

target triple = "x86_64-pc-linux-gnu"

declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

@str_input = constant [3 x i8] c"%d\00", align 1
@str_output = constant [4 x i8] c"%d \00", align 1
@newline = constant [2 x i8] c"\0A\00" , align 1

define void @bubble_sort(i32* %arr, i32 %n) {
entry:
    br label %outer_loop

outer_loop:
    %i = phi i32 [ 0, %entry ], [ %i_next, %inner_end ]
    %0 = sub i32 %n, 1
    ; i < n - 1
    %cmp0 = icmp slt i32 %i, %0
    br i1 %cmp0, label %outer_body, label %outer_end

outer_body:
    br label %inner_loop

inner_loop:
    %j = phi i32 [ 0, %outer_body ], [ %j_next, %inner_after_cmp ]
    ; i + 1
    %1 = add i32 %i, 1
    ; n - i - 1
    %2 = sub i32 %n, %1
    ; j < n - i - 1
    %cmp1 = icmp slt i32 %j, %2
    br i1 %cmp1, label %inner_body, label %inner_end

inner_body:
    ; arr[j]
    %ptr1 = getelementptr i32, i32* %arr, i32 %j
    %num1 = load i32, i32* %ptr1, align 4
    ; arr[j + 1]
    %3 = add i32 %j, 1
    %ptr2 = getelementptr i32, i32* %arr, i32 %3
    %num2 = load i32, i32* %ptr2, align 4
    ; arr[j] > arr[j + 1]
    %cmp2 = icmp sgt i32 %num1, %num2
    br i1 %cmp2, label %swap, label %inner_after_cmp

swap:
    store i32 %num2, i32* %ptr1, align 4
    store i32 %num1, i32* %ptr2, align 4
    br label %inner_after_cmp

inner_after_cmp:
    %j_next = add i32 %j, 1
    br label %inner_loop

inner_end:
    %i_next = add i32 %i, 1
    br label %outer_loop

outer_end:
    ret void
}

define i32 @main() {
entry:
    %arr_len = alloca i32, align 4

    %call0 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str_input, i32 0, i32 0), i32* %arr_len)

    %arr_len_val = load i32, i32* %arr_len, align 4

    %arr = alloca i32, i32 %arr_len_val, align 4

    %arr_ptr = getelementptr i32, i32* %arr, i32 0

    br label %read_loop

read_loop:
    %i = phi i32 [0, %entry], [%i_next, %read]
    %cmp0 = icmp slt i32 %i, %arr_len_val
    br i1 %cmp0, label %read, label %sort

read:
    %ptr0 = getelementptr i32, i32* %arr_ptr, i32 %i
    %0 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str_input, i32 0, i32 0), i32* %ptr0)
    ; i = i + 1
    %i_next = add i32 %i, 1
    br label %read_loop

sort:
    call void @bubble_sort(i32* %arr_ptr, i32 %arr_len_val)

    br label %print_loop

print_loop:
    %j = phi i32 [0, %sort], [%j_next, %print]
    %cmp1 = icmp slt i32 %j, %arr_len_val
    br i1 %cmp1, label %print, label %end

print:
    %ptr1 = getelementptr i32, i32* %arr_ptr, i32 %j
    %1 = load i32, i32* %ptr1, align 4
    %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str_output, i32 0, i32 0), i32 %1)
    ; j = j + 1
    %j_next = add i32 %j, 1
    br label %print_loop

end:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @newline, i32 0, i32 0))
    ret i32 0
}