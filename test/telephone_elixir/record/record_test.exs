defmodule TelephoneElixir.RecordTest do
  use TelephoneElixir.DataCase

  alias TelephoneElixir.Record

  describe "informations" do
    alias TelephoneElixir.Record.Information

    @valid_attrs %{call_id: 42, destination: "some destination", id_end_call: 42, id_start_call: 42, source: "some source", timestamp_end_call: ~N[2010-04-17 14:00:00.000000], timestamp_start_call: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{call_id: 43, destination: "some updated destination", id_end_call: 43, id_start_call: 43, source: "some updated source", timestamp_end_call: ~N[2011-05-18 15:01:01.000000], timestamp_start_call: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{call_id: nil, destination: nil, id_end_call: nil, id_start_call: nil, source: nil, timestamp_end_call: nil, timestamp_start_call: nil}

    def information_fixture(attrs \\ %{}) do
      {:ok, information} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Record.create_information()

      information
    end

    test "list_informations/0 returns all informations" do
      information = information_fixture()
      assert Record.list_informations() == [information]
    end

    test "get_information!/1 returns the information with given id" do
      information = information_fixture()
      assert Record.get_information!(information.id) == information
    end

    test "create_information/1 with valid data creates a information" do
      assert {:ok, %Information{} = information} = Record.create_information(@valid_attrs)
      assert information.call_id == 42
      assert information.destination == "some destination"
      assert information.id_end_call == 42
      assert information.id_start_call == 42
      assert information.source == "some source"
      assert information.timestamp_end_call == ~N[2010-04-17 14:00:00.000000]
      assert information.timestamp_start_call == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_information/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Record.create_information(@invalid_attrs)
    end

    test "update_information/2 with valid data updates the information" do
      information = information_fixture()
      assert {:ok, information} = Record.update_information(information, @update_attrs)
      assert %Information{} = information
      assert information.call_id == 43
      assert information.destination == "some updated destination"
      assert information.id_end_call == 43
      assert information.id_start_call == 43
      assert information.source == "some updated source"
      assert information.timestamp_end_call == ~N[2011-05-18 15:01:01.000000]
      assert information.timestamp_start_call == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_information/2 with invalid data returns error changeset" do
      information = information_fixture()
      assert {:error, %Ecto.Changeset{}} = Record.update_information(information, @invalid_attrs)
      assert information == Record.get_information!(information.id)
    end

    test "delete_information/1 deletes the information" do
      information = information_fixture()
      assert {:ok, %Information{}} = Record.delete_information(information)
      assert_raise Ecto.NoResultsError, fn -> Record.get_information!(information.id) end
    end

    test "change_information/1 returns a information changeset" do
      information = information_fixture()
      assert %Ecto.Changeset{} = Record.change_information(information)
    end
  end

  describe "informations" do
    alias TelephoneElixir.Record.Information

    @valid_attrs %{call_id: 42, destination: "some destination", id: 42, source: "some source", timestamp_call: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{call_id: 43, destination: "some updated destination", id: 43, source: "some updated source", timestamp_call: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{call_id: nil, destination: nil, id: nil, source: nil, timestamp_call: nil}

    def information_fixture(attrs \\ %{}) do
      {:ok, information} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Record.create_information()

      information
    end

    test "list_informations/0 returns all informations" do
      information = information_fixture()
      assert Record.list_informations() == [information]
    end

    test "get_information!/1 returns the information with given id" do
      information = information_fixture()
      assert Record.get_information!(information.id) == information
    end

    test "create_information/1 with valid data creates a information" do
      assert {:ok, %Information{} = information} = Record.create_information(@valid_attrs)
      assert information.call_id == 42
      assert information.destination == "some destination"
      assert information.id == 42
      assert information.source == "some source"
      assert information.timestamp_call == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_information/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Record.create_information(@invalid_attrs)
    end

    test "update_information/2 with valid data updates the information" do
      information = information_fixture()
      assert {:ok, information} = Record.update_information(information, @update_attrs)
      assert %Information{} = information
      assert information.call_id == 43
      assert information.destination == "some updated destination"
      assert information.id == 43
      assert information.source == "some updated source"
      assert information.timestamp_call == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_information/2 with invalid data returns error changeset" do
      information = information_fixture()
      assert {:error, %Ecto.Changeset{}} = Record.update_information(information, @invalid_attrs)
      assert information == Record.get_information!(information.id)
    end

    test "delete_information/1 deletes the information" do
      information = information_fixture()
      assert {:ok, %Information{}} = Record.delete_information(information)
      assert_raise Ecto.NoResultsError, fn -> Record.get_information!(information.id) end
    end

    test "change_information/1 returns a information changeset" do
      information = information_fixture()
      assert %Ecto.Changeset{} = Record.change_information(information)
    end
  end
end
