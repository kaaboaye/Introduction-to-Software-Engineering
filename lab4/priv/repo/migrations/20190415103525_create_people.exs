defmodule Teamify.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :full_name, :text, null: false

      timestamps()
    end
  end
end
