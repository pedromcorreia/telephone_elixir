defmodule Api.Resolvers.Content do

  def create_telephone_info(args, _params) do
    TelephoneElixir.Record.Resolver.create_telephone_call(args)

    {:ok, %{status: "This info will be storage"}}
  end

  def create_telephone_info(_parent, _args, _resolution) do
    {:error, "Access denied"}
  end

  def list_telephone_infos(_parent, _args, _resolution) do
    {:ok, TelephoneElixir.Bill.Rules.list_telephone_infos()}
  end
end
