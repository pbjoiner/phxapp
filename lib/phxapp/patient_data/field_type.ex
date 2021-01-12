defmodule Phxapp.PatientData.FieldType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "field_types" do
    field :description, :string
    field :input_type, :string
    field :label, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(field_type, attrs) do
    field_type
    |> cast(attrs, [:name, :label, :description, :input_type])
    |> validate_required([:name, :label, :description, :input_type])
    |> validate_subset(:input_type, ["decimal", "integer", "bloodPressure"])
  end
end
