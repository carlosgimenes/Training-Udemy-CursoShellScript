#!/bin/bash

###################################################################################################
#
# ExercicioProposto2.sh - Script que gera relatorio informacoes Workstation
#
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)
# Data Criação: 15/12/2022
#
# Descrição: Script que gera relatorio com informacoes da Workstation
#
# Exemplo de uso: ./ExercicioProposto2.sh
#
# Alteracoes
#	Dia X - DescricaoAlteracaoRealizada
#
###################################################################################################
NOMEMAQUINA=$(hostname)
DATAHORA=$(date +'%d de %B de %Y %H:%M hs')
DATAHORA2=$(date +'%D %H:%M hs')
DATAHORA3=$(date +'%d/%m/%Y %H:%M hs')

UPTIME=$(uptime -s)
KERNEL=$(uname -r)
CPUCORES=$(cat /proc/cpuinfo |grep "model name"|wc -l)
CPUMODEL=$(cat /proc/cpuinfo |grep "model name"|head -n1|cut -c14-)
MEMTOTAL=$(expr $(cat /proc/meminfo |grep MemTotal|tr -d ' '|cut -d: -f2|tr -d kB) / 1024) # Em MB
FILESYS=$(df -h|egrep -v '(tmpfs|udev)')

echo "###################################################################################################"
echo ""
echo "Relatório da Máquina: $NOMEMAQUINA"
echo "Data/Hora: $DATAHORA"
echo "Data/Hora: $DATAHORA2"
echo "Data/Hora: $DATAHORA3"
echo ""
echo "###################################################################################################"
echo ""
echo ""
echo "Máquina ativa desde: $UPTIME"
echo ""
echo "Versão do Kernel: $KERNEL"
echo ""
echo "===== Informações da CPU ====="
echo ""
echo "Quantidade de CPUs/Core: $CPUCORES"
echo "Modelo da CPU: $CPUMODEL"
echo ""
echo "===== Informações da Memória ====="
echo "Memória Total: $MEMTOTAL MB"
echo ""
echo "===== Informações do Disco ====="
echo "Partições"
echo "$FILESYS"
