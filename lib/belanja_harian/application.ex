defmodule BelanjaHarian.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BelanjaHarianWeb.Telemetry,
      BelanjaHarian.Repo,
      {DNSCluster, query: Application.get_env(:belanja_harian, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BelanjaHarian.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BelanjaHarian.Finch},
      # Start a worker by calling: BelanjaHarian.Worker.start_link(arg)
      # {BelanjaHarian.Worker, arg},
      # Start to serve requests, typically the last entry
      BelanjaHarianWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BelanjaHarian.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BelanjaHarianWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
