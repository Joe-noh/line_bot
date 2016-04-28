use Mix.Config

config :line_bot, LineBot.Endpoint,
  http: [port: 8000]

config :logger, level: :info
config :logger, backends: [
  {LoggerFileBackend, :info},
  {LoggerFileBackend, :error}
]

config :logger, :info,
  path: "/var/log/line_bot/info.log",
  level: :info

config :logger, :error,
  path: "/var/log/line_bot/error.log",
  level: :error

import_config "prod.secret.exs"
