defmodule CdcDemo.Repo.Migrations.CreateTodosPublication do
  use Ecto.Migration

  def up do
    execute("CREATE PUBLICATION todos_publication FOR TABLE todos;")
  end

  def down do
    execute("DROP PUBLICATION todos_publication;")
  end
end
