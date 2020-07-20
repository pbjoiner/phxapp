defmodule Phxapp.Repo.Migrations.CreateFieldTypes do
	use Ecto.Migration

	def change do
		create table(:field_types) do
			add :name, :string, null: false
			add :label, :string
			add :description, :string
			add :input_type, :string, null: false
		end

		create unique_index(:field_types, [:name])
	end
end
