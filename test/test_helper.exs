ExUnit.start

Mix.Task.run "ecto.create", ~w(-r LineBot.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r LineBot.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(LineBot.Repo)

