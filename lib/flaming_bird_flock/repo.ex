defmodule FlamingBirdFlock.Repo do
  use Ecto.Repo,
    otp_app: :flaming_bird_flock,
    adapter: Ecto.Adapters.Postgres
end
