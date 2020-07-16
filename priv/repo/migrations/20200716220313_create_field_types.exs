defmodule Phxapp.Repo.Migrations.CreateFieldTypes do
  use Ecto.Migration

  def change do
    add :name, :string, null: false
    add :description, :string
    add :input_type, :string, null: false
  end
end
