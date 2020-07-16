defmodule Phxapp.Repo.Migrations.CreateFieldList do
  use Ecto.Migration

  def change do
    add :index, :integer, null: false
    add :name, :string, null: false
    belongs_to :patient, Phxapp.Patient

    many_to_many(:field_type, Phxapp.FieldType, join_through: "field_list_field_type")
  end
end
