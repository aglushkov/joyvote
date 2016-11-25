# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :joyvote,
  ecto_repos: [Joyvote.Repo]

# Configures the endpoint
config :joyvote, Joyvote.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o5T3pS+hKdK1hPP3v09gyeo8V8qpUpxoMcmOs0LmBu0QWo1Mwast3KHJzE8QAXTV",
  render_errors: [view: Joyvote.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Joyvote.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
