use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :line_bot, LineBot.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :line_bot, LineBot.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "line_bot_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
