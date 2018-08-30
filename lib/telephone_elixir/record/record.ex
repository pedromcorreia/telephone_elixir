defmodule TelephoneElixir.Record do
  @moduledoc """
  The Record context.
  """

  import Ecto.Query, warn: false
  alias TelephoneElixir.Repo

  alias TelephoneElixir.Record.Information

  @doc false
  def list_informations do
    Repo.all(Information)
  end

  @doc false
  def get_information_by_call_id(id), do: Repo.get_by(Information, call_id: id)

  @doc false
  def create_information(attrs \\ %{}) do
    %Information{}
    |> Information.changeset_start(attrs)
    |> Repo.insert()
  end

  @doc false
   def update_information(%Information{} = information, attrs) do
    information
    |> Information.changeset_end(attrs)
    |> Repo.update()
  end

  def change_information(%Information{} = information) do
    Information.changeset(information, %{})
  end

  alias TelephoneElixir.Record.Bill

  @doc false
   def list_bill_by_source_reference_date(source, reference_time \\ Timex.now()) do
     Bill
     |> where(source: ^source, reference_time: ^reference_time)
     |> Repo.all()
  end

  @doc """
  Returns the list of bill.

  ## Examples

      iex> list_bill()
      [%Bill{}, ...]

  """
  def list_bill do
    Repo.all(Bill)
  end

  @doc """
  Gets a single bill.

  Raises `Ecto.NoResultsError` if the Bill does not exist.

  ## Examples

      iex> get_bill!(123)
      %Bill{}

      iex> get_bill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bill!(id), do: Repo.get!(Bill, id)

  @doc """
  Creates a bill.

  ## Examples

      iex> create_bill(%{field: value})
      {:ok, %Bill{}}

      iex> create_bill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bill(attrs \\ %{}) do
    %Bill{}
    |> Bill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bill.

  ## Examples

      iex> update_bill(bill, %{field: new_value})
      {:ok, %Bill{}}

      iex> update_bill(bill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bill(%Bill{} = bill, attrs) do
    bill
    |> Bill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bill.

  ## Examples

      iex> delete_bill(bill)
      {:ok, %Bill{}}

      iex> delete_bill(bill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bill(%Bill{} = bill) do
    Repo.delete(bill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bill changes.

  ## Examples

      iex> change_bill(bill)
      %Ecto.Changeset{source: %Bill{}}

  """
  def change_bill(%Bill{} = bill) do
    Bill.changeset(bill, %{})
  end
end
