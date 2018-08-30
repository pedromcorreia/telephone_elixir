defmodule TelephoneElixir.Record.Resolver do

  alias TelephoneElixir.Record
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
      |> Record.create_information()
    end

  def create_telephone_call(
    %{
      call_id: call_id,
      id: id,
      timestamp_call: timestamp_call,
      type: type
    } = arg) do

      #TODO replace this var name and add a conditional for not find
      information_exitent
        arg
        |> Map.get(:call_id, nil)
        |> Record.get_information_by_call_id()
        |> Record.update_information(build_telephone_end(arg))
    end

  def create_telephone_call(arg), do: nil

  def list_bill_info(
    %{
      source: source,
      reference_time: reference_time
    } = arg) do
      Record.list_bill_by_source(arg)
  end

  def list_bill_info(
    %{
      source: source
    } = arg) do
      arg
      |> Map.put(:reference_time, create_reference_date())
      |> Record.list_bill_by_source(arg)
  end

  defp create_reference_date(), do: Timex.shift(Timex.now(), months: -1)

  defp build_bill_args(arg) do
    %{
      source: Map.get(arg, :source),
      reference_time: Map.get(arg, :reference_time)
    }
  end

  defp build_telephone_start(arg) do
    %{
      call_id: Map.get(arg, :call_id, nil),
      destination: Map.get(arg, :destination, nil),
      source: Map.get(arg, :source, nil),
      timestamp_start_call: Map.get(arg, :timestamp_call, nil),
      type: Map.get(arg, :type, nil),
      rule: create_rule(arg)
    }
  end

  defp build_telephone_end(arg) do
    %{
      call_id: Map.get(arg, :call_id, nil),
      timestamp_end_call: Map.get(arg, :timestamp_call, nil),
      type: Map.get(arg, :type, nil)
    }
  end

  def create_rule(attrs) do
    timestamp_start_call =
      attrs
      |> Map.get(:timestamp_call)
      |> NaiveDateTime.from_iso8601!
      |> NaiveDateTime.to_time()

    if timestamp_start_call >= ~T[06:00:00] and timestamp_start_call < ~T[22:00:00] do
      1
    else
      2
    end
  end
end
