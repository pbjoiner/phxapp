defmodule Phxapp.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string, null: false
      add :birthdate, :date
      add :genderaab, :string, null: false
      add :gender, :string, null: false
      add :blood_type, :string
      has_many :rows, Phxapp.Rows
      has_many :field_list_entries, Phxapp.FieldList
    end

    create index(:patient, [:last_name, :first_name, :birthdate])
  end
end
