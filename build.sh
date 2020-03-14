#!/usr/bin/env bash

# Initialization {{{
RED='\033[0;31m'
BRed='\033[1;31m'
Green='\033[0;32m'
BGreen='\033[1;32m'
Yellow='\033[0;33m'
BYellow='\033[1;33m'
Blue='\033[0;34m'
BBlue='\033[1;34m'
NC='\033[0m'
cd $(git rev-parse --show-toplevel)
mkdir -p .cache
# }}}

# General iCursive Op{{{
general_op() {
    cp "$1" ./"Operator Mono Book Italic.otf"

    # patch ligatures
    printf "\n${BGreen}==>${NC} ${BBlue}Patching ligatures...${NC}\n"
    if [ ! -d "operator-mono-lig" ]; then
        git clone --depth 1 https://github.com/kiliman/operator-mono-lig.git
    fi
    cd operator-mono-lig || exit
    mv ../"Operator Mono Book Italic.otf" ./original/OperatorMono-BookItalic.otf
    npm install
    ./build.sh
    cp ./build/OperatorMonoLig-BookItalic.otf ../"Operator Mono Book Italic.otf"
    cd ../

    # patch nerd font symbols
    printf "\n${BGreen}==>${NC} ${BBlue}Patching nerd font symbols...${NC}\n"
    if [ ! -d "nerd-fonts" ]; then
        git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    fi
    cp ./"Operator Mono Book Italic.otf" ./nerd-fonts/
    cd ./nerd-fonts || exit
    ./font-patcher --mono -w -c -ext ttf "Operator Mono Book Italic.otf"
    mv Operator*Compatible.ttf ../"Operator Mono Book Italic.ttf"
    rm ./"Operator Mono Book Italic.otf"
    rm ../"Operator Mono Book Italic.otf"
    cd ../

    # font rename reo
    printf "\n${BGreen}==>${NC} ${BBlue}Cloning github.com/chrissimpkins/fontname.py ...${NC}\n"
    if [ ! -d "fontname.py" ]; then
        git clone --depth 1 https://github.com/chrissimpkins/fontname.py.git
        chmod +x ./fontname.py/fontname.py
    fi
}
# }}}
# General iCursive Dk{{{
general_dk() {
    cp "$1" ./"Dank Mono Italic.ttf"

    # patch nerd font symbols
    printf "\n${BGreen}==>${NC} ${BBlue}Patching nerd font symbols...${NC}\n"
    if [ ! -d "nerd-fonts" ]; then
        git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    fi
    cp ./"Dank Mono Italic.ttf" ./nerd-fonts/
    cd ./nerd-fonts || exit
    ./font-patcher --mono -w -c -ext ttf "Dank Mono Italic.ttf"
    mv -f Dank*Compatible.ttf ../"Dank Mono Italic.ttf"
    rm ./"Dank Mono Italic.ttf"
    cd ../

    # font rename reo
    printf "\n${BGreen}==>${NC} ${BBlue}Cloning github.com/chrissimpkins/fontname.py ...${NC}\n"
    if [ ! -d "fontname.py" ]; then
        git clone --depth 1 https://github.com/chrissimpkins/fontname.py.git
        chmod +x ./fontname.py/fontname.py
    fi
}
# }}}
# Fira Code iCursive Op{{{
fira_op() {
    mkdir "Fira Code iCursive Op"
    cp ./"Fira Code iCursive S12/Fira Code iCursive S12 Regular".ttf ./"Fira Code iCursive Op/Fira Code iCursive Op Regular".ttf
    cp ./"Fira Code iCursive S12/Fira Code iCursive S12 Bold".ttf ./"Fira Code iCursive Op/Fira Code iCursive Op Bold".ttf
    cp ./.cache/"Operator Mono Book Italic".ttf ./"Fira Code iCursive Op/Fira Code iCursive Op Italic".ttf
    ./.cache/fontname.py/fontname.py "Fira Code iCursive Op" ./"Fira Code iCursive Op/Fira Code iCursive Op Regular".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Fira Code iCursive Op" ./"Fira Code iCursive Op/Fira Code iCursive Op Bold".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Fira Code iCursive Op" ./"Fira Code iCursive Op/Fira Code iCursive Op Italic".ttf > /dev/null
}
# }}}
# Source Code Pro iCursive Op{{{
source_op() {
    mkdir "Source Code Pro iCursive Op"
    cp ./"Source Code Pro iCursive S12/Source Code Pro iCursive S12 Regular".ttf ./"Source Code Pro iCursive Op/Source Code Pro iCursive Op Regular".ttf
    cp ./"Source Code Pro iCursive S12/Source Code Pro iCursive S12 Bold".ttf ./"Source Code Pro iCursive Op/Source Code Pro iCursive Op Bold".ttf
    cp ./.cache/"Operator Mono Book Italic".ttf ./"Source Code Pro iCursive Op/Source Code Pro iCursive Op Italic".ttf
    ./.cache/fontname.py/fontname.py "Source Code Pro iCursive Op" ./"Source Code Pro iCursive Op/Source Code Pro iCursive Op Regular".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Source Code Pro iCursive Op" ./"Source Code Pro iCursive Op/Source Code Pro iCursive Op Bold".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Source Code Pro iCursive Op" ./"Source Code Pro iCursive Op/Source Code Pro iCursive Op Italic".ttf > /dev/null
}
# }}}
# InconsolataLGC iCursive Op{{{
inconsolata_lgc_op() {
    mkdir "InconsolataLGC iCursive Op"
    cp ./"InconsolataLGC iCursive S12/InconsolataLGC iCursive S12 Regular".ttf ./"InconsolataLGC iCursive Op/InconsolataLGC iCursive Op Regular".ttf
    cp ./"InconsolataLGC iCursive S12/InconsolataLGC iCursive S12 Bold".ttf ./"InconsolataLGC iCursive Op/InconsolataLGC iCursive Op Bold".ttf
    cp ./.cache/"Operator Mono Book Italic".ttf ./"InconsolataLGC iCursive Op/InconsolataLGC iCursive Op Italic".ttf
    ./.cache/fontname.py/fontname.py "InconsolataLGC iCursive Op" ./"InconsolataLGC iCursive Op/InconsolataLGC iCursive Op Regular".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "InconsolataLGC iCursive Op" ./"InconsolataLGC iCursive Op/InconsolataLGC iCursive Op Bold".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "InconsolataLGC iCursive Op" ./"InconsolataLGC iCursive Op/InconsolataLGC iCursive Op Italic".ttf > /dev/null
}
# }}}
# Meslo iCursive Op{{{
meslo_op() {
    mkdir "Meslo iCursive Op"
    cp ./"Meslo iCursive S12/Meslo iCursive S12 Regular".ttf ./"Meslo iCursive Op/Meslo iCursive Op Regular".ttf
    cp ./"Meslo iCursive S12/Meslo iCursive S12 Bold".ttf ./"Meslo iCursive Op/Meslo iCursive Op Bold".ttf
    cp ./.cache/"Operator Mono Book Italic".ttf ./"Meslo iCursive Op/Meslo iCursive Op Italic".ttf
    ./.cache/fontname.py/fontname.py "Meslo iCursive Op" ./"Meslo iCursive Op/Meslo iCursive Op Regular".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Meslo iCursive Op" ./"Meslo iCursive Op/Meslo iCursive Op Bold".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Meslo iCursive Op" ./"Meslo iCursive Op/Meslo iCursive Op Italic".ttf > /dev/null
}
# }}}
# Hack iCursive Op{{{
hack_op() {
    mkdir "Hack iCursive Op"
    cp ./"Hack iCursive S12/Hack iCursive S12 Regular".ttf ./"Hack iCursive Op/Hack iCursive Op Regular".ttf
    cp ./"Hack iCursive S12/Hack iCursive S12 Bold".ttf ./"Hack iCursive Op/Hack iCursive Op Bold".ttf
    cp ./.cache/"Operator Mono Book Italic".ttf ./"Hack iCursive Op/Hack iCursive Op Italic".ttf
    ./.cache/fontname.py/fontname.py "Hack iCursive Op" ./"Hack iCursive Op/Hack iCursive Op Regular".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Hack iCursive Op" ./"Hack iCursive Op/Hack iCursive Op Bold".ttf > /dev/null
    ./.cache/fontname.py/fontname.py "Hack iCursive Op" ./"Hack iCursive Op/Hack iCursive Op Italic".ttf > /dev/null
}
# }}}
# Fantasque iCursive Op{{{
fantasque_op() {
    cp ./.cache/"Operator Mono Book Italic".ttf ./"Fantasque iCursive Op/Fantasque iCursive Op Italic".ttf
    ./.cache/fontname.py/fontname.py "Fantasque iCursive Op" ./"Fantasque iCursive Op/Fantasque iCursive Op Italic".ttf > /dev/null
}
# }}}
# Fantasque iCursive Dk{{{
fantasque_dk() {
    cp ./.cache/"Dank Mono Italic".ttf ./"Fantasque iCursive Dk/Fantasque iCursive Dk Italic".ttf
    ./.cache/fontname.py/fontname.py "Fantasque iCursive Dk" ./"Fantasque iCursive Dk/Fantasque iCursive Dk Italic".ttf > /dev/null
}
# }}}

if [[ "$1"x == "Op"x ]]; then
    cd .cache || exit
    general_op "$2"
    cd ../
    printf "\n${BGreen}==>${NC} ${BBlue}Patching iCursive font...${NC}\n"
    fira_op
    source_op
    inconsolata_lgc_op
    meslo_op
    hack_op
    fantasque_op
elif [[ "$1"x == "Dk"x ]]; then
    cd .cache || exit
    general_dk "$2"
    cd ../
    printf "\n${BGreen}==>${NC} ${BBlue}Patching iCursive font...${NC}\n"
    fantasque_dk
else
    printf "${BGreen}==>${NC} ${RED}Invalid parameters. Usage:${NC}\n"
    printf "${BGreen}==>${NC} ${Green}./build.sh [series] /path/to/non_free_font${NC}\n"
    exit 1
fi
printf "\n${BGreen}==>${NC} ${BBlue}Cache directory:${NC} ${Green}%s/.cache/${NC}\n" $(pwd)
printf "${BGreen}==>${NC} ${BBlue}Clean cache? [Y/n]${NC} "
read -r clean
if [ "$clean"x == ""x ] || [ "$clean"x == "Y"x ] || [ "$clean"x == "y"x ]; then
    rm -rf .cache
fi
printf "\n${BGreen}==>${NC} ${BGreen}Done.${NC}\n"
