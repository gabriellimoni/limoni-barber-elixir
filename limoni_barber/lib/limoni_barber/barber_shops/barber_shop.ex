defmodule LimoniBarber.BarberShops.BarberShop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "barber_shops" do
    field :city, :string
    field :compĺement, :string
    field :country, :string
    field :name, :string
    field :number, :string
    field :state, :string
    field :street, :string

    belongs_to :barber_shop_group, LimoniBarber.BarberShops.BarberShopGroup

    timestamps()
  end

  @doc false
  def changeset(barber_shop, attrs) do
    barber_shop
    |> cast(attrs, [:name, :country, :city, :state, :street, :number, :compĺement, :barber_shop_group_id])
    |> validate_required([:name, :country, :city, :state, :street, :number, :compĺement, :barber_shop_group_id])
  end
end
