# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :stadium,
  ecto_repos: [Stadium.Repo]

# Configures the endpoint
config :stadium, StadiumWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T1R58IR35Vx9oystHiYPfVs8ywmfXNftJ3dYwBDE5m6gVCI4Mn5pEEaLZiFTZ3p8",
  render_errors: [view: StadiumWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Stadium.PubSub,
  live_view: [signing_salt: "6nhS0hkg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
