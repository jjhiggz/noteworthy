defmodule Noteworthy.Repo do
  use Ecto.Repo,
    otp_app: :noteworthy,
    adapter: Ecto.Adapters.Postgres
end
