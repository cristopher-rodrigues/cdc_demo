defmodule CdcDemoWeb.PageLive do
  use CdcDemoWeb, :live_view

  alias Phoenix.Socket.Broadcast

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(CdcDemo.PubSub, "todos")
    end

    todos = CdcDemo.Todos.list_todos()

    {:ok, assign(socket, todos: todos)}
  end

  @impl true
  def handle_info(
        %Broadcast{
          event: "new_todo",
          payload: %{
            todo: %{
              "todo" => todo,
              "marked_as_done" => marked_as_done
            }
          },
          topic: "todos"
        },
        socket
      ) do
    {:noreply,
     assign(socket, todos: [%{todo: todo, marked_as_done: marked_as_done} | socket.assigns.todos])}
  end
end
