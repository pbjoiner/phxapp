defmodule Phxapp.FieldListsTest do
  use Phxapp.DataCase

  alias Phxapp.FieldLists

  describe "field_lists" do
    alias Phxapp.FieldLists.FieldList

    @valid_attrs %{field_type: "some field_type", input_type: "some input_type", name: "some name"}
    @update_attrs %{field_type: "some updated field_type", input_type: "some updated input_type", name: "some updated name"}
    @invalid_attrs %{field_type: nil, input_type: nil, name: nil}

    def field_list_fixture(attrs \\ %{}) do
      {:ok, field_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FieldLists.create_field_list()

      field_list
    end

    test "list_field_lists/0 returns all field_lists" do
      field_list = field_list_fixture()
      assert FieldLists.list_field_lists() == [field_list]
    end

    test "get_field_list!/1 returns the field_list with given id" do
      field_list = field_list_fixture()
      assert FieldLists.get_field_list!(field_list.id) == field_list
    end

    test "create_field_list/1 with valid data creates a field_list" do
      assert {:ok, %FieldList{} = field_list} = FieldLists.create_field_list(@valid_attrs)
      assert field_list.field_type == "some field_type"
      assert field_list.input_type == "some input_type"
      assert field_list.name == "some name"
    end

    test "create_field_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FieldLists.create_field_list(@invalid_attrs)
    end

    test "update_field_list/2 with valid data updates the field_list" do
      field_list = field_list_fixture()
      assert {:ok, %FieldList{} = field_list} = FieldLists.update_field_list(field_list, @update_attrs)
      assert field_list.field_type == "some updated field_type"
      assert field_list.input_type == "some updated input_type"
      assert field_list.name == "some updated name"
    end

    test "update_field_list/2 with invalid data returns error changeset" do
      field_list = field_list_fixture()
      assert {:error, %Ecto.Changeset{}} = FieldLists.update_field_list(field_list, @invalid_attrs)
      assert field_list == FieldLists.get_field_list!(field_list.id)
    end

    test "delete_field_list/1 deletes the field_list" do
      field_list = field_list_fixture()
      assert {:ok, %FieldList{}} = FieldLists.delete_field_list(field_list)
      assert_raise Ecto.NoResultsError, fn -> FieldLists.get_field_list!(field_list.id) end
    end

    test "change_field_list/1 returns a field_list changeset" do
      field_list = field_list_fixture()
      assert %Ecto.Changeset{} = FieldLists.change_field_list(field_list)
    end
  end
end
