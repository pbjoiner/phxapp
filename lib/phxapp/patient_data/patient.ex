defmodule Phxapp.PatientData.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :birth_date, :date
    field :first_name, :string
    field :last_name, :string
    field :ssn4, :string

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:first_name, :last_name, :birth_date, :ssn4])
    |> validate_required([:first_name, :last_name, :birth_date, :ssn4])
    |> unique_constraint(:only_unique_patients, name: :unique_patients)
  end
end
