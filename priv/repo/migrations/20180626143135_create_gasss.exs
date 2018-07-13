defmodule Database.Repo.Migrations.CreateGasss do
  use Ecto.Migration

  def change do
    create table(:gasss) do
      add :event_clicked, :integer
      add :pool_clicked, :integer
      add :created_events, :integer
      add :influenced_chats, :integer

      timestamps()
    end

  end
end
