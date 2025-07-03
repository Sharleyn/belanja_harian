defmodule BelanjaHarian.Repo do
  use Ecto.Repo,
    otp_app: :belanja_harian,
    adapter: Ecto.Adapters.Postgres
end
