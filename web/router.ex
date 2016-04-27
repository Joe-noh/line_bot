defmodule LineBot.Router do
  use LineBot.Web, :router

  channel_secret = :line_bot
    |> Application.get_env(:channel)
    |> Keyword.get(:secret)

  pipeline :api do
    plug :accepts, ["json"]
    plug LineBot.SignaturePlug, channel_secret: channel_secret
  end

  scope "/", LineBot do
    pipe_through :api

    post "/callback", MessageController, :callback
  end
end
