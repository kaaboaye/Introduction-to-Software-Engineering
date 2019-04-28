defmodule Teamify.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  alias Teamify.People.Person
  alias Teamify.Projects.Project
  alias Teamify.TeamMembers.TeamMember

  @primary_key false
  @foreign_key_type :binary_id
  schema "teams" do
    belongs_to :project, Project,
      foreign_key: :project_id,
      primary_key: true

    belongs_to :team_leader, Person
    has_many :members, TeamMember, references: :project_id
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:team_leader_id, :project_id])
    |> validate_required([:project_id])
  end
end
