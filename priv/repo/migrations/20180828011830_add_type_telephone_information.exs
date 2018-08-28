defmodule TelephoneElixir.Repo.Migrations.AddTypeTelephoneInformation do
  use Ecto.Migration

  def change do
     alter table(:informations) do
      add(:type, :string)
      remove(:id_start_call)
      remove(:id_end_call)
    end
  end
end
