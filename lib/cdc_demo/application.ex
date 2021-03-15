defmodule CdcDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CdcDemo.Repo,
      # Start the Telemetry supervisor
      CdcDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CdcDemo.PubSub},
      # Start the Endpoint (http/https)
      CdcDemoWeb.Endpoint,
      {
        Cainophile.Adapters.Postgres,
        Application.fetch_env!(:cdc_demo, Cainophile.Adapters.Postgres)
      },
      CdcDemo.Todos.Subscriber
      # Start a worker by calling: CdcDemo.Worker.start_link(arg)
      # {CdcDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CdcDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CdcDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
