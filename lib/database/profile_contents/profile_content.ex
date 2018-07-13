defmodule Database.ProfileContents.ProfileContent do
  use Ecto.Schema
  import Ecto.Changeset


  schema "profilecontents" do
    field :animal_blurb, :string
    field :boat_blurb, :string
    field :education_blurb, :string
    field :eggs_blurb, :string
    field :occupation_blurb, :string
    field :worst_pickup_blurb, :string
    field :emoji_blurb, :string
    field :person_id, :id

    timestamps()
  end

  @doc false
  def changeset(profile_content, attrs) do
    profile_content
    |> cast(attrs, [:education_blurb, :occupation_blurb, :boat_blurb, :eggs_blurb, :animal_blurb, :worst_pickup_blurb, :emoji_blurb, :person_id])
    |> validate_required([:education_blurb, :occupation_blurb, :boat_blurb, :eggs_blurb, :animal_blurb, :worst_pickup_blurb, :emoji_blurb, :person_id])
  end
end
