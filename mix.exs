defmodule WalkscoreEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :walkscore_ex,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        links: %{"GitHub" => "https://github.com/mollyretter/walkscore_ex"},
        licenses: ["MIT"]
      ],
      description: "WalkScore API wrapper Elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:httpoison, "~> 2.0"},
      {:poison, "~> 5.0"},
      {:exvcr, "~> 0.11", only: :test}
    ]
  end
end
