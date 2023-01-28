#!/usr/bin/env bash

## Esta funcion establece un color de fuente y uno de base segun
## se les pase como primer y segundo argumento
## ---
## Los colores se establecen con un numero indicando el elemento 
## de la tabla de colores fg para fuente y de la tabla de colores 
## bg para bases.
## ---
## @example:
## <pre>
##     bg=('33;32;44' '55;11;232')
##     fg=('112;23;76' '192;128;123')
##     echo -e $(c 0 1) # primer y segundo color para la fuente 
##     # y base respectivamente
## </pre>
## @endexample
## @param $1 color de base
## @param $2 color de fuente
## @return formato de color para terminales con soporte rgb.
## 
function c(){
    if ! [ "$2" == "" ]; then
        echo -e $(b)"\[\e[38;2;${color[${1}]}m\]\[\e[48;2;${color[${2}]}m\]" 
    else
        echo -e $(b)"\[\e[38;2;${color[${1}]}m\]" 
    fi
}

## Texto en negrita
function b(){
    echo -e "\[\e[1m\]"
}

## Neutralizador de color
function nc(){
    echo -e "\[\e[m\]"
}

rr=''; rl=''; tr=''; tl=''; am=''; ab=''
pr=''

color=("229;152;102" "234;227;225" "92;9;35" "26;36;33" "0;121;89")

function prompt(){
    if ! [ -d ./.git ]; then
        export PS1=$(c 1)"${rl}"$(c 3 1)" \u $(c 1 4)$tr \W $am $(date +'%a %b $am %H:%M %Z %Y '\
            )"$(nc)$(c 4)"${rr}"$(nc)"\n$pr "
    else
        export PS1=$(c 1)"${rl}"$(c 3 1)" \u $(c 1 4)$tr \W $am $(date +'%a %b $am %H:%M %Z %Y '$(c 4 1)'$tr'$(c 3)'  '\
            )"$(nc)$(c 1)"${rr}"$(nc)"\n$pr "
    fi
}

if [ -n $(echo $TERM | egrep -o "256") ]; then
#    export PS1=$(c 1)"${rl}"$(c 3 1)" \u $(c 1 4)$tr \W $am $(date +'%a %b $am %H:%M %Z %Y '\
#        )"$(nc)$(c 4)"${rr}"$(nc)"\n$pr "
    export PROMPT_COMMAND=prompt
else
    export PS1="\u @ \W # "
fi
