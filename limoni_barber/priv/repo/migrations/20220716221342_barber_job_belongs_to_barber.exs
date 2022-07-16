defmodule LimoniBarber.Repo.Migrations.BarberJobBelongsToBarber do
  use Ecto.Migration

  def change do
    alter table(:barber_jobs) do
      add :barber_id, references(:barbers), null: false
    end
  end
end
