defmodule Phxapp.Repo.Migrations.CreateRows do
  use Ecto.Migration

  def change do
    add :id, :id, autogenerate: true
    timestamps()
    belongs_to :patient, Phxapp.Patient
    has_many :cells, Phxapp.Cell

    many_to_many(:field_list, Phxapp.Field_List, join_through: "row_field_list")
  end
end
