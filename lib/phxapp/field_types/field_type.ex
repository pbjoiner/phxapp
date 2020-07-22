defmodule Phxapp.FieldTypes.FieldType do
  use Phxapp.Schema
  import Ecto.Changeset

  schema "field_types" do
    field :description, :string
    field :input_type, :string
    field :label, :string
    field :name, :string
  end

  @doc """
    casts a collection as a changeset,
    validates required fields,
    validates input type valuees
  """
  def changeset(field_type, attrs) do
    field_type
    |> cast(attrs, [:name, :label, :description, :input_type])
    |> validate_required([:name, :input_type])
    |> validate_input_type()
  end

  @input_types [
    "button",
    "checkbox",
    "date",
    "decimal",
    "number",
    "password",
    "radio",
    "range",
    "splittext",
    "splitnumber",
    "text",
    "time"
  ]

  def validate_input_type(changeset) do
    inputtype = get_field(changeset, :input_type)

    if inputtype in @input_types do
      changeset
    else
      add_error(changeset, :input_type, "is not an HTML input field type.")
    end
  end
end
