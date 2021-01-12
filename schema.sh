#!/bin/sh
mix phx.gen.html PatientData Option options label:string value:string
mix phx.gen.html PatientData FieldType field_types name:string label:string description:string input_type:string
mix phx.gen.html PatientData OptionList option_lists field_type_id:references:field_types option_id:references:options
mix phx.gen.html PatientData Patient patients first_name:string last_name:string birth_date:date ssn4:string
mix phx.gen.html PatientData Value values value:string date:utc_datetime
mix phx.gen.html PatientData FieldList field_lists name:string input_type:string patient_id:references:patients field_type_id:references:field_types value_id:references:values
mix phx.gen.html Accounts User users username:string password_hash:binary email:string:unique
mix phx.gen.html Accounts PatientAccess patient_access user_id:references:users patient_id:references:patients
mix phx.gen.html Accounts SystemAccess system_access user_id:references:users permissions_hash:binary
