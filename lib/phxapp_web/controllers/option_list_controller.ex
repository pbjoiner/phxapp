defmodule PhxappWeb.OptionListController do
  use PhxappWeb, :controller

  alias Phxapp.PatientData
  alias Phxapp.PatientData.OptionList

  def index(conn, _params) do
    option_lists = PatientData.list_option_lists()
    render(conn, "index.html", option_lists: option_lists)
  end

  def new(conn, _params) do
    changeset = PatientData.change_option_list(%OptionList{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"option_list" => option_list_params}) do
    case PatientData.create_option_list(option_list_params) do
      {:ok, option_list} ->
        conn
        |> put_flash(:info, "Option list created successfully.")
        |> redirect(to: Routes.option_list_path(conn, :show, option_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    option_list = PatientData.get_option_list!(id)
    render(conn, "show.html", option_list: option_list)
  end

  def edit(conn, %{"id" => id}) do
    option_list = PatientData.get_option_list!(id)
    changeset = PatientData.change_option_list(option_list)
    render(conn, "edit.html", option_list: option_list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "option_list" => option_list_params}) do
    option_list = PatientData.get_option_list!(id)

    case PatientData.update_option_list(option_list, option_list_params) do
      {:ok, option_list} ->
        conn
        |> put_flash(:info, "Option list updated successfully.")
        |> redirect(to: Routes.option_list_path(conn, :show, option_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", option_list: option_list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    option_list = PatientData.get_option_list!(id)
    {:ok, _option_list} = PatientData.delete_option_list(option_list)

    conn
    |> put_flash(:info, "Option list deleted successfully.")
    |> redirect(to: Routes.option_list_path(conn, :index))
  end
end
