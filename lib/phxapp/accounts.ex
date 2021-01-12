defmodule Phxapp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Phxapp.Repo

  alias Phxapp.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias Phxapp.Accounts.PatientAccess

  @doc """
  Returns the list of patient_access.

  ## Examples

      iex> list_patient_access()
      [%PatientAccess{}, ...]

  """
  def list_patient_access do
    Repo.all(PatientAccess)
  end

  @doc """
  Gets a single patient_access.

  Raises `Ecto.NoResultsError` if the Patient access does not exist.

  ## Examples

      iex> get_patient_access!(123)
      %PatientAccess{}

      iex> get_patient_access!(456)
      ** (Ecto.NoResultsError)

  """
  def get_patient_access!(id), do: Repo.get!(PatientAccess, id)

  @doc """
  Creates a patient_access.

  ## Examples

      iex> create_patient_access(%{field: value})
      {:ok, %PatientAccess{}}

      iex> create_patient_access(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_patient_access(attrs \\ %{}) do
    %PatientAccess{}
    |> PatientAccess.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a patient_access.

  ## Examples

      iex> update_patient_access(patient_access, %{field: new_value})
      {:ok, %PatientAccess{}}

      iex> update_patient_access(patient_access, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_patient_access(%PatientAccess{} = patient_access, attrs) do
    patient_access
    |> PatientAccess.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a patient_access.

  ## Examples

      iex> delete_patient_access(patient_access)
      {:ok, %PatientAccess{}}

      iex> delete_patient_access(patient_access)
      {:error, %Ecto.Changeset{}}

  """
  def delete_patient_access(%PatientAccess{} = patient_access) do
    Repo.delete(patient_access)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking patient_access changes.

  ## Examples

      iex> change_patient_access(patient_access)
      %Ecto.Changeset{data: %PatientAccess{}}

  """
  def change_patient_access(%PatientAccess{} = patient_access, attrs \\ %{}) do
    PatientAccess.changeset(patient_access, attrs)
  end

  alias Phxapp.Accounts.SystemAccess

  @doc """
  Returns the list of system_access.

  ## Examples

      iex> list_system_access()
      [%SystemAccess{}, ...]

  """
  def list_system_access do
    Repo.all(SystemAccess)
  end

  @doc """
  Gets a single system_access.

  Raises `Ecto.NoResultsError` if the System access does not exist.

  ## Examples

      iex> get_system_access!(123)
      %SystemAccess{}

      iex> get_system_access!(456)
      ** (Ecto.NoResultsError)

  """
  def get_system_access!(id), do: Repo.get!(SystemAccess, id)

  @doc """
  Creates a system_access.

  ## Examples

      iex> create_system_access(%{field: value})
      {:ok, %SystemAccess{}}

      iex> create_system_access(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_system_access(attrs \\ %{}) do
    %SystemAccess{}
    |> SystemAccess.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a system_access.

  ## Examples

      iex> update_system_access(system_access, %{field: new_value})
      {:ok, %SystemAccess{}}

      iex> update_system_access(system_access, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_system_access(%SystemAccess{} = system_access, attrs) do
    system_access
    |> SystemAccess.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a system_access.

  ## Examples

      iex> delete_system_access(system_access)
      {:ok, %SystemAccess{}}

      iex> delete_system_access(system_access)
      {:error, %Ecto.Changeset{}}

  """
  def delete_system_access(%SystemAccess{} = system_access) do
    Repo.delete(system_access)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking system_access changes.

  ## Examples

      iex> change_system_access(system_access)
      %Ecto.Changeset{data: %SystemAccess{}}

  """
  def change_system_access(%SystemAccess{} = system_access, attrs \\ %{}) do
    SystemAccess.changeset(system_access, attrs)
  end
end
