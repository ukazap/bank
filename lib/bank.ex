defmodule Bank do
  alias Bank.Commands.OpenBankAccount

  def open_bank_account(account_number, initial_balance) do
    dispatch(%OpenBankAccount{account_number: account_number, initial_balance: initial_balance})
  end

  defdelegate dispatch(command), to: Bank.EventSourcing
end
