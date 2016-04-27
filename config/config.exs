# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :line_bot, LineBot.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "sSEb9DbSy3Bhcty2t7n2LcR74DCAo7/kBByVNGTzJC1qcdJq1RoTkc2OX6KJojan",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: LineBot.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :line_bot, :channel,
  id: "1460000000",
  secret: "caaaaaa0000000dddddddd777777dddd",
  mid: "u01880000000000000000000000000000"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

