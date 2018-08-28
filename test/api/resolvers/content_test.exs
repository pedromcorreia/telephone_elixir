defmodule Api.Resolvers.ContentTest do
  use TelephoneElixirWeb.ConnCase

  describe "#create/2" do
    test "try insert new telephone info with not valid params" do

      assert {:error, "Access denied"} =
          """
      mutation createTelephoneInfo {
      createTelephoneInfo()
      }
      """
      |> Absinthe.run(Api.Schema)
    end

    test "insert new telephone info" do

      assert {:ok,
        %{
          data: %{
            "createRun" => %{
              "status" => "This task was enqueued to be processed later"
            }
          }
        }} =
          """
      mutation createTelephoneInfo {
      createTelephoneInfo(
      id: 1,
      type: "start",
      timestamp_call: "12341234"
      call_id: 1,
      source: "987654321",
      destination: "123456789",
      ) {
      id
      }
      }
      """
      |> Absinthe.run(Api.Schema)
    end
  end
end
