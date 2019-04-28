defmodule TeamifyWeb.ProjectIterationView do
  use TeamifyWeb, :view
  alias TeamifyWeb.ProjectIterationView

  def render("index.json", %{project_iterations: project_iterations}) do
    %{data: render_many(project_iterations, ProjectIterationView, "project_iteration.json")}
  end

  def render("show.json", %{project_iteration: project_iteration}) do
    %{data: render_one(project_iteration, ProjectIterationView, "project_iteration.json")}
  end

  def render("project_iteration.json", %{project_iteration: project_iteration}) do
    %{id: project_iteration.id,
      deadline: project_iteration.deadline}
  end
end
