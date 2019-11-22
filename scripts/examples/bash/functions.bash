# ------------------------------------ #
# scripts/examples/bash/functions.bash #
# ------------------------------------ #

# Setting a return status for a function
print_something () {
    echo Hello $1
    return 5
}
print_something Mars
print_something Jupiter
# echo The previous function has a return value of $?

# Function with parameters/arguments
function_name () {
    echo "Parameter #1 is $1"
}
function_name "$arg1" "$arg2"

# EOF #
