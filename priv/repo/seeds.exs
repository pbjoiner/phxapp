# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Phxapp.Repo.insert!(%Phxapp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Phxapp.Repo.insert! %FieldType{
  name: "bloodPressure",
  label: "Blood Pressure",
  description: "blood pressure as systolic over diastolic",
  input_type: "bloodPressure"
}
Phxapp.Repo.insert! %FieldType{
  name: "pulse",
  label: "Pulse",
  description: "pulse rate in beats per minute",
  input_type: "integer"
}
Phxapp.Repo.insert! %FieldType{
  name: "bloodSugar",
  label: "Blood Sugar",
  description: "blood sugar level",
  input_type: "integer"
}
Phxapp.Repo.insert! %FieldType{
  name: "tempAm",
  label: "Temperature AM",
  description: "morning temperature in fahrenheit",
  input_type: "decimal"
}
Phxapp.Repo.insert! %FieldType{
  name: "tempPm",
  label: "Temperature PM",
  description: "evening temperature in fahrenheit",
  input_type: "decimal"
}
Phxapp.Repo.insert! %FieldType{
  name: "weight",
  label: "Weight",
  description: "weight in pounds",
  input_type: "decimal"
}

