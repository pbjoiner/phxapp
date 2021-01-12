defmodule Phxapp.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :birth_date, :date
      add :ssn4, :string

      timestamps()
    end

    create unique_index(:patients, [:last_name, :first_name, :birth_date], name: :unique_patients)

  end
end
