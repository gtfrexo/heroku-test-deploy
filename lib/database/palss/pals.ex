defmodule Database.Palss.Pals do
  use Ecto.Schema
  import Ecto.Changeset


  schema "palss" do
    field :events_created, :integer
    field :messages_total, :integer
    field :pools_joined, :integer
    field :started_chats, :integer

    timestamps()
  end

  @doc false
  def changeset(pals, attrs) do
    pals
    |> cast(attrs, [:events_created, :messages_total, :pools_joined, :started_chats])
    |> validate_required([:events_created, :messages_total, :pools_joined, :started_chats])
  end
end
