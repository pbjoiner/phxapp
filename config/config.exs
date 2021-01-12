# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phxapp,
       ecto_repos: [Phxapp.Repo]

# Configures the endpoint
config :phxapp,
       PhxappWeb.Endpoint,
       url: [
	       host: "localhost"
       ],
       secret_key_base: "2V4CPiTK0SSUBsNJqj3bLGi4dhUi4IgUQGb23CM0vtvoDzM+gtiPmv/cRNjTsuar",
       render_errors: [
	       view: PhxappWeb.ErrorView,
	       accepts: ~w(html json),
	       layout: false
       ],
       pubsub_server: Phxapp.PubSub,
       live_view: [
	       signing_salt: "T4SoXB4T"
       ]

# Configures Elixir's Logger  @formatter:off
config :logger, :console,
# @formatter:on
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Add POW Authenticcation @formatter:off
config :phxapp, :pow,
# @formatter:on
       user: Phxapp.Users.User,
       repo: Phxapp.Repo



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
