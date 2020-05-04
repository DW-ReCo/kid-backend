# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kid,
  ecto_repos: [Kid.Repo]

# Configures the endpoint
config :kid, KidWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1Jn2TFgULPvTqGoBDLQXQkliQ3OzDmcljMgJf1UuFcr8Y5zyC2qWMVyaoDeXKjZj",
  render_errors: [view: KidWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kid.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "xb10F/Xq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
