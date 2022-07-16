defmodule LimoniBarber.Repo do
  use Ecto.Repo,
    otp_app: :limoni_barber,
    adapter: Ecto.Adapters.Postgres
end
