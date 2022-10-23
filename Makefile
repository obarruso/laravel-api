COMPOSE=docker-compose -f docker/docker-compose.yml
DOCKERLOG=docker/log/docker.log

dstart:
	$(COMPOSE) build && $(COMPOSE) up -d
	@docker exec -it laravel-app bash -c "/bin/bash -c \"php artisan cache:clear\""
	@docker exec -it laravel-app bash -c "/bin/bash -c \"composer install\""
	@docker exec -it laravel-app bash -c "/bin/bash -c \"php artisan key:generate\""


dstop:
	$(COMPOSE) stop

dreload:
	$(COMPOSE) down
	$(COMPOSE) build
	$(COMPOSE) up -d

lbash:
	docker exec -it laravel-app bash -c "sudo -u devuser /bin/bash"

lbash-root:
	docker exec -it laravel-app bash -c "sudo -u root /bin/bash"

mysql:
	docker exec -it mysql-db bash -c "mysql -u dbuser -psecret db"

artisan:
	args="$@"
	command="php artisan $args"
	echo "$command"
	docker exec -it laravel-app bash -c "sudo -u devuser /bin/bash -c \"$command\""

composer:
	args="$@"
	command="composer $args"
	echo "$command"
	docker exec -it laravel-app bash -c "sudo -u devuser /bin/bash -c \"$command\""