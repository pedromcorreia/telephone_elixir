defmodule Api.Resolvers.Content do

  def create_telephone_info(_parent,
    %{
      call_id: call_id,
      destination: destination,
      id: id,
      timestamp: timestamp,
      type: type
    }, _params) do
      IO.inspect type, label: "SAGFAS"
      #Telephone.TelephoneInfo.create_info(args)
      {:ok, %{status: "This info will be storage"}}
    end

  def create_telephone_info(_parent, _args, _resolution) do
    {:error, "Access denied"}
  end

  def list_telephone_infos(_parent, _args, _resolution) do
    {:ok, Telephone.TelephoneInfo.list_telephone_infos()}
  end

end
