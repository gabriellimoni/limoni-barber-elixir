defmodule LimoniBarber.Barbers.Barber do
  use Ecto.Schema
  import Ecto.Changeset

  schema "barbers" do
    field :description, :string
    field :email, :string
    field :name, :string
    field :phone, :string

    belongs_to :barber_shop, LimoniBarber.BarberShops.BarberShop
    has_many :barber_jobs, LimoniBarber.Barbers.BarberJob

    timestamps()
  end

  @doc false
  def changeset(barber, attrs) do
    barber
    |> cast(attrs, [:name, :email, :description, :phone, :barber_shop_id])
    |> validate_required([:name, :email, :description, :phone])
  end
end
