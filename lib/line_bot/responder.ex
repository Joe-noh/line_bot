defmodule LineBot.Responder do

  @url "https://trialbot-api.line.me/v1/events"
  @answers ["いいね！", "さすが！", "どすか！"]

  def send_response(%{"from" => reply_to}) do
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

    config = Application.get_env(:line_bot, :channel)

    headers = %{
      "X-Line-ChannelID" => config[:id],
      "X-Line-ChannelSecret" => config[:secret],
      "X-Line-Trusted-User-With-ACL" => config[:mid]
    }

    HTTPoison.post(@url, message, headers)
  end
end
