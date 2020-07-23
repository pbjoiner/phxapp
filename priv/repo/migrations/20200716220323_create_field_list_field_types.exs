defmodule Phxapp.Repo.Migrations.CreateFieldListFieldTypes do
	use Ecto.Migration

	def change do
		create table(:field_list_field_types) do
			add :field_list_id, :id, null: false
			add :field_type_id, :id, null: false
		end
	end
end
