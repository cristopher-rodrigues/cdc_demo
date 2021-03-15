defmodule CdcDemo.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :marked_as_done, :boolean, default: false
    field :todo, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:todo, :marked_as_done])
    |> validate_required([:todo, :marked_as_done])
  end
end
