defmodule Phxapp.Accounts.PatientAccess do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patient_access" do
    field :user_id, :id
    field :patient_id, :id

    timestamps()
  end

  @doc false
  def changeset(patient_access, attrs) do
    patient_access
    |> cast(attrs, [])
    |> validate_required([])
  end
end
