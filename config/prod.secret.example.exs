use Mix.Config

config :line_bot, LineBot.Endpoint,
  url: [host: "bot.example.com", port: 443]

config :line_bot, :channel,
  id:     "140000000",
  secret: "c36000000000000000000000000000000",
  mid:    "u01000000000000000000000000000000"

