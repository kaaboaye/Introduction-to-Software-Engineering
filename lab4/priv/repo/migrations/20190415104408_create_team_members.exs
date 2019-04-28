defmodule Teamify.Repo.Migrations.CreateTeamMembers do
  use Ecto.Migration

  def change do
    create table(:team_members, primary_key: false) do
      add :team_id,
          references(:teams, on_delete: :nothing, type: :binary_id, column: :project_id),
          primary_key: true

      add :person_id, references(:people, on_delete: :nothing, type: :binary_id),
        primary_key: true

      timestamps()
    end

    create index(:team_members, [:team_id])
    create index(:team_members, [:person_id])
  end
end
