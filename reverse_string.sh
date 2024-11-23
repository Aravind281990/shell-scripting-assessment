#!/bin/bash


# Function to reverse a string
reverse_string() {
    echo "$1" | rev
}

# Function to reverse each word in the string
reverse_stringwords() {
    local reversed_words=()
    for word in $1; do
        reversed_words+=("$(echo "$word" | rev)")
    done
    printf "%s " "${reversed_words[@]}" 
    echo 
}

# To check correct number of input arguments are passed.
if [ "$#" -ne 2 ]; then
    echo "Invalid input. Some input parameters are missing it should in below format"
    echo "Usage: sh reverse_string.sh [operation] [Input String Arguments]"
    echo "Operations:"
    echo "  -e for entire reversal "
    echo "  -w for word reversal"
    exit 1
fi

# Assign arguments to variables
operation=$1
shift
string="$*"

# Use case structure to perform the desired operation
case $operation in
    -e)
        reverse_string "$string"
        ;;
    -w)
        reverse_stringwords "$string"
        ;;
    *)
        echo "Error: Invalid input. Use -e for entire reversal or -w for word reversal."
        exit 1
        ;;
esac