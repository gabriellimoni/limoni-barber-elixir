defmodule LimoniBarber.BarberShops do
  @moduledoc """
  The BarberShops context.
  """

  import Ecto.Query, warn: false
  alias LimoniBarber.Repo

  alias LimoniBarber.BarberShops.BarberShopGroup

  @doc """
  Returns the list of barber_shop_groups.

  ## Examples

      iex> list_barber_shop_groups()
      [%BarberShopGroup{}, ...]

  """
  def list_barber_shop_groups do
    Repo.all(BarberShopGroup)
  end

  @doc """
  Gets a single barber_shop_group.

  Raises `Ecto.NoResultsError` if the Barber shop group does not exist.

  ## Examples

      iex> get_barber_shop_group!(123)
      %BarberShopGroup{}

      iex> get_barber_shop_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_barber_shop_group!(id), do: Repo.get!(BarberShopGroup, id)

  @doc """
  Creates a barber_shop_group.

  ## Examples

      iex> create_barber_shop_group(%{field: value})
      {:ok, %BarberShopGroup{}}

      iex> create_barber_shop_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_barber_shop_group(attrs \\ %{}) do
    %BarberShopGroup{}
    |> BarberShopGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a barber_shop_group.

  ## Examples

      iex> update_barber_shop_group(barber_shop_group, %{field: new_value})
      {:ok, %BarberShopGroup{}}

      iex> update_barber_shop_group(barber_shop_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_barber_shop_group(%BarberShopGroup{} = barber_shop_group, attrs) do
    barber_shop_group
    |> BarberShopGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a barber_shop_group.

  ## Examples

      iex> delete_barber_shop_group(barber_shop_group)
      {:ok, %BarberShopGroup{}}

      iex> delete_barber_shop_group(barber_shop_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_barber_shop_group(%BarberShopGroup{} = barber_shop_group) do
    Repo.delete(barber_shop_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking barber_shop_group changes.

  ## Examples

      iex> change_barber_shop_group(barber_shop_group)
      %Ecto.Changeset{data: %BarberShopGroup{}}

  """
  def change_barber_shop_group(%BarberShopGroup{} = barber_shop_group, attrs \\ %{}) do
    BarberShopGroup.changeset(barber_shop_group, attrs)
  end

  alias LimoniBarber.BarberShops.BarberShop

  @doc """
  Returns the list of barber_shops.

  ## Examples

      iex> list_barber_shops()
      [%BarberShop{}, ...]

  """
  def list_barber_shops do
    Repo.all(BarberShop) |> Repo.preload(:barber_shop_group)
  end

  @doc """
  Gets a single barber_shop.

  Raises `Ecto.NoResultsError` if the Barber shop does not exist.

  ## Examples

      iex> get_barber_shop!(123)
      %BarberShop{}

      iex> get_barber_shop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_barber_shop!(id), do: Repo.get!(BarberShop, id) |> Repo.preload(:barber_shop_group)

  @doc """
  Creates a barber_shop.

  ## Examples

      iex> create_barber_shop(%{field: value})
      {:ok, %BarberShop{}}

      iex> create_barber_shop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_barber_shop(attrs \\ %{}) do
    %BarberShop{}
    |> BarberShop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a barber_shop.

  ## Examples

      iex> update_barber_shop(barber_shop, %{field: new_value})
      {:ok, %BarberShop{}}

      iex> update_barber_shop(barber_shop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_barber_shop(%BarberShop{} = barber_shop, attrs) do
    barber_shop
    |> BarberShop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a barber_shop.

  ## Examples

      iex> delete_barber_shop(barber_shop)
      {:ok, %BarberShop{}}

      iex> delete_barber_shop(barber_shop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_barber_shop(%BarberShop{} = barber_shop) do
    Repo.delete(barber_shop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking barber_shop changes.

  ## Examples

      iex> change_barber_shop(barber_shop)
      %Ecto.Changeset{data: %BarberShop{}}

  """
  def change_barber_shop(%BarberShop{} = barber_shop, attrs \\ %{}) do
    BarberShop.changeset(barber_shop, attrs)
  end
end
