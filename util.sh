#/bin/bash

RED_COLOR="\033[031m"
CYAN_COLOR="\033[036m"
GREEN_COLOR="\033[032m"
YELLOW_COLOR="\033[033m"
END_COLOR="\033[0m"

function echo_red {
    echo_color "${RED_COLOR}" "$1"
}

function echo_cyan {
    echo_color "${CYAN_COLOR}" "$1"
}

function echo_green {
    echo_color "${GREEN_COLOR}" "$1"
}

function echo_yellow {
    echo_color "${YELLOW_COLOR}" "$1"
}

function echo_color {
    echo -e "$1$2${END_COLOR}"
}

function show_spinner()
{
    pid=$1

    spin='-\|/'

    i=0
    while kill -0 $pid 2>/dev/null
    do
        i=$(( (i+1) %4 ))
        printf "\r${spin:$i:1}"
        sleep .5
    done
    printf "\r"
}
