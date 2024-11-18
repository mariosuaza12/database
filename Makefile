DB_CONTAINER_NAME = mysql
MYSQL_USER = portafolio-user
MYSQL_PASSWORD = CVEfL3^9CjoRJ#db
MYSQL_DATABASE = portafolio
BACKUP_DIR = ./MySQL/backups

# Encuentra el archivo de backup más reciente
LAST_BACKUP_FILE = $(shell ls -1t $(BACKUP_DIR)/*.sql | head -n 1)

# Tarea para cargar el backup
restore-backup:
	@echo "Usando backup: $(LAST_BACKUP_FILE)"
	docker exec -i $(DB_CONTAINER_NAME) mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) $(MYSQL_DATABASE) < $(LAST_BACKUP_FILE)

deploy:
	@docker compose build
	@docker compose up -d