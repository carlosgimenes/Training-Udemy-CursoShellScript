#!/bin/bash

###############################################################################
#
# ExercicioProposto4V2.sh - Script que exibe a hora atual e mensagem saudação
#
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)
# Data Criação: 01/02/2023
#
# Descrição: Script que exibe a hora atual no formato de 0 a 12, indicando 
#            am/pm e saudando com uma mensagem de Bom dia, Boa tarde ou Boa 
#            noite
#
# Exemplo de uso: ./ExercicioProposto4V2.sh
#
# Alteracoes
#	Dia X - DescricaoAlteracaoRealizada
#
###############################################################################

#HORA=$(date +%H)        # Guarda em uma variável a Hora
HORA=$1                # Habilite ou desabilite para testar o código
MIN=$(date +%M)         # Guarda em uma variável o Minuto

# If para definir período
# Estou considerando que das 00:00 às 06:00 é noite
if [ $HORA -ge 06 -a $HORA -lt 12 ]            # Podemos ler como: se a hora for maior que 6 e menor que 12
then 
    echo "Muito Bom dia!"
elif [ $HORA -ge 12 -a $HORA -lt 18 ]          # Podemos ler como: se a hora for maior que 12 e menor que 18
then 
    echo "Muito Boa tarde!"
else
    echo "Muito Boa noite!"
fi

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