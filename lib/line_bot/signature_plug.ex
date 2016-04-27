defmodule LineBot.SignaturePlug do
  import Plug.Conn

  def init(opts = [channel_secret: _secret]) do
    opts
  end

  def call(conn, channel_secret: secret) do
    {:ok, body, conn} = read_body(conn)

    [header_signature] = get_req_header(conn, "x-line-channelsignature")

    signature = :crypto.hmac(:sha256, secret, body) |> Base.encode64

    if signature == header_signature do
      conn
    else
      conn |> send_resp(401, "Unauthorized") |> halt
    end
  end
end
