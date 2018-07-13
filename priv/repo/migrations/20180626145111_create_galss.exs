defmodule Database.Repo.Migrations.CreateGalss do
  use Ecto.Migration

  def change do
    create table(:galss) do
      add :created_events, :integer
      add :event_clicked, :integer
      add :influenced_chats, :integer
      add :pool_clicked, :integer

      timestamps()
    end

  end
end
