defmodule Teamify.ProjectIterations.ProjectIteration do
  use Ecto.Schema
  import Ecto.Changeset

  alias Teamify.Projects.Project
  alias Teamify.Tasks.Task

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "project_iterations" do
    field :deadline, :utc_datetime
    belongs_to :project, Project
    has_many :tasks, Task

    timestamps()
  end

  @doc false
  def changeset(project_iteration, attrs) do
    project_iteration
    |> cast(attrs, [:deadline, :project_id])
    |> validate_required([:deadline, :project_id])
  end
end
