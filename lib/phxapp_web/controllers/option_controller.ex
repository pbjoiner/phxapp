defmodule PhxappWeb.OptionController do
  use PhxappWeb, :controller

  alias Phxapp.PatientData
  alias Phxapp.PatientData.Option

  def index(conn, _params) do
    options = PatientData.list_options()
    render(conn, "index.html", options: options)
  end

  def new(conn, _params) do
    changeset = PatientData.change_option(%Option{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"option" => option_params}) do
    case PatientData.create_option(option_params) do
      {:ok, option} ->
        conn
        |> put_flash(:info, "Option created successfully.")
        |> redirect(to: Routes.option_path(conn, :show, option))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    option = PatientData.get_option!(id)
    render(conn, "show.html", option: option)
  end

  def edit(conn, %{"id" => id}) do
    option = PatientData.get_option!(id)
    changeset = PatientData.change_option(option)
    render(conn, "edit.html", option: option, changeset: changeset)
  end

  def update(conn, %{"id" => id, "option" => option_params}) do
    option = PatientData.get_option!(id)

    case PatientData.update_option(option, option_params) do
      {:ok, option} ->
        conn
        |> put_flash(:info, "Option updated successfully.")
        |> redirect(to: Routes.option_path(conn, :show, option))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", option: option, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    option = PatientData.get_option!(id)
    {:ok, _option} = PatientData.delete_option(option)

    conn
    |> put_flash(:info, "Option deleted successfully.")
    |> redirect(to: Routes.option_path(conn, :index))
  end
end
