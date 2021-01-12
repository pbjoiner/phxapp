defmodule PhxappWeb.SystemAccessController do
  use PhxappWeb, :controller

  alias Phxapp.Accounts
  alias Phxapp.Accounts.SystemAccess

  def index(conn, _params) do
    system_access = Accounts.list_system_access()
    render(conn, "index.html", system_access: system_access)
  end

  def new(conn, _params) do
    changeset = Accounts.change_system_access(%SystemAccess{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"system_access" => system_access_params}) do
    case Accounts.create_system_access(system_access_params) do
      {:ok, system_access} ->
        conn
        |> put_flash(:info, "System access created successfully.")
        |> redirect(to: Routes.system_access_path(conn, :show, system_access))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    system_access = Accounts.get_system_access!(id)
    render(conn, "show.html", system_access: system_access)
  end

  def edit(conn, %{"id" => id}) do
    system_access = Accounts.get_system_access!(id)
    changeset = Accounts.change_system_access(system_access)
    render(conn, "edit.html", system_access: system_access, changeset: changeset)
  end

  def update(conn, %{"id" => id, "system_access" => system_access_params}) do
    system_access = Accounts.get_system_access!(id)

    case Accounts.update_system_access(system_access, system_access_params) do
      {:ok, system_access} ->
        conn
        |> put_flash(:info, "System access updated successfully.")
        |> redirect(to: Routes.system_access_path(conn, :show, system_access))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", system_access: system_access, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    system_access = Accounts.get_system_access!(id)
    {:ok, _system_access} = Accounts.delete_system_access(system_access)

    conn
    |> put_flash(:info, "System access deleted successfully.")
    |> redirect(to: Routes.system_access_path(conn, :index))
  end
end
