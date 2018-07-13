defmodule Database.Genders.Gender do
  use Ecto.Schema
  import Ecto.Changeset

  #gender_list = [:male, :female]
  #  |> Enum.with_index 
  #  |> Map.new

  schema "genders" do
    field :is_female, :boolean, default: false
    field :is_male, :boolean, default: false
    #field :gender, :gender_list

    timestamps()
  end

  @doc false
  def changeset(gender, attrs) do
    gender
    |> cast(attrs, [:is_male, :is_female])
    |> validate_required([:is_male, :is_female])
  end
end
