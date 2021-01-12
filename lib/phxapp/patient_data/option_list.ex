defmodule Phxapp.PatientData.OptionList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "option_lists" do
    field :field_type_id, :id
    field :option_id, :id

    timestamps()
  end

  @doc false
  def changeset(option_list, attrs) do
    option_list
    |> cast(attrs, [])
    |> validate_required([])
  end
end
