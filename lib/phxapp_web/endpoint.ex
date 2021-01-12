defmodule PhxappWeb.Endpoint do
	use Phoenix.Endpoint, otp_app: :phxapp

	# The session will be stored in the cookie and signed,
	# this means its contents can be read but not tampered with.
	# Set :encryption_salt if you would also like to encrypt it.
	@session_options [
		store: :cookie,
		key: "_phxapp_key",
		signing_salt: "DzLYdjBA"
	]

	# @formatter:off
	socket "/socket", PhxappWeb.UserSocket,
	# @formatter:on
	       websocket: true,
	       longpoll: false

	# @formatter:off
#	socket "/live", Phoenix.LiveView.Socket,
	# @formatter:on
#	       websocket: [
#		       connect_info: [
#			       session: @session_options
#		       ]
#	       ]

	# Serve at "/" the static files from "priv/static" directory.
	#
	# You should set gzip to true if you are running phx.digest
	# when deploying your static files in production.
	plug Plug.Static,
	     at: "/",
	     from: :phxapp,
	     gzip: false,
	     only: ~w(css fonts images js favicon.ico robots.txt)

		     # Code reloading can be explicitly enabled under the
		     # :code_reloader configuration of your endpoint.
#	if code_reloading? do
#		socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
#		plug Phoenix.LiveReloader
#		plug Phoenix.CodeReloader
#		plug Phoenix.Ecto.CheckRepoStatus, otp_app: :phxapp
#	end

#	plug Phoenix.LiveDashboard.RequestLogger,
#	     param_key: "request_logger",
#	     cookie_key: "request_logger"

	plug Plug.RequestId
	plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

	plug Plug.Parsers,
	     parsers: [:urlencoded, :multipart, :json],
	     pass: ["*/*"],
	     json_decoder: Phoenix.json_library()

	plug Plug.MethodOverride
	plug Plug.Head
	plug Plug.Session, @session_options
	plug Pow.Plug.Session, otp_app: :phxapp
	plug PhxappWeb.Router
end
