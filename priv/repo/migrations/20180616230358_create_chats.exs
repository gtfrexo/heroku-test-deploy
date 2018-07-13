defmodule Database.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :is_blocked, :boolean, default: false, null: false
      add :pool_id, :id
      add :person_id, :id 

      timestamps()
    end

  end
end
