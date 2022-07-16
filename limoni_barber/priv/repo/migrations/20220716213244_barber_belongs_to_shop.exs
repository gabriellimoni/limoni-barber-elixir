defmodule LimoniBarber.Repo.Migrations.BarberBelongsToShop do
  use Ecto.Migration

  def change do
    alter table(:barbers) do
      add :barber_shop_id, references(:barber_shops), null: true
    end
  end
end
