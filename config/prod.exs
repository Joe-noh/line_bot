use Mix.Config

config :line_bot, LineBot.Endpoint,
  http: [port: 8000]

config :logger, backends: [
  {LoggerFileBackend, :info},
  {LoggerFileBackend, :error}
]

config :logger, :info,
  path: "log/info.log",
  level: :info

config :logger, :error,
  path: "log/error.log",
  level: :error

import_config "prod.secret.exs"
