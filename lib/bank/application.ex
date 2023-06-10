defmodule Bank.Application do
  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      Bank.EventSourcing,
      Bank.AccountBalances
    ]

    opts = [strategy: :one_for_one, name: Bank.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
