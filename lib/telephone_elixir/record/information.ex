defmodule TelephoneElixir.Record.Information do
  use Ecto.Schema
  import Ecto.Changeset


  schema "informations" do
    field :call_id, :integer
    field :destination, :string
    field :id_end_call, :integer
    field :id_start_call, :integer
    field :source, :string
    field :timestamp_end_call, :naive_datetime
    field :timestamp_start_call, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(information, attrs) do
    information
    |> cast(attrs, [:id_start_call, :timestamp_start_call, :call_id, :source, :destination, :id_end_call, :timestamp_end_call])
    |> validate_required([:id_start_call, :timestamp_start_call, :call_id, :source, :destination, :id_end_call, :timestamp_end_call])
  end

  @doc false
  def changeset_start(information, attrs) do
    information
    |> cast(attrs, [:id_start_call, :timestamp_start_call, :call_id, :source, :destination])
    |> validate_required([:id_start_call, :timestamp_start_call, :call_id, :source, :destination])
  end

  @doc false
  def changeset_end(information, attrs) do
    information
    |> cast(attrs, [:id_start_call, :timestamp_start_call, :call_id, :source, :destination, :id_end_call, :timestamp_end_call])
    |> validate_required([:id_start_call, :timestamp_start_call, :call_id, :source, :destination, :id_end_call, :timestamp_end_call])
  end
end
