defmodule TelephoneElixirWeb.InformationControllerTest do
  use TelephoneElixirWeb.ConnCase

  alias TelephoneElixir.Record

  @create_attrs %{call_id: 42, destination: "some destination", id_end_call: 42, id_start_call: 42, source: "some source", timestamp_end_call: ~N[2010-04-17 14:00:00.000000], timestamp_start_call: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{call_id: 43, destination: "some updated destination", id_end_call: 43, id_start_call: 43, source: "some updated source", timestamp_end_call: ~N[2011-05-18 15:01:01.000000], timestamp_start_call: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{call_id: nil, destination: nil, id_end_call: nil, id_start_call: nil, source: nil, timestamp_end_call: nil, timestamp_start_call: nil}

  def fixture(:information) do
    {:ok, information} = Record.create_information(@create_attrs)
    information
  end

  describe "index" do
    test "lists all informations", %{conn: conn} do
      conn = get conn, information_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Informations"
    end
  end

  describe "new information" do
    test "renders form", %{conn: conn} do
      conn = get conn, information_path(conn, :new)
      assert html_response(conn, 200) =~ "New Information"
    end
  end

  describe "create information" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, information_path(conn, :create), information: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == information_path(conn, :show, id)

      conn = get conn, information_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Information"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, information_path(conn, :create), information: @invalid_attrs
      assert html_response(conn, 200) =~ "New Information"
    end
  end

  describe "edit information" do
    setup [:create_information]

    test "renders form for editing chosen information", %{conn: conn, information: information} do
      conn = get conn, information_path(conn, :edit, information)
      assert html_response(conn, 200) =~ "Edit Information"
    end
  end

  describe "update information" do
    setup [:create_information]

    test "redirects when data is valid", %{conn: conn, information: information} do
      conn = put conn, information_path(conn, :update, information), information: @update_attrs
      assert redirected_to(conn) == information_path(conn, :show, information)

      conn = get conn, information_path(conn, :show, information)
      assert html_response(conn, 200) =~ "some updated destination"
    end

    test "renders errors when data is invalid", %{conn: conn, information: information} do
      conn = put conn, information_path(conn, :update, information), information: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Information"
    end
  end

  describe "delete information" do
    setup [:create_information]

    test "deletes chosen information", %{conn: conn, information: information} do
      conn = delete conn, information_path(conn, :delete, information)
      assert redirected_to(conn) == information_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, information_path(conn, :show, information)
      end
    end
  end

  defp create_information(_) do
    information = fixture(:information)
    {:ok, information: information}
  end
end
