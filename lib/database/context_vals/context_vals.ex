defmodule Database.ContextVals do
  @moduledoc """
  The ContextVals context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.ContextVals.ContextVal

  @doc """
  Returns the list of contextvals.

  ## Examples

      iex> list_contextvals()
      [%ContextVal{}, ...]

  """
  def list_contextvals do
    Repo.all(ContextVal)
  end

  @doc """
  Gets a single context_val.

  Raises `Ecto.NoResultsError` if the Context val does not exist.

  ## Examples

      iex> get_context_val!(123)
      %ContextVal{}

      iex> get_context_val!(456)
      ** (Ecto.NoResultsError)

  """
  def get_context_val!(id), do: Repo.get!(ContextVal, id)

  @doc """
  Creates a context_val.

  ## Examples

      iex> create_context_val(%{field: value})
      {:ok, %ContextVal{}}

      iex> create_context_val(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_context_val(attrs \\ %{}) do
    %ContextVal{}
    |> ContextVal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a context_val.

  ## Examples

      iex> update_context_val(context_val, %{field: new_value})
      {:ok, %ContextVal{}}

      iex> update_context_val(context_val, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_context_val(%ContextVal{} = context_val, attrs) do
    context_val
    |> ContextVal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContextVal.

  ## Examples

      iex> delete_context_val(context_val)
      {:ok, %ContextVal{}}

      iex> delete_context_val(context_val)
      {:error, %Ecto.Changeset{}}

  """
  def delete_context_val(%ContextVal{} = context_val) do
    Repo.delete(context_val)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking context_val changes.

  ## Examples

      iex> change_context_val(context_val)
      %Ecto.Changeset{source: %ContextVal{}}

  """
  def change_context_val(%ContextVal{} = context_val) do
    ContextVal.changeset(context_val, %{})
  end
end
