defmodule Api.Resolvers.Content do

  alias TelephoneElixir.Record.Resolver
  def create_telephone_info(args, _params) do
    Resolver.create_telephone_call(args)
    {:ok, %{status: "This info will be storage"}}
  end

  def create_telephone_info(_args, _params) do
    {:error, "Access denied"}
  end

  def list_telephone_infos(_parent, _args, _resolution) do
    nil
  end

  def list_bill_info(args, _params) do
    Resolver.list_bill_info(args)
    {:ok, %{status: "This info will be storage"}}
  end

  def list_bill_info(_args, _params) do
    {:error, "Access denied"}
  end

  def list_bill_infos(_parent, _args, _resolution) do
    nil
  end
end
