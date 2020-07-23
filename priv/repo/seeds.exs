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

alias Phxapp.FieldTypes

fieldTypeData = [
	%{
		name: "rowDate",
		label: "Date",
		input_type: "date"
	},
	%{
		name: "bloodPressure",
		label: "Blood Pressure",
		description: "blood pressure as systolic over diastolic",
		input_type: "splitnumber",
		field_options: [
			%{
				label: "Systolic",
				# for split number fields, the value is the field order
				value: "01"
			},
			%{
				label: "Diastolic",
				value: "02"
			}
		]
	},
	%{
		name: "pulse",
		label: "Pulse",
		description: "pulse rate in beats per minute",
		input_type: "number"
	},
	%{
		name: "tempAm",
		label: "Temperature AM",
		description: "morning temperature in farenheit",
		input_type: "decimal"
	},
	%{
		name: "tempPm",
		label: "Temperature PM",
		description: "evening temperature in farenheit",
		input_type: "decimal"
	},
	%{
		name: "weight",
		label: "Weight",
		description: "weight in pounds",
		input_type: "decimal"
	}
]


Enum.each(
	fieldTypeData,
	fn (data) ->
			FieldTypes.create_field_type(data)
	end
)
