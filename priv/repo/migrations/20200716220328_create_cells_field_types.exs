defmodule Phxapp.Repo.Migrations.CreateCellsFieldTypes do
	use Ecto.Migration

	def change do
		create table(:cells_field_types) do
			add :cell_id, :id, null: false
			add :field_type_id, :id, null: false
		end
	end
end
