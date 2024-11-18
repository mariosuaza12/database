DB_CONTAINER_NAME = mysql
MYSQL_USER = portafolio-user
MYSQL_PASSWORD = CVEfL3^9CjoRJ#db
MYSQL_DATABASE = portafolio
BACKUP_FILE = ./MySQL/backups/db_backup.sql

# Tarea para cargar el backup
restore-backup:
	docker exec -i $(DB_CONTAINER_NAME) mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) $(MYSQL_DATABASE) < $(BACKUP_FILE)

deploy:
	@docker compose build
	@docker compose up -d