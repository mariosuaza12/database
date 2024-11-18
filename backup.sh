#!/bin/bash
# Variables
TIMESTAMP=$(date +"%F_%T")
BACKUP_DIR="./MySQL/backups" # Cambia la ruta según tus necesidades
MYSQL_USER="portafolio-user"
MYSQL_PASSWORD="CVEfL3^9CjoRJ#db"
MYSQL_DATABASE="portafolio"

# Crear el directorio de backups si no existe
mkdir -p $BACKUP_DIR

# Ejecutar el respaldo
docker exec mysql mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > $BACKUP_DIR/db_backup_$TIMESTAMP.sql

# Mantener un solo backup (una vez al día)
if [[ $(date +"%H") == "23" ]]; then
  echo "Ejecutando limpieza de backups antiguos..."
  ls -1t $BACKUP_DIR/*.sql | tail -n +1 | xargs rm -f
fi

echo "Backup completado: $BACKUP_DIR/db_backup_$TIMESTAMP.sql"