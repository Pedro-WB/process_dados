#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    yad --error --title="Erro" --text="Este script não pode ser executado como root."
    exit 1
fi

arquivo=$(yad --file --title="Seleção de Arquivo" --text="Escolha o arquivo para deletar:" --separator="\n")

if [ -z "$arquivo" ]; then
    yad --error --title="Erro" --text="Nenhum arquivo foi selecionado."
    exit 1
fi

rm -f "$arquivo"

if [ $? -eq 0 ]; then
    yad --info --title="Sucesso" --text="O arquivo '$arquivo' foi deletado com sucesso."
else
    yad --error --title="Erro" --text="Não foi possível deletar o arquivo '$arquivo'."
fi

