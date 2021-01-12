defmodule Phxapp.Repo.Migrations.CreatePatientAccess do
  use Ecto.Migration

  def change do
    create table(:patient_access) do
      add :user_id, references(:users, on_delete: :nothing)
      add :patient_id, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:patient_access, [:user_id])
    create index(:patient_access, [:patient_id])
  end
end
