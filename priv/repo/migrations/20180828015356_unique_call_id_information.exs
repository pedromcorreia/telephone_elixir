defmodule TelephoneElixir.Repo.Migrations.UniqueCallIdInformation do
  use Ecto.Migration

  def change do
    create(unique_index(:informations, [:call_id]))
  end
end
