defmodule Bank.AccountBalances do
  use Commanded.Event.Handler,
    application: Bank.EventSourcing,
    name: __MODULE__

  alias Bank.Events.BankAccountOpened

  @table :account_balances

  def list, do: :ets.tab2list(@table)

  @impl Commanded.Event.Handler
  def init do
    case :ets.new(@table, [:set, :named_table, :public]) do
      @table -> :ok
      _ -> {:stop, :ets_init_failed}
    end
  end

  @impl Commanded.Event.Handler
  def handle(%BankAccountOpened{account_number: n, initial_balance: b}, _metadata) do
    case :ets.insert(@table, {n, b}) do
      true -> :ok
      false -> {:error, :insert_failed}
    end
  end
end
