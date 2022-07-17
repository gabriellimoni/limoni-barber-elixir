defmodule LimoniBarber.Repo.Migrations.CreateAttendances do
  use Ecto.Migration

  def change do
    create table(:attendances) do
      add :status, :string
      add :schedule, :utc_datetime
      add :finished_at, :utc_datetime
      add :canceled_at, :utc_datetime

      timestamps()
    end
  end
end
