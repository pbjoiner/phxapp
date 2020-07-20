defmodule Phxapp.FieldList do
	use Phxapp.Schema

	schema "fieldlist" do
		field :index, :integer
		field :name, :string
		belongs_to :patient, Phxapp.Patient
		many_to_many(:field_type, Phxapp.FieldType, join_through: "field_list_field_type")
	end
end