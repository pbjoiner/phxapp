defmodule Phxapp.PatientDataTest do
  use Phxapp.DataCase

  alias Phxapp.PatientData

  describe "options" do
    alias Phxapp.PatientData.Option

    @valid_attrs %{label: "some label", value: "some value"}
    @update_attrs %{label: "some updated label", value: "some updated value"}
    @invalid_attrs %{label: nil, value: nil}

    def option_fixture(attrs \\ %{}) do
      {:ok, option} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PatientData.create_option()

      option
    end

    test "list_options/0 returns all options" do
      option = option_fixture()
      assert PatientData.list_options() == [option]
    end

    test "get_option!/1 returns the option with given id" do
      option = option_fixture()
      assert PatientData.get_option!(option.id) == option
    end

    test "create_option/1 with valid data creates a option" do
      assert {:ok, %Option{} = option} = PatientData.create_option(@valid_attrs)
      assert option.label == "some label"
      assert option.value == "some value"
    end

    test "create_option/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PatientData.create_option(@invalid_attrs)
    end

    test "update_option/2 with valid data updates the option" do
      option = option_fixture()
      assert {:ok, %Option{} = option} = PatientData.update_option(option, @update_attrs)
      assert option.label == "some updated label"
      assert option.value == "some updated value"
    end

    test "update_option/2 with invalid data returns error changeset" do
      option = option_fixture()
      assert {:error, %Ecto.Changeset{}} = PatientData.update_option(option, @invalid_attrs)
      assert option == PatientData.get_option!(option.id)
    end

    test "delete_option/1 deletes the option" do
      option = option_fixture()
      assert {:ok, %Option{}} = PatientData.delete_option(option)
      assert_raise Ecto.NoResultsError, fn -> PatientData.get_option!(option.id) end
    end

    test "change_option/1 returns a option changeset" do
      option = option_fixture()
      assert %Ecto.Changeset{} = PatientData.change_option(option)
    end
  end

  describe "field_types" do
    alias Phxapp.PatientData.FieldType

    @valid_attrs %{description: "some description", input_type: "some input_type", label: "some label", name: "some name"}
    @update_attrs %{description: "some updated description", input_type: "some updated input_type", label: "some updated label", name: "some updated name"}
    @invalid_attrs %{description: nil, input_type: nil, label: nil, name: nil}

    def field_type_fixture(attrs \\ %{}) do
      {:ok, field_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PatientData.create_field_type()

      field_type
    end

    test "list_field_types/0 returns all field_types" do
      field_type = field_type_fixture()
      assert PatientData.list_field_types() == [field_type]
    end

    test "get_field_type!/1 returns the field_type with given id" do
      field_type = field_type_fixture()
      assert PatientData.get_field_type!(field_type.id) == field_type
    end

    test "create_field_type/1 with valid data creates a field_type" do
      assert {:ok, %FieldType{} = field_type} = PatientData.create_field_type(@valid_attrs)
      assert field_type.description == "some description"
      assert field_type.input_type == "some input_type"
      assert field_type.label == "some label"
      assert field_type.name == "some name"
    end

    test "create_field_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PatientData.create_field_type(@invalid_attrs)
    end

    test "update_field_type/2 with valid data updates the field_type" do
      field_type = field_type_fixture()
      assert {:ok, %FieldType{} = field_type} = PatientData.update_field_type(field_type, @update_attrs)
      assert field_type.description == "some updated description"
      assert field_type.input_type == "some updated input_type"
      assert field_type.label == "some updated label"
      assert field_type.name == "some updated name"
    end

    test "update_field_type/2 with invalid data returns error changeset" do
      field_type = field_type_fixture()
      assert {:error, %Ecto.Changeset{}} = PatientData.update_field_type(field_type, @invalid_attrs)
      assert field_type == PatientData.get_field_type!(field_type.id)
    end

    test "delete_field_type/1 deletes the field_type" do
      field_type = field_type_fixture()
      assert {:ok, %FieldType{}} = PatientData.delete_field_type(field_type)
      assert_raise Ecto.NoResultsError, fn -> PatientData.get_field_type!(field_type.id) end
    end

    test "change_field_type/1 returns a field_type changeset" do
      field_type = field_type_fixture()
      assert %Ecto.Changeset{} = PatientData.change_field_type(field_type)
    end
  end

  describe "option_lists" do
    alias Phxapp.PatientData.OptionList

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def option_list_fixture(attrs \\ %{}) do
      {:ok, option_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PatientData.create_option_list()

      option_list
    end

    test "list_option_lists/0 returns all option_lists" do
      option_list = option_list_fixture()
      assert PatientData.list_option_lists() == [option_list]
    end

    test "get_option_list!/1 returns the option_list with given id" do
      option_list = option_list_fixture()
      assert PatientData.get_option_list!(option_list.id) == option_list
    end

    test "create_option_list/1 with valid data creates a option_list" do
      assert {:ok, %OptionList{} = option_list} = PatientData.create_option_list(@valid_attrs)
    end

    test "create_option_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PatientData.create_option_list(@invalid_attrs)
    end

    test "update_option_list/2 with valid data updates the option_list" do
      option_list = option_list_fixture()
      assert {:ok, %OptionList{} = option_list} = PatientData.update_option_list(option_list, @update_attrs)
    end

    test "update_option_list/2 with invalid data returns error changeset" do
      option_list = option_list_fixture()
      assert {:error, %Ecto.Changeset{}} = PatientData.update_option_list(option_list, @invalid_attrs)
      assert option_list == PatientData.get_option_list!(option_list.id)
    end

    test "delete_option_list/1 deletes the option_list" do
      option_list = option_list_fixture()
      assert {:ok, %OptionList{}} = PatientData.delete_option_list(option_list)
      assert_raise Ecto.NoResultsError, fn -> PatientData.get_option_list!(option_list.id) end
    end

    test "change_option_list/1 returns a option_list changeset" do
      option_list = option_list_fixture()
      assert %Ecto.Changeset{} = PatientData.change_option_list(option_list)
    end
  end

  describe "patients" do
    alias Phxapp.PatientData.Patient

    @valid_attrs %{birth_date: ~D[2010-04-17], first_name: "some first_name", last_name: "some last_name", ssn4: "some ssn4"}
    @update_attrs %{birth_date: ~D[2011-05-18], first_name: "some updated first_name", last_name: "some updated last_name", ssn4: "some updated ssn4"}
    @invalid_attrs %{birth_date: nil, first_name: nil, last_name: nil, ssn4: nil}

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PatientData.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert PatientData.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert PatientData.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = PatientData.create_patient(@valid_attrs)
      assert patient.birth_date == ~D[2010-04-17]
      assert patient.first_name == "some first_name"
      assert patient.last_name == "some last_name"
      assert patient.ssn4 == "some ssn4"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PatientData.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = PatientData.update_patient(patient, @update_attrs)
      assert patient.birth_date == ~D[2011-05-18]
      assert patient.first_name == "some updated first_name"
      assert patient.last_name == "some updated last_name"
      assert patient.ssn4 == "some updated ssn4"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = PatientData.update_patient(patient, @invalid_attrs)
      assert patient == PatientData.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = PatientData.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> PatientData.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = PatientData.change_patient(patient)
    end
  end

  describe "values" do
    alias Phxapp.PatientData.Value

    @valid_attrs %{date: "2010-04-17T14:00:00Z", value: "some value"}
    @update_attrs %{date: "2011-05-18T15:01:01Z", value: "some updated value"}
    @invalid_attrs %{date: nil, value: nil}

    def value_fixture(attrs \\ %{}) do
      {:ok, value} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PatientData.create_value()

      value
    end

    test "list_values/0 returns all values" do
      value = value_fixture()
      assert PatientData.list_values() == [value]
    end

    test "get_value!/1 returns the value with given id" do
      value = value_fixture()
      assert PatientData.get_value!(value.id) == value
    end

    test "create_value/1 with valid data creates a value" do
      assert {:ok, %Value{} = value} = PatientData.create_value(@valid_attrs)
      assert value.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert value.value == "some value"
    end

    test "create_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PatientData.create_value(@invalid_attrs)
    end

    test "update_value/2 with valid data updates the value" do
      value = value_fixture()
      assert {:ok, %Value{} = value} = PatientData.update_value(value, @update_attrs)
      assert value.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert value.value == "some updated value"
    end

    test "update_value/2 with invalid data returns error changeset" do
      value = value_fixture()
      assert {:error, %Ecto.Changeset{}} = PatientData.update_value(value, @invalid_attrs)
      assert value == PatientData.get_value!(value.id)
    end

    test "delete_value/1 deletes the value" do
      value = value_fixture()
      assert {:ok, %Value{}} = PatientData.delete_value(value)
      assert_raise Ecto.NoResultsError, fn -> PatientData.get_value!(value.id) end
    end

    test "change_value/1 returns a value changeset" do
      value = value_fixture()
      assert %Ecto.Changeset{} = PatientData.change_value(value)
    end
  end

  describe "field_lists" do
    alias Phxapp.PatientData.FieldList

    @valid_attrs %{input_type: "some input_type", name: "some name"}
    @update_attrs %{input_type: "some updated input_type", name: "some updated name"}
    @invalid_attrs %{input_type: nil, name: nil}

    def field_list_fixture(attrs \\ %{}) do
      {:ok, field_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PatientData.create_field_list()

      field_list
    end

    test "list_field_lists/0 returns all field_lists" do
      field_list = field_list_fixture()
      assert PatientData.list_field_lists() == [field_list]
    end

    test "get_field_list!/1 returns the field_list with given id" do
      field_list = field_list_fixture()
      assert PatientData.get_field_list!(field_list.id) == field_list
    end

    test "create_field_list/1 with valid data creates a field_list" do
      assert {:ok, %FieldList{} = field_list} = PatientData.create_field_list(@valid_attrs)
      assert field_list.input_type == "some input_type"
      assert field_list.name == "some name"
    end

    test "create_field_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PatientData.create_field_list(@invalid_attrs)
    end

    test "update_field_list/2 with valid data updates the field_list" do
      field_list = field_list_fixture()
      assert {:ok, %FieldList{} = field_list} = PatientData.update_field_list(field_list, @update_attrs)
      assert field_list.input_type == "some updated input_type"
      assert field_list.name == "some updated name"
    end

    test "update_field_list/2 with invalid data returns error changeset" do
      field_list = field_list_fixture()
      assert {:error, %Ecto.Changeset{}} = PatientData.update_field_list(field_list, @invalid_attrs)
      assert field_list == PatientData.get_field_list!(field_list.id)
    end

    test "delete_field_list/1 deletes the field_list" do
      field_list = field_list_fixture()
      assert {:ok, %FieldList{}} = PatientData.delete_field_list(field_list)
      assert_raise Ecto.NoResultsError, fn -> PatientData.get_field_list!(field_list.id) end
    end

    test "change_field_list/1 returns a field_list changeset" do
      field_list = field_list_fixture()
      assert %Ecto.Changeset{} = PatientData.change_field_list(field_list)
    end
  end
end
