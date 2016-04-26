defmodule LineBot.Router do
  use LineBot.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LineBot do
    pipe_through :api

    post "/callback", MessageController, :callback
  end
end
