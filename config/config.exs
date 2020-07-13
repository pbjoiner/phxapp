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
       secret_key_base: "AvmD624jyoTKS7nHKjfw1WGbMs6/OuylsH7Na9vpFzM34VcvACCGV4+FyMgmJqF5",
       render_errors: [
         view: PhxappWeb.ErrorView,
         accepts: ~w(html json),
         layout: false
       ],
       pubsub_server: Phxapp.PubSub,
       live_view: [
         signing_salt: "MkE1mYP0"
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# add Pow for user management
config :phxapp,
       :pow,
       user: Phxapp.Users.User,
       repo: Phxapp.Repo,
       extensions: [PowResetPassword, PowEmailConfirmation],
       controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
       web_module: PhxappWeb,
       mailer_backend: PhxappWeb.Pow.Mailer,
       web_module_mailer: PhxappWeb

# add bamboo for email
config :phxapp, PhxappWeb.Mailer,
       adapter: Bamboo.MailgunAdapter,
       api_key: {:system, "MAILGUN_API_KEY"},
       server: {:system, "MAILGUN_SMTP_SERVER"},
       hostname: {:system, "MAILGUN_DOMAIN"},
       port: {:system, "MAILGUN_SMTP_PORT"},
       username: {:system, "MAILGUN_SMTP_LOGIN"},
       password: {:system, "MAILGUN_SMTP_PASSWORD"},
       tls: :if_available, # can be `:always` or `:never`
       allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"], # or {:system, "ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
       ssl: false, # can be `true`
       retries: 1,
       no_mx_lookups: false, # can be `true`
       auth: :if_available # can be `always`. If your smtp relay requires authentication set it to `always`.

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"