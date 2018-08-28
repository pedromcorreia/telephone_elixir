defmodule TelephoneElixir.Record.Information do
  use Ecto.Schema
  import Ecto.Changeset

  schema "informations" do
    field :call_id, :integer
    field :destination, :string
    field :source, :string
    field :timestamp_end_call, :naive_datetime
    field :timestamp_start_call, :naive_datetime
    field :type, :string

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
    |> cast(attrs, [:timestamp_start_call, :call_id, :source, :destination, :type])
    |> validate_required([:timestamp_start_call, :call_id, :source, :destination, :type])
    |> validate_format(:destination, ~r/^[0-9]{10,11}$/)
    |> validate_format(:source, ~r/^[0-9]{10,11}$/)
    |> validate_inclusion(:type, ["start"])
    |> unique_constraint(:call_id)
    |> valid_destination()
  end

  @doc false
  def changeset_end(information, attrs) do
    information
    |> cast(attrs, [:call_id, :timestamp_start_call, :timestamp_end_call, :type])
    |> validate_required([:call_id, :timestamp_start_call, :timestamp_end_call, :type])
    |> validate_inclusion(:type, ["end"])
    |> validate_timestamp(information)
    |> unique_constraint(:call_id)
  end

  def valid_destination(attrs) do
    source = get_change(attrs, :source)
    destination = get_change(attrs, :destination)
     case source do
      ^destination -> add_error(attrs, :numbers, "destination is not valid")
      _ -> attrs
    end
  end

  def validate_timestamp(attrs, information) do
    timestamp_start_call = Map.get(information, :timestamp_start_call)
    timestamp_end_call = get_change(attrs, :timestamp_end_call)
    case timestamp_end_call > timestamp_start_call do
      false ->  add_error(attrs, :timestamp_end_call, "timestamp end is not valid")
      true -> attrs
    end
  end
end
