defmodule Phxapp.Patient do
	use Phxapp.Schema

	schema "patients" do
		field :first_name, :string
		field :last_name, :string
		field :birthdate, :date
		field :genderaab, :string
		field :gender, :string
		field :blood_type, :string
		has_many :rows, Phxapp.Row
		many_to_many(:field_types, Phxapp.FieldTypes.FieldType, join_through: "patients_field_types")
	end
end