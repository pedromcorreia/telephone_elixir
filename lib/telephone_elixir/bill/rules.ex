defmodule TelephoneElixir.Bill.Rules do

  def create_call_start(%{
    call_id: call_id,
    id: id,
    timestamp: timestamp,
    type: type,
    source: source,
    destination: destination})
  do
  end

  def create_call_end(%{
    call_id: call_id,
    id: id,
    timestamp: timestamp,
    type: type})
  do
  end

end
