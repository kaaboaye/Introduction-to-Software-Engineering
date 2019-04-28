defmodule Teamify.ProjectIterations do
  @moduledoc """
  The ProjectIterations context.
  """

  import Ecto.Query, warn: false
  alias Teamify.Repo

  alias Teamify.ProjectIterations.ProjectIteration

  @doc """
  Returns the list of project_iterations.

  ## Examples

      iex> list_project_iterations()
      [%ProjectIteration{}, ...]

  """
  def list_project_iterations do
    Repo.all(ProjectIteration)
  end

  @doc """
  Gets a single project_iteration.

  Raises `Ecto.NoResultsError` if the Project iteration does not exist.

  ## Examples

      iex> get_project_iteration!(123)
      %ProjectIteration{}

      iex> get_project_iteration!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_iteration!(id), do: Repo.get!(ProjectIteration, id)

  @doc """
  Creates a project_iteration.

  ## Examples

      iex> create_project_iteration(%{field: value})
      {:ok, %ProjectIteration{}}

      iex> create_project_iteration(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_iteration(attrs \\ %{}) do
    %ProjectIteration{}
    |> ProjectIteration.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_iteration.

  ## Examples

      iex> update_project_iteration(project_iteration, %{field: new_value})
      {:ok, %ProjectIteration{}}

      iex> update_project_iteration(project_iteration, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_iteration(%ProjectIteration{} = project_iteration, attrs) do
    project_iteration
    |> ProjectIteration.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ProjectIteration.

  ## Examples

      iex> delete_project_iteration(project_iteration)
      {:ok, %ProjectIteration{}}

      iex> delete_project_iteration(project_iteration)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_iteration(%ProjectIteration{} = project_iteration) do
    Repo.delete(project_iteration)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_iteration changes.

  ## Examples

      iex> change_project_iteration(project_iteration)
      %Ecto.Changeset{source: %ProjectIteration{}}

  """
  def change_project_iteration(%ProjectIteration{} = project_iteration) do
    ProjectIteration.changeset(project_iteration, %{})
  end
end
