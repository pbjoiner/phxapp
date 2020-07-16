defmodule Phxapp.Repo.Migrations.CreateFieldList do
  use Ecto.Migration

  def change do
    add :index, :integer, null: false
    add :name, :string, null: false
    has :field_type, FieldType
    belongs_to :patient, Patient
  end
end
