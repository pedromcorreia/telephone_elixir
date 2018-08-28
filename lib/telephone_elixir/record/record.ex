defmodule TelephoneElixir.Record do
  @moduledoc """
  The Record context.
  """

  import Ecto.Query, warn: false
  alias TelephoneElixir.Repo

  alias TelephoneElixir.Record.Information

  @doc false
  def list_informations do
    Repo.all(Information)
  end

  @doc false
  def get_information_by_call_id(id), do: Repo.get_by(Information, call_id: id)

  @doc false
  def create_information(attrs \\ %{}) do
    %Information{}
    |> Information.changeset_start(attrs)
    |> Repo.insert()
  end

  @doc false
   def update_information(%Information{} = information, attrs) do
    information
    |> Information.changeset_end(attrs)
    |> Repo.update()
  end

  def change_information(%Information{} = information) do
    Information.changeset(information, %{})
  end
end
