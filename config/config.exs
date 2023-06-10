import Config

config :bank, event_stores: [Bank.EventStore]

config :bank, Bank.EventSourcing,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: Bank.EventStore
  ]

import_config "#{config_env()}.exs"
