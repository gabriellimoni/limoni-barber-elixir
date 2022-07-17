defmodule LimoniBarber.Attendances.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :description, :string
    field :email, :string
    field :name, :string
    field :phone, :string

    has_many :attendances, LimoniBarber.Attendances.Attendance

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:name, :email, :description, :phone])
    |> validate_required([:name, :email, :description, :phone])
  end
end
