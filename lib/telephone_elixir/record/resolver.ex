defmodule TelephoneElixir.Record.Resolver do

  def create_telephone_call(
    %{
      call_id: call_id,
      destination: destination,
      id: id,
      source: source,
      timestamp_call: timestamp_call,
      type: type
    } = arg) do
      arg
      |> build_telephone_start()
      |> TelephoneElixir.Record.create_information()
    end

  def create_telephone_call(
    %{
      call_id: call_id,
      id: id,
      timestamp_call: timestamp_call,
      type: type
    } = arg) do

      #TODO replace this var name and add a conditional for not find
      information_exitent = TelephoneElixir.Record.get_information_by_call_id(Map.get(arg, :call_id, nil))

      TelephoneElixir.Record.update_information(information_exitent, build_telephone_end(arg))
    end

  def create_telephone_call(arg), do: nil

  defp build_telephone_start(arg) do
    %{
      call_id: Map.get(arg, :call_id, nil),
      destination: Map.get(arg, :destination, nil),
      source: Map.get(arg, :source, nil),
      timestamp_start_call: Map.get(arg, :timestamp_call, nil),
      type: Map.get(arg, :type, nil)
    }
  end

  defp build_telephone_end(arg) do
    %{
      call_id: Map.get(arg, :call_id, nil),
      timestamp_end_call: Map.get(arg, :timestamp_call, nil),
      type: Map.get(arg, :type, nil)
    }
  end
end
