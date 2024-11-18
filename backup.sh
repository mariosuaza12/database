#!/bin/bash
# Variables
TIMESTAMP=$(date +"%F_%T")
BACKUP_DIR="./MySQL/backups" # Cambia la ruta según tus necesidades
MYSQL_USER="root"
MYSQL_PASSWORD="Z1n#*zj10KGo55U%"
MYSQL_DATABASE="portafolio"

# Crear el directorio de backups si no existe
mkdir -p $BACKUP_DIR

# Ejecutar el respaldo
sudo docker exec mysql mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > $BACKUP_DIR/backup.sql

echo "Backup completado: $BACKUP_DIR/db_backup_$TIMESTAMP.sql"