defmodule TelephoneElixir.Repo.Migrations.AddRuleTelephone do
  use Ecto.Migration

  def change do
     alter table(:informations) do
      add(:rule, :string)
    end
  end
end
