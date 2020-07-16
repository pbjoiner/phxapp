defmodule Phxapp.FieldList do
	use Phxapp.Schema

	schema "fieldlist" do
		field :index, :integer
		field :name, :string
		belongs_to :patient, Phxapp.Patient
	end
end