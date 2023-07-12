#!/bin/bash

###############################################################################
#
# ExercicioProposto4V3.sh - Script que exibe a hora atual e mensagem saudação
#
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)
# Data Criação: 03/02/2023
#
# Descrição: Script que exibe a hora atual no formato de 0 a 12, indicando 
#            am/pm e saudando com uma mensagem de Bom dia, Boa tarde ou Boa 
#            noite
#
# Exemplo de uso: ./ExercicioProposto4V3.sh
#
# Alteracoes
#	Dia X - DescricaoAlteracaoRealizada
#
###############################################################################

#HORA=$(date +%H)        # Guarda em uma variável a Hora
HORA=$1                # Habilite ou desabilite para testar o código
MIN=$(date +%M)         # Guarda em uma variável o Minuto

# Case para definir período
# Estou considerando que das 00:00 às 06:00 é noite
echo
case $HORA in
    0[6-9] | 1[01])                     # Podemos ler como: caso a hora esteja entre "06" e "09"
        echo "Muito Bom Dia!"           # ou entre "10" e "11"
        ;;
    1[2-7])                             # Podemos ler como: caso a hora esteja entre "12" e "17"
        echo "Muito Boa Tarde!"
        ;;
    *)                                  # Podemos ler como: qualquer outra "coisa"
        echo "Muito Boa Noite!"
        ;;
esac

# If para reduzir hora e definir AM/PM
if [ $HORA -ge 12 ]
then
    AMPM=PM
    if [ $HORA -ne 12 ]
    then
        HORA=$(expr $HORA - 12)
    fi
else
    AMPM=AM
fi

echo
echo "A hora atual é: $HORA:$MIN $AMPM"