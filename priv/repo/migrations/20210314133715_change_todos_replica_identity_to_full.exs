defmodule CdcDemo.Repo.Migrations.ChangeTodosReplicaIdentityToFull do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE todos REPLICA IDENTITY FULL;")
  end

  def down do
    execute("ALTER TABLE todos REPLICA IDENTITY DEFAULT;")
  end
end
