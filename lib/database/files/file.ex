defmodule Database.Files.File do
  use Ecto.Schema
  import Ecto.Changeset


  schema "files" do
    field :content_type, :string
    field :name, :string
    field :name_full, :string
    field :secret, :string
    field :size, :integer
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:content_type, :name, :name_full, :secret, :size, :url])
    |> validate_required([:content_type, :name, :name_full, :secret, :size, :url])
  end
end
