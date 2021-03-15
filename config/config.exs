# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cdc_demo,
  ecto_repos: [CdcDemo.Repo]

# Configures the endpoint
config :cdc_demo, CdcDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Mkgvd9J37isVr04s/7/P9cq0Sg+6jUBW2gJeRYZqMBv+sShAC2L/F5MVk4yiCMF/",
  render_errors: [view: CdcDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CdcDemo.PubSub,
  live_view: [signing_salt: "o8aboFmV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
