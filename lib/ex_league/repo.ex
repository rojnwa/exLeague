defmodule ExLeague.Repo do
  use Ecto.Repo,
    otp_app: :ex_league,
    adapter: Ecto.Adapters.Postgres
end
