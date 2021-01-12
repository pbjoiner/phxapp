defmodule Phxapp.Value do
  use Ecto.Schema
  import Ecto.Changeset

  schema "values" do
    field :value_hash, :binary

    timestamps()
  end

  @doc false
  def changeset(value, attrs) do
    value
    |> cast(attrs, [:value_hash])
    |> validate_required([:value_hash])
  end
end
