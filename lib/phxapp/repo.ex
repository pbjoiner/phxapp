defmodule Phxapp.Repo do
  use Ecto.Repo,
    otp_app: :phxapp,
    adapter: Ecto.Adapters.Postgres
end

defmodule Phxapp.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset
      @primary_key {:id, :id, autogenerate: true}
      @foreign_key_type :id
    end
  end
end
