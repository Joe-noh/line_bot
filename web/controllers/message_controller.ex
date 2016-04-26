defmodule LineBot.MessageController do
  use LineBot.Web, :controller

  def callback(conn, %{"result" => messages}) do
    Enum.each messages, fn message ->
      spawn LineBot.Responder, :send_response, [message]
    end

    send_resp conn, 200, ""
  end
end
