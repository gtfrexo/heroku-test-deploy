defmodule Database.Chats.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  ##DELETE DATASET

  schema "chats" do
    field :is_blocked, :boolean, default: false
    field :pool_id, :id
    field :person_id, :id 

    has_many :messages, Database.Messages.Message
    has_many :persons, Database.Persons.Person

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:is_blocked, :pool_id, :person_id])
    |> validate_required([:is_blocked, :pool_id, :person_id])
  end
end
