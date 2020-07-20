defmodule Phxapp.Repo.Migrations.CreateFieldList do
	use Ecto.Migration

	def change do
		create table(:field_list) do
			add :index, :integer, null: false
			add :name, :string, null: false
		end
	end
end
