#!/bin/bash

download() {
    if [ ! -f "access.log" ]; then
        curl -O "https://raw.githubusercontent.com/linuxacademy/content-elastic-log-samples/master/access.log"
        echo "Download realizado com sucesso!"
    else
        echo "O arquivo já existe."
    fi
}

exibir_resumo() {
    if [ -f "access.log" ]; then
        head -n 30 access.log
        tail -n 30 access.log
    else
        echo "Arquivo não encontrado!"
    fi
}

listar_ips() {
    if [ -f "access.log" ]; then
        awk '{print $1}' access.log | sort | uniq
    else
        echo "Arquivo não encontrado!"
    fi
}

ip_aleatorio() {
    if [ -f "access.log" ]; then
        random_ip=$(awk '{print $1}' access.log | sort | uniq | shuf -n 1)
        echo "IP Aleatório: $random_ip"
    else
        echo "Arquivo não encontrado!"
    fi
}

while true; do
    echo "Escolha qual opção:"
    echo "[1] Efetuar Download"
    echo "[2] Exibir Resumo do Arquivo"
    echo "[3] Listar IPs"
    echo "[4] Exibir IP aleatório"
    echo "[5] Sair"

    read -p "Digite a opção: " opcao

    case $opcao in
        1) download ;;
        2) exibir_resumo ;;
        3) listar_ips ;;
        4) ip_aleatorio ;;
        5) echo "Saindo..."; break ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac
done

