defmodule Phxapp.Cell do
	use Phxapp.Schema

	schema "cells" do
		field :data, :string
		belongs_to :row, Phxapp.Row
		many_to_many(:field_type, Phxapp.FieldType, join_through: "cells_field_type")
	end
end