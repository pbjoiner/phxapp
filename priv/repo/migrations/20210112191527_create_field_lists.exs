defmodule Phxapp.Repo.Migrations.CreateFieldLists do
  use Ecto.Migration

  def change do
    create table(:field_lists) do
      add :name, :string
      add :input_type, :string
      add :patient_id, references(:patients, on_delete: :nothing)
      add :field_type_id, references(:field_types, on_delete: :nothing)
      add :value_id, references(:values, on_delete: :nothing)

      timestamps()
    end

    create index(:field_lists, [:patient_id])
    create index(:field_lists, [:field_type_id])
    create index(:field_lists, [:value_id])
  end
end
