use Mix.Config

config :line_bot, LineBot.Endpoint,
  http: [port: 8000]

config :logger, backends: [
  {LoggerFileBackend, :info},
  {LoggerFileBackend, :error}
]

config :logger, :info,
  path: "logs/info.log",
  level: :info

config :logger, :error,
  path: "logs/error.log",
  level: :error

import_config "prod.secret.exs"
