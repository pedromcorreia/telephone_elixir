defmodule TelephoneElixirWeb.InformationController do
  use TelephoneElixirWeb, :controller

  alias TelephoneElixir.Record
  alias TelephoneElixir.Record.Information

  def index(conn, _params) do
    informations = Record.list_informations()
    render(conn, "index.html", informations: informations)
  end

  def new(conn, _params) do
    changeset = Record.change_information(%Information{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"information" => information_params}) do
    case Record.create_information(information_params) do
      {:ok, information} ->
        conn
        |> put_flash(:info, "Information created successfully.")
        |> redirect(to: information_path(conn, :show, information))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    information = Record.get_information!(id)
    render(conn, "show.html", information: information)
  end

  def edit(conn, %{"id" => id}) do
    information = Record.get_information!(id)
    changeset = Record.change_information(information)
    render(conn, "edit.html", information: information, changeset: changeset)
  end

  def update(conn, %{"id" => id, "information" => information_params}) do
    information = Record.get_information!(id)

    case Record.update_information(information, information_params) do
      {:ok, information} ->
        conn
        |> put_flash(:info, "Information updated successfully.")
        |> redirect(to: information_path(conn, :show, information))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", information: information, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    information = Record.get_information!(id)
    {:ok, _information} = Record.delete_information(information)

    conn
    |> put_flash(:info, "Information deleted successfully.")
    |> redirect(to: information_path(conn, :index))
  end
end
