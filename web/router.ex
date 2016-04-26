defmodule LineBot.Router do
  use LineBot.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LineBot do
    pipe_through :api
  end
end
