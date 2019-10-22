#!/bin/sh

# ------------------- #
# bash/bash-colors.sh #
# ------------------- #

# Resources:
# https://en.wikipedia.org/wiki/ANSI_escape_code
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://www.shellhacks.com/bash-colors/

# ANSI escape codes:

: '
Black        0;30     Dark Gray     1;30
Red          0;31     Light Red     1;31
Green        0;32     Light Green   1;32
Brown/Orange 0;33     Yellow        1;33
Blue         0;34     Light Blue    1;34
Purple       0;35     Light Purple  1;35
Cyan         0;36     Light Cyan    1;36
Light Gray   0;37     White         1;37
'

###################
# COLOR CONSTANTS #
###################

RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

LIGHT_GRAY='\033[0;37m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'

WHITE='\033[1;37m'
NC='\033[0m' # No Color

############
# EXAMPLES #
############

echo -e "\e[31mRed Text\e[0m"
echo -e "\e[42mGreen Background\e[0m"
echo -e "\e[1mBold Text\e[0m"
echo -e "\e[3mUnderlined Text\e[0m"
echo -e "\e[COLOR1;COLOR2mSample Text\e[0m"
echo -e "\e[1;34mLight Blue Text\e[0m"
echo -e "\e[1;33;4;44mYellow Underlined Text on Blue Background\e[0m"

printf "\n\t${GREEN}bash-color.sh${NC}\n\n"

printf "\t * ${RED}RED${NC} Stack Overflow\n"
printf "\t * ${GREEN}GREEN${NC} Stack Overflow\n"
printf "\t * ${BROWN}DROWN${NC} Stack Overflow\n"
printf "\t * ${BLUE}BLUE${NC} Stack Overflow\n"
printf "\t * ${PURPLE}PURPLE${NC} Stack Overflow\n"
printf "\t * ${CYAN}CYAN${NC} Stack Overflow\n"
#
# printf "\t * ${GRAY_GRAY}LIGHT_GRAY${NC} Stack Overflow\n\n"
# printf "\t * ${WHITE}WHITE${NC} Stack Overflow\n"

printf "\t * ${LIGHT_RED}LIGHT_RED${NC} Stack Overflow\n"
printf "\t * ${LIGHT_GREEN}LIGHT_GREEN${NC} Stack Overflow\n"
printf "\t * ${YELLOW}YELLOW${NC} Stack Overflow\n"
printf "\t * ${LIGHT_BLUE}LIGHT_BLUE${NC} Stack Overflow\n"
printf "\t * ${LIGHT_PURPLE}LIGHT_PURPLE${NC} Stack Overflow\n"
printf "\t * ${LIGHT_CYAN}LIGHT_CYAN${NC} Stack Overflow\n"

printf "\nDone.\n"

# EOF #
