defmodule Phxapp.Row do
	use Phxapp.Schema

	schema "rows" do
		timestamps()
		belongs_to :patient, Phxapp.Patient
		has_many :cells, Phxapp.Cell
	end
end