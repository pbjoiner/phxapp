defmodule Phxapp.Cell do
	use Phxapp.Schema

	schema "cells" do
		field :data, :string
		belongs_to :row, Phxapp.Row
	end
end