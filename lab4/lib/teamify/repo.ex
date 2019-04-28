defmodule Teamify.Repo do
  use Ecto.Repo,
    otp_app: :teamify,
    adapter: Ecto.Adapters.Postgres
end
