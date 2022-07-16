defmodule LimoniBarber.Repo.Migrations.CreateBarbers do
  use Ecto.Migration

  def change do
    create table(:barbers) do
      add :name, :string
      add :email, :string
      add :description, :string
      add :phone, :string

      timestamps()
    end
  end
end
