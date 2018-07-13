defmodule Database.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :content, :string
    field :read_at, :utc_datetime
    #field :was_read, :boolean, default: false
    #field :person_id, :id 
    field :from_person, :id
    field :to_person, :id
    field :sent_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :read_at, :from_person, :to_person, :sent_at])
    |> validate_required([:content, :read_at, :from_person, :to_person, :sent_at])
  end
end
