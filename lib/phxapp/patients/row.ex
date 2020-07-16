defmodule Phxapp.Row do
	use Phxapp.Schema

	schema "rows" do
		# rows is a linking table with nothing more than an ID field provided by Phxapp.Schema
		timestamps()
	end
end