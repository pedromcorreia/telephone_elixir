defmodule Api.Schema do
  use Absinthe.Schema
  import_types Api.Schema.ContentTypes

  query do

    @desc "Get all telephone infosj"
    field :telephone, list_of(:telephone_info) do
      resolve &Resolvers.Content.list_telephone_infos/3
    end

  end

  mutation do

   @type %{
    "foo" => %{id: "foo"},
    "bar" => %{id: "bar"}
  }

    @desc "Create a new Telephone info"
    field :create_telephone_info, type: :telephone_info do
      arg(:id, non_null(:integer))
      arg(:type, non_null(:string))
      resolve fn %{id: item_id}, _ ->
        {:ok, @items[item_id]}
      end
      arg(:timestamp, non_null(:string))
      arg(:call_id, non_null(:integer))
      arg(:source, :string)
      arg(:destination, :string)
      resolve(&Api.Resolvers.Content.create_telephone_info/3)
    end
  end
end
