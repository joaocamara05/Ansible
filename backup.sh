#!/bin/sh

# Variáveis de configuração
DATA="printf %(%Y-%m-%d_)T"
NOMESERVER="hostname -s"
NOMEARQUIVO=$($DATA & $NOMESERVER)

# Compressão dos Arquivos do Pfsense
pigz -9 -k -p16 /cf/conf/config.xml

# RENOMEAR ARQUIVO COMPACTADO PARA TER A DATA NO NOME
mv /cf/conf/confg.xml.gz /var/log/"$NOMEARQUIVO"_config.xml.gz

# Transferir o backup para o servidor remoto
scp /var/log/"$NOMEARQUIVO"_config.xml.gz camara@192.168.128.236:/home/camara

