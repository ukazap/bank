defmodule Bank.Aggregates.BankAccount do
  defstruct [:account_number, :balance]

  alias __MODULE__
  alias Bank.Commands.OpenBankAccount
  alias Bank.Events.BankAccountOpened

  # Public command API

  def execute(%BankAccount{account_number: nil}, %OpenBankAccount{account_number: n, initial_balance: b}) when b > 0 do
    %BankAccountOpened{account_number: n, initial_balance: b}
  end

  def execute(%BankAccount{}, %OpenBankAccount{initial_balance: b}) when b <= 0 do
    {:error, :initial_balance_must_be_above_zero}
  end

  def execute(%BankAccount{} = state, %OpenBankAccount{}) do
    IO.inspect({"wkwk", state, self()})
    {:error, :account_already_opened}
  end

  # State mutators

  def apply(%BankAccount{} = account, %BankAccountOpened{account_number: n, initial_balance: b} = event) do
    %BankAccount{account | account_number: n, balance: b}
  end
end
