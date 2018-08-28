defmodule TelephoneElixir.Record.ResolverTest do

  use TelephoneElixir.DataCase
  alias TelephoneElixir.Record.Resolver

  describe "create_telephone_call/1" do
    test "pass a list and return nil" do
      refute Resolver.create_telephone_call([])
    end

    test "pass a invalid call_id and return nil" do
      refute %{
        call_id: nil,
        destination: "123456789",
        id: 1,
        source: "987654321",
        timestamp_call: "12341234",
        type: "start"
      }
      |> Resolver.create_telephone_call()
    end

    test "pass a map with miss args and return error" do
      refute %{
        destination: nil,
        id: 1,
        source: "987654321",
        timestamp_call: "12341234",
        type: "start"
      }
      |> Resolver.create_telephone_call()
    end

    test "pass a map with start and return ok" do
      assert %{
        call_id: 1,
        destination: "123456789",
        id: 1,
        source: "987654321",
        timestamp_call: "12341234",
        type: "start"
      }
      |> Resolver.create_telephone_call() ==  1
    end

    test "pass a map with type end args and return error" do
      refute %{
        id: 1,
        timestamp_call: "12341234",
        type: "end"
      }
      |> Resolver.create_telephone_call()
    end

    test "pass a map with type end args and return ok" do
      assert %{
        call_id: 1,
        id: 1,
        timestamp_call: "12341234",
        type: "end"
      }
      |> Resolver.create_telephone_call() ==  1
    end
  end
end
