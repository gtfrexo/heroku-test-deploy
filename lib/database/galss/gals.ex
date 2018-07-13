defmodule Database.Galss.Gals do
  use Ecto.Schema
  import Ecto.Changeset


  schema "galss" do
    field :created_events, :integer
    field :event_clicked, :integer
    field :influenced_chats, :integer
    field :pool_clicked, :integer

    timestamps()
  end

  @doc false
  def changeset(gals, attrs) do
    gals
    |> cast(attrs, [:created_events, :event_clicked, :influenced_chats, :pool_clicked])
    |> validate_required([:created_events, :event_clicked, :influenced_chats, :pool_clicked])
  end
end
