defmodule Birbnest.SessionTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Birbnest.Nest

  test "put session cookie" do
    conn = conn(:get, "/") |> fetch_cookies
    opts = Plug.Session.init(store: Nest, key: "foobar")
    conn = Plug.Session.call(conn, opts) |> fetch_session
    conn = send_resp(conn, 200, "")
    assert conn.resp_cookies == %{}
  end

  test "put session" do
    conn = conn(:get, "/") |> fetch_cookies
    conn = %{conn | cookies: %{"foobar" => "sid"}}

    opts = Plug.Session.init(store: Nest, key: "foobar")
    conn = Plug.Session.call(conn, opts) |> fetch_session
    conn = put_session(conn, "foo", "bar")
    send_resp(conn, 200, "")
  end
end
