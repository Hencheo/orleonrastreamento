#!/bin/bash

# Baixando Capa e Imagem de Sobre
echo "Baixando imagens base..."
curl -s -O https://www.orleonrastreamento.com.br/img/capa.svg
curl -s -O https://www.orleonrastreamento.com.br/img/sobre.png

# Baixando Depoimentos/Fotos
echo "Baixando fotos de depoimentos..."
curl -s https://www.orleonrastreamento.com.br/Depoimentos/WhatsApp%20Image%202025-05-08%20at%2019.00.01.jpeg -o "foto1.jpeg"
curl -s https://www.orleonrastreamento.com.br/Depoimentos/WhatsApp%20Image%202025-05-08%20at%2019.00.46.jpeg -o "foto2.jpeg"
curl -s https://www.orleonrastreamento.com.br/Depoimentos/WhatsApp%20Image%202025-05-08%20at%2019.01.05.jpeg -o "foto3.jpeg"

# Baixando Depoimentos/Videos (pode demorar)
echo "Baixando vídeo (isso pode levar alguns instantes devido ao tamanho do arquivo)..."
curl -s https://www.orleonrastreamento.com.br/Depoimentos/WhatsApp%20Video%202025-05-08%20at%2019.01.57.mp4 -o "video.mp4"

echo "Download concluído!"
