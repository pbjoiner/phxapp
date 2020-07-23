defmodule Phxapp.Repo.Migrations.CreateRows do
	use Ecto.Migration

	def change do
		create table(:rows) do
			add :patient_id, :id, null: false
			timestamps()
		end
	end
end
