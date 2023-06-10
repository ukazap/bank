defmodule Bank.Router do
  use Commanded.Commands.Router

  alias Bank.Commands.OpenBankAccount
  alias Bank.Aggregates.BankAccount

  dispatch OpenBankAccount, to: BankAccount, identity: :account_number
end
