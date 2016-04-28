defmodule LineBot.SignaturePlug do
  import Plug.Conn

  def init(opts = [channel_secret: _secret]), do: opts

  def call(conn, channel_secret: secret) do
    body = conn.private[:raw_body]
    signature = :crypto.hmac(:sha256, secret, body) |> Base.encode64

    [header_signature] = get_req_header(conn, "x-line-channelsignature")

    if signature == header_signature do
      conn
    else
      conn |> send_resp(401, "Unauthorized") |> halt
    end
  end
end
