defmodule LimoniBarber.Repo.Migrations.CreateBarberJobs do
  use Ecto.Migration

  def change do
    create table(:barber_jobs) do
      add :name, :string
      add :description, :string
      add :price_in_cents, :integer

      timestamps()
    end
  end
end
