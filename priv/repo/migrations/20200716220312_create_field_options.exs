defmodule Phxapp.Repo.Migrations.CreateFieldOptions do
  use Ecto.Migration

  def change do
    create table(:field_options) do
      add :label, :string, null: false
      add :value, :string, null: false
      add :field_type_id, :id, null: false
    end
  end

end
