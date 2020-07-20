defmodule Phxapp.Repo.Migrations.CreateRows do
	use Ecto.Migration

	def change do
		create table(:rows) do
#			add :id, :id, autogenerate: true
			timestamps()
		end
	end
end
