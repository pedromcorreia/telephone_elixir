defmodule TelephoneElixir.Repo.Migrations.CreateInformations do
  use Ecto.Migration

  def change do
    create table(:informations) do
      add :id_start_call, :integer
      add :timestamp_start_call, :naive_datetime
      add :call_id, :integer
      add :source, :string
      add :destination, :string
      add :id_end_call, :integer
      add :timestamp_end_call, :naive_datetime

      timestamps()
    end

  end
end
