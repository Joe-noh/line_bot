defmodule LineBot.StoreRawBodyPlug do
  import Plug.Conn

  def init(_opts), do: []

  def call(conn, _opts) do
    {:ok, body, _} = read_body(conn)
    put_private(conn, :raw_body, body)
  end
end
