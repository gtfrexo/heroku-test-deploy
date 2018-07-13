defmodule Database.Gasss do
  @moduledoc """
  The Gasss context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.Gasss.Gass

  @doc """
  Returns the list of gasss.

  ## Examples

      iex> list_gasss()
      [%Gass{}, ...]

  """
  def list_gasss do
    Repo.all(Gass)
  end

  @doc """
  Gets a single gass.

  Raises `Ecto.NoResultsError` if the Gass does not exist.

  ## Examples

      iex> get_gass!(123)
      %Gass{}

      iex> get_gass!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gass!(id), do: Repo.get!(Gass, id)

  @doc """
  Creates a gass.

  ## Examples

      iex> create_gass(%{field: value})
      {:ok, %Gass{}}

      iex> create_gass(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gass(attrs \\ %{}) do
    %Gass{}
    |> Gass.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gass.

  ## Examples

      iex> update_gass(gass, %{field: new_value})
      {:ok, %Gass{}}

      iex> update_gass(gass, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gass(%Gass{} = gass, attrs) do
    gass
    |> Gass.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Gass.

  ## Examples

      iex> delete_gass(gass)
      {:ok, %Gass{}}

      iex> delete_gass(gass)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gass(%Gass{} = gass) do
    Repo.delete(gass)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gass changes.

  ## Examples

      iex> change_gass(gass)
      %Ecto.Changeset{source: %Gass{}}

  """
  def change_gass(%Gass{} = gass) do
    Gass.changeset(gass, %{})
  end
end
