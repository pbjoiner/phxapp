defmodule Phxapp.FieldType do
	use Phxapp.Schema

	schema "fieldtypes" do
		field :name, :string
		field :description, :string
		field :input_type, :string
	end
end