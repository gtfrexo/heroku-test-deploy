defmodule Database.Galss do
  @moduledoc """
  The Galss context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.Galss.Gals

  @doc """
  Returns the list of galss.

  ## Examples

      iex> list_galss()
      [%Gals{}, ...]

  """
  def list_galss do
    Repo.all(Gals)
  end

  @doc """
  Gets a single gals.

  Raises `Ecto.NoResultsError` if the Gals does not exist.

  ## Examples

      iex> get_gals!(123)
      %Gals{}

      iex> get_gals!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gals!(id), do: Repo.get!(Gals, id)

  @doc """
  Creates a gals.

  ## Examples

      iex> create_gals(%{field: value})
      {:ok, %Gals{}}

      iex> create_gals(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gals(attrs \\ %{}) do
    %Gals{}
    |> Gals.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gals.

  ## Examples

      iex> update_gals(gals, %{field: new_value})
      {:ok, %Gals{}}

      iex> update_gals(gals, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gals(%Gals{} = gals, attrs) do
    gals
    |> Gals.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Gals.

  ## Examples

      iex> delete_gals(gals)
      {:ok, %Gals{}}

      iex> delete_gals(gals)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gals(%Gals{} = gals) do
    Repo.delete(gals)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gals changes.

  ## Examples

      iex> change_gals(gals)
      %Ecto.Changeset{source: %Gals{}}

  """
  def change_gals(%Gals{} = gals) do
    Gals.changeset(gals, %{})
  end
end
