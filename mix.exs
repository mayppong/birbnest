defmodule Birbnest.Mixfile do
  use Mix.Project

  def project do
    [app: :birbnest,
     version: "0.1.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [mod: {Birbnest, []},
     applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:plug, "~> 1.2"},
     {:uuid, "~> 1.1"},
     {:credo, "~> 0.4", only: :dev},
     {:ex_doc, "~> 0.13", only: :dev}]
  end

  defp description do
    """
    Store your baby birbs' important information in your own nest! A Plug.Conn.Store implementation using Agent.
    """
  end

  defp package do
    [name: :birbnest,
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["May Pongpitpitak"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/mayppong/birbnest"}]
  end
end
