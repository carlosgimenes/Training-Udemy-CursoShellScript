#!/bin/bash

###############################################################################
#
# ExercicioProposto3.sh - Script que gera relatorio informacoes Usuário
#
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)
# Data Criação: 17/01/2023
#
# Descrição: Script que gera relatorio com informacoes do Usuário
#
# Exemplo de uso: ./ExercicioProposto3.sh <NomeUsuario>
#
# Alteracoes
#	Dia X - DescricaoAlteracaoRealizada
#
###############################################################################

#ls /home/$1 > /dev/null 2>&1 || echo "Usuario Inexistente"
#ls /home/$1 > /dev/null 2>&1 || exit 1

ls /home/$1 > /dev/null 2>&1 || { echo "Usuario Inexistente" ; exit 1; }

USERID=$(grep $1 /etc/passwd|cut -d":" -f3)
DESC=$(grep $1 /etc/passwd|cut -d":" -f5 | tr -d ,)
USOHOME=$(du -sh /home/$1|cut -f1)

clear
echo "========================================================================"
echo " Relatório do Usuário: $1"
echo
echo "UID: $USERID"
echo "Nome ou Descrição: $DESC"
echo
echo "Total Usado no /home/$1: $USOHOME"
echo
echo "Último login:"
lastlog -u $1
echo "========================================================================"
exit 0