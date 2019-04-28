defmodule TeamifyWeb.ProjectIterationControllerTest do
  use TeamifyWeb.ConnCase

  alias Teamify.ProjectIterations
  alias Teamify.ProjectIterations.ProjectIteration

  @create_attrs %{
    deadline: "2010-04-17T14:00:00Z"
  }
  @update_attrs %{
    deadline: "2011-05-18T15:01:01Z"
  }
  @invalid_attrs %{deadline: nil}

  def fixture(:project_iteration) do
    {:ok, project_iteration} = ProjectIterations.create_project_iteration(@create_attrs)
    project_iteration
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all project_iterations", %{conn: conn} do
      conn = get(conn, Routes.project_iteration_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create project_iteration" do
    test "renders project_iteration when data is valid", %{conn: conn} do
      conn = post(conn, Routes.project_iteration_path(conn, :create), project_iteration: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.project_iteration_path(conn, :show, id))

      assert %{
               "id" => id,
               "deadline" => "2010-04-17T14:00:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.project_iteration_path(conn, :create), project_iteration: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update project_iteration" do
    setup [:create_project_iteration]

    test "renders project_iteration when data is valid", %{conn: conn, project_iteration: %ProjectIteration{id: id} = project_iteration} do
      conn = put(conn, Routes.project_iteration_path(conn, :update, project_iteration), project_iteration: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.project_iteration_path(conn, :show, id))

      assert %{
               "id" => id,
               "deadline" => "2011-05-18T15:01:01Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, project_iteration: project_iteration} do
      conn = put(conn, Routes.project_iteration_path(conn, :update, project_iteration), project_iteration: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete project_iteration" do
    setup [:create_project_iteration]

    test "deletes chosen project_iteration", %{conn: conn, project_iteration: project_iteration} do
      conn = delete(conn, Routes.project_iteration_path(conn, :delete, project_iteration))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.project_iteration_path(conn, :show, project_iteration))
      end
    end
  end

  defp create_project_iteration(_) do
    project_iteration = fixture(:project_iteration)
    {:ok, project_iteration: project_iteration}
  end
end
