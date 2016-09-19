defmodule Birbnest.NestTest do
  use ExUnit.Case, async: true

  alias Birbnest.Nest

  test "return default options for initializing the store" do
    assert [] == Nest.init
  end
end
