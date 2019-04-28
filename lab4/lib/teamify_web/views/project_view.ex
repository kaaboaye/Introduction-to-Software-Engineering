defmodule TeamifyWeb.ProjectView do
  use TeamifyWeb, :view
  alias TeamifyWeb.ProjectView

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{id: project.id,
      name: project.name,
      deadline: project.deadline}
  end
end
