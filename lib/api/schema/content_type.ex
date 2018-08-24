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
end
