defmodule LimoniBarber.BarbersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LimoniBarber.Barbers` context.
  """

  @doc """
  Generate a barber.
  """
  def barber_fixture(attrs \\ %{}) do
    {:ok, barber} =
      attrs
      |> Enum.into(%{
        description: "some description",
        email: "some email",
        name: "some name",
        phone: "some phone"
      })
      |> LimoniBarber.Barbers.create_barber()

    barber
  end
end
