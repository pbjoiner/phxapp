defmodule Phxapp.Repo.Migrations.CreateOptionLists do
  use Ecto.Migration

  def change do
    create table(:option_lists) do
      add :field_type_id, references(:field_types, on_delete: :nothing)
      add :option_id, references(:options, on_delete: :nothing)

      timestamps()
    end

    create index(:option_lists, [:field_type_id])
    create index(:option_lists, [:option_id])
  end
end
