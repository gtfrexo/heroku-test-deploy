defmodule Database.Repo.Migrations.CreatePools do
  use Ecto.Migration

  def change do
    create table(:pools) do
      add :person_id, :id 
      add :event_id, :id
      add :influenced_chats, :integer

      timestamps()
    end

  end
end
