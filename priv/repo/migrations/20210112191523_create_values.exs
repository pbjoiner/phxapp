defmodule Phxapp.Repo.Migrations.CreateValues do
  use Ecto.Migration

  def change do
    create table(:values) do
      add :value, :string
      add :date, :utc_datetime

      timestamps()
    end

  end
end
