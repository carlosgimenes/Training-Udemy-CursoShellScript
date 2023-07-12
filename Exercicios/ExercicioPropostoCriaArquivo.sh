 #!/bin/bash

###############################################################################
#                                                                             #
# ExercicioPropostoCriaArquivo.sh                                             #
#                                                                             #
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)                    #
# Data Criação: 13/02/2023                                                    #
#                                                                             #
# Descrição: Baseado em informações do usuário, o scrip criará um arquivo     #
#            texto de determinado tamanho                                     #
#                                                                             #
# Exemplo de uso: ./ExercicioPropostoCriaArquivo.sh                           #
#                                                                             #
# Alteracoes                                                                  #
#	Dia X - DescricaoAlteracaoRealizada                                       #
#                                                                             #
###############################################################################

read -p "Informe o nome do arquivo a ser criado: " FILE
read -p "Informe um conjunto de caracteres: " WORD
read -p "Informe o tamanho do arquivo (em bytes): " SIZE

cat /dev/null > $FILE # Neste caso se o arquivo existir, não irá apagar o arquivo
                      # mas deixará o mesmo vazio

PORC_EXIBIDA=0

until [ $SIZE -le $(stat --printf=%s "$FILE") ]
do
    echo -n $WORD >> $FILE
    SIZEATUAL=$(stat --printf=%s "$FILE")

    PORC_ATUAL=$(expr $SIZEATUAL \* 100 / $SIZE)

    if [ $(expr $PORC_ATUAL % 10) -eq 0 -a $PORC_EXIBIDA -ne $PORC_ATUAL ]
    then
        echo "Concluido: $PORC_ATUAL% - Tamanho do Arquivo: $SIZEATUAL"
        PORC_EXIBIDA=$PORC_ATUAL
    fi
done