defmodule Phxapp.Repo do
  use Ecto.Repo,
    otp_app: :phxapp,
    adapter: Ecto.Adapters.Postgres
end
