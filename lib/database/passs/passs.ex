defmodule Database.Passs do
  @moduledoc """
  The Passs context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.Passs.Pass

  @doc """
  Returns the list of passs.

  ## Examples

      iex> list_passs()
      [%Pass{}, ...]

  """
  def list_passs do
    Repo.all(Pass)
  end

  @doc """
  Gets a single pass.

  Raises `Ecto.NoResultsError` if the Pass does not exist.

  ## Examples

      iex> get_pass!(123)
      %Pass{}

      iex> get_pass!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pass!(id), do: Repo.get!(Pass, id)

  @doc """
  Creates a pass.

  ## Examples

      iex> create_pass(%{field: value})
      {:ok, %Pass{}}

      iex> create_pass(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pass(attrs \\ %{}) do
    %Pass{}
    |> Pass.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pass.

  ## Examples

      iex> update_pass(pass, %{field: new_value})
      {:ok, %Pass{}}

      iex> update_pass(pass, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pass(%Pass{} = pass, attrs) do
    pass
    |> Pass.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pass.

  ## Examples

      iex> delete_pass(pass)
      {:ok, %Pass{}}

      iex> delete_pass(pass)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pass(%Pass{} = pass) do
    Repo.delete(pass)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pass changes.

  ## Examples

      iex> change_pass(pass)
      %Ecto.Changeset{source: %Pass{}}

  """
  def change_pass(%Pass{} = pass) do
    Pass.changeset(pass, %{})
  end
end
