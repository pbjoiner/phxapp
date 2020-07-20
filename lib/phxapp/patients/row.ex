defmodule Phxapp.Row do
	use Phxapp.Schema

	schema "rows" do
		timestamps()
		belongs_to :patient, Phxapp.Patient
		has_many :cells, Phxapp.Cell
		many_to_many(:field_list, Phxapp.FieldList, join_through: "row_field_list")
	end
end