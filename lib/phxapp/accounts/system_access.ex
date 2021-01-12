defmodule Phxapp.Accounts.SystemAccess do
  use Ecto.Schema
  import Ecto.Changeset

  schema "system_access" do
    field :permissions_hash, :binary
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(system_access, attrs) do
    system_access
    |> cast(attrs, [:permissions_hash])
    |> validate_required([:permissions_hash])
  end
end
