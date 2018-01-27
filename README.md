### Getting Started

#### Start Postgres

```
$ cd into/this/project
$ docker-compose up -d postgres
```

#### Create Database & Run Migration

```
$ docker-compose run --rm web bash -c "RAILS_ENV=production rake db:create"
$ docker-compose run --rm web bash -c "RAILS_ENV=production rake db:migrate"
```

#### Start Web Service

```
$ docker-compose up -d web
```

#### Stop All Services

```
$ docker-compose stop
```

#### Start All Services (for containers in `exited` state)

```
$ docker-compose start
```

#### Delete the containers/services and volumes

```
$ docker-compose down
```
