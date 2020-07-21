defmodule PhxappWeb.FieldTypeControllerTest do
  use PhxappWeb.ConnCase

  alias Phxapp.FieldTypes

  @create_attrs %{description: "some description", input_type: "some input_type", label: "some label", name: "some name"}
  @update_attrs %{description: "some updated description", input_type: "some updated input_type", label: "some updated label", name: "some updated name"}
  @invalid_attrs %{description: nil, input_type: nil, label: nil, name: nil}

  def fixture(:field_type) do
    {:ok, field_type} = FieldTypes.create_field_type(@create_attrs)
    field_type
  end

  describe "index" do
    test "lists all field_types", %{conn: conn} do
      conn = get(conn, Routes.field_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Field types"
    end
  end

  describe "new field_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.field_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Field type"
    end
  end

  describe "create field_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.field_type_path(conn, :create), field_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.field_type_path(conn, :show, id)

      conn = get(conn, Routes.field_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Field type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.field_type_path(conn, :create), field_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Field type"
    end
  end

  describe "edit field_type" do
    setup [:create_field_type]

    test "renders form for editing chosen field_type", %{conn: conn, field_type: field_type} do
      conn = get(conn, Routes.field_type_path(conn, :edit, field_type))
      assert html_response(conn, 200) =~ "Edit Field type"
    end
  end

  describe "update field_type" do
    setup [:create_field_type]

    test "redirects when data is valid", %{conn: conn, field_type: field_type} do
      conn = put(conn, Routes.field_type_path(conn, :update, field_type), field_type: @update_attrs)
      assert redirected_to(conn) == Routes.field_type_path(conn, :show, field_type)

      conn = get(conn, Routes.field_type_path(conn, :show, field_type))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, field_type: field_type} do
      conn = put(conn, Routes.field_type_path(conn, :update, field_type), field_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Field type"
    end
  end

  describe "delete field_type" do
    setup [:create_field_type]

    test "deletes chosen field_type", %{conn: conn, field_type: field_type} do
      conn = delete(conn, Routes.field_type_path(conn, :delete, field_type))
      assert redirected_to(conn) == Routes.field_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.field_type_path(conn, :show, field_type))
      end
    end
  end

  defp create_field_type(_) do
    field_type = fixture(:field_type)
    %{field_type: field_type}
  end
end
