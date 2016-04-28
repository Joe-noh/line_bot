defmodule LineBot.Responder do

  config = Application.get_env(:line_bot, :channel)

  @url "https://trialbot-api.line.me/v1/events"
  @headers %{
    "X-Line-ChannelID" => config[:id],
    "X-Line-ChannelSecret" => config[:secret],
    "X-Line-Trusted-User-With-ACL" => config[:mid],
    "Content-Type" => "application/json;charset=UTF-8"
  }

  @answers ["いいね！", "さすが！", "どすか！"]

  def send_response(%{"content" => %{"from" => reply_to}}) do
    message = Poison.encode! %{
      "to" => [reply_to],
      "toChannel" => 1383378250,
      "eventType" => "138311608800106203",
      "content" => %{
        "contentType" => 1,
        "toType" => 1,
        "text" => Enum.random(@answers)
      }
    }

    HTTPoison.post(@url, message, @headers)
  end
end
