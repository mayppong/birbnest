defmodule Birbnest.Nest do
  @moduledoc """
  This is an Agent implementation of `Plug.Session.Store`.
  """

  @behaviour Plug.Session.Store
  @name __MODULE__
  @type on_start :: {:ok, pid} | {:error, {:already_started, pid} | term}

  @doc """
  Start the Agent with empty map and module name as reference id.
  """
  @spec start_link() :: on_start
  def start_link do
    Agent.start_link(&Map.new/0, name: @name)
  end

  @doc """
  Initialized the store with the default options. These options are also given
  to `get`, `put`, and `delete` by default too.
  """
  def init(opts \\ []), do: opts

  @doc """
  Get session data from the agent for the given session id.
  """
  @spec get(%Plug.Conn{}, String.t, Keyword.t) :: {String.t | nil, Map.t}
  def get(_conn, sid, _opts) do
    Agent.get(@name, &Map.get(&1, sid))
    |> case do
      nil -> {nil, %{}}
      data -> {sid, data}
    end
  end

  @doc """
  Put session data into the agent for the given session id. If `nil` is given
  for the session id, create a new session.
  """
  @spec put(%Plug.Conn{}, String.t | nil, Any.t, Keyword.t) :: String.t
  def put(conn, nil, value, opts), do: put(conn, UUID.uuid4(), value, opts)
  def put(_conn, sid, value, _opts) do
    Agent.update(@name, &Map.put(&1, sid, value))
    sid
  end

  @doc """
  Remove the given session id from store.
  """
  @spec delete(%Plug.Conn{}, String.t, Keyword.t) :: :ok
  def delete(_conn, sid, _opts) do
    Agent.update(@name, &Map.delete(&1, sid))
    :ok
  end
end
