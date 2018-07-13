defmodule Database.Gasss.Gass do
  use Ecto.Schema
  import Ecto.Changeset


  schema "gasss" do
    field :created_events, :integer
    field :event_clicked, :integer
    field :influenced_chats, :integer
    field :pool_clicked, :integer

    timestamps()
  end

  @doc false
  def changeset(gass, attrs) do
    gass
    |> cast(attrs, [:event_clicked, :pool_clicked, :created_events, :influenced_chats])
    |> validate_required([:event_clicked, :pool_clicked, :created_events, :influenced_chats])
  end
end
