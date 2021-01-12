defmodule Phxapp.AccountsTest do
  use Phxapp.DataCase

  alias Phxapp.Accounts

  describe "users" do
    alias Phxapp.Accounts.User

    @valid_attrs %{email_hash: "some email_hash", password_hash: "some password_hash", username_hash: "some username_hash"}
    @update_attrs %{email_hash: "some updated email_hash", password_hash: "some updated password_hash", username_hash: "some updated username_hash"}
    @invalid_attrs %{email_hash: nil, password_hash: nil, username_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email_hash == "some email_hash"
      assert user.password_hash == "some password_hash"
      assert user.username_hash == "some username_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email_hash == "some updated email_hash"
      assert user.password_hash == "some updated password_hash"
      assert user.username_hash == "some updated username_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "patient_access" do
    alias Phxapp.Accounts.PatientAccess

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def patient_access_fixture(attrs \\ %{}) do
      {:ok, patient_access} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_patient_access()

      patient_access
    end

    test "list_patient_access/0 returns all patient_access" do
      patient_access = patient_access_fixture()
      assert Accounts.list_patient_access() == [patient_access]
    end

    test "get_patient_access!/1 returns the patient_access with given id" do
      patient_access = patient_access_fixture()
      assert Accounts.get_patient_access!(patient_access.id) == patient_access
    end

    test "create_patient_access/1 with valid data creates a patient_access" do
      assert {:ok, %PatientAccess{} = patient_access} = Accounts.create_patient_access(@valid_attrs)
    end

    test "create_patient_access/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_patient_access(@invalid_attrs)
    end

    test "update_patient_access/2 with valid data updates the patient_access" do
      patient_access = patient_access_fixture()
      assert {:ok, %PatientAccess{} = patient_access} = Accounts.update_patient_access(patient_access, @update_attrs)
    end

    test "update_patient_access/2 with invalid data returns error changeset" do
      patient_access = patient_access_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_patient_access(patient_access, @invalid_attrs)
      assert patient_access == Accounts.get_patient_access!(patient_access.id)
    end

    test "delete_patient_access/1 deletes the patient_access" do
      patient_access = patient_access_fixture()
      assert {:ok, %PatientAccess{}} = Accounts.delete_patient_access(patient_access)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_patient_access!(patient_access.id) end
    end

    test "change_patient_access/1 returns a patient_access changeset" do
      patient_access = patient_access_fixture()
      assert %Ecto.Changeset{} = Accounts.change_patient_access(patient_access)
    end
  end

  describe "system_access" do
    alias Phxapp.Accounts.SystemAccess

    @valid_attrs %{permissions_hash: "some permissions_hash"}
    @update_attrs %{permissions_hash: "some updated permissions_hash"}
    @invalid_attrs %{permissions_hash: nil}

    def system_access_fixture(attrs \\ %{}) do
      {:ok, system_access} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_system_access()

      system_access
    end

    test "list_system_access/0 returns all system_access" do
      system_access = system_access_fixture()
      assert Accounts.list_system_access() == [system_access]
    end

    test "get_system_access!/1 returns the system_access with given id" do
      system_access = system_access_fixture()
      assert Accounts.get_system_access!(system_access.id) == system_access
    end

    test "create_system_access/1 with valid data creates a system_access" do
      assert {:ok, %SystemAccess{} = system_access} = Accounts.create_system_access(@valid_attrs)
      assert system_access.permissions_hash == "some permissions_hash"
    end

    test "create_system_access/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_system_access(@invalid_attrs)
    end

    test "update_system_access/2 with valid data updates the system_access" do
      system_access = system_access_fixture()
      assert {:ok, %SystemAccess{} = system_access} = Accounts.update_system_access(system_access, @update_attrs)
      assert system_access.permissions_hash == "some updated permissions_hash"
    end

    test "update_system_access/2 with invalid data returns error changeset" do
      system_access = system_access_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_system_access(system_access, @invalid_attrs)
      assert system_access == Accounts.get_system_access!(system_access.id)
    end

    test "delete_system_access/1 deletes the system_access" do
      system_access = system_access_fixture()
      assert {:ok, %SystemAccess{}} = Accounts.delete_system_access(system_access)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_system_access!(system_access.id) end
    end

    test "change_system_access/1 returns a system_access changeset" do
      system_access = system_access_fixture()
      assert %Ecto.Changeset{} = Accounts.change_system_access(system_access)
    end
  end

  describe "users" do
    alias Phxapp.Accounts.User

    @valid_attrs %{email: "some email", password_hash: "some password_hash", username: "some username"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash", username: "some updated username"}
    @invalid_attrs %{email: nil, password_hash: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
