defmodule PhxappWeb.ValueController do
  use PhxappWeb, :controller

  alias Phxapp.PatientData
  alias Phxapp.PatientData.Value

  def index(conn, _params) do
    values = PatientData.list_values()
    render(conn, "index.html", values: values)
  end

  def new(conn, _params) do
    changeset = PatientData.change_value(%Value{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"value" => value_params}) do
    case PatientData.create_value(value_params) do
      {:ok, value} ->
        conn
        |> put_flash(:info, "Value created successfully.")
        |> redirect(to: Routes.value_path(conn, :show, value))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    value = PatientData.get_value!(id)
    render(conn, "show.html", value: value)
  end

  def edit(conn, %{"id" => id}) do
    value = PatientData.get_value!(id)
    changeset = PatientData.change_value(value)
    render(conn, "edit.html", value: value, changeset: changeset)
  end

  def update(conn, %{"id" => id, "value" => value_params}) do
    value = PatientData.get_value!(id)

    case PatientData.update_value(value, value_params) do
      {:ok, value} ->
        conn
        |> put_flash(:info, "Value updated successfully.")
        |> redirect(to: Routes.value_path(conn, :show, value))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", value: value, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    value = PatientData.get_value!(id)
    {:ok, _value} = PatientData.delete_value(value)

    conn
    |> put_flash(:info, "Value deleted successfully.")
    |> redirect(to: Routes.value_path(conn, :index))
  end
end
