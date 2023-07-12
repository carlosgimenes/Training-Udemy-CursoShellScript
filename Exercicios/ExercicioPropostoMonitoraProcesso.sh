 #!/bin/bash

###############################################################################
#                                                                             #
# ExercicioPropostoMonitoraProcesso.sh                                        #
#                                                                             #
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)                    #
# Data Criação: 09/02/2023                                                    #
#                                                                             #
# Descrição: Processo deve rodar como Daemon, monitorando a execução de um    #
#            processo passado por parâmetro. Exibe constantes mensagens na    #
#            tela quando o processo não está em execução                      #
#                                                                             #
# Exemplo de uso: ./ExercicioPropostoMonitoraProcesso.sh <processo>           #
#                                                                             #
# Alteracoes                                                                  #
#	Dia X - DescricaoAlteracaoRealizada                                       #
#                                                                             #
###############################################################################

TIME=5

if [ $# -eq 0 ]
then 
    echo "Favor informar um processo como argumento"
    echo "./MonitorProcesso.sh <processo>"
    exit 1
fi
while true
do
    if ps aux | grep $1 | grep -v grep | grep -v $0 > /dev/null
    then
        sleep $TIME
    else
        echo "ATENÇÃO!!!!!!! O processo $1 NÃO está em execução!"
        sleep $TIME
    fi
done