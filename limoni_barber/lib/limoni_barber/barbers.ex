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
    Repo.all(Barber) |> Repo.preload(:barber_shop)
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
  def get_barber!(id), do: Repo.get!(Barber, id) |> Repo.preload(:barber_shop)

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

  alias LimoniBarber.Barbers.BarberJob

  @doc """
  Returns the list of barber_jobs.

  ## Examples

      iex> list_barber_jobs()
      [%BarberJob{}, ...]

  """
  def list_barber_jobs do
    Repo.all(BarberJob) |> Repo.preload(:barber)
  end

  @doc """
  Gets a single barber_job.

  Raises `Ecto.NoResultsError` if the Barber job does not exist.

  ## Examples

      iex> get_barber_job!(123)
      %BarberJob{}

      iex> get_barber_job!(456)
      ** (Ecto.NoResultsError)

  """
  def get_barber_job!(id), do: Repo.get!(BarberJob, id) |> Repo.preload(:barber)

  @doc """
  Creates a barber_job.

  ## Examples

      iex> create_barber_job(%{field: value})
      {:ok, %BarberJob{}}

      iex> create_barber_job(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_barber_job(attrs \\ %{}) do
    %BarberJob{}
    |> BarberJob.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a barber_job.

  ## Examples

      iex> update_barber_job(barber_job, %{field: new_value})
      {:ok, %BarberJob{}}

      iex> update_barber_job(barber_job, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_barber_job(%BarberJob{} = barber_job, attrs) do
    barber_job
    |> BarberJob.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a barber_job.

  ## Examples

      iex> delete_barber_job(barber_job)
      {:ok, %BarberJob{}}

      iex> delete_barber_job(barber_job)
      {:error, %Ecto.Changeset{}}

  """
  def delete_barber_job(%BarberJob{} = barber_job) do
    Repo.delete(barber_job)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking barber_job changes.

  ## Examples

      iex> change_barber_job(barber_job)
      %Ecto.Changeset{data: %BarberJob{}}

  """
  def change_barber_job(%BarberJob{} = barber_job, attrs \\ %{}) do
    BarberJob.changeset(barber_job, attrs)
  end
end
