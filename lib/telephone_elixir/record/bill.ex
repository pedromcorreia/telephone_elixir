defmodule TelephoneElixir.Record.Bill do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bill" do
    field :call_duration, :naive_datetime
    field :call_price, :integer
    field :destination, :string
    field :timestamp_end_call, :naive_datetime
    field :timestamp_start_call, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:destination, :timestamp_start_call, :timestamp_end_call, :call_duration, :call_price])
    |> validate_required([:destination, :timestamp_start_call, :timestamp_end_call, :call_duration, :call_price])
  end
end
