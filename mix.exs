defmodule LineBot.Mixfile do
  use Mix.Project

  def project do
    [app: :line_bot,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  def application do
    [
      mod: {LineBot, []},
      applications: [
        :phoenix, :cowboy, :logger, :gettext, :phoenix_ecto,
        :postgrex, :httpoison, :logger_file_backend
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp deps do
    [
      {:phoenix, "~> 1.1.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_ecto, "~> 2.0"},
      {:gettext, "~> 0.9"},
      {:cowboy, "~> 1.0"},

      {:httpoison, "~> 0.8"},
      {:logger_file_backend, "0.0.7"},

      {:exrm, "~> 1.0"}
    ]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
