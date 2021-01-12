defmodule PhxappWeb.PatientAccessController do
  use PhxappWeb, :controller

  alias Phxapp.Accounts
  alias Phxapp.Accounts.PatientAccess

  def index(conn, _params) do
    patient_access = Accounts.list_patient_access()
    render(conn, "index.html", patient_access: patient_access)
  end

  def new(conn, _params) do
    changeset = Accounts.change_patient_access(%PatientAccess{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"patient_access" => patient_access_params}) do
    case Accounts.create_patient_access(patient_access_params) do
      {:ok, patient_access} ->
        conn
        |> put_flash(:info, "Patient access created successfully.")
        |> redirect(to: Routes.patient_access_path(conn, :show, patient_access))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    patient_access = Accounts.get_patient_access!(id)
    render(conn, "show.html", patient_access: patient_access)
  end

  def edit(conn, %{"id" => id}) do
    patient_access = Accounts.get_patient_access!(id)
    changeset = Accounts.change_patient_access(patient_access)
    render(conn, "edit.html", patient_access: patient_access, changeset: changeset)
  end

  def update(conn, %{"id" => id, "patient_access" => patient_access_params}) do
    patient_access = Accounts.get_patient_access!(id)

    case Accounts.update_patient_access(patient_access, patient_access_params) do
      {:ok, patient_access} ->
        conn
        |> put_flash(:info, "Patient access updated successfully.")
        |> redirect(to: Routes.patient_access_path(conn, :show, patient_access))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", patient_access: patient_access, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient_access = Accounts.get_patient_access!(id)
    {:ok, _patient_access} = Accounts.delete_patient_access(patient_access)

    conn
    |> put_flash(:info, "Patient access deleted successfully.")
    |> redirect(to: Routes.patient_access_path(conn, :index))
  end
end
