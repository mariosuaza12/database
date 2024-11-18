deploy:
    @sudo docker compose down
    @sudo docker compose build
    @sudo docker compose up -d

run-backup:
    @if [ -d /home/ubuntu/databasemario/MySQL/data ]; then \
        echo "Eliminando carpeta existente: /home/ubuntu/databasemario/MySQL/data"; \
        sudo rm -r /home/ubuntu/databasemario/MySQL/data; \
    else \
        echo "La carpeta no existe, no se elimina: /home/ubuntu/databasemario/MySQL/data"; \
    fi
    @sudo docker compose down
    @sudo docker compose build
    @sudo docker compose up -d