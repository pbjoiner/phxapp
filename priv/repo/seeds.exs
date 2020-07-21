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

alias Phxapp.FieldType

fieldTypeData = [
	%{
		name: "rowDate",
		label: "Date",
		description: "date data was entered",
		input_type: :date
	},
	%{
		name: "bloodPressure",
		label: "Blood Pressure Sys/Dia",
		description: "blood pressure as systtolic over diastolic",
		input_type: :bloodpressure
	},
	%{
		name: "pulse",
		label: "Pulse",
		description: "pulse rate in beats per minute",
		input_type: :number
	},
	%{
		name: "bloodSugar",
		label: "Blood Sugar",
		description: "amount of glucose in the blood",
		input_type: :number
	},
	%{
		name: "tempAm",
		label: "Temperature AM",
		description: "amount of glucose in the blood",
		input_type: :number
	},
]