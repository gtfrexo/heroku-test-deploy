defmodule Database.ProfileContents do
  @moduledoc """
  The ProfileContents context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.ProfileContents.ProfileContent

  @doc """
  Returns the list of profilecontents.

  ## Examples

      iex> list_profilecontents()
      [%ProfileContent{}, ...]

  """
  def list_profilecontents do
    Repo.all(ProfileContent)
  end

  @doc """
  Gets a single profile_content.

  Raises `Ecto.NoResultsError` if the Profile content does not exist.

  ## Examples

      iex> get_profile_content!(123)
      %ProfileContent{}

      iex> get_profile_content!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile_content!(id), do: Repo.get!(ProfileContent, id)

  @doc """
  Creates a profile_content.

  ## Examples

      iex> create_profile_content(%{field: value})
      {:ok, %ProfileContent{}}

      iex> create_profile_content(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile_content(attrs \\ %{}) do
    %ProfileContent{}
    |> ProfileContent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile_content.

  ## Examples

      iex> update_profile_content(profile_content, %{field: new_value})
      {:ok, %ProfileContent{}}

      iex> update_profile_content(profile_content, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile_content(%ProfileContent{} = profile_content, attrs) do
    profile_content
    |> ProfileContent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ProfileContent.

  ## Examples

      iex> delete_profile_content(profile_content)
      {:ok, %ProfileContent{}}

      iex> delete_profile_content(profile_content)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile_content(%ProfileContent{} = profile_content) do
    Repo.delete(profile_content)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile_content changes.

  ## Examples

      iex> change_profile_content(profile_content)
      %Ecto.Changeset{source: %ProfileContent{}}

  """
  def change_profile_content(%ProfileContent{} = profile_content) do
    ProfileContent.changeset(profile_content, %{})
  end
end
