defmodule Teamify.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  alias Teamify.ProjectIterations.ProjectIteration

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :plannedHours, :decimal
    field :realHours, :decimal
    field :state, :string
    field :title, :string
    belongs_to :project_iteration, ProjectIteration

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :plannedHours, :realHours, :state, :project_iteration_id])
    |> validate_required([:title, :plannedHours, :realHours, :state, :project_iteration_id])
  end
end
