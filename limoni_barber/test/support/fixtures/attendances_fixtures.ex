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

  @doc """
  Generate a attendance.
  """
  def attendance_fixture(attrs \\ %{}) do
    {:ok, attendance} =
      attrs
      |> Enum.into(%{
        canceled_at: ~U[2022-07-15 22:28:00Z],
        finished_at: ~U[2022-07-15 22:28:00Z],
        schedule: ~U[2022-07-15 22:28:00Z],
        status: :scheduled
      })
      |> LimoniBarber.Attendances.create_attendance()

    attendance
  end
end
