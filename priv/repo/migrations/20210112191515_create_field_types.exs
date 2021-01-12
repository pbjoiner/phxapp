defmodule Phxapp.Repo.Migrations.CreateFieldTypes do
  use Ecto.Migration

  def change do
    create table(:field_types) do
      add :name, :string
      add :label, :string
      add :description, :string
      add :input_type, :string

      timestamps()
    end

  end
end
