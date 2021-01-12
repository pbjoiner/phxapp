defmodule Phxapp.PatientData.Option do
  use Ecto.Schema
  import Ecto.Changeset

  schema "options" do
    field :label, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(option, attrs) do
    option
    |> cast(attrs, [:label, :value])
    |> validate_required([:label, :value])
  end
end
