defmodule Phxapp.Repo.Migrations.CreateRows do
  use Ecto.Migration

  def change do
    add :id, :id, autogenerate: true
    timestamps()
    belongs_to :patient, Patient
    has_many :cells, Cell
  end
end
