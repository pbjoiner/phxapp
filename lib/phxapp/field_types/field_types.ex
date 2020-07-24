defmodule Phxapp.FieldTypes do
	@moduledoc """
	The FieldTypes context.
	"""

	import Ecto.Query, warn: false
	alias Phxapp.Repo

	alias Phxapp.FieldTypes.FieldType

	@doc """
	Returns the list of field_types.

	## Examples

	    iex> list_field_types()
	    [%FieldType{}, ...]

	"""
	def list_field_types do
		Repo.all(FieldType)
	end

	@doc """
	Gets a single field_type.

	Raises `Ecto.NoResultsError` if the Field type does not exist.

	## Examples

	    iex> get_field_type!(123)
	    %FieldType{}

	    iex> get_field_type!(456)
	    ** (Ecto.NoResultsError)

	"""
	#  def get_field_type!(id), do: Repo.get!(FieldType, id)
	def get_field_type!(id) do
		Repo.all(from(ft in FieldType, join: fo in assoc(ft, :field_options), where: ft.id == ^id, preload: [field_options: fo]))
	end

	@doc """
	Creates a field_type.

	## Examples

	    iex> create_field_type(%{field: value})
	    {:ok, %FieldType{}}

	    iex> create_field_type(%{field: bad_value})
	    {:error, %Ecto.Changeset{}}

	"""
	def create_field_type(attrs \\ %{}) do
		%FieldType{}
		|> FieldType.changeset(attrs)
		|> Repo.insert()
	end

	@doc """
	Updates a field_type.

	## Examples

	    iex> update_field_type(field_type, %{field: new_value})
	    {:ok, %FieldType{}}

	    iex> update_field_type(field_type, %{field: bad_value})
	    {:error, %Ecto.Changeset{}}

	"""
	def update_field_type(%FieldType{} = field_type, attrs) do
		field_type
		|> FieldType.changeset(attrs)
		|> Repo.update()
	end

	@doc """
	Deletes a field_type.

	## Examples

	    iex> delete_field_type(field_type)
	    {:ok, %FieldType{}}

	    iex> delete_field_type(field_type)
	    {:error, %Ecto.Changeset{}}

	"""
	def delete_field_type(%FieldType{} = field_type) do
		Repo.delete(field_type)
	end

	@doc """
	Returns an `%Ecto.Changeset{}` for tracking field_type changes.

	## Examples

	    iex> change_field_type(field_type)
	    %Ecto.Changeset{data: %FieldType{}}

	"""
	def change_field_type(%FieldType{} = field_type, attrs \\ %{}) do
		FieldType.changeset(field_type, attrs)
	end
end
