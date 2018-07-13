defmodule Database.Repo.Migrations.CreatePalss do
  use Ecto.Migration

  def change do
    create table(:palss) do
      add :events_created, :integer
      add :messages_total, :integer
      add :pools_joined, :integer
      add :started_chats, :integer

      timestamps()
    end

  end
end
