defmodule Database.Repo.Migrations.CreatePasss do
  use Ecto.Migration

  def change do
    create table(:passs) do
      add :events_created, :integer
      add :messages_recieved, :integer
      add :messages_sent, :integer
      add :pools_joined, :integer
      add :started_chats, :integer
      add :age, :integer
      add :person_id, :id

      timestamps()
    end

  end
end
