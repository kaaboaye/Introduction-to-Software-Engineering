defmodule Teamify.TeamMembers do
  @moduledoc """
  The TeamMembers context.
  """

  import Ecto.Query, warn: false
  alias Teamify.Repo

  alias Teamify.TeamMembers.TeamMember

  @doc """
  Returns the list of team_members.

  ## Examples

      iex> list_team_members()
      [%TeamMember{}, ...]

  """
  def list_team_members do
    Repo.all(TeamMember)
  end

  @doc """
  Gets a single team_member.

  Raises `Ecto.NoResultsError` if the Team member does not exist.

  ## Examples

      iex> get_team_member!(123)
      %TeamMember{}

      iex> get_team_member!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team_member!(id), do: Repo.get!(TeamMember, id)

  @doc """
  Creates a team_member.

  ## Examples

      iex> create_team_member(%{field: value})
      {:ok, %TeamMember{}}

      iex> create_team_member(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team_member(attrs \\ %{}) do
    %TeamMember{}
    |> TeamMember.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team_member.

  ## Examples

      iex> update_team_member(team_member, %{field: new_value})
      {:ok, %TeamMember{}}

      iex> update_team_member(team_member, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team_member(%TeamMember{} = team_member, attrs) do
    team_member
    |> TeamMember.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TeamMember.

  ## Examples

      iex> delete_team_member(team_member)
      {:ok, %TeamMember{}}

      iex> delete_team_member(team_member)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team_member(%TeamMember{} = team_member) do
    Repo.delete(team_member)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team_member changes.

  ## Examples

      iex> change_team_member(team_member)
      %Ecto.Changeset{source: %TeamMember{}}

  """
  def change_team_member(%TeamMember{} = team_member) do
    TeamMember.changeset(team_member, %{})
  end
end
