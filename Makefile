DB_CONTAINER_NAME = mysql
MYSQL_USER = root
MYSQL_PASSWORD = Z1n#*zj10KGo55U%
MYSQL_DATABASE = portafolio
BACKUP_DIR = ./MySQL/backups

# Encuentra el archivo de backup más reciente
LAST_BACKUP_FILE = $(shell ls -1t $(BACKUP_DIR)/*.sql | head -n 1)

# Tarea para cargar el backup
restore-backup:
        @echo "Copiando backup: $(LAST_BACKUP_FILE) al contenedor..."
        docker cp $(LAST_BACKUP_FILE) $(DB_CONTAINER_NAME):/tmp/db_backup.sql
        @sleep 5
        @echo "Usando backup: $(LAST_BACKUP_FILE)"
        docker exec -i mysql-ana sh -c "mysql -uroot -pZ1n#*zj10KGo55U% portafolio < /tmp/db_backup.sql"

deploy:
        @docker compose build
        @docker compose up -d