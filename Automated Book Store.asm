INCLUDE Irvine32.inc
.data
    welcomeMsg BYTE "Welcome to the Online Book Store!", 0
    optionMsg BYTE "Press '1' to see available books: ", 0
    categoryMsg BYTE "Choose a category: ", 0
    fiction BYTE "1. Fiction", 0
    nonFiction BYTE "2. Non-Fiction", 0
    sciFi BYTE "3. Science-Fiction", 0
    bookListMsg BYTE "Choose a book from the list: ", 0
    quantityMsg BYTE "Enter quantity: ", 0
    totalCostMsg BYTE "Total cost: $", 0
    continueMsg BYTE "Press '1' to see the book list again or any other key to exit: ", 0
    Msgto_notlist BYTE "You Entered number Out from List Please Enter No with in List ",0
     ;Fiction Books list

    bookandprice_Fic BYTE " Books--------------------------------------------Price",0
    FictionB1 BYTE "1. The Left Hand of Darkness                      ($20)", 0
    FictionB2 BYTE "2. The Three-Body Problem                         ($30)", 0
    FictionB3 BYTE "3. The Stars My Destination                       ($40)", 0

    ;Non Fiction Book List

    bookandprice_nonFic BYTE " Books--------------------------------------------Price",0
    nonficB1 BYTE "1. Sapiens: A Brief History of Humankind          ($20)", 0
    nonficB2 BYTE "2. Thinking, Fast and Slow                        ($30)", 0
    nonficB3 BYTE "3. The Immortal Life of Henrietta Lacks           ($40)", 0

    ;Science Fiction Book List

    bookandprice_SciFic BYTE " Books--------------------------------------------Price",0
    ScificB1 BYTE "1. The Left Hand of Darkness                      ($20)", 0
    ScificB2 BYTE "2. The Three-Body Problem                         ($30)", 0
    ScificB3 BYTE "3. The Stars My Destination                       ($40)", 0

    bookPrices DWORD 20, 30, 40
    userChoice DWORD ?
    quantity DWORD ?
    totalCost DWORD ?

.code
main PROC
    ; Display welcome message
    call Clrscr
    mov edx, OFFSET welcomeMsg
    call WriteString
    call Crlf
    call WaitMsg
    
    
    ; Main loop
mainLoop:
    ; Display option to see available books
    call Crlf
    mov edx, OFFSET optionMsg
    call WriteString
    call ReadInt
    call Crlf
    cmp al, 1
    jne mainloop
    
    ; Show categories
    Ct:
    call Clrscr
    call ShowCategories
    ; Get category choice
    call ReadInt
    call Crlf
    
    cmp al, 1
    je fictionCategory
    cmp al, 2
    je nonFictionCategory
    cmp al, 3
    je sciFiCategory
    jg Ct
    Call WaitMsg
    
fictionCategory:
    ; Display fiction book list
    call Clrscr
    call Show_Fictionbook_list
    jmp selectBook
    call WaitMsg
    
nonFictionCategory:
   ;Display Non Fiction Book List
    call Clrscr
    call ShownonfictionCat
    jmp selectBook
    Call WaitMsg
    
sciFiCategory:
    ; Display sci-fi book list
     call Clrscr
     call Show_Scific
 
 selectBook:
    ; Prompt user to select a book
    mov edx, OFFSET bookListMsg
    call WriteString
    call ReadInt
    
    ; Validate input (ensure it's between 1 and 3)
    cmp eax, 1
    jl invalidChoice   ; If input is less than 1, it's invalid
    cmp eax, 3
    jg invalidChoice   ; If input is greater than 3, it's invalid

    ; Valid choice, store it in userChoice
    dec eax            ; Convert 1-based to 0-based index
    mov userChoice, eax
    call Crlf
    jmp continue       ; Skip invalid choice handling

invalidChoice:
    ; Handle invalid input, prompt again
    call Crlf
    jmp selectBook
continue:
    
    ; Get quantity
    mov edx, OFFSET quantityMsg
    call WriteString
    call ReadInt
    mov quantity, eax
    
    ; Calculate total cost
    call CalculateTotalCost
    
    ; Display total cost
    mov edx, OFFSET totalCostMsg
    call WriteString
    mov eax, totalCost
    call WriteInt
    call Crlf
    
    ; Ask to continue or exit
    mov edx, OFFSET continueMsg
    call WriteString
    call ReadChar
    call Crlf
    cmp al, '1'
    je Ct     ;mainLoop

exitProgram:
    exit
main ENDP

ShowCategories PROC
    mov edx, OFFSET categoryMsg
    call WriteString
    call Crlf
    mov edx, OFFSET fiction
    call WriteString
    call Crlf
    mov edx, OFFSET nonFiction
    call WriteString
    call Crlf
    mov edx, OFFSET scifi
    call WriteString
    call Crlf
    ret
ShowCategories ENDP

  ShownonfictionCat PROC
    mov edx, OFFSET nonFiction
    call WriteString
    call Crlf
    mov edx, OFFSET bookandprice_nonFic
    call WriteString
    call Crlf
    mov edx, OFFSET nonficB1
    call WriteString
    call Crlf
    mov edx, OFFSET nonficB2
    call WriteString
    call Crlf
    mov edx, OFFSET nonficB3
    call WriteString
    call Crlf
    ret
ShownonfictionCat ENDP

Show_Scific PROC
    mov edx, OFFSET sciFi
    call WriteString
    call Crlf
    mov edx, OFFSET bookandprice_SciFic
    call WriteString
    call Crlf
    mov edx, OFFSET ScificB1
    call WriteString
    call Crlf
    mov edx, OFFSET ScificB2
    call WriteString
    call Crlf
    mov edx, OFFSET ScificB3
    call WriteString
    call Crlf
    ret
Show_Scific ENDP

Show_Fictionbook_list PROC
    mov edx, OFFSET fiction
    call WriteString
    call Crlf
    mov edx, OFFSET bookandprice_Fic
    call WriteString
    call Crlf
    mov edx, OFFSET FictionB1
    call WriteString
    call Crlf
    mov edx, OFFSET FictionB2
    call WriteString
    call Crlf
    mov edx, OFFSET FictionB1
    call WriteString
    call Crlf
    ret
Show_Fictionbook_list ENDP
CalculateTotalCost PROC
    mov eax, userChoice
    cmp eax, 1
    je Book1
    cmp eax, 2
    je Book2
    cmp eax, 3
    je Book3
    Book1:
    mov ebx, bookPrices[0]
    jmp SetTotalCost
    Book2:
    mov ebx, bookPrices[1]
    jmp SetTotalCost
    Book3:
    mov ebx, bookPrices[2]
    SetTotalCost:
    mov eax, quantity
    imul eax, ebx
    mov totalCost, eax
    ret
CalculateTotalCost ENDP
END main
