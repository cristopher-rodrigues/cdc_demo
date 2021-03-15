defmodule CdcDemo.Todos.Subscriber do
  use GenServer

  alias Cainophile.{Adapters, Changes}

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @register :cdc_demo
            |> Application.fetch_env!(Cainophile.Adapters.Postgres)
            # this is the register we set in the config/dev.exs
            |> Keyword.fetch!(:register)

  @impl true
  def init(state) do
    Adapters.Postgres.subscribe(@register, self())

    {:ok, state}
  end

  @impl true
  def handle_info(
        %Cainophile.Changes.Transaction{
          changes: [
            %Cainophile.Changes.NewRecord{
              record: new_todo,
              relation: {"public", "todos"}
            }
          ]
        },
        state
      ) do
    CdcDemoWeb.Endpoint.broadcast_from!(self(), "todos", "new_todo", %{todo: new_todo})

    {:noreply, state}
  end

  @impl true
  def handle_info(_, state), do: {:noreply, state}
end
