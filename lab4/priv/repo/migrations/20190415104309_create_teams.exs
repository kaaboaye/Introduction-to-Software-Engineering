defmodule Teamify.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :team_leader_id, references(:people, on_delete: :nothing, type: :binary_id)

      add :project_id, references(:projects, on_delete: :nothing, type: :binary_id),
        primary_key: true
    end

    create index(:teams, [:team_leader_id])
  end
end
