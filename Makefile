deploy:
    @sudo docker compose down
    @sudo docker compose build
    @sudo docker compose up -d

run-backup:
    @if [ -d /home/ubuntu/databasejames/MySQL/data ]; then \
        echo "Eliminando carpeta existente: /home/ubuntu/databasejames/MySQL/data"; \
        sudo rm -r /home/ubuntu/databasejames/MySQL/data; \
    else \
        echo "La carpeta no existe, no se elimina: /home/ubuntu/databasejames/MySQL/data"; \
    fi
    @sudo docker compose down
    @sudo docker compose build
    @sudo docker compose up -d
