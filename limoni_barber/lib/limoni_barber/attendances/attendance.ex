defmodule LimoniBarber.Attendances.Attendance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attendances" do
    field :canceled_at, :utc_datetime
    field :finished_at, :utc_datetime
    field :schedule, :utc_datetime
    field :status, Ecto.Enum, values: [:scheduled, :canceled, :finished], default: :scheduled

    belongs_to :barber_shop, LimoniBarber.BarberShops.BarberShop
    belongs_to :barber_job, LimoniBarber.Barbers.BarberJob
    belongs_to :patient, LimoniBarber.Attendances.Patient

    timestamps()
  end

  @doc false
  def changeset(attendance, attrs) do
    attendance
    |> cast(attrs, [:status, :schedule, :finished_at, :canceled_at, :barber_shop_id, :barber_job_id, :patient_id])
    |> validate_required([:status, :schedule, :finished_at, :canceled_at, :barber_shop_id, :barber_job_id, :patient_id])
  end
end
