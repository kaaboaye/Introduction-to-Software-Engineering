defmodule Teamify.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias Teamify.Teams.Team
  alias Teamify.ProjectIterations.ProjectIteration

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "projects" do
    field :deadline, :utc_datetime
    field :name, :string
    has_one :team, Team, foreign_key: :project_id
    has_many :iterations, ProjectIteration

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :deadline])
    |> validate_required([:name, :deadline])
  end
end
