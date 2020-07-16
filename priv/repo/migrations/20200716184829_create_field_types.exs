defmodule Phxapp.Repo.Migrations.CreateFieldTypes do
  use Ecto.Migration

  def change do
    add :name, :string, null: false
    add :description, :string
    add :input_type, :string, null: false
    belongs_to :field_list, Phxapp.FieldList
    belongs_to :patient, Phxapp.Patient
  end
end
