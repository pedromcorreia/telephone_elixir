defmodule Api.Resolvers.Content do

  def create_telephone_info(_parent,
    %{
      call_id: call_id,
      id: id,
      timestamp_call: timestamp_call,
      type: type,
      source: source,
      destination: destination
    } = args,
    _params) do
      {:ok, timestamp_call} = NaiveDateTime.from_iso8601(timestamp_call)

      %{
        id_start_call: id,
        call_id: call_id,
        timestamp_start_call: timestamp_call,
        source: source,
        destination: destination
      }
      |> TelephoneElixir.Record.create_information()

      {:ok, %{status: "This info will be storage"}}
    end

  def create_telephone_info(_parent,
    %{
      call_id: call_id,
      id: id,
      timestamp_call: timestamp_call,
      type: type
    } = args,
    _params) do
      {:ok, timestamp_call} = NaiveDateTime.from_iso8601(timestamp_call)

      args =
        %{
          id_end_call: id,
          call_id: call_id,
          timestamp_end_call: timestamp_call
        }

      id
      |> TelephoneElixir.Record.get_information!()
      |> TelephoneElixir.Record.update_information(args)
      {:ok, %{status: "This info will be storage"}}
    end


  def create_telephone_info(_parent, _args, _resolution) do
    {:error, "Access denied"}
  end

  def list_telephone_infos(_parent, _args, _resolution) do
    {:ok, TelephoneElixir.Bill.Rules.list_telephone_infos()}
  end
end
