defmodule LimoniBarber.Repo.Migrations.BarberShopBelongsToGroup do
  use Ecto.Migration

  def change do
    alter table(:barber_shops) do
      add :barber_shop_group_id, references(:barber_shop_groups), null: false
    end
  end
end
