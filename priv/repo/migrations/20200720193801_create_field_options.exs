defmodule Phxapp.Repo.Migrations.CreateFieldOptions do
  use Ecto.Migration

  def change do
    create table(:field_options) do
      add :label, :string
      add :value, :string
    end
  end

end
