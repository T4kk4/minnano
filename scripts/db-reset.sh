#!/bin/sh
docker-compose kill db
git checkout HEAD db/schema.rb
docker-compose run --rm web bash -c "rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1 && rails db:create && rails db:schema:load"
docker-compose exec -T db pg_restore -cO -d app_development -U postgres -w < latest.dump
docker-compose run --rm web bundle exec rails db:migrate
