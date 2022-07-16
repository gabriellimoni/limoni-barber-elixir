defmodule LimoniBarber.Barbers.BarberJob do
  use Ecto.Schema
  import Ecto.Changeset

  schema "barber_jobs" do
    field :description, :string
    field :name, :string
    field :price_in_cents, :integer

    belongs_to :barber, LimoniBarber.Barbers.Barber

    timestamps()
  end

  @doc false
  def changeset(barber_job, attrs) do
    barber_job
    |> cast(attrs, [:name, :description, :price_in_cents, :barber_id])
    |> validate_required([:name, :description, :price_in_cents, :barber_id])
  end
end
