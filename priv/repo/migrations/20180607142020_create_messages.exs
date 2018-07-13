defmodule Database.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :read_at, :utc_datetime
      add :was_read, :boolean, default: false, null: false
      add :person_id, :id 
      add :sent_to_id, :id 
      add :chat_id, :id

      timestamps()
    end

  end
end
