#!/bin/bash

clear
read -p "Informe o Limite de Processos: " MAXIMO

while [ $(ps aux|wc -l) -le $MAXIMO ]
do
    echo "Tudo Ok!"
    echo "Processos Atuais: $(ps aux|wc -l)"
    sleep 3
    echo
done

echo "Limite de Processos Excedido"
echo " Por favor verifique o sistema"