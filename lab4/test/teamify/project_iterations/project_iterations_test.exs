defmodule Teamify.ProjectIterationsTest do
  use Teamify.DataCase

  alias Teamify.ProjectIterations

  describe "project_iterations" do
    alias Teamify.ProjectIterations.ProjectIteration

    @valid_attrs %{deadline: "2010-04-17T14:00:00Z"}
    @update_attrs %{deadline: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{deadline: nil}

    def project_iteration_fixture(attrs \\ %{}) do
      {:ok, project_iteration} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ProjectIterations.create_project_iteration()

      project_iteration
    end

    test "list_project_iterations/0 returns all project_iterations" do
      project_iteration = project_iteration_fixture()
      assert ProjectIterations.list_project_iterations() == [project_iteration]
    end

    test "get_project_iteration!/1 returns the project_iteration with given id" do
      project_iteration = project_iteration_fixture()
      assert ProjectIterations.get_project_iteration!(project_iteration.id) == project_iteration
    end

    test "create_project_iteration/1 with valid data creates a project_iteration" do
      assert {:ok, %ProjectIteration{} = project_iteration} = ProjectIterations.create_project_iteration(@valid_attrs)
      assert project_iteration.deadline == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_project_iteration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProjectIterations.create_project_iteration(@invalid_attrs)
    end

    test "update_project_iteration/2 with valid data updates the project_iteration" do
      project_iteration = project_iteration_fixture()
      assert {:ok, %ProjectIteration{} = project_iteration} = ProjectIterations.update_project_iteration(project_iteration, @update_attrs)
      assert project_iteration.deadline == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_project_iteration/2 with invalid data returns error changeset" do
      project_iteration = project_iteration_fixture()
      assert {:error, %Ecto.Changeset{}} = ProjectIterations.update_project_iteration(project_iteration, @invalid_attrs)
      assert project_iteration == ProjectIterations.get_project_iteration!(project_iteration.id)
    end

    test "delete_project_iteration/1 deletes the project_iteration" do
      project_iteration = project_iteration_fixture()
      assert {:ok, %ProjectIteration{}} = ProjectIterations.delete_project_iteration(project_iteration)
      assert_raise Ecto.NoResultsError, fn -> ProjectIterations.get_project_iteration!(project_iteration.id) end
    end

    test "change_project_iteration/1 returns a project_iteration changeset" do
      project_iteration = project_iteration_fixture()
      assert %Ecto.Changeset{} = ProjectIterations.change_project_iteration(project_iteration)
    end
  end
end
