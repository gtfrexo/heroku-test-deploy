# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :database,
  ecto_repos: [Database.Repo]

# Configures the endpoint
config :database, DatabaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PHLDkOm50Tie2rhdAgWWeZCSdhn6lzuy1kbyw/tLSgPyhhSGywOOOjRaWXJjAUPK",
  render_errors: [view: DatabaseWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Database.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
