defmodule Teamify.TeamMembers.TeamMember do
  use Ecto.Schema
  import Ecto.Changeset

  alias Teamify.Teams.Team
  alias Teamify.People.Person

  @primary_key false
  @foreign_key_type :binary_id
  schema "team_members" do
    belongs_to :team, Team, primary_key: true, references: :project_id
    belongs_to :person, Person, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(team_member, attrs) do
    team_member
    |> cast(attrs, [:team_id, :person_id])
    |> validate_required([:team_id, :person_id])
  end
end
