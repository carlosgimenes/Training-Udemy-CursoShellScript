 #!/bin/bash

###############################################################################
#                                                                             #
# ExercicioPropostoInspecionaHome.sh                                          #
#                                                                             #
# Autor: Carlos Eduardo Gimenes (carlos.gimenes@gmail.com)                    #
# Data Criação: 10/02/2023                                                    #
#                                                                             #
# Descrição: Inspeciona os diretórios home dos usuários em busca de arquivos  #
#            de determinadas extensões                                        #
#                                                                             #
# Exemplo de uso: ./ExercicioPropostoInspecionaHome.sh                        #
#                                                                             #
# Alteracoes                                                                  #
#	Dia X - DescricaoAlteracaoRealizada                                       #
#                                                                             #
###############################################################################

# Serão procurados arquivos do tipo .mp4, .mp3, .jpg e .png

for user in /home/*
do
    MP4COUNT=0
    MP3COUNT=0
    JPGCOUNT=0
    PNGCOUNT=0
    OLDIFS=$IFS
    IFS=$'\n'
    for files in $(find $user -name '*.jpg' -o -name '*.mp4' -o -name '*.mp3' -o -name '*.png')
    do
        case $files in 
            *.mp4)
                MP4COUNT=$(expr $MP4COUNT + 1 )
                ;;
            *.mp3)
                MP3COUNT=$(expr $MP3COUNT + 1 )
                ;;
            *.jpg)
                JPGCOUNT=$(expr $JPGCOUNT + 1 )
                ;;
            *.png)
                PNGCOUNT=$(expr $PNGCOUNT + 1 )
                ;;
        esac
    done # Fim do for do find
echo "Usuario: $(basename $user)"
echo "Arquivos PNG: $PNGCOUNT"
echo "Arquivos JPG: $JPGCOUNT"
echo "Arquivos MP3: $MP3COUNT"
echo "Arquivos MP4: $MP4COUNT"
echo
done # Fim do for no /home

IFS=$OLDIFS