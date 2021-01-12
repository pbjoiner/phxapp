defmodule PhxappWeb.FieldListController do
  use PhxappWeb, :controller

  alias Phxapp.PatientData
  alias Phxapp.PatientData.FieldList

  def index(conn, _params) do
    field_lists = PatientData.list_field_lists()
    render(conn, "index.html", field_lists: field_lists)
  end

  def new(conn, _params) do
    changeset = PatientData.change_field_list(%FieldList{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"field_list" => field_list_params}) do
    case PatientData.create_field_list(field_list_params) do
      {:ok, field_list} ->
        conn
        |> put_flash(:info, "Field list created successfully.")
        |> redirect(to: Routes.field_list_path(conn, :show, field_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    field_list = PatientData.get_field_list!(id)
    render(conn, "show.html", field_list: field_list)
  end

  def edit(conn, %{"id" => id}) do
    field_list = PatientData.get_field_list!(id)
    changeset = PatientData.change_field_list(field_list)
    render(conn, "edit.html", field_list: field_list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "field_list" => field_list_params}) do
    field_list = PatientData.get_field_list!(id)

    case PatientData.update_field_list(field_list, field_list_params) do
      {:ok, field_list} ->
        conn
        |> put_flash(:info, "Field list updated successfully.")
        |> redirect(to: Routes.field_list_path(conn, :show, field_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", field_list: field_list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    field_list = PatientData.get_field_list!(id)
    {:ok, _field_list} = PatientData.delete_field_list(field_list)

    conn
    |> put_flash(:info, "Field list deleted successfully.")
    |> redirect(to: Routes.field_list_path(conn, :index))
  end
end
