defmodule Birbnest.Nest do
  @moduledoc """
  This is an Agent implementation of `Plug.Session.Store`.
  """

  @behaviour Plug.Session.Store

  def init(opts \\ []), do: opts

  def get(conn, cookie, opts) do
  end

  def put(conn, sid, value, opts) do
  end

  def delete(conn, sid, opts) do
    :ok
  end
end
