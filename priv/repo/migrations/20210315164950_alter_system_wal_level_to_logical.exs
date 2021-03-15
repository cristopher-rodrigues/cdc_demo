defmodule CdcDemo.Repo.Migrations.AlterSystemWalLevelToLogical do
  use Ecto.Migration

  @disable_ddl_transaction true

  def change do
    execute("ALTER SYSTEM SET wal_level = 'logical';")
  end
end
