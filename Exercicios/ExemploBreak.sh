#!/bin/bash

read -p "Qual o(a) melhor aluno(a): " MELHOR
for i in $(cat ../arquivos/alunos3.txt)
do
    if [ $i = $MELHOR ]
    then 
        echo "$i é o(a) melhor aluno(a)!"
        break
    fi
    echo "Aluno(a): $i"
done