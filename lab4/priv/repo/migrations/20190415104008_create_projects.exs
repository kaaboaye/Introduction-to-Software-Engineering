defmodule Teamify.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text, null: false
      add :deadline, :utc_datetime, null: false

      timestamps()
    end
  end
end
