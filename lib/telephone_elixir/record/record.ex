defmodule TelephoneElixir.Record do
  @moduledoc """
  The Record context.
  """

  import Ecto.Query, warn: false
  alias TelephoneElixir.Repo

  alias TelephoneElixir.Record.Information

  @doc """
  Returns the list of informations.

  ## Examples

      iex> list_informations()
      [%Information{}, ...]

  """
  def list_informations do
    Repo.all(Information)
  end

  @doc """
  Gets a single information.

  Raises `Ecto.NoResultsError` if the Information does not exist.

  ## Examples

      iex> get_information!(123)
      %Information{}

      iex> get_information!(456)
      ** (Ecto.NoResultsError)

  """
  def get_information_by_call_id(id), do: Repo.get_by(Information, call_id: id)

  @doc """
  Creates a information.

  ## Examples

      iex> create_information(%{field: value})
      {:ok, %Information{}}

      iex> create_information(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_information(attrs \\ %{}) do
    %Information{}
    |> Information.changeset_start(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a information.

  ## Examples

      iex> update_information(information, %{field: new_value})
      {:ok, %Information{}}

      iex> update_information(information, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_information(%Information{} = information, attrs) do
    information
    |> Information.changeset_end(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Information.

  ## Examples

      iex> delete_information(information)
      {:ok, %Information{}}

      iex> delete_information(information)
      {:error, %Ecto.Changeset{}}

  """
  def delete_information(%Information{} = information) do
    Repo.delete(information)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking information changes.

  ## Examples

      iex> change_information(information)
      %Ecto.Changeset{source: %Information{}}

  """
  def change_information(%Information{} = information) do
    Information.changeset(information, %{})
  end
end
