defmodule CdcDemo.Repo do
  use Ecto.Repo,
    otp_app: :cdc_demo,
    adapter: Ecto.Adapters.Postgres
end
