defmodule Birbnest.NestTest do
  use ExUnit.Case, async: true

  alias Birbnest.Nest

  test "start agent when OTP start" do
    pid = Nest |> GenServer.whereis
    assert pid |> is_pid
  end

  test "return default options for initializing the store" do
    assert [] == Nest.init
  end

  test "put session data into agent" do
    sid = "test"
    value = "session"
    nest_id = Nest.put(%{}, sid, value, [])

    assert sid == nest_id
    assert value == Agent.get(Nest, &Map.get(&1, sid))
  end

  test "put session data into agent when no session id is given" do
    value = "session"
    nest_id = Nest.put(%{}, nil, value, [])

    refute is_nil(nest_id)
    assert value == Agent.get(Nest, &Map.get(&1, nest_id))
  end
end
