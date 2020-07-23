defmodule Phxapp.FieldTypes.FieldOptions.FieldOption do
	use Phxapp.Schema
	import Ecto.Changeset

	schema "field_options" do
		field :label, :string
		field :value, :string
		belongs_to :field_type,
					  Phxapp.FieldTypes.FieldType,
					  references: :id,
					  foreign_key: :field_type_id
	end

	@doc """
	  casts a collection as a changeset,
	  validates required fields
	"""
	def changeset(field_option, attrs) do
		field_option
		|> cast(attrs, [:label, :value])
		|> cast_assoc(:field_type)
		|> validate_required([:label, :value])
	end
end
