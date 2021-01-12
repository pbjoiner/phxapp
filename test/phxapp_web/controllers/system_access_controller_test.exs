defmodule PhxappWeb.SystemAccessControllerTest do
  use PhxappWeb.ConnCase

  alias Phxapp.Accounts

  @create_attrs %{permissions_hash: "some permissions_hash"}
  @update_attrs %{permissions_hash: "some updated permissions_hash"}
  @invalid_attrs %{permissions_hash: nil}

  def fixture(:system_access) do
    {:ok, system_access} = Accounts.create_system_access(@create_attrs)
    system_access
  end

  describe "index" do
    test "lists all system_access", %{conn: conn} do
      conn = get(conn, Routes.system_access_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing System access"
    end
  end

  describe "new system_access" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.system_access_path(conn, :new))
      assert html_response(conn, 200) =~ "New System access"
    end
  end

  describe "create system_access" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.system_access_path(conn, :create), system_access: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.system_access_path(conn, :show, id)

      conn = get(conn, Routes.system_access_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show System access"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.system_access_path(conn, :create), system_access: @invalid_attrs)
      assert html_response(conn, 200) =~ "New System access"
    end
  end

  describe "edit system_access" do
    setup [:create_system_access]

    test "renders form for editing chosen system_access", %{conn: conn, system_access: system_access} do
      conn = get(conn, Routes.system_access_path(conn, :edit, system_access))
      assert html_response(conn, 200) =~ "Edit System access"
    end
  end

  describe "update system_access" do
    setup [:create_system_access]

    test "redirects when data is valid", %{conn: conn, system_access: system_access} do
      conn = put(conn, Routes.system_access_path(conn, :update, system_access), system_access: @update_attrs)
      assert redirected_to(conn) == Routes.system_access_path(conn, :show, system_access)

      conn = get(conn, Routes.system_access_path(conn, :show, system_access))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, system_access: system_access} do
      conn = put(conn, Routes.system_access_path(conn, :update, system_access), system_access: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit System access"
    end
  end

  describe "delete system_access" do
    setup [:create_system_access]

    test "deletes chosen system_access", %{conn: conn, system_access: system_access} do
      conn = delete(conn, Routes.system_access_path(conn, :delete, system_access))
      assert redirected_to(conn) == Routes.system_access_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.system_access_path(conn, :show, system_access))
      end
    end
  end

  defp create_system_access(_) do
    system_access = fixture(:system_access)
    %{system_access: system_access}
  end
end
