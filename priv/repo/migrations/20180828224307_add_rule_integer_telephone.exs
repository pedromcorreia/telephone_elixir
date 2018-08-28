defmodule TelephoneElixir.Repo.Migrations.AddRuleIntegerTelephone do
  use Ecto.Migration

  def change do
    alter table(:informations) do
      remove(:rule)
      add(:rule, :integer)
    end
  end
end
