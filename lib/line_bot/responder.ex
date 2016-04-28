defmodule LineBot.Responder do

  config = Application.get_env(:line_bot, :channel)

  @url "https://trialbot-api.line.me/v1/events"
  @headers %{
    "X-Line-ChannelID" => config[:id],
    "X-Line-ChannelSecret" => config[:secret],
    "X-Line-Trusted-User-With-ACL" => config[:mid],
    "Content-Type" => "application/json;charset=UTF-8"
  }

  def send_response(%{"content" => %{"opType" => 4, "params" => [user_mid, nil, nil]}) do
    text_message([user_mid], "こんにちわ！") |> do_send_response
  end

  @answers ["いいね！", "さすが！", "どすか！"]

  def send_response(%{"content" => %{"from" => reply_to}}) do
    text_message([reply_to], Enum.random(@answers)) |> do_send_response
  end

  defp do_send_response(message) do
    HTTPoison.post(@url, message, @headers)
  end

  defp text_message(mids, text) do
    Poison.encode! %{
      "to" => mids,
      "toChannel" => 1383378250,
      "eventType" => "138311608800106203",
      "content" => %{
        "contentType" => 1,
        "toType" => 1,
        "text" => text
      }
    }
  end
end
