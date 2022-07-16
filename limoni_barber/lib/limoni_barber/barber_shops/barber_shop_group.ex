defmodule LimoniBarber.BarberShops.BarberShopGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "barber_shop_groups" do
    field :name, :string

    has_many :barber_shops, LimoniBarber.BarberShops.BarberShop

    timestamps()
  end

  @doc false
  def changeset(barber_shop_group, attrs) do
    barber_shop_group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
