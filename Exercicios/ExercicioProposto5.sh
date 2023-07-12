#!/bin/bash

###############################################################################
#
# ExercicioProposto5.sh - Script que realiza Backup pasta "home"
#
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)
# Data Criação: 03/02/2023
#
# Descrição: Script que realiza Backup da pasta "home" do usuário que estiver
#            executando o script
#
# Exemplo de uso: ./ExercicioProposto5.sh
#
# Alteracoes
#	Dia X - DescricaoAlteracaoRealizada
#
###############################################################################

DIRDEST=$HOME/Backup

if [ ! -d $DIRDEST ]
then
    echo "Criando Diretório $DIRDEST..."
    mkdir -p $DIRDEST
fi

DAYS7=$(find $DIRDEST -ctime -7 -name backup_home\*tgz)     # Atenção na proteção do "*" o "\" faz com que ele seja interpretado
                                                            # "coringa" e não como "código"

if [ "$DAYS7" ]     # Testa se a variável é nula. Atenção nas aspas duplas
then
    echo "Já foi gerado um backup no diretório $HOME nos últimos 7 dias."
    echo -n "Deseja continuar? (N/s): "
    read -n1 CONT   # Aqui será capturado a tecla digitada
    echo
    if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]
    then
            echo "Backup Abortado!"
            exit 1
    elif [ $CONT = S -o $CONT = s ]
    then
            echo "Será criado mais um backup para a mesma semana"
    else
            echo "Opção Inválida"
            exit 2
    fi
fi

echo "Criando Backup..."
ARQ="backup_home_$(date +%Y%m%d%H%m).tgz"
tar zcvpf $DIRDEST/$ARQ --absolute-names --exclude="$HOME/Docker" --exclude="$HOME/Downloadas" --exclude="$HOME/Dropbox" --exclude="$HOME/VirtualBoxVMs" --exclude="$DIRDEST" "$HOME"/* > /dev/null
# O "/dev/null" é para não jogar nada na tela

# tar zcpf $DIRDEST/$ARQ --exclude="$DIRDEST" "$HOME"/* > /dev/null
# A linha acima é para o caso de querer fazer "na mão"

echo
echo "O backup de nome \""$ARQ"\" foi criado em $DIRDEST"
echo
echo "Backup Concluído!"