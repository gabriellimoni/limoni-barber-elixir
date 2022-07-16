defmodule LimoniBarber.BarberShopsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LimoniBarber.BarberShops` context.
  """

  @doc """
  Generate a barber_shop_group.
  """
  def barber_shop_group_fixture(attrs \\ %{}) do
    {:ok, barber_shop_group} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> LimoniBarber.BarberShops.create_barber_shop_group()

    barber_shop_group
  end

  @doc """
  Generate a barber_shop.
  """
  def barber_shop_fixture(attrs \\ %{}) do
    {:ok, barber_shop} =
      attrs
      |> Enum.into(%{
        c: "some c",
        city: "some city",
        compĺement: "some compĺement",
        country: "some country",
        name: "some name",
        number: "some number",
        state: "some state",
        street: "some street"
      })
      |> LimoniBarber.BarberShops.create_barber_shop()

    barber_shop
  end
end
