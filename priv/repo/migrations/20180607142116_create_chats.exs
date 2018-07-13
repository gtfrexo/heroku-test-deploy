defmodule Database.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :person_id, :id 
      add :pool_id, :id 
      add :is_blocked, :boolean, default: false, null: false

      timestamps()
    end

  end
end
