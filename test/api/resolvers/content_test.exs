defmodule Api.Resolvers.ContentTest do
  use TelephoneElixirWeb.ConnCase
  describe "#create/3" do
    test "insert new telephone info" do

      assert {:ok,
        %{
          data: %{
            "createRun" => %{
              "status" => "This task was enqueued to be processed later"
            }
          }
        }} =
          Absinthe.run(
            """
            mutation createTelephoneInfo {
            createTelephoneInfo(
            callId: 1,
            destination: "123456789",
            id: 1,
            type: "start",
            source: "987654321",
            timestamp: "12341234"
            ) {
            id
            }
            }
            """,
            "api",
            "param"
          )
    end
  end
end
