defmodule Phxapp.Repo.Migrations.CreateCells do
	use Ecto.Migration

	def change do
		create table(:cells) do
			add :data, :string
			add :field_name, :string, null: false
			add :row_id, :id, null: false
		end
	end
end
