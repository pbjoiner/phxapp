defmodule PhxappWeb.OptionListControllerTest do
  use PhxappWeb.ConnCase

  alias Phxapp.PatientData

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:option_list) do
    {:ok, option_list} = PatientData.create_option_list(@create_attrs)
    option_list
  end

  describe "index" do
    test "lists all option_lists", %{conn: conn} do
      conn = get(conn, Routes.option_list_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Option lists"
    end
  end

  describe "new option_list" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.option_list_path(conn, :new))
      assert html_response(conn, 200) =~ "New Option list"
    end
  end

  describe "create option_list" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.option_list_path(conn, :create), option_list: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.option_list_path(conn, :show, id)

      conn = get(conn, Routes.option_list_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Option list"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.option_list_path(conn, :create), option_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Option list"
    end
  end

  describe "edit option_list" do
    setup [:create_option_list]

    test "renders form for editing chosen option_list", %{conn: conn, option_list: option_list} do
      conn = get(conn, Routes.option_list_path(conn, :edit, option_list))
      assert html_response(conn, 200) =~ "Edit Option list"
    end
  end

  describe "update option_list" do
    setup [:create_option_list]

    test "redirects when data is valid", %{conn: conn, option_list: option_list} do
      conn = put(conn, Routes.option_list_path(conn, :update, option_list), option_list: @update_attrs)
      assert redirected_to(conn) == Routes.option_list_path(conn, :show, option_list)

      conn = get(conn, Routes.option_list_path(conn, :show, option_list))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, option_list: option_list} do
      conn = put(conn, Routes.option_list_path(conn, :update, option_list), option_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Option list"
    end
  end

  describe "delete option_list" do
    setup [:create_option_list]

    test "deletes chosen option_list", %{conn: conn, option_list: option_list} do
      conn = delete(conn, Routes.option_list_path(conn, :delete, option_list))
      assert redirected_to(conn) == Routes.option_list_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.option_list_path(conn, :show, option_list))
      end
    end
  end

  defp create_option_list(_) do
    option_list = fixture(:option_list)
    %{option_list: option_list}
  end
end
