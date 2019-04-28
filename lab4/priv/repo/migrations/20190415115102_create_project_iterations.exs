defmodule Teamify.Repo.Migrations.CreateProjectIterations do
  use Ecto.Migration

  def change do
    create table(:project_iterations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :deadline, :utc_datetime, null: false
      add :project_id, references(:projects, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:project_iterations, [:project_id])
  end
end
