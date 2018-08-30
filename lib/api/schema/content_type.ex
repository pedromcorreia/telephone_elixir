defmodule Api.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :telephone_info do
    field :id, :id
    field :type, :string
    field :timestamp_call, :string
    field :call_id, :integer
    field :source, :string
    field :destination, :string
  end

  object :bill_info do
    field :destination, :string
    field :call_start_date, :string
    field :call_start_time, :string
    field :call_duration, :string
    field :call_price, :string
  end
end
