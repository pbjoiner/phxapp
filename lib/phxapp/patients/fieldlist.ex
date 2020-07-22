defmodule Phxapp.FieldList do
	use Phxapp.Schema

	schema "field_list" do
		field :index, :integer
		field :name, :string
		belongs_to :patient, Phxapp.Patient
		many_to_many(:field_types, Phxapp.FieldTypes.FieldType, join_through: "field_list_field_types")
	end
end