defmodule PhxappWeb.ValueControllerTest do
  use PhxappWeb.ConnCase

  alias Phxapp.PatientData

  @create_attrs %{date: "2010-04-17T14:00:00Z", value: "some value"}
  @update_attrs %{date: "2011-05-18T15:01:01Z", value: "some updated value"}
  @invalid_attrs %{date: nil, value: nil}

  def fixture(:value) do
    {:ok, value} = PatientData.create_value(@create_attrs)
    value
  end

  describe "index" do
    test "lists all values", %{conn: conn} do
      conn = get(conn, Routes.value_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Values"
    end
  end

  describe "new value" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.value_path(conn, :new))
      assert html_response(conn, 200) =~ "New Value"
    end
  end

  describe "create value" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.value_path(conn, :create), value: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.value_path(conn, :show, id)

      conn = get(conn, Routes.value_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Value"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.value_path(conn, :create), value: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Value"
    end
  end

  describe "edit value" do
    setup [:create_value]

    test "renders form for editing chosen value", %{conn: conn, value: value} do
      conn = get(conn, Routes.value_path(conn, :edit, value))
      assert html_response(conn, 200) =~ "Edit Value"
    end
  end

  describe "update value" do
    setup [:create_value]

    test "redirects when data is valid", %{conn: conn, value: value} do
      conn = put(conn, Routes.value_path(conn, :update, value), value: @update_attrs)
      assert redirected_to(conn) == Routes.value_path(conn, :show, value)

      conn = get(conn, Routes.value_path(conn, :show, value))
      assert html_response(conn, 200) =~ "some updated value"
    end

    test "renders errors when data is invalid", %{conn: conn, value: value} do
      conn = put(conn, Routes.value_path(conn, :update, value), value: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Value"
    end
  end

  describe "delete value" do
    setup [:create_value]

    test "deletes chosen value", %{conn: conn, value: value} do
      conn = delete(conn, Routes.value_path(conn, :delete, value))
      assert redirected_to(conn) == Routes.value_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.value_path(conn, :show, value))
      end
    end
  end

  defp create_value(_) do
    value = fixture(:value)
    %{value: value}
  end
end
