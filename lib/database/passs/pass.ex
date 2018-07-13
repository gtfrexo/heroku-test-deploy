defmodule Database.Passs.Pass do
  use Ecto.Schema
  import Ecto.Changeset


  schema "passs" do
    field :events_created, :integer
    field :messages_recieved, :integer
    field :messages_sent, :integer
    field :pools_joined, :integer
    field :started_chats, :integer
    field :age, :integer
    field :person_id, :id

    timestamps()
  end

  @doc false
  def changeset(pass, attrs) do
    pass
    |> cast(attrs, [:events_created, :messages_recieved, :messages_sent, :pools_joined, :started_chats, :age, :person_id])
    |> validate_required([:events_created, :messages_recieved, :messages_sent, :pools_joined, :started_chats, :age, :person_id])
  end
end
