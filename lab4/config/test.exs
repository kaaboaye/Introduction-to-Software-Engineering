use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :teamify, TeamifyWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :teamify, Teamify.Repo,
  username: "postgres",
  password: "mysecretpassword",
  database: "postgres",
  hostname: "localhost",
  port: 32667,
  pool: Ecto.Adapters.SQL.Sandbox
