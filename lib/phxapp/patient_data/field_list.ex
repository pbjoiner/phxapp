defmodule Phxapp.PatientData.FieldList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "field_lists" do
    field :input_type, :string
    field :name, :string
    field :patient_id, :id
    field :field_type_id, :id
    field :value_id, :id

    timestamps()
  end

  @doc false
  def changeset(field_list, attrs) do
    field_list
    |> cast(attrs, [:name, :input_type])
    |> validate_required([:name, :input_type])
  end
end
