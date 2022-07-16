defmodule LimoniBarber.AttendancesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LimoniBarber.Attendances` context.
  """

  @doc """
  Generate a patient.
  """
  def patient_fixture(attrs \\ %{}) do
    {:ok, patient} =
      attrs
      |> Enum.into(%{
        description: "some description",
        email: "some email",
        name: "some name",
        phone: "some phone"
      })
      |> LimoniBarber.Attendances.create_patient()

    patient
  end
end
