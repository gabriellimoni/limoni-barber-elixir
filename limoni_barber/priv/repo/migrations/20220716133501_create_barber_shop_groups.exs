defmodule LimoniBarber.Repo.Migrations.CreateBarberShopGroups do
  use Ecto.Migration

  def change do
    create table(:barber_shop_groups) do
      add :name, :string

      timestamps()
    end
  end
end
