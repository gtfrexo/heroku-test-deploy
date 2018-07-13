defmodule Database.ContextVals.ContextVal do
  use Ecto.Schema
  import Ecto.Changeset


  schema "contextvals" do
    field :animal_blurb, :string
    field :boat_blurb, :string
    field :education_blurb, :string
    field :eggs_blurb, :string
    field :occupation_blurb, :string
    field :worst_pickup_blurb, :string
    field :emoji_blurb, :string

    timestamps()
  end

  @doc false
  def changeset(context_val, attrs) do
    context_val
    |> cast(attrs, [:education_blurb, :occupation_blurb, :boat_blurb, :eggs_blurb, :animal_blurb, :worst_pickup_blurb, :emoji_blurb])
    |> validate_required([:education_blurb, :occupation_blurb, :boat_blurb, :eggs_blurb, :animal_blurb, :worst_pickup_blurb, :emoji_blurb])
  end
end
