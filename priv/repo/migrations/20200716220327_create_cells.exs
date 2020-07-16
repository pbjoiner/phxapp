defmodule Phxapp.Repo.Migrations.CreateCells do
  use Ecto.Migration

  def change do
    add :data, :string
    belongs_to :row, Row

    many_to_many(:field_type, Phxapp.FieldType, join_through: "cell_field_type")
  end
end
