defmodule CdcDemo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :todo, :text
      add :marked_as_done, :boolean, default: false, null: false

      timestamps()
    end
  end
end
