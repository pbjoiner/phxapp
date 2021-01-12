defmodule Phxapp.Repo.Migrations.CreateOptions do
  use Ecto.Migration

  def change do
    create table(:options) do
      add :label, :string
      add :value, :string

      timestamps()
    end

  end
end
