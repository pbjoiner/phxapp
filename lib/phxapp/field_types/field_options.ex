defmodule Phxapp.FieldTypes.FieldOptions do
  @moduledoc """
  The FieldTypes context.
  """

  import Ecto.Query, warn: false
  alias Phxapp.Repo
  alias Phxapp.FieldTypes.FieldOptions.FieldOption
  alias Phxapp.FieldTypes.FieldType

  @doc """
  Returns the list of options for the curent field type.

  ## Examples

      iex> list_field_types()
      [%FieldType{}, ...]

  """
  def list_options do
    Repo.all(FieldOption)
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
  def get_option!(id), do: Repo.get!(FieldOption, id)

  @doc """
  Creates a field_type.

  ## Examples

      iex> create_field_option(%{field: value})
      {:ok, %FieldType{}}

      iex> create_field_option(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_field_option(attrs \\ %{}) do
    %FieldOption{}
    |> FieldOption.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a field_type.

  ## Examples

      iex> update_field_option(field_type, %{field: new_value})
      {:ok, %FieldType{}}

      iex> update_field_option(field_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_field_option(%FieldType{} = option, attrs) do
    option
    |> FieldOption.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a field_type.

  ## Examples

      iex> delete_field_option(field_type)
      {:ok, %FieldType{}}

      iex> delete_field_option(field_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_field_option(%FieldOption{} = field_option) do
    Repo.delete(field_option)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking field_type changes.

  ## Examples

      iex> change_field_option(field_type)
      %Ecto.Changeset{data: %FieldType{}}

  """
  def change_field_option(%FieldOption{} = field_option, attrs \\ %{}) do
    FieldOption.changeset(field_option, attrs)
  end
end
