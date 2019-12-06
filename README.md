### The following repository contains configuration and instructions for creating api-only rails application and setting up the development environment from scratch
```
bundle exec rails new . --no-deps --skip-test --webpack=react --skip-coffee --skip-sprocket --skip-action-cable --database=postgresql --api -f
```
```
docker-compose build
docker-compose up
rake db:create
```

config/database.yml
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: blog-development

test:
  <<: *default
  database: blog-test
  ```