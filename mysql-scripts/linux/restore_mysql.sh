#!/bin/bash

#################### SCRIPT PARA RESTORE MYSQL ####################
# Jadilson Guedes <jadilson12@gmail.com>                          #
#																  #
# Jadilson - SISTEMAS DE INFORMAÇÃO                               #

# Definindo parametros do MySQL
echo "  -- Definindo parametros do MySQL ..."
DB_NAME='vocacional'
DB_USER='root'
export MYSQL_PWD=tiger

# Definindo parametros do sistema
echo "  -- Definindo parametros do sistema ..."
DATA=2019-07-04  # Exemplo yyyy-mm-dd
BACKUP_DIR=/backup/mysql
DB_PATH_RESTORE=/tmp/restore_mysql/
BACKUP_NAME=teste-vocacional-$DATA.sql
BACKUP_TAR=teste-vocacional-$DATA.tar

# Descompactando arquivo em tar
echo "  -- Descompactando arquivo em tar ..."
[ -d $DB_PATH_RESTORE ] || mkdir  -p $DB_PATH_RESTORE
tar -xf $BACKUP_DIR/$BACKUP_TAR -C $DB_PATH_RESTORE

# Realizando o restore
echo "  -- Gerando restore da base de dados $DB_NAME em $DB_PATH_RESTORE$BACKUP_NAME ..."
mysql -u $DB_USER $DB_NAME  < $DB_PATH_RESTORE$BACKUP_NAME

# Limpando arquivos temporários
echo "  -- Limpando os arquivos temporários ..."
rm -rf $DB_PATH_RESTORE

# Feedback final
echo "  -- O processo de restore foi finalizado com sucessso ..."

# Mensagem
MSG="Restore realizado com sucesso $DATE"

# Notificar via telegram
curl --silent --output /dev/null \
--data-urlencode "chat_id=$chat_id" \
--data-urlencode "text=$MSG" \
--data-urlencode "parse_mode=Markdown" \
"https://api.telegram.org/bot$token/sendMessage"

