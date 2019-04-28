defmodule TeamifyWeb.ProjectIterationController do
  use TeamifyWeb, :controller

  alias Teamify.ProjectIterations
  alias Teamify.ProjectIterations.ProjectIteration

  action_fallback TeamifyWeb.FallbackController

  def index(conn, _params) do
    project_iterations = ProjectIterations.list_project_iterations()
    render(conn, "index.json", project_iterations: project_iterations)
  end

  def create(conn, %{"project_iteration" => project_iteration_params}) do
    with {:ok, %ProjectIteration{} = project_iteration} <- ProjectIterations.create_project_iteration(project_iteration_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.project_iteration_path(conn, :show, project_iteration))
      |> render("show.json", project_iteration: project_iteration)
    end
  end

  def show(conn, %{"id" => id}) do
    project_iteration = ProjectIterations.get_project_iteration!(id)
    render(conn, "show.json", project_iteration: project_iteration)
  end

  def update(conn, %{"id" => id, "project_iteration" => project_iteration_params}) do
    project_iteration = ProjectIterations.get_project_iteration!(id)

    with {:ok, %ProjectIteration{} = project_iteration} <- ProjectIterations.update_project_iteration(project_iteration, project_iteration_params) do
      render(conn, "show.json", project_iteration: project_iteration)
    end
  end

  def delete(conn, %{"id" => id}) do
    project_iteration = ProjectIterations.get_project_iteration!(id)

    with {:ok, %ProjectIteration{}} <- ProjectIterations.delete_project_iteration(project_iteration) do
      send_resp(conn, :no_content, "")
    end
  end
end
