defmodule LimoniBarber.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :name, :string
      add :email, :string
      add :description, :string
      add :phone, :string

      timestamps()
    end
  end
end
