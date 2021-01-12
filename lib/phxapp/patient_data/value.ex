defmodule Phxapp.PatientData.Value do
  use Ecto.Schema
  import Ecto.Changeset

  schema "values" do
    field :date, :utc_datetime
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(value, attrs) do
    value
    |> cast(attrs, [:value, :date])
    |> validate_required([:value, :date])
  end
end
