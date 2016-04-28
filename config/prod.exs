use Mix.Config

config :line_bot, LineBot.Endpoint,
  http: [port: 8000]

config :logger, level: :info

import_config "prod.secret.exs"
