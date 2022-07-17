defmodule LimoniBarber.Repo.Migrations.AttendanceRelations do
  use Ecto.Migration

  def change do
    alter table(:attendances) do
      add :barber_shop_id, references(:barber_shops), null: false
      add :barber_job_id, references(:barber_jobs), null: false
      add :patient_id, references(:patients), null: false
    end
  end
end
