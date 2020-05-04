use Mix.Config

config :kid,
  ecto_repos: [Kid.Repo]

# Configures the endpoint
config :kid, KidWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: KidWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kid.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
import_config "#{Mix.env()}.secret.exs"
