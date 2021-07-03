defmodule Stadium.Repo do
  use Ecto.Repo,
    otp_app: :stadium,
    adapter: Ecto.Adapters.Postgres
end
