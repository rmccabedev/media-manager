setup-env:
	if [ ! -f .env ]; then \
		echo "Creating .env file..."; \
		touch .env; \
	fi

populate-user-info:
	echo "Setting PUID and PGID in .env file..."
	sed -i "s/^PUID=.*/PUID=$(id -u)/" .env
	sed -i "s/^PGID=.*/PGID=$(id -g)/" .env
	echo ".env file updated with PUID and PGID."

restart: down up

down:
	docker-compose down

up:
	docker-compose up -d

update:
	make down
	docker-compose pull
	make up