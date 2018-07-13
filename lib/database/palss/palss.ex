defmodule Database.Palss do
  @moduledoc """
  The Palss context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.Palss.Pals

  @doc """
  Returns the list of palss.

  ## Examples

      iex> list_palss()
      [%Pals{}, ...]

  """
  def list_palss do
    Repo.all(Pals)
  end

  @doc """
  Gets a single pals.

  Raises `Ecto.NoResultsError` if the Pals does not exist.

  ## Examples

      iex> get_pals!(123)
      %Pals{}

      iex> get_pals!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pals!(id), do: Repo.get!(Pals, id)

  @doc """
  Creates a pals.

  ## Examples

      iex> create_pals(%{field: value})
      {:ok, %Pals{}}

      iex> create_pals(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pals(attrs \\ %{}) do
    %Pals{}
    |> Pals.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pals.

  ## Examples

      iex> update_pals(pals, %{field: new_value})
      {:ok, %Pals{}}

      iex> update_pals(pals, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pals(%Pals{} = pals, attrs) do
    pals
    |> Pals.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pals.

  ## Examples

      iex> delete_pals(pals)
      {:ok, %Pals{}}

      iex> delete_pals(pals)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pals(%Pals{} = pals) do
    Repo.delete(pals)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pals changes.

  ## Examples

      iex> change_pals(pals)
      %Ecto.Changeset{source: %Pals{}}

  """
  def change_pals(%Pals{} = pals) do
    Pals.changeset(pals, %{})
  end
end
