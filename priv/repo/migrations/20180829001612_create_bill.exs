defmodule TelephoneElixir.Repo.Migrations.CreateBill do
  use Ecto.Migration

  def change do
    create table(:bill) do
      add :destination, :string
      add :timestamp_start_call, :naive_datetime
      add :timestamp_end_call, :naive_datetime
      add :call_duration, :naive_datetime
      add :call_price, :integer

      timestamps()
    end

  end
end
