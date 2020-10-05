#!/bin/bash

#################### SCRIPT PARA BACKUP MYSQL ####################
# Jadilson Guedes <jadilson12@gmail.com>                         #
#																 #
# Jadilson - SISTEMAS DE INFORMAÇÃO                              #

# Definindo parametros do MySQL
echo "  -- Definindo parametros do MySQL ..."
DB_NAME='vocacional'
DB_USER='root'
export MYSQL_PWD=tiger
DB_PARAM='--add-drop-table --add-locks --extended-insert --single-transaction -quick'

# Definindo parametros do sistema
echo "  -- Definindo parametros do sistema ..."
DATE=`date +%Y-%m-%d`
MYSQLDUMP=/usr/bin/mysqldump
BACKUP_DIR=/backup/mysql
BACKUP_NAME=teste-vocacional-$DATE.sql
BACKUP_TAR=teste-vocacional-$DATE.tar

#Gerando arquivo sql
echo "  -- Gerando Backup da base de dados $DB_NAME em $BACKUP_DIR/$BACKUP_NAME ..."
[ -d $BACKUP_DIR ] || mkdir  -p $BACKUP_DIR
$MYSQLDUMP $DB_NAME $DB_PARAM -u $DB_USER > $BACKUP_DIR/$BACKUP_NAME

# Compactando arquivo em tar
echo "  -- Compactando arquivo em tar ..."
tar -cjf $BACKUP_DIR/$BACKUP_TAR -C $BACKUP_DIR $BACKUP_NAME --remove-files

# Excluindo backups antigos
echo "  -- Excluindo backups com mais de 30 dias ..."
find $BACKUP_DIR/* -mtime +30 -delete

# Feedback final
echo "  -- O processo de backup foi finalizado com sucessso ..."

# Configuração do telegram
chat_id="-1001376475021"
token="433288264:AAEgtKVaTSmQ1YOoOhGDxJnD8mp_Tb8fDkg"

# Mensagem
MSG="Backup realizado com sucesso $DATE"

# Notificar via telegram
curl --silent --output /dev/null \
--data-urlencode "chat_id=$chat_id" \
--data-urlencode "text=$MSG" \
--data-urlencode "parse_mode=Markdown" \
"https://api.telegram.org/bot$token/sendMessage"
