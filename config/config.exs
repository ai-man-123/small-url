# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :small_url,
  ecto_repos: [SmallUrl.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :small_url, SmallUrlWeb.Endpoint,
  url: [host: "lynxaiman"],
  secret_key_base: "+7ZINoY9iCEhw1ivei+oyD+lBef2mOQ0gYNjENoHbzUL4qyxWTqnjat4Y1FmdbA6",
  render_errors: [view: SmallUrlWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SmallUrl.PubSub,
  live_view: [signing_salt: "mdjGtOFF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
