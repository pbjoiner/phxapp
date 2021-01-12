defmodule PhxappWeb.FieldListControllerTest do
  use PhxappWeb.ConnCase

  alias Phxapp.PatientData

  @create_attrs %{input_type: "some input_type", name: "some name"}
  @update_attrs %{input_type: "some updated input_type", name: "some updated name"}
  @invalid_attrs %{input_type: nil, name: nil}

  def fixture(:field_list) do
    {:ok, field_list} = PatientData.create_field_list(@create_attrs)
    field_list
  end

  describe "index" do
    test "lists all field_lists", %{conn: conn} do
      conn = get(conn, Routes.field_list_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Field lists"
    end
  end

  describe "new field_list" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.field_list_path(conn, :new))
      assert html_response(conn, 200) =~ "New Field list"
    end
  end

  describe "create field_list" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.field_list_path(conn, :create), field_list: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.field_list_path(conn, :show, id)

      conn = get(conn, Routes.field_list_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Field list"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.field_list_path(conn, :create), field_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Field list"
    end
  end

  describe "edit field_list" do
    setup [:create_field_list]

    test "renders form for editing chosen field_list", %{conn: conn, field_list: field_list} do
      conn = get(conn, Routes.field_list_path(conn, :edit, field_list))
      assert html_response(conn, 200) =~ "Edit Field list"
    end
  end

  describe "update field_list" do
    setup [:create_field_list]

    test "redirects when data is valid", %{conn: conn, field_list: field_list} do
      conn = put(conn, Routes.field_list_path(conn, :update, field_list), field_list: @update_attrs)
      assert redirected_to(conn) == Routes.field_list_path(conn, :show, field_list)

      conn = get(conn, Routes.field_list_path(conn, :show, field_list))
      assert html_response(conn, 200) =~ "some updated input_type"
    end

    test "renders errors when data is invalid", %{conn: conn, field_list: field_list} do
      conn = put(conn, Routes.field_list_path(conn, :update, field_list), field_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Field list"
    end
  end

  describe "delete field_list" do
    setup [:create_field_list]

    test "deletes chosen field_list", %{conn: conn, field_list: field_list} do
      conn = delete(conn, Routes.field_list_path(conn, :delete, field_list))
      assert redirected_to(conn) == Routes.field_list_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.field_list_path(conn, :show, field_list))
      end
    end
  end

  defp create_field_list(_) do
    field_list = fixture(:field_list)
    %{field_list: field_list}
  end
end
