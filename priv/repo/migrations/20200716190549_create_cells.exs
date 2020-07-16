defmodule Phxapp.Repo.Migrations.CreateCells do
  use Ecto.Migration

  def change do
    add :data, :string
    belongs_to :row, Row
    has :field_list_entry, Phxapp.FieldList
  end
end
