defmodule Phxapp.FieldType do
	use Phxapp.Schema

	schema "field_types" do
		field :name, :string
		field :label, :string
		field :description, :string
		field :input_type, :string
		has_many :field_options, Phxapp.FieldOption
	end

	def changeset(struct, params) do
		struct
		|> cast(params, [:name, :label, :description, :input_type])
		|> validate_required([:name, :input_type])
	end

	@input_types [
		"button",
		"checkbox",
		"date",
		"number",
		"password",
		"radio",
		"range",
		"text",
		"time"
	]

	def validate_input_type(changeset) do
		inputtype = get_field(changeset, :input_type)

		if inputtype in @input_types do
			changeset
		else
			add_error(changeset, :input_type, "is not an HTML input field type.")
		end
	end
end