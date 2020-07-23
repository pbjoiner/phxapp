defmodule Phxapp.Repo.Migrations.CreateFieldList do
	use Ecto.Migration

	def change do
		create table(:field_list) do
			add :index, :integer, null: false
			add :name, :string, null: false
			add :patient_id, :id, null: false
		end
	end
end
