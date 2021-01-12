defmodule Phxapp.Repo.Migrations.CreateSystemAccess do
  use Ecto.Migration

  def change do
    create table(:system_access) do
      add :permissions_hash, :binary
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:system_access, [:user_id])
  end
end
