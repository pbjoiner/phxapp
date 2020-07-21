defmodule Phxapp.FieldTypesTest do
  use Phxapp.DataCase

  alias Phxapp.FieldTypes

  describe "field_types" do
    alias Phxapp.FieldTypes.FieldType

    @valid_attrs %{description: "some description", input_type: "some input_type", label: "some label", name: "some name"}
    @update_attrs %{description: "some updated description", input_type: "some updated input_type", label: "some updated label", name: "some updated name"}
    @invalid_attrs %{description: nil, input_type: nil, label: nil, name: nil}

    def field_type_fixture(attrs \\ %{}) do
      {:ok, field_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FieldTypes.create_field_type()

      field_type
    end

    test "list_field_types/0 returns all field_types" do
      field_type = field_type_fixture()
      assert FieldTypes.list_field_types() == [field_type]
    end

    test "get_field_type!/1 returns the field_type with given id" do
      field_type = field_type_fixture()
      assert FieldTypes.get_field_type!(field_type.id) == field_type
    end

    test "create_field_type/1 with valid data creates a field_type" do
      assert {:ok, %FieldType{} = field_type} = FieldTypes.create_field_type(@valid_attrs)
      assert field_type.description == "some description"
      assert field_type.input_type == "some input_type"
      assert field_type.label == "some label"
      assert field_type.name == "some name"
    end

    test "create_field_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FieldTypes.create_field_type(@invalid_attrs)
    end

    test "update_field_type/2 with valid data updates the field_type" do
      field_type = field_type_fixture()
      assert {:ok, %FieldType{} = field_type} = FieldTypes.update_field_type(field_type, @update_attrs)
      assert field_type.description == "some updated description"
      assert field_type.input_type == "some updated input_type"
      assert field_type.label == "some updated label"
      assert field_type.name == "some updated name"
    end

    test "update_field_type/2 with invalid data returns error changeset" do
      field_type = field_type_fixture()
      assert {:error, %Ecto.Changeset{}} = FieldTypes.update_field_type(field_type, @invalid_attrs)
      assert field_type == FieldTypes.get_field_type!(field_type.id)
    end

    test "delete_field_type/1 deletes the field_type" do
      field_type = field_type_fixture()
      assert {:ok, %FieldType{}} = FieldTypes.delete_field_type(field_type)
      assert_raise Ecto.NoResultsError, fn -> FieldTypes.get_field_type!(field_type.id) end
    end

    test "change_field_type/1 returns a field_type changeset" do
      field_type = field_type_fixture()
      assert %Ecto.Changeset{} = FieldTypes.change_field_type(field_type)
    end
  end
end
