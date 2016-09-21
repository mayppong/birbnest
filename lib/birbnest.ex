defmodule Birbnest do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Birbnest.Nest, [])
    ]
    Supervisor.start_link(children, [])
  end
end
