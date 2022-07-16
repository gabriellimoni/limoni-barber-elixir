defmodule LimoniBarber.Barbers do
  @moduledoc """
  The Barbers context.
  """

  import Ecto.Query, warn: false
  alias LimoniBarber.Repo

  alias LimoniBarber.Barbers.Barber

  @doc """
  Returns the list of barbers.

  ## Examples

      iex> list_barbers()
      [%Barber{}, ...]

  """
  def list_barbers do
    Repo.all(Barber)
  end

  @doc """
  Gets a single barber.

  Raises `Ecto.NoResultsError` if the Barber does not exist.

  ## Examples

      iex> get_barber!(123)
      %Barber{}

      iex> get_barber!(456)
      ** (Ecto.NoResultsError)

  """
  def get_barber!(id), do: Repo.get!(Barber, id)

  @doc """
  Creates a barber.

  ## Examples

      iex> create_barber(%{field: value})
      {:ok, %Barber{}}

      iex> create_barber(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_barber(attrs \\ %{}) do
    %Barber{}
    |> Barber.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a barber.

  ## Examples

      iex> update_barber(barber, %{field: new_value})
      {:ok, %Barber{}}

      iex> update_barber(barber, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_barber(%Barber{} = barber, attrs) do
    barber
    |> Barber.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a barber.

  ## Examples

      iex> delete_barber(barber)
      {:ok, %Barber{}}

      iex> delete_barber(barber)
      {:error, %Ecto.Changeset{}}

  """
  def delete_barber(%Barber{} = barber) do
    Repo.delete(barber)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking barber changes.

  ## Examples

      iex> change_barber(barber)
      %Ecto.Changeset{data: %Barber{}}

  """
  def change_barber(%Barber{} = barber, attrs \\ %{}) do
    Barber.changeset(barber, attrs)
  end
end
