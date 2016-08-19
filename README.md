Follow instructions [here](https://github.com/mikrofusion/docker-devbox-base).

Postgres will now be set up as follows:

```
  adapter: postgresql
  encoding: unicode
  database: postgres
  username: postgres
  password:
  host: postgres
```

From within the container can connect to postgres using:

```
psql -h postgres -U postgres postgres
```

## Phoenix

$ mix phoenix.new hello_phoenix
$ cd hello_phoenix

update hostname in `config/dev.exs` to use the correct database host:

in config/dev.exs
```
  # Configure your database
  config :hello_phoenix, HelloPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "hello_phoenix_dev",
  hostname: "postgres",
  pool_size: 10

```

$ mix ecto.create
$ mix phoenix.server
