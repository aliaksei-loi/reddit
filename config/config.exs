# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :reddit,
  ecto_repos: [Reddit.Repo]

# Configures the endpoint
config :reddit, RedditWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    System.get_env("SECRET_KEY_BASE") ||
      raise("environment variable SECRET_KEY_BASE is missing"),
  render_errors: [view: RedditWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Reddit.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :reddit, Reddit.Guardian,
  issuer: "reddit",
  secret_key:
    System.get_env("GUARDIAN_SECRET_KEY") ||
      raise("environment variable GUARDIAN_SECRET_KEY is missing")
