defmodule TelephoneElixirWeb.BillControllerTest do
  use TelephoneElixirWeb.ConnCase

  alias TelephoneElixir.Record

  @create_attrs %{call_duration: ~N[2010-04-17 14:00:00.000000], call_price: 42, destination: "some destination", timestamp_end_call: ~N[2010-04-17 14:00:00.000000], timestamp_start_call: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{call_duration: ~N[2011-05-18 15:01:01.000000], call_price: 43, destination: "some updated destination", timestamp_end_call: ~N[2011-05-18 15:01:01.000000], timestamp_start_call: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{call_duration: nil, call_price: nil, destination: nil, timestamp_end_call: nil, timestamp_start_call: nil}

  def fixture(:bill) do
    {:ok, bill} = Record.create_bill(@create_attrs)
    bill
  end

  describe "index" do
    test "lists all bill", %{conn: conn} do
      conn = get conn, bill_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Bill"
    end
  end

  describe "new bill" do
    test "renders form", %{conn: conn} do
      conn = get conn, bill_path(conn, :new)
      assert html_response(conn, 200) =~ "New Bill"
    end
  end

  describe "create bill" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, bill_path(conn, :create), bill: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == bill_path(conn, :show, id)

      conn = get conn, bill_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Bill"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, bill_path(conn, :create), bill: @invalid_attrs
      assert html_response(conn, 200) =~ "New Bill"
    end
  end

  describe "edit bill" do
    setup [:create_bill]

    test "renders form for editing chosen bill", %{conn: conn, bill: bill} do
      conn = get conn, bill_path(conn, :edit, bill)
      assert html_response(conn, 200) =~ "Edit Bill"
    end
  end

  describe "update bill" do
    setup [:create_bill]

    test "redirects when data is valid", %{conn: conn, bill: bill} do
      conn = put conn, bill_path(conn, :update, bill), bill: @update_attrs
      assert redirected_to(conn) == bill_path(conn, :show, bill)

      conn = get conn, bill_path(conn, :show, bill)
      assert html_response(conn, 200) =~ "some updated destination"
    end

    test "renders errors when data is invalid", %{conn: conn, bill: bill} do
      conn = put conn, bill_path(conn, :update, bill), bill: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Bill"
    end
  end

  describe "delete bill" do
    setup [:create_bill]

    test "deletes chosen bill", %{conn: conn, bill: bill} do
      conn = delete conn, bill_path(conn, :delete, bill)
      assert redirected_to(conn) == bill_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, bill_path(conn, :show, bill)
      end
    end
  end

  defp create_bill(_) do
    bill = fixture(:bill)
    {:ok, bill: bill}
  end
end
