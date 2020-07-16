defmodule Phxapp.FieldType do
	use Phxapp.Schema

	schema "fieldtypes" do
		field :name, :string
		field :description
		field :input_type
	end
end