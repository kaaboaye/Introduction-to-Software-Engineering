defmodule Teamify.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :text, null: false
      add :plannedHours, :decimal, null: false
      add :realHours, :decimal, null: false
      add :state, :text, null: false

      add :project_iteration_id,
          references(:project_iterations, on_delete: :nothing, type: :binary_id),
          null: false

      timestamps()
    end

    create index(:tasks, [:project_iteration_id])
  end
end
