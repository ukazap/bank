import Config

config :bank, Bank.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "bank_dev",
  hostname: "localhost",
  pool_size: 10
