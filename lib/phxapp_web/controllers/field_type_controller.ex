defmodule PhxappWeb.FieldTypeController do
  use PhxappWeb, :controller

  alias Phxapp.PatientData
  alias Phxapp.PatientData.FieldType

  def index(conn, _params) do
    field_types = PatientData.list_field_types()
    render(conn, "index.html", field_types: field_types)
  end

  def new(conn, _params) do
    changeset = PatientData.change_field_type(%FieldType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"field_type" => field_type_params}) do
    case PatientData.create_field_type(field_type_params) do
      {:ok, field_type} ->
        conn
        |> put_flash(:info, "Field type created successfully.")
        |> redirect(to: Routes.field_type_path(conn, :show, field_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    field_type = PatientData.get_field_type!(id)
    render(conn, "show.html", field_type: field_type)
  end

  def edit(conn, %{"id" => id}) do
    field_type = PatientData.get_field_type!(id)
    changeset = PatientData.change_field_type(field_type)
    render(conn, "edit.html", field_type: field_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "field_type" => field_type_params}) do
    field_type = PatientData.get_field_type!(id)

    case PatientData.update_field_type(field_type, field_type_params) do
      {:ok, field_type} ->
        conn
        |> put_flash(:info, "Field type updated successfully.")
        |> redirect(to: Routes.field_type_path(conn, :show, field_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", field_type: field_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    field_type = PatientData.get_field_type!(id)
    {:ok, _field_type} = PatientData.delete_field_type(field_type)

    conn
    |> put_flash(:info, "Field type deleted successfully.")
    |> redirect(to: Routes.field_type_path(conn, :index))
  end
end
