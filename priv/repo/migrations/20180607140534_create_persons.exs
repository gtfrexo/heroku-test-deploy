defmodule Database.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :age, :integer
      add :birthday, :utc_datetime
      add :email, :string
      add :events_created, :integer
      add :gender, :string
      add :messages_recieved, :integer
      add :messages_sent, :integer
      add :name, :string
      add :name_full, :string
      add :password, :string
      add :pools_joined, :integer
      add :started_chats, :integer
      add :target_gender, :string
      add :target_relationship, :string
      add :worst_pickup, :string
      add :education, :string
      add :occupation, :string
      add :boat_blurb, :string
      add :eggs_blurb, :string
      add :animal_blurb, :string
      add :dare_blurb, :string
      #add :chat_id, :id

      timestamps()
    end

  end
end
