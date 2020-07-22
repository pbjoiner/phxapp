defmodule Phxapp.FieldOption do
	use Phxapp.Schema

	schema "field_options" do
		field :name, :string
		field :value, :string
		belongs_to :field_type, Phxapp.FieldTypes.FieldType
	end
end