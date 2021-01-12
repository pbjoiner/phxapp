defmodule PhxappWeb.PatientAccessControllerTest do
  use PhxappWeb.ConnCase

  alias Phxapp.Accounts

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:patient_access) do
    {:ok, patient_access} = Accounts.create_patient_access(@create_attrs)
    patient_access
  end

  describe "index" do
    test "lists all patient_access", %{conn: conn} do
      conn = get(conn, Routes.patient_access_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Patient access"
    end
  end

  describe "new patient_access" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.patient_access_path(conn, :new))
      assert html_response(conn, 200) =~ "New Patient access"
    end
  end

  describe "create patient_access" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.patient_access_path(conn, :create), patient_access: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.patient_access_path(conn, :show, id)

      conn = get(conn, Routes.patient_access_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Patient access"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.patient_access_path(conn, :create), patient_access: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Patient access"
    end
  end

  describe "edit patient_access" do
    setup [:create_patient_access]

    test "renders form for editing chosen patient_access", %{conn: conn, patient_access: patient_access} do
      conn = get(conn, Routes.patient_access_path(conn, :edit, patient_access))
      assert html_response(conn, 200) =~ "Edit Patient access"
    end
  end

  describe "update patient_access" do
    setup [:create_patient_access]

    test "redirects when data is valid", %{conn: conn, patient_access: patient_access} do
      conn = put(conn, Routes.patient_access_path(conn, :update, patient_access), patient_access: @update_attrs)
      assert redirected_to(conn) == Routes.patient_access_path(conn, :show, patient_access)

      conn = get(conn, Routes.patient_access_path(conn, :show, patient_access))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, patient_access: patient_access} do
      conn = put(conn, Routes.patient_access_path(conn, :update, patient_access), patient_access: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Patient access"
    end
  end

  describe "delete patient_access" do
    setup [:create_patient_access]

    test "deletes chosen patient_access", %{conn: conn, patient_access: patient_access} do
      conn = delete(conn, Routes.patient_access_path(conn, :delete, patient_access))
      assert redirected_to(conn) == Routes.patient_access_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.patient_access_path(conn, :show, patient_access))
      end
    end
  end

  defp create_patient_access(_) do
    patient_access = fixture(:patient_access)
    %{patient_access: patient_access}
  end
end
