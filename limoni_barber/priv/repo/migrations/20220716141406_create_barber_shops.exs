defmodule LimoniBarber.Repo.Migrations.CreateBarberShops do
  use Ecto.Migration

  def change do
    create table(:barber_shops) do
      add :name, :string
      add :country, :string
      add :city, :string
      add :state, :string
      add :street, :string
      add :number, :string
      add :compĺement, :string

      timestamps()
    end
  end
end
