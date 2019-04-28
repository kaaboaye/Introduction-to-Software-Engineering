defmodule TeamifyWeb.Router do
  use TeamifyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TeamifyWeb do
    pipe_through :api

    resources "/people", PersonController
    resources "/projects", ProjectController
    resources "/teams", TeamController
    resources "/team_members", TeamMemberController
    resources "/project_iterations", ProjectIterationController
    resources "/tasks", TaskController
  end
end
