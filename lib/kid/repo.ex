defmodule Kid.Repo do
  use Ecto.Repo,
    otp_app: :kid,
    adapter: Ecto.Adapters.Postgres
end
