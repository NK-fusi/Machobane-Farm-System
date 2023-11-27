.data
    # declarations
    Maize: .asciiz "*******************Maize\n"
    Peas: .asciiz "+++++++++++++++++++Peas\n"
    Wheat: .asciiz "&&&&&&&&&&&&&&&&&&Wheat\n"
    Potatoes: .asciiz "----------------Potatoes\n"
    Beans: .asciiz "%%%%%%%%%%%%%%%%%%%Beans\n"
    Pumpkin: .asciiz "@@@@@@@@@@@@@@@@@Pumpkin\n"
    Sorghum: .asciiz "###################Sorghum\n"
    Watermelon: .asciiz "^^^^^^^^^^^^^^^^Watermelon\n"
    Groundnuts: .asciiz "$$$$$$$$$$$$$$$$$$Groundnuts\n"
    increaseMoisture: .asciiz "Increase moisture :\n"
    initialMoisture: .asciiz "Initial Moisture is :"
    NewMoisture: .asciiz "MOisture levels have been increased to: "
    season: .asciiz "Choose a season:"
    promptSeason: .asciiz "----Choose Season ----\n1. Winter\n2. Summer\nEnter Season: "
    promptWinter: .asciiz "--------You can Plant the following in winter-----\nPotatoes\nWheat\nPeas\nDo you want to plant the above Plants(Y/N): "
    promptSummer: .asciiz "--Well looks like it's summer so you intercrop the following--\nMaize\nBeans\nPumpkin\nSorghum\nWatermelon\nGroundnuts\nDo you wish to proceed? the intercropping is automated based on your field(Y/N): "
    doneMessage: .asciiz "---------------------Done!--------------------\n"
    IntercroppedPlot: .asciiz "-------------------INTERCROPPED PLOT---------------\n"
    promptManure: .asciiz "Add manure: "
    menu: .asciiz "----------Menu---------\n1. Prepare the soil\n2. Winter planting\n3. Summer planting\n4. Moisture Management\n5. Exit\n\nEnter your choice: "
    checkFertility: .word
    prompt_choice: .asciiz "Enter your choice: "

.text
main:
    # prints menu
    li $v0, 4
    la $a0, menu
    syscall

    # Get user choice
    li $v0, 4
    la $a0, prompt_choice
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   # $t0 = user choice

    # Process user choice
    beq $t0, 1, PrepareSoil
    beq $t0, 2, WinterPlanting
    beq $t0, 3, SummerPlanting
    beq $t0, 4, ManageMoisture
    beq $t0, 5, exit_program

PrepareSoil:
    # Assuming that the parameters Moisture and Fertility are in registers $a0 and $a1, respectively.
    li $v0, 4
    la $a0, promptManure
    syscall

    li $v0, 5
    syscall
    move $a1, $v0   # Update Fertility with the input value
    j main

WinterPlanting:
    li $v0, 4
    la $a0, Potatoes
    syscall

    li $v0, 4
    la $a0, Wheat
    syscall

    li $v0, 4
    la $a0, Peas
    syscall

    j main

ManageMoisture:
    # prints initial moisture
    li $v0, 4
    la $a0, initialMoisture
    syscall

    # read initial moisture
    li $v0, 5
    syscall
    move $s0, $v0

    # string to increase moisture
    li $v0, 4
    la $a0, increaseMoisture
    syscall

    # prompt the user for increasing moisture levels
    li $v0, 5
    syscall
    move $s0, $v0

    # print the string to print the new moisture levels
    li $v0, 4
    la $a0, NewMoisture
    syscall

    # print new moisture
    li $v0, 1
    move $a0, $s0
    syscall

    j main

SummerPlanting:
    # SummerPlanting function
    li $v0, 4
    la $a0, promptSeason
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   # $t0 = Season

    beq $t0, 1, winter
    beq $t0, 2, summer
    j main

winter:
    li $v0, 4
    la $a0, promptWinter
    syscall

    li $v0, 8
    syscall

    li $v0, 4
    la $a0, doneMessage
    syscall
    j main

summer:
    li $v0, 4
    la $a0, promptSummer
    syscall

    li $v0, 4
    la $a0, IntercroppedPlot
    syscall

    li $v0, 8
    syscall

    li $v0, 4
    la $a0, Maize
    syscall

    li $v0, 8
    syscall

    li $v0, 4
    la $a0, Beans
    syscall

    li $v0, 8
    syscall

    li $v0, 4
    la $a0, Maize

    li $v0, 8
    syscall

    li $v0, 4
    la $a0, Beans
    syscall

    j main

exit_program:
    # Exit the program
    li $v0, 10
    syscall

