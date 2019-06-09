defmodule Lab7.MixProject do
  use Mix.Project

  def project do
    [
      app: :lab7,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "lab5",
      source_url: "https://github.com/kaaboaye/Introduction-to-Software-Engineering",
      homepage_url: "https://github.com/kaaboaye/Introduction-to-Software-Engineering",
      docs: [
        # The main page in the docs
        main: "lab5",
        extras: ["README.md"]
      ]
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
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
